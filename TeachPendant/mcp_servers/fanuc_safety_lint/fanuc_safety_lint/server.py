"""fanuc_safety_lint MCP server.

Static analysis over .LS and .KL files. Deterministic; no LLM.
"""
from __future__ import annotations

import json
from dataclasses import asdict
from pathlib import Path
from typing import Any

from .rules import (
    lint_tp, lint_karel, summarize,
    list_rules as rules_list_rules,
    explain_rule as rules_explain_rule,
)

try:
    from mcp.server import Server
    from mcp.server.stdio import stdio_server
    from mcp.types import TextContent, Tool
except ImportError:
    Server = None  # type: ignore
    stdio_server = None  # type: ignore
    TextContent = None  # type: ignore
    Tool = None  # type: ignore


def _read_lines(path: str) -> list[str] | None:
    p = Path(path)
    if not p.is_file():
        return None
    return p.read_text(encoding="utf-8", errors="replace").splitlines()


def _tool_lint_ls(path: str) -> dict[str, Any]:
    lines = _read_lines(path)
    if lines is None:
        return {"error": f"file not found: {path}"}
    findings = [asdict(f) for f in lint_tp(lines)]
    return {"path": path, "findings": findings, "summary": summarize(lint_tp(lines))}


def _tool_lint_karel(path: str) -> dict[str, Any]:
    lines = _read_lines(path)
    if lines is None:
        return {"error": f"file not found: {path}"}
    findings = [asdict(f) for f in lint_karel(lines)]
    return {"path": path, "findings": findings, "summary": summarize(lint_karel(lines))}


def lint_ls_cli(path: str) -> None:
    """CLI convenience used by skills for one-off lints."""
    print(json.dumps(_tool_lint_ls(path), indent=2))


async def main() -> None:
    if Server is None:
        raise RuntimeError("mcp package not installed. Run: uv pip install -e .")
    server = Server("fanuc-safety-lint")

    @server.list_tools()
    async def _list_tools() -> list[Tool]:  # type: ignore[name-defined]
        return [
            Tool(name="lint_ls", description="Lint a FANUC TP/LS source file.", inputSchema={"type": "object", "properties": {"path": {"type": "string"}}, "required": ["path"]}),
            Tool(name="lint_karel", description="Lint a FANUC KAREL source file.", inputSchema={"type": "object", "properties": {"path": {"type": "string"}}, "required": ["path"]}),
            Tool(name="list_rules", description="Enumerate all rules.", inputSchema={"type": "object", "properties": {}}),
            Tool(name="explain_rule", description="Rationale + normative refs for a rule.", inputSchema={"type": "object", "properties": {"rule_id": {"type": "string"}}, "required": ["rule_id"]}),
        ]

    @server.call_tool()
    async def _call_tool(name: str, arguments: dict[str, Any]) -> list[TextContent]:  # type: ignore[name-defined]
        if name == "lint_ls":
            result: Any = _tool_lint_ls(arguments["path"])
        elif name == "lint_karel":
            result = _tool_lint_karel(arguments["path"])
        elif name == "list_rules":
            result = rules_list_rules()
        elif name == "explain_rule":
            result = rules_explain_rule(arguments["rule_id"])
        else:
            result = {"error": f"unknown tool: {name}"}
        return [TextContent(type="text", text=json.dumps(result, indent=2))]

    async with stdio_server() as (read, write):
        await server.run(read, write, server.create_initialization_options())


if __name__ == "__main__":
    import asyncio
    asyncio.run(main())
