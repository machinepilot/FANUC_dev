---
name: fanuc-workspace-setup
description: Bootstrap a fresh TeachPendant clone - verify prerequisites, install MCP servers, register with Cursor and Claude Desktop, confirm the eval smoke case passes. Use on first clone and whenever the environment changes (new machine, new Python, Cursor reset).
---

# TeachPendant Workspace Setup

## Purpose

Go from "I just cloned the repo" to "MCP servers green, smoke eval passing" in under 15 minutes.

## Prerequisites

- Git + Git LFS (`git lfs install --system`).
- Python 3.11+ (`python --version`).
- `uv` or `pip`.
- Cursor IDE (latest).
- Claude Desktop (latest).
- Ollama (optional; required only if using local embeddings or local LLM replays).

## Steps

### 1. Verify You're in TeachPendant

Check `pwd` (or `Get-Location`) ends in `TeachPendant`. Check `AGENTS.md` exists.

### 2. Install MCP Servers

```bash
cd mcp_servers/fanuc_knowledge && uv pip install -e .
cd ../program_repository && uv pip install -e .
cd ../fanuc_safety_lint && uv pip install -e .
```

Verify each with:

```bash
python -m fanuc_knowledge.server --help
python -m program_repository.server --help
python -m fanuc_safety_lint.server --help
```

### 3. Optional: Ollama

```bash
ollama pull nomic-embed-text
```

Set `EMBEDDING_BACKEND=ollama` in `mcp_servers/mcp.example.json` (or your local overrides file).

### 4. Register MCP

- Cursor: Settings -> MCP; paste from `mcp_servers/mcp.example.json`; update absolute paths.
- Claude Desktop: Settings -> Developer -> Edit Config; merge same blocks; update paths.

Restart both.

### 5. Open the Workspace

Open `teachpendant.code-workspace` in Cursor. Confirm:

- `.cursor/rules/workspace-context.mdc` banner shows (it's `alwaysApply: true`).
- MCP panel in Cursor shows `fanuc-knowledge`, `program-repository`, `fanuc-safety-lint` (green).

### 6. Smoke Eval

```bash
cd evals
python runner.py --list
python runner.py --case smoke_task_state --schema-only
```

Pass: output says `verdict: PASS`.

### 7. (If LDJ-BLM clone) Baseline Lint

If `customer_programs/ldj_blm/backups/` is non-empty:

```bash
# Run through MCP or manually:
python -c "from fanuc_safety_lint.server import lint_ls_cli; lint_ls_cli('customer_programs/ldj_blm/backups/041626/PNS0001.LS')"
```

Compare against `customer_programs/ldj_blm/lint_baseline.md`. Any new findings are regressions.

### 8. Done

Record the session in `MIGRATION_LOG.md` if this is a first-time setup.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| MCP server red in Cursor | Run `python -m <server>.server` manually to see stderr. |
| `.LS` files show LF | `.gitattributes` wasn't applied on checkout; `git rm --cached -r . && git reset --hard`. |
| `fanuc_knowledge.search` returns nothing | Call `fanuc_knowledge.reindex`; if still empty, check `fanuc_dataset/normalized/` is populated. |
| Python `import mcp` fails | `uv pip install mcp` or reinstall the server with `-e .`. |
