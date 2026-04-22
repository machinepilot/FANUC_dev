---
# Validates against cowork/schemas/review.schema.json
schema: review
task_id: <uuid>
customer_id: <customer>
program_name: <UPPERCASE_NAME>
reviewed_artifacts:
  - path: <path>
    kind: tp_ls | karel | program_spec | integration_spec | safety_review | dataset_entry
    revision: <sha or date>
reviewer: qa
reviewed_at: <ISO 8601>
verdict: pass | pass_with_conditions | fail
summary_counts:
  critical: 0
  high: 0
  medium: 0
  low: 0
  info: 0
---

# QA Review: <NAME>

## Scope

What was reviewed, by whom, against which standards and rule catalog.

## Findings

| ID | Severity | Rule / Source | Location | Message | Proposed Fix |
|----|----------|---------------|----------|---------|--------------|
| 1 | high | `FANUC-WAIT-001` | `PNS0001.LS:42` | `WAIT DI[...]=ON` without `TIMEOUT` | Add `TIMEOUT,LBL[99]` + fault handler |
| 2 | medium | `FANUC-ALIAS-001` | `PNS0001.LS:55` | Raw `DI[123]` in body | Add signal comment `PB_START`; reference as `DI[123:PB_START]` |

## Diff Summary

If comparing revisions via `program_repository.diff`, summarize here:

- Lines added: <N>
- Lines removed: <N>
- Motion instructions changed: <N>
- Signals touched: <list>

## Citations

- All claims in `PROGRAM_SPEC_<NAME>.md` resolve: <yes / no, with list of unresolved>
- Safety review claims cite ISO/10218 entries: <yes / no>

## Verdict

One of:

- **Pass** - no `high+` findings; artifact ships.
- **Pass with conditions** - `high+` findings with an owner and date; ship-blocked until closed.
- **Fail** - kick back to originating agent with specific fix requests.

## Next

- If pass: hand to Documentation.
- If conditions: assign each to the responsible agent in `task_state.conflicts[]`.
- If fail: update `task_state.status = <origin_stage>` and dispatch.
