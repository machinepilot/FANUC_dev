# Agent Roster

Canonical index of TeachPendant agents. Mirrors the FANUC cell topology.

## Confer Graph

```mermaid
flowchart LR
    User[User / Integrator] --> Intake
    Intake --> Orchestrator
    Orchestrator --> Architect
    Architect <--> Integration
    Architect <--> Safety
    Architect --> Motion[Motion Synthesis]
    Motion --> QA
    Integration --> QA
    Safety --> QA
    QA --> Docs[Documentation]
    Docs --> User
    Orchestrator -. task_state.json .- Intake
    Orchestrator -. task_state.json .- Architect
    Orchestrator -. task_state.json .- Motion
    Orchestrator -. task_state.json .- Integration
    Orchestrator -. task_state.json .- Safety
    Orchestrator -. task_state.json .- QA
    Orchestrator -. task_state.json .- Docs
```

## Roster

| Agent | File | Robot-cell analog | Schema in | Schema out |
|-------|------|-------------------|-----------|------------|
| Orchestrator | [orchestrator.md](orchestrator.md) | Cell PLC | (any) | `task_state.schema.json` (writes) |
| Intake | [intake.md](intake.md) | Perception | (user message) | `program_intake.schema.json` |
| Architect | [architect.md](architect.md) | Task planner | `program_intake.schema.json` | `program_spec.schema.json` |
| Motion Synthesis | [motion-synthesis.md](motion-synthesis.md) | Trajectory planner | `program_spec.schema.json` | TP/KAREL source + `handoff.schema.json` |
| Integration | [integration.md](integration.md) | I/O + fieldbus | `program_spec.schema.json` | `INTEGRATION_SPEC_*.md` + `handoff.schema.json` |
| Safety | [safety.md](safety.md) | DCS + safety PLC | `program_spec.schema.json` | `safety_review.schema.json` |
| QA | [qa.md](qa.md) | Diagnostics | TP/KAREL source + specs | `review.schema.json` |
| Documentation | [documentation.md](documentation.md) | HMI / operator | approved artifacts | operator doc + `handoff.schema.json` |

## Confers With (each agent's declared conversation partners)

| Agent | Confers with |
|-------|--------------|
| Orchestrator | All |
| Intake | Orchestrator |
| Architect | Intake, Integration, Safety, Motion, Orchestrator |
| Motion | Architect, QA, Safety |
| Integration | Architect, QA, Safety, Orchestrator |
| Safety | Architect, Integration, Motion, QA, Orchestrator |
| QA | Motion, Integration, Safety, Documentation, Orchestrator |
| Documentation | QA, Orchestrator |

## Invocation

- Cursor: via `Task` subagent tool with the relevant system prompt loaded from `<role>.md`.
- Cowork: Claude Desktop operates as the Orchestrator; spin sub-sessions for other roles when needed.

## Scopes

Each agent lists `reads:` (allowed read paths) and `writes:` (allowed write paths) in its YAML frontmatter. Violations are caught by QA during review.
