# TeachPendant MCP Servers

Three local Model Context Protocol (MCP) servers that give Cursor and Claude Desktop structured access to the TeachPendant workspace:

| Server | Purpose | Data source |
|--------|---------|-------------|
| `fanuc_knowledge` | Semantic + keyword search over normalized dataset | `fanuc_dataset/normalized/` |
| `program_repository` | Query customer programs and integration notes | `customer_programs/` |
| `fanuc_safety_lint` | Deterministic static analysis of TP/LS + KAREL | passed file paths |

## Why MCP

MCP is the portable, host-agnostic surface for giving an LLM tools. The same three servers expose the same tools to Cursor, Claude Desktop, and any other MCP-capable host. You write once, register anywhere.

## Install

Each server is an editable Python package.

```bash
cd mcp_servers/fanuc_knowledge && uv pip install -e .
cd ../program_repository && uv pip install -e .
cd ../fanuc_safety_lint && uv pip install -e .
```

`uv` is strongly recommended; `pip install -e .` also works.

## Register

Copy `mcp.example.json` into:

- **Cursor**: Settings - MCP - paste (or add each block individually).
- **Claude Desktop**: Settings - Developer - Edit Config - merge into `mcpServers`.

Replace `{WORKSPACE_PATH}` with the absolute path to your TeachPendant folder.

## Ollama (optional, for semantic search)

The `fanuc_knowledge` server can use Ollama for embeddings. Install Ollama, then:

```bash
ollama pull nomic-embed-text
```

Set the environment variables in the MCP config:

```json
"env": {
  "EMBEDDING_BACKEND": "ollama",
  "OLLAMA_MODEL": "nomic-embed-text",
  "OLLAMA_HOST": "http://localhost:11434"
}
```

Without Ollama, `fanuc_knowledge` falls back to keyword-only search (still useful).

## Tools

### `fanuc_knowledge`

| Tool | Args | Returns |
|------|------|---------|
| `search` | `query` (str), `top_k` (int, default 5), `topic` (str, optional), `tier` (str, optional) | list of {id, title, score, snippet, path} |
| `get` | `id` (str) | full entry (frontmatter + body) or null |
| `list_by_tag` | `tag` (str) | ids matching the tag (topic, language, controller, tier) |
| `related` | `id` (str) | ids listed under `related:` plus inbound references |
| `reindex` | (none) | {count} after re-reading `fanuc_dataset/normalized/` |
| `list_rules` | (none) | enumerate canonical reference rules (for agents that want to know what canon exists) |

### `program_repository`

| Tool | Args | Returns |
|------|------|---------|
| `list_customers` | (none) | list from `customer_programs/_manifest.json` |
| `get_program` | `customer` (str), `name` (str), `revision` (str, default `latest` or `current`) | program contents |
| `get_integration_notes` | `customer` (str) | list of integration notes with `{path, title, status, canonical, scope}` |
| `search` | `customer` (str), `pattern` (regex) | matches across TP/KAREL |
| `diff` | `customer` (str), `name` (str), `rev_a` (str), `rev_b` (str) | structural diff |
| `list_files` | `customer` (str), `subpath` (str, optional) | file listing with kind annotations |

### `fanuc_safety_lint`

| Tool | Args | Returns |
|------|------|---------|
| `lint_ls` | `path` (str) | {path, findings[], summary} |
| `lint_karel` | `path` (str) | {path, findings[], summary} |
| `list_rules` | (none) | full rule catalog |
| `explain_rule` | `rule_id` (str) | {rule_id, rationale, normative_refs, examples} |

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| Red server dot in Cursor | Run `python -m <server>.server` manually to capture stderr |
| `import mcp` fails | `uv pip install mcp` in the server's venv |
| `fanuc_knowledge.search` empty | `fanuc_knowledge.reindex` or check `fanuc_dataset/normalized/` is non-empty |
| KAREL lint flags everything as error | Check `%NOLOCKGROUP` + `%STACKSIZE` are present; otherwise it's a real finding |

## Development

Each server ships with a tiny `pyproject.toml` and a server module under `<server>/<server>/server.py`. Seed tests live beside the module. Add new tools by:

1. Implementing the function.
2. Registering via the MCP SDK's `Server` decorator (or whatever the SDK version here uses).
3. Documenting in the server's own README.
4. Adding an eval case if the tool is load-bearing for an agent workflow.
