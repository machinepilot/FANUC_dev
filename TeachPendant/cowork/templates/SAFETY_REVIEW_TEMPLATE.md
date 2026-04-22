---
# Validates against cowork/schemas/safety_review.schema.json
schema: safety_review
task_id: <uuid>
customer_id: <customer>
program_name: <NAME>
fanuc_controller: [R-30iB Plus]
system_sw_version: [V9.30]
collaborative: false                    # true for CR/CRX cells
standards_applied:
  - iso_10218_1
  - iso_10218_2
  - iso_ts_15066                        # only if collaborative
  - fanuc_dcs_manual
reviewer: safety
reviewed_at: <ISO 8601>
verdict: pass | pass_with_conditions | fail
highest_severity: none | low | medium | high | critical
signoff:
  required: true | false                # true if highest_severity >= high
  by: <name>
  at: <ISO 8601 or null>
---

# Safety Review: <NAME>

## Scope

What motion-relevant artifacts were reviewed (program spec, integration spec, TP/KAREL source, DCS config).

## Standards Applied

Cite entries in `fanuc_dataset/normalized/safety/`:

- `ONE_iso10218_overview` - clauses <list>
- `ONE_iso_ts_15066_basics` - Table A.2 (if collaborative)
- `FANUC_SAFE_DCS_*` - specific functions used

## DCS Specification

| ID | Type | Purpose | Coordinates / Limits | Stop Cat | Tested |
|----|------|---------|---------------------|----------|--------|
| JPC1 | Joint Position Check | Operator reach envelope | J1: -90..+90, J2: -30..+60, ... | Cat 1 | <date or PENDING> |
| CPC1 | Cartesian Position Check | Exclude operator station | X: [0..800], Y: [-400..400], Z: [0..1200] mm | Cat 1 | PENDING |
| CSC1 | Cartesian Speed Check | TCP speed at operator reach | <= 250 mm/s | Cat 1 | PENDING |
| TF1 | Tool Frame | Gripper assembly | name, mass, CG | Cat 1 | <date> |

## Findings

| ID | Severity | Description | Location | Normative Ref | Proposed Fix |
|----|----------|-------------|----------|---------------|--------------|
| S1 | high | Motion on line 87 can reach CPC1 zone at > 250 mm/s | `PNS0001.LS:87` | ISO 10218-2 5.10, FANUC_SAFE_DCS_CSC | Add CSC1 speed trigger before entry; reroute via `PR[5:SAFE_APPROACH]` |

## Collaborative Analysis (only if `collaborative: true`)

- Mode(s): SRMS / HG / SSM / PFL (list)
- If PFL: body-region limits per ISO/TS 15066 Table A.2; computed contact force + pressure; cite entries
- Cycle-time penalty estimate

## Fault Recovery

- E-stop category: Cat 0 / Cat 1 (confirm against controller config).
- FAULT_RESET path: documented in operator guide.
- Recovery-from-reach-in-trip procedure: defined / not defined.

## Verdict

- **Pass** - no `high+` findings; artifact ships.
- **Pass with conditions** - `high+` findings with owner and date; ship-blocked until closed, signoff required.
- **Fail** - kick back to Architect with specific fix requests.

## Next

If any finding is `severity: critical`, set `task_state.status = blocked` and escalate to human. Signoff is mandatory before the task can proceed.
