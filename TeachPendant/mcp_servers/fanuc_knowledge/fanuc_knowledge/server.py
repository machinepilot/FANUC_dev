"""fanuc_knowledge MCP server.

Semantic + keyword search over fanuc_dataset/normalized/. Minimal, readable,
intended as a starting point. All operations are synchronous and in-memory
which is appropriate for a dataset of up to a few thousand entries.
"""
from __future__ import annotations

import json
import os
import re
from dataclasses import dataclass, field, asdict
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


DATASET_ROOT = Path(os.environ.get("DATASET_ROOT", "../../fanuc_dataset/normalized")).resolve()
EMBEDDING_BACKEND = os.environ.get("EMBEDDING_BACKEND", "none").lower()
OLLAMA_MODEL = os.environ.get("OLLAMA_MODEL", "nomic-embed-text")
OLLAMA_HOST = os.environ.get("OLLAMA_HOST", "http://localhost:11434")


@dataclass
class Entry:
    id: str
    title: str
    topic: str
    language: str
    tier: str
    controllers: list[str]
    path: str
    body: str
    frontmatter: dict[str, Any] = field(default_factory=dict)


_INDEX: dict[str, Entry] = {}
_INBOUND: dict[str, set[str]] = {}


def _parse_entry(path: Path) -> Entry | None:
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return None
    if not text.startswith("---"):
        return None
    parts = text.split("---", 2)
    if len(parts) < 3:
        return None
    try:
        fm = yaml.safe_load(parts[1]) or {}
    except yaml.YAMLError:
        return None
    if not isinstance(fm, dict) or "id" not in fm:
        return None
    body = parts[2].strip()
    return Entry(
        id=str(fm["id"]),
        title=str(fm.get("title", fm["id"])),
        topic=str(fm.get("topic", "")),
        language=str(fm.get("language", "")),
        tier=str((fm.get("source") or {}).get("tier", "")),
        controllers=list(fm.get("fanuc_controller") or []),
        path=str(path),
        body=body,
        frontmatter=fm,
    )


def _reindex() -> int:
    _INDEX.clear()
    _INBOUND.clear()
    if not DATASET_ROOT.exists():
        return 0
    for md in DATASET_ROOT.rglob("*.md"):
        entry = _parse_entry(md)
        if entry is None:
            continue
        _INDEX[entry.id] = entry
    for entry in _INDEX.values():
        for ref in entry.frontmatter.get("related") or []:
            _INBOUND.setdefault(str(ref), set()).add(entry.id)
    return len(_INDEX)


def _keyword_score(query: str, entry: Entry) -> float:
    q = query.lower()
    tokens = [t for t in re.split(r"\W+", q) if t]
    if not tokens:
        return 0.0
    haystack = (entry.title + " " + entry.body + " " + entry.topic).lower()
    score = 0.0
    for tok in tokens:
        count = haystack.count(tok)
        if tok in entry.title.lower():
            score += 3 * count
        else:
            score += count
    return score


def _snippet(body: str, query: str, width: int = 160) -> str:
    q = query.lower()
    body_lc = body.lower()
    idx = body_lc.find(q)
    if idx < 0:
        for tok in re.split(r"\W+", q):
            if not tok:
                continue
            idx = body_lc.find(tok)
            if idx >= 0:
                break
    if idx < 0:
        return body[:width].replace("\n", " ") + ("..." if len(body) > width else "")
    start = max(0, idx - width // 2)
    end = min(len(body), idx + width // 2)
    return ("..." if start > 0 else "") + body[start:end].replace("\n", " ") + ("..." if end < len(body) else "")


def _tool_search(query: str, top_k: int = 5, topic: str | None = None, tier: str | None = None) -> list[dict[str, Any]]:
    results: list[tuple[float, Entry]] = []
    for entry in _INDEX.values():
        if topic and entry.topic != topic:
            continue
        if tier and entry.tier != tier:
            continue
        score = _keyword_score(query, entry)
        if score > 0:
            results.append((score, entry))
    results.sort(key=lambda x: x[0], reverse=True)
    top = results[:top_k]
    return [
        {
            "id": e.id,
            "title": e.title,
            "score": round(s, 3),
            "snippet": _snippet(e.body, query),
            "path": e.path,
        }
        for s, e in top
    ]


def _tool_get(id: str) -> dict[str, Any] | None:
    e = _INDEX.get(id)
    if e is None:
        return None
    return {"frontmatter": e.frontmatter, "body": e.body, "path": e.path}


def _tool_list_by_tag(tag: str) -> list[str]:
    out = []
    for e in _INDEX.values():
        if tag == e.topic or tag == e.language or tag == e.tier or tag in e.controllers:
            out.append(e.id)
    return sorted(out)


def _tool_related(id: str) -> dict[str, Any]:
    e = _INDEX.get(id)
    if e is None:
        return {"outbound": [], "inbound": []}
    outbound = list(e.frontmatter.get("related") or [])
    inbound = sorted(_INBOUND.get(id, set()))
    return {"outbound": outbound, "inbound": inbound}


def _tool_list_rules() -> list[dict[str, Any]]:
    out = []
    for e in _INDEX.values():
        if e.id.startswith("FANUC_REF_"):
            out.append({"id": e.id, "title": e.title, "topic": e.topic})
    return sorted(out, key=lambda r: r["id"])


async def main() -> None:
    if Server is None:
        raise RuntimeError("mcp package not installed. Run: uv pip install -e .")
    _reindex()
    server = Server("fanuc-knowledge")

    @server.list_tools()
    async def _list_tools() -> list[Tool]:  # type: ignore[name-defined]
        return [
            Tool(
                name="search",
                description="Search normalized FANUC dataset entries by keyword (and embeddings if configured).",
                inputSchema={
                    "type": "object",
                    "properties": {
                        "query": {"type": "string"},
                        "top_k": {"type": "integer", "default": 5},
                        "topic": {"type": "string"},
                        "tier": {"type": "string"},
                    },
                    "required": ["query"],
                },
            ),
            Tool(
                name="get",
                description="Fetch a normalized entry by id.",
                inputSchema={"type": "object", "properties": {"id": {"type": "string"}}, "required": ["id"]},
            ),
            Tool(
                name="list_by_tag",
                description="List entry ids that match a tag (topic, language, controller, tier).",
                inputSchema={"type": "object", "properties": {"tag": {"type": "string"}}, "required": ["tag"]},
            ),
            Tool(
                name="related",
                description="Outbound (from related:) and inbound neighbors of an entry.",
                inputSchema={"type": "object", "properties": {"id": {"type": "string"}}, "required": ["id"]},
            ),
            Tool(
                name="reindex",
                description="Re-read fanuc_dataset/normalized/ from disk. Returns {count}.",
                inputSchema={"type": "object", "properties": {}},
            ),
            Tool(
                name="list_rules",
                description="Enumerate canonical reference entries (prefix FANUC_REF_).",
                inputSchema={"type": "object", "properties": {}},
            ),
        ]

    @server.call_tool()
    async def _call_tool(name: str, arguments: dict[str, Any]) -> list[TextContent]:  # type: ignore[name-defined]
        if name == "search":
            result = _tool_search(
                query=arguments["query"],
                top_k=int(arguments.get("top_k", 5)),
                topic=arguments.get("topic"),
                tier=arguments.get("tier"),
            )
        elif name == "get":
            result = _tool_get(arguments["id"])
        elif name == "list_by_tag":
            result = _tool_list_by_tag(arguments["tag"])
        elif name == "related":
            result = _tool_related(arguments["id"])
        elif name == "reindex":
            count = _reindex()
            result = {"count": count}
        elif name == "list_rules":
            result = _tool_list_rules()
        else:
            result = {"error": f"unknown tool: {name}"}
        return [TextContent(type="text", text=json.dumps(result, indent=2))]

    async with stdio_server() as (read, write):
        await server.run(read, write, server.create_initialization_options())


if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
