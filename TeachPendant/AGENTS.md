# AGENTS.md - TeachPendant

Single source of truth for agent roles, workspace map, critical rules, and handoff protocol. Both Cursor and Cowork (Claude Desktop) read this on session start.

## Tool Roles

| Tool | Role |
|------|------|
| Cursor IDE | In-file editing; hosts Cursor subagents (`Task` tool) and applies `.cursor/rules/` |
| Claude Desktop (Cowork) | Long-horizon orchestration; runs as the Orchestrator agent across sessions |
| MCP servers | Deterministic access to knowledge (`fanuc_knowledge`), customer programs (`program_repository`), and static safety lint (`fanuc_safety_lint`) |

## The FANUC Cell

Every agent plays a robot-cell role. The analogy is load-bearing: it tells the agent what information to respect, what to ignore, and who to confer with before acting.

```mermaid
flowchart LR
    User[User / Integrator] --> Intake
    subgraph Cell [FANUC Cell]
      Orchestrator[Orchestrator - cell PLC]
      Intake[Intake - perception]
      Architect[Architect - task planner]
      Motion[Motion Synthesis - trajectory planner]
      Integration[Integration - I/O and fieldbus]
      Safety[Safety - DCS + ISO 10218]
      QA[QA - TP/KAREL lint]
      Docs[Documentation - HMI]
    end
    Intake --> Orchestrator
    Orchestrator --> Architect
    Architect <--> Integration
    Architect <--> Safety
    Architect --> Motion
    Motion --> QA
    Safety --> QA
    QA --> Docs
    Docs --> User
    Orchestrator -. task_state.json .- Intake
    Orchestrator -. task_state.json .- Architect
    Orchestrator -. task_state.json .- Motion
    Orchestrator -. task_state.json .- Integration
    Orchestrator -. task_state.json .- Safety
    Orchestrator -. task_state.json .- QA
    Orchestrator -. task_state.json .- Docs
```

| Agent | Robot-cell analog | File |
|-------|-------------------|------|
| Orchestrator | Cell PLC | `.cursor/agents/orchestrator.md` |
| Intake | Perception system | `.cursor/agents/intake.md` |
| Architect | Task planner | `.cursor/agents/architect.md` |
| Motion Synthesis | Trajectory planner | `.cursor/agents/motion-synthesis.md` |
| Integration | I/O + fieldbus | `.cursor/agents/integration.md` |
| Safety | Safety PLC (DCS) | `.cursor/agents/safety.md` |
| QA | Diagnostics | `.cursor/agents/qa.md` |
| Documentation | HMI / operator | `.cursor/agents/documentation.md` |

See `.cursor/agents/_ROSTER.md` for the full confer-graph.

## Critical Rules (read every session)

### 1. Knowledge Authority

- Canon lives in `fanuc_dataset/normalized/`. Every agent grounds claims there (via `fanuc_knowledge.search` / `fanuc_knowledge.get`).
- **Customer integration notes are context, not canon.** Anything under `customer_programs/**/integration_notes/` is customer-scoped, often evolving, and may contradict canon. When it does, the dataset wins. Raise a conflict under `task_state.conflicts[]` and defer to the dataset or escalate to the human.
- If the dataset lacks an answer, run the research workflow (`cowork/workflows/knowledge_ingestion.md`) rather than making it up.

### 2. TP and KAREL Conventions

- File extensions: `.LS` (ASCII TP source), `.TP` (binary), `.KL` (KAREL source), `.PC` (compiled KAREL). All preserved as CRLF per `.gitattributes`.
- Set `UTool[n]` and `UFrame[n]` before any motion instruction. Never rely on whatever was loaded last.
- Use aliased signal names (`DI[101:PB_START]`) instead of raw `DI[101]` in bodies. If the signal lacks a comment, stop and ask.
- Avoid programmatic overrides (`$MCR_GRP[].$PRGOVERRIDE`, `$OVERRIDE`).
- Every `WAIT DI[]=ON` must have a `TIMEOUT` branch.
- Every `SKIP CONDITION` must have a matching `LBL[]`.
- Every `MONITOR` must have a matching `MONITOR END`.

### 3. Safety Is Not Negotiable

- Every program that touches motion is reviewed by the Safety agent against ISO 10218-1/-2, ISO/TS 15066, and the controller's DCS configuration.
- Collaborative (CR/CRX) work triggers a mandatory PFL / SSM / hand-guide analysis.
- E-stop, guard, and clear-of-fault behavior is specified in the spec, not left to "whatever the robot does today."
- Safety findings live in `normalized/safety/` or as `safety_review` artifacts; never mixed with general knowledge.

### 4. Fieldbus / Handshake Discipline

- Program selection follows PNS or Style Select, not `RUN` button folklore.
- UOP handshake (`UI[8] ENBL`, `UI[18] PROD_START`, `UI[5] FAULT_RESET`, `UO[7] AT_PERCH`, etc.) is mapped explicitly in the integration spec.
- Fieldbus input/output tables live in `protocols/` and are cited by integration specs.

### 5. Customer Programs Are Historical Evidence

- Back up before you touch. Every change lands under `customer_programs/<customer>/backups/<date>/`, never overwrites.
- Current working copy lives under `customer_programs/<customer>/current/`.
- Never promote customer-specific content to `fanuc_dataset/` without scrubbing customer identifiers and re-validating against `dataset_entry.schema.json`.

## Workspace Map

| Path | Purpose |
|------|---------|
| `fanuc_dataset/normalized/` | Canonical knowledge. Cite and summarize; don't paraphrase vendor manuals verbatim. |
| `fanuc_dataset/raw_sources/` | Raw PDFs; LFS; `.cursorignored`; never committed to public remotes. |
| `customer_programs/<customer>/` | Customer-specific TP/KAREL programs + integration notes. Context, not canon. |
| `.cursor/rules/` | Glob-scoped Cursor rules. Only `workspace-context.mdc` is `alwaysApply: true`. |
| `.cursor/agents/` | Per-role agent system prompts. Loaded by Cursor subagents and Cowork. |
| `.cursor/skills/` | Procedural skills (SKILL.md format). Reusable, deterministic recipes. |
| `cowork/templates/` | Markdown templates with schema frontmatter. Agents fill these in. |
| `cowork/schemas/` | JSON Schemas (Draft 2020-12) for every handoff. Validate in, validate out. |
| `cowork/workflows/` | Multi-agent interaction scripts. Start here when picking up a task. |
| `mcp_servers/` | Local MCP servers (Python). Register via `mcp.example.json`. |
| `ros2/src/` | ROS 2 packages (`fanuc_driver`, `fanuc_description`) migrated from `physical_ai/`. |
| `tools/mqtt_bridge/` | Press-brake MQTT bridge utility, migrated from `FANUC_dev/mqtt_bridge/`. |
| `evals/` | Lightweight eval harness. Replay cases against golden outputs. |
| `research/` | Deep-research prompt + coverage tracker. |

## MCP Tools Available

| Tool | Purpose | Authorized agents |
|------|---------|-------------------|
| `fanuc_knowledge.search` | Semantic + keyword search over normalized dataset | All |
| `fanuc_knowledge.get` | Fetch a specific normalized entry by ID | All |
| `fanuc_knowledge.list_by_tag` | Topic / platform / KSS filter | Intake, Architect, Safety |
| `fanuc_knowledge.related` | Neighbors in the knowledge graph | All |
| `fanuc_knowledge.reindex` | Rebuild the index after ingestion | Orchestrator only |
| `program_repository.list_customers` | Enumerate customers | All |
| `program_repository.get_program` | Read a specific customer program, latest or dated | All |
| `program_repository.get_integration_notes` | Customer-scoped integration notes (tagged context, not canon) | Intake, Architect, Integration |
| `program_repository.search` | Regex across customer programs | All |
| `program_repository.diff` | Structural diff between two program revisions | QA |
| `fanuc_safety_lint.lint_ls` | Static checks on TP/LS | QA, Safety |
| `fanuc_safety_lint.lint_karel` | Static checks on KAREL | QA, Safety |
| `fanuc_safety_lint.list_rules` | Rule catalog | All |
| `fanuc_safety_lint.explain_rule` | Rationale + normative refs for a rule | Docs, Safety |

## Handoff Protocol

Every agent handoff is a structured message, validated against a schema in `cowork/schemas/`, and logged in `task_state.json`.

1. **Pre-flight**: consumer validates the incoming envelope against its `schema_in`. If invalid, consumer refuses the handoff, logs under `task_state.conflicts[]`, and kicks back to the Orchestrator.
2. **Work**: consumer performs its role, citing `fanuc_dataset/` entries by ID for every non-trivial claim.
3. **Emit**: consumer writes its output under the appropriate template, validates against `schema_out`, and appends to `task_state.handoffs[]`.
4. **Orchestrator adjudicates**: if two agents disagree (e.g., Architect proposes a motion plan the Safety agent rejects), the Orchestrator reconciles per `conflict_resolution` in `task_state.json`. Human escalation is a first-class option.

### `task_state.json` usage

One `task_state.json` lives in each task directory. The Orchestrator owns writes; other agents append under their named key. Schema at `cowork/schemas/task_state.schema.json`. Template at `cowork/templates/task_state.template.json`.

## Dataset Authority Summary

| Source | Authority |
|--------|-----------|
| `fanuc_dataset/normalized/` | Canon |
| Research findings (cited T1/T2) | Canon after QA validation |
| Customer `integration_notes/` | Context (customer-scoped) |
| Customer program backups | Historical evidence (customer-scoped) |
| Raw PDFs in `raw_sources/` | Primary source; cite, don't reproduce |
| Agent memory / prior-session guesses | Not authoritative; re-verify against canon |

## Session Start Checklist (for any agent)

1. Read this file.
2. Read the role file under `.cursor/agents/<role>.md`.
3. Read the relevant workflow under `cowork/workflows/<workflow>.md`.
4. If a task is open, read `task_state.json`.
5. Ground every claim in `fanuc_dataset/` via MCP, or explicitly mark it as a gap for research.
6. Produce schema-valid output.
