# Handoff — LDJ-BLM R01 Review Fixes — Phase 4

Date: 2026-04-20
Scope: Cosmetic / documentation pass. No runtime-behavior changes (aside from the `ALL_VAC_OFF_R01` singularity-avoidance flag flip).
Target files: `customer_programs/LDJ-BLM Robot/*_R01.LS`

## Files changed

| File | Change |
| --- | --- |
| `PNS0003_R01.LS`, `PNS0004_R01.LS` | Promoted the in-line `OUTFEED POSITIONS NEED LIVE TEAC` comment to a 5-line banner at the top of `/MN`. Programs are still loadable, but the banner is the first thing the operator sees on the TP. |
| `ALL_VAC_OFF_R01.LS` | `ENABLE_SINGULARITY_AVOIDANCE : FALSE` → `TRUE`, bringing it in line with every other `/APPL` block in the R01 set. No motion in the program so the change is effectively cosmetic. |
| `-BCKED2-_R01.LS`, `-BCKED8-_R01.LS`, `-BCKED9-_R01.LS`, `-BCKEDT-_R01.LS` | Added `! RESERVED BG TASK SLOT ;` body line so the empty background-task stubs self-document instead of looking corrupted. `LINE_COUNT` bumped from `0` to `1` on each. |

## NOT changed (intentionally)

The following utility programs do **not** have an `/APPL` block at all and Phase 4 does not add one:

- `ALL_VAC_ON_R01.LS`
- `ADJ_BG_R01.LS`
- `PRE_BG_R01.LS`
- `SEARCH_R01.LS`
- `VAC_CONFIG_R01.LS`

Adding `AUTO_SINGULARITY_HEADER` here would require inserting an entire `/APPL` section, which the controller will accept but would cause the `MODIFIED` timestamp on those files to change for a purely cosmetic reason — and two of them (`ADJ_BG`, `SEARCH`) are hot paths we just edited in earlier phases. Leave as-is; revisit if a future commissioning session shows a singularity issue.

## Behavior changes to verify

1. **PNS0003 / PNS0004** — the banner is the only change; the outfeed WIP state is unchanged. Still do not put these two programs into production until the outfeed positions are live-taught.
2. **ALL_VAC_OFF_R01** — no motion group instructions, so the singularity-avoidance flag has no runtime effect. Flip is purely for consistency with the rest of the fleet.
3. **-BCKED*-** — harmless comment in empty slots; controller will re-save without complaint.

## Register / variable / alarm summary (all phases combined)

For convenience at commissioning time, here is the full set of controller-side data that the operator needs to set up before the Phase 1–4 R01 programs run correctly:

### Numeric registers

| R[ ] | Comment | Initial value |
| --- | --- | --- |
| `R[5]` | `CURRENT TOOL` | (existing — 1 or 2) |
| `R[13]` | `DEPLETED INFD` | (existing) |
| `R[18]` | `ADJ LOOP CNT` | (existing — diagnostic only) |
| `R[19]` | `VAC SETTLE` | **2.00 (sec)** |
| `R[21]` | `PINCH DWELL` | **1.50 (sec)** |
| `R[22]` | `BEND SETTLE` | **1.00 (sec)** |
| `R[23]` | `TOOL DWELL` | **1.00 (sec)** |
| `R[24]` | `TARGET TOOL` | (set by caller of `CHANGE_TOOLS_R01`) |
| `R[50]` | `OVERRIDE` | (existing) |

### Position registers

| PR[ ] | Comment |
| --- | --- |
| `PR[1]` | `HOME` (existing) |
| `PR[2]` | `OFFSET` (existing) |
| `PR[10]` | `infd search` (existing) |
| `PR[11]` | `infd threshold` (existing) |
| `PR[50]` | `INFD1 Z TRACK` |
| `PR[51]` | `INFD2 Z TRACK` |
| `PR[52]` | `save infd search` (existing) |
| `PR[53]` | `INFD4 Z TRACK` |
| `PR[54]` | `INFD5 Z TRACK` |
| `PR[100]` | `ZERO` (existing) |

### User alarms (must have pendant text)

| UALM[ ] | Text |
| --- | --- |
| `UALM[3]` | `GRIP CONFIRM FAIL` |
| `UALM[4]` | `TOOL SELECT INVALID` (existing — now also fires on invalid `R[24]`) |
| `UALM[5]` | `PRESS HANDSHAKE TIMEOUT` |
| `UALM[6]` | `VAC_CONFIG INVALID AR[1]` (new in Phase 2) |
| `UALM[7]` | `BG ADJUST TIMEOUT` (existing) |
| `UALM[8]` | `OUT OF PARTS` |
| `UALM[9]` | `STACK DEPLETED` |

### Payload schedules

- `PAYLOAD[1]` = empty EOAT
- `PAYLOAD[2]` = EOAT + one sheet

### System variable

- `$WAITTMOUT = 3000` (ms) — set explicitly by press-macro tops.

## Open follow-ups (not in any phase)

1. Confirm Modbus DO indices for the `RESET MUTE` / `RESET CLAMP` pre-sends in `PINCH_R01` / `BEND_R01`. Currently commented-out placeholders on `DO[40]` / `DO[41]`.
2. Decide whether to collapse `R[22:BEND SETTLE]` back into the bend macro body (currently both the PNS programs *and* `BEND_R01` have a `WAIT R[22]`). The existing arrangement trades ~1 extra sec for safety — intentional, but raise with operations.
3. If the outfeed positions ever get live-taught on PNS0003/0004, remove the new Phase 4 banner.
