"""program_repository MCP server.

Customer program + integration-notes queries over customer_programs/.
Read-mostly. No writes.
"""
from __future__ import annotations

import difflib
import json
import os
import re
from pathlib import Path
from typing import Any

import yaml

try:
    from mcp.server import Server
    from mcp.server.stdio import stdio_server
    from mcp.types import TextContent, Tool
except ImportError:
    Server = None  # type: ignore
    stdio_server = None  # type: ignore
    TextContent = None  # type: ignore
    Tool = None  # type: ignore


CUSTOMERS_ROOT = Path(os.environ.get("CUSTOMERS_ROOT", "../../customer_programs")).resolve()

TP_SRC = {".LS", ".ls"}
TP_BIN = {".TP", ".tp"}
KAREL_SRC = {".KL", ".kl"}
KAREL_BIN = {".PC", ".pc"}
MD = {".md"}
PDF = {".pdf", ".PDF"}


def _kind(p: Path) -> str:
    ext = p.suffix
    if ext in TP_SRC:
        return "tp_ls"
    if ext in TP_BIN:
        return "tp_bin"
    if ext in KAREL_SRC:
        return "karel"
    if ext in KAREL_BIN:
        return "karel_bin"
    if ext in MD:
        return "markdown"
    if ext in PDF:
        return "pdf"
    return "other"


def _manifest() -> dict[str, Any]:
    m = CUSTOMERS_ROOT / "_manifest.json"
    if not m.exists():
        return {"version": 1, "customers": []}
    return json.loads(m.read_text(encoding="utf-8"))


def _tool_list_customers() -> list[dict[str, Any]]:
    return _manifest().get("customers", [])


def _resolve_program(customer: str, name: str, revision: str) -> Path | None:
    cdir = CUSTOMERS_ROOT / customer
    if not cdir.is_dir():
        return None
    if revision == "current":
        candidate = cdir / "current" / name
        return candidate if candidate.exists() else None
    backups = cdir / "backups"
    if not backups.is_dir():
        return None
    if revision == "latest":
        dated = sorted([d for d in backups.iterdir() if d.is_dir()], key=lambda d: d.name, reverse=True)
        for d in dated:
            cand = d / name
            if cand.exists():
                return cand
            # flat search under this dated dir
            for p in d.rglob(name):
                return p
        return None
    # specific revision
    d = backups / revision
    if d.is_dir():
        cand = d / name
        if cand.exists():
            return cand
        for p in d.rglob(name):
            return p
    return None


def _tool_get_program(customer: str, name: str, revision: str = "latest") -> dict[str, Any] | None:
    p = _resolve_program(customer, name, revision)
    if p is None:
        return None
    k = _kind(p)
    if k in ("tp_bin", "karel_bin", "pdf", "other"):
        # binary - don't dump bytes; report metadata
        return {"path": str(p), "kind": k, "size": p.stat().st_size, "text": None}
    text = p.read_text(encoding="utf-8", errors="replace")
    return {"path": str(p), "kind": k, "size": p.stat().st_size, "text": text}


def _read_note_frontmatter(path: Path) -> dict[str, Any]:
    try:
        text = path.read_text(encoding="utf-8")
    except Exception:
        return {}
    if not text.startswith("---"):
        return {}
    parts = text.split("---", 2)
    if len(parts) < 3:
        return {}
    try:
        fm = yaml.safe_load(parts[1]) or {}
    except yaml.YAMLError:
        return {}
    return fm if isinstance(fm, dict) else {}


def _tool_get_integration_notes(customer: str) -> list[dict[str, Any]]:
    notes_dir = CUSTOMERS_ROOT / customer / "integration_notes"
    if not notes_dir.is_dir():
        return []
    out = []
    for md in notes_dir.glob("*.md"):
        fm = _read_note_frontmatter(md)
        out.append({
            "path": str(md),
            "title": md.stem,
            "status": fm.get("status"),
            "canonical": fm.get("canonical", False),
            "scope": fm.get("scope"),
            "customer": fm.get("customer"),
            "supersedes": fm.get("supersedes"),
        })
    return sorted(out, key=lambda n: n["path"])


def _tool_search(customer: str, pattern: str) -> list[dict[str, Any]]:
    cdir = CUSTOMERS_ROOT / customer
    if not cdir.is_dir():
        return []
    try:
        rx = re.compile(pattern)
    except re.error as exc:
        return [{"error": f"invalid regex: {exc}"}]
    out = []
    for p in cdir.rglob("*"):
        if not p.is_file():
            continue
        k = _kind(p)
        if k not in ("tp_ls", "karel", "markdown"):
            continue
        try:
            text = p.read_text(encoding="utf-8", errors="replace")
        except Exception:
            continue
        for lineno, line in enumerate(text.splitlines(), start=1):
            if rx.search(line):
                out.append({"path": str(p), "line": lineno, "match": line.strip()[:240]})
    return out


def _normalize_ls(text: str) -> list[str]:
    # Strip /PROG header differences that are timestamp-noise.
    lines = []
    in_body = False
    for line in text.splitlines():
        if line.strip() == "/MN":
            in_body = True
        if in_body:
            lines.append(line.rstrip())
        if line.strip() == "/END":
            in_body = False
    if not lines:
        return [l.rstrip() for l in text.splitlines()]
    return lines


def _tool_diff(customer: str, name: str, rev_a: str, rev_b: str) -> dict[str, Any]:
    a = _resolve_program(customer, name, rev_a)
    b = _resolve_program(customer, name, rev_b)
    if a is None or b is None:
        return {"error": f"one or both revisions not found: a={a}, b={b}"}
    a_text = a.read_text(encoding="utf-8", errors="replace")
    b_text = b.read_text(encoding="utf-8", errors="replace")
    a_lines = _normalize_ls(a_text)
    b_lines = _normalize_ls(b_text)
    diff = list(difflib.unified_diff(a_lines, b_lines, fromfile=str(a), tofile=str(b), n=2, lineterm=""))
    return {"a": str(a), "b": str(b), "diff": diff, "added": sum(1 for d in diff if d.startswith("+") and not d.startswith("+++")), "removed": sum(1 for d in diff if d.startswith("-") and not d.startswith("---"))}


def _tool_list_files(customer: str, subpath: str | None = None) -> list[dict[str, Any]]:
    base = CUSTOMERS_ROOT / customer
    if subpath:
        base = base / subpath
    if not base.is_dir():
        return []
    out = []
    for p in sorted(base.rglob("*")):
        if p.is_file():
            out.append({"path": str(p), "kind": _kind(p), "size": p.stat().st_size})
    return out


async def main() -> None:
    if Server is None:
        raise RuntimeError("mcp package not installed. Run: uv pip install -e .")
    server = Server("program-repository")

    @server.list_tools()
    async def _list_tools() -> list[Tool]:  # type: ignore[name-defined]
        return [
            Tool(name="list_customers", description="List customers from _manifest.json.", inputSchema={"type": "object", "properties": {}}),
            Tool(
                name="get_program",
                description="Read a TP/LS or KAREL program from a customer's backups/current.",
                inputSchema={
                    "type": "object",
                    "properties": {
                        "customer": {"type": "string"},
                        "name": {"type": "string"},
                        "revision": {"type": "string", "default": "latest"},
                    },
                    "required": ["customer", "name"],
                },
            ),
            Tool(
                name="get_integration_notes",
                description="List customer-scoped integration notes (canonical: false).",
                inputSchema={"type": "object", "properties": {"customer": {"type": "string"}}, "required": ["customer"]},
            ),
            Tool(
                name="search",
                description="Regex search across TP/KAREL/markdown under a customer.",
                inputSchema={"type": "object", "properties": {"customer": {"type": "string"}, "pattern": {"type": "string"}}, "required": ["customer", "pattern"]},
            ),
            Tool(
                name="diff",
                description="Structural diff of a program across two revisions.",
                inputSchema={"type": "object", "properties": {"customer": {"type": "string"}, "name": {"type": "string"}, "rev_a": {"type": "string"}, "rev_b": {"type": "string"}}, "required": ["customer", "name", "rev_a", "rev_b"]},
            ),
            Tool(
                name="list_files",
                description="List files under a customer (optionally under a subpath) with kind annotations.",
                inputSchema={"type": "object", "properties": {"customer": {"type": "string"}, "subpath": {"type": "string"}}, "required": ["customer"]},
            ),
        ]

    @server.call_tool()
    async def _call_tool(name: str, arguments: dict[str, Any]) -> list[TextContent]:  # type: ignore[name-defined]
        if name == "list_customers":
            result: Any = _tool_list_customers()
        elif name == "get_program":
            result = _tool_get_program(arguments["customer"], arguments["name"], arguments.get("revision", "latest"))
        elif name == "get_integration_notes":
            result = _tool_get_integration_notes(arguments["customer"])
        elif name == "search":
            result = _tool_search(arguments["customer"], arguments["pattern"])
        elif name == "diff":
            result = _tool_diff(arguments["customer"], arguments["name"], arguments["rev_a"], arguments["rev_b"])
        elif name == "list_files":
            result = _tool_list_files(arguments["customer"], arguments.get("subpath"))
        else:
            result = {"error": f"unknown tool: {name}"}
        return [TextContent(type="text", text=json.dumps(result, indent=2))]

    async with stdio_server() as (read, write):
        await server.run(read, write, server.create_initialization_options())


if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
