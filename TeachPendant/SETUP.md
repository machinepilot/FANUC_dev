# Setup Guide - TeachPendant

Step-by-step instructions to take this workspace from copied folder to a functioning FANUC agentic workspace. If you followed the KUKA template before, this will be familiar.

---

## 0. Prerequisites

| Tool | Why | Install |
|------|-----|---------|
| Git + Git LFS | Versioning + large binary handling for PDFs | git via OS package manager; `git lfs install --system` |
| Cursor IDE | Primary host for in-file editing and Cursor subagents | https://cursor.sh |
| Claude Desktop (Cowork) | Orchestration host | https://claude.ai/download |
| Python 3.11+ | Runs the MCP servers | https://www.python.org |
| uv *(recommended)* or pip | Fast Python package install | `pip install uv` |
| Ollama *(optional, recommended)* | Local embeddings + local LLM for evals | https://ollama.com |
| ROS 2 Humble *(optional)* | Only if you plan to use `ros2/` packages | https://docs.ros.org/en/humble |

---

## 1. Copy TeachPendant Out of FANUC_dev

Copy this folder to a new location so it becomes its own repo.

```bash
# Windows
xcopy /E /I /H "C:\Users\tripp\FANUC_dev\TeachPendant" "C:\Users\tripp\TeachPendant"

# macOS / Linux
cp -R /path/to/FANUC_dev/TeachPendant /path/to/TeachPendant
```

Then:

```bash
cd /path/to/TeachPendant
git init
git lfs install
git add .
git commit -m "Initial TeachPendant scaffold"
# Add your remote:
# git remote add origin git@github.com:<your-org>/TeachPendant.git
# git push -u origin main
```

---

## 2. Rename and Adjust

| File | What to change |
|------|----------------|
| `README.md` | Organization name if not The Way Automation LLC |
| `AGENTS.md` | Same |
| `CLAUDE.md` | Same |
| `LICENSE` | Copyright holder |
| `teachpendant.code-workspace` | Display name if desired |
| `customer_programs/PROGRAM_REPOSITORY_INDEX.md` | Customer list reflects your active engagements |
| `customer_programs/_manifest.json` | Machine-readable customer list |

---

## 3. Drop Your FANUC PDFs

Under `fanuc_dataset/raw_sources/`, recommended layout:

```
fanuc_dataset/raw_sources/
  vendor_manuals/        # FANUC controller / option manuals
  application_notes/     # FANUC application notes
  training/              # FANUC Academy / CRC training material
  error_codes/           # Alarm code references
  third_party/           # Integrator compilations
```

All of these are LFS-tracked automatically via `.gitattributes` and excluded from Cursor's index by `.cursorignore`.

**Copyright reminder:** do not push `raw_sources/` to a public repo unless you own the copyright or have permission. The normalization pipeline is designed to summarize and cite, not reproduce.

---

## 4. Install the MCP Servers

```bash
cd mcp_servers/fanuc_knowledge
uv pip install -e .
# or: pip install -e .

cd ../program_repository
uv pip install -e .

cd ../fanuc_safety_lint
uv pip install -e .
```

Optional Ollama for offline embeddings:

```bash
ollama pull nomic-embed-text
# or higher-quality:
ollama pull mxbai-embed-large
```

---

## 5. Register the MCP Servers

### Cursor

1. Open Cursor - Settings - MCP.
2. Copy `mcp_servers/mcp.example.json` into your Cursor MCP config.
3. Update absolute paths to match your new workspace location.
4. Restart Cursor; MCP panel should show three green dots.

### Claude Desktop (Cowork)

1. Open Claude Desktop - Settings - Developer - Edit Config.
2. Merge the same server blocks from `mcp.example.json`.
3. Restart Claude Desktop.

Troubleshoot: run a server manually (`python -m fanuc_knowledge.server`) to see stderr. Common causes: wrong Python, missing Ollama, wrong `cwd`.

---

## 6. Open the Workspace

### In Cursor

Open `teachpendant.code-workspace`. Cursor will:

- Auto-apply `.cursor/rules/workspace-context.mdc` (`alwaysApply: true`).
- Apply glob-scoped rules as you open `.LS`, `.KL`, `SAFETY_*.md` files.
- Make `.cursor/skills/` available.
- Make `.cursor/agents/<role>.md` available as system-prompt bodies for subagents spawned via the Task tool.

### In Claude Desktop (Cowork)

- Add this workspace folder to Claude Desktop's project list.
- Claude reads `CLAUDE.md` and `AGENTS.md` on session start.

---

## 7. Run the Ingestion Pipeline

With MCP servers running and PDFs in place:

1. In Cursor, open any file.
2. Invoke the skill: `@.cursor/skills/ingest-pdf-to-normalized/SKILL.md`.
3. The skill walks an agent through extracting, chunking, frontmatter-tagging, and emitting normalized files.
4. Each normalized file is validated against `cowork/schemas/dataset_entry.schema.json` by the QA agent.

After ingestion:

- `fanuc_dataset/normalized/` populated.
- `DATASET_INDEX.md` updated.
- `_manifest.json` updated.
- `fanuc_knowledge` MCP server re-indexes on next call.

---

## 8. Run the Deep Research

1. Open `research/RESEARCH_PROMPT_FANUC.md`.
2. Paste into Claude (Research mode recommended).
3. Claude emits additional normalized entries with `source_urls` and access dates.
4. `research/RESEARCH_TRACKING.md` is updated to reflect coverage gaps.
5. Repeat until coverage is satisfactory.

---

## 9. Verify with the Eval Harness

```bash
cd evals
python runner.py --list                                  # lists: smoke_task_state, ldj_blm_pns_gen
python runner.py --case smoke_task_state --schema-only
python runner.py --all --schema-only
```

The smoke case validates `task_state.json` against its schema. The `ldj_blm_pns_gen` case is a real replay case for the flagship customer - it will require a golden file before it passes (see `evals/README.md`).

---

## 10. LDJ-BLM First Run

The flagship customer is LDJ-BLM. To pick up the installation:

1. Read `customer_programs/ldj_blm/README.md` for current status.
2. Open `cowork/workflows/ldj_blm_continuation.md`.
3. Have the Orchestrator drive the workflow.
4. Run `fanuc_safety_lint.lint_ls` against `customer_programs/ldj_blm/backups/**/*.LS` and compare to `customer_programs/ldj_blm/lint_baseline.md`.

---

## 11. General Workflows

| Task | Entry point |
|------|-------------|
| Generate a new TP/LS or KAREL program | `cowork/workflows/program_generation.md` |
| Review an existing program | `cowork/workflows/code_review.md` |
| Onboard a new customer | `cowork/workflows/customer_onboarding.md` |
| Ingest more documentation | `cowork/workflows/knowledge_ingestion.md` |
| Audit safety of a program | `cowork/workflows/safety_audit.md` |
| Continue LDJ-BLM installation | `cowork/workflows/ldj_blm_continuation.md` |

---

## Common Problems

| Symptom | Cause | Fix |
|---------|-------|-----|
| MCP server red in Cursor | Path typo or Python version | Run `python -m fanuc_knowledge.server` manually |
| `fanuc_knowledge.search` returns nothing | Index not built | Call `fanuc_knowledge.reindex` or delete `.cache/` and retry |
| Agent ignores dataset | `workspace-context.mdc` not `alwaysApply: true` | Check rule frontmatter |
| Ingestion skips PDFs | PDF has no text layer | OCR the PDF first (e.g., `ocrmypdf`) |
| `.LS` files end up LF | `.gitattributes` not applied on checkout | `git rm --cached -r .` + `git reset --hard` after `.gitattributes` is in place |
| Schema validation fails constantly | Agent prompt drift | Run eval harness; update `.cursor/agents/<role>.md` |

---

## Getting Help

- Agent roster and confer-graph: `.cursor/agents/_ROSTER.md`.
- Handoff protocol: `AGENTS.md` - Handoff Protocol.
- Dataset organization: `fanuc_dataset/DATASET_README.md`.
- Ingestion schema: `fanuc_dataset/INGESTION_SCHEMA.md`.
- Deep-research prompt: `research/RESEARCH_PROMPT_FANUC.md`.
- Migration history: `MIGRATION_LOG.md`.
- LDJ-BLM status: `customer_programs/ldj_blm/README.md`.
