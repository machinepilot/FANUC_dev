---
name: register-mcp-servers
description: Register the three TeachPendant MCP servers (fanuc_knowledge, program_repository, fanuc_safety_lint) with Cursor and Claude Desktop. Use on first setup, after moving the workspace, or after any MCP config reset.
---

# Register MCP Servers

## Purpose

Give agents access to the three local MCP servers. Cursor and Claude Desktop both need the same config.

## Prerequisites

- Servers installed: `uv pip install -e .` run in each `mcp_servers/<name>/` directory.
- Python 3.11+ available on PATH.
- Cursor + Claude Desktop installed.

## Steps

### 1. Open `mcp_servers/mcp.example.json`

It contains three server blocks: `fanuc-knowledge`, `program-repository`, `fanuc-safety-lint`.

### 2. Substitute Absolute Paths

Replace every `{WORKSPACE_PATH}` placeholder with the absolute path to your TeachPendant folder. On Windows:

```
C:/Users/<you>/TeachPendant
```

(Forward slashes in JSON work on Windows MCP configs; backslashes require escaping.)

### 3. Cursor

Cursor - Settings - MCP - Edit config (or "+ Add new MCP server" for each). Paste each server block. Restart Cursor.

Verify: MCP panel should show three servers with green indicators. Each should list its tools (`search`, `get`, `lint_ls`, etc.).

### 4. Claude Desktop

Claude Desktop - Settings - Developer - Edit Config. Merge the same three blocks into `mcpServers`. Restart Claude Desktop.

Verify in a new chat: `"what MCP tools do you have?"` - the response should mention the FANUC servers.

### 5. (Optional) Local Overrides

If you want different behavior per-machine (e.g., a different Ollama model), create `mcp.local.json` at the workspace root. Git ignores it via `.gitignore`. Point Cursor at `mcp.local.json` instead of `mcp.example.json`.

### 6. Ollama Backend for `fanuc_knowledge`

If you want semantic search with local embeddings:

```bash
ollama pull nomic-embed-text
```

In `mcp.example.json`, set:

```json
"env": {
  "EMBEDDING_BACKEND": "ollama",
  "OLLAMA_MODEL": "nomic-embed-text",
  "OLLAMA_HOST": "http://localhost:11434"
}
```

Without this, `fanuc_knowledge` falls back to keyword search (still useful, less semantic).

### 7. Verify

In Cursor, open a chat. Type:

```
Can you call fanuc_knowledge.list_rules?
```

Expected: a response listing rule sources. If the tool is missing, Cursor couldn't start the server - run manually:

```bash
python -m fanuc_knowledge.server
```

...and read the stderr.

## Anti-patterns

- Hardcoding relative paths. Cursor resolves relative to Cursor's cwd, which is not the workspace.
- Running servers under a different Python than `uv` installed into. Use the interpreter path explicitly if you have multiple Pythons.
- Shipping an API key in `mcp.example.json`. Use `.env` or `mcp.local.json` (both gitignored).
