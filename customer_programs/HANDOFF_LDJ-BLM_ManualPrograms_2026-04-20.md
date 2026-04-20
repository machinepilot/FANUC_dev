# Handoff — LDJ-BLM Manual (T2) Programs

Date: 2026-04-20
Scope: New folder `customer_programs/LDJ-BLM Robot/manual programs/` with 10 operator-paced `.LS` programs (5 derived from the taught `PNS000X_R01` waypoints, 5 skeleton templates) plus a folder README. No changes to the existing `PNS*_R01.LS` / utility macros.

Use case: running parts on LDJ-BLM while the press brake is **not yet integrated** with the CRX. The operator holds the teach pendant in T2 mode and steps the robot through pick → load → (manual pinch) → retreat → (manual bends) → retrieve → outfeed. Quantities per part number range from ~6 to ~20.

## New files

| File | Source | Notes |
| ---- | ------ | ----- |
| `manual programs/M_6410808783.LS` | `PNS0001_R01.LS` | Pick / zero / press approach / outfeed all taught. Retrieve positions `P[100..102]` are `!TEACH` placeholders. |
| `manual programs/M_6410817074.LS` | `PNS0002_R01.LS` | Same as above. Retrieve `P[100..102]` placeholder. |
| `manual programs/M_6410816256.LS` | `PNS0003_R01.LS` | Source PNS outfeed was WIP, so outfeed `P[56..59]` is also a `!TEACH` placeholder. Retrieve `P[100..102]` placeholder. |
| `manual programs/M_6410818389.LS` | `PNS0004_R01.LS` | Source PNS already uses `P[100..108]`, so retrieve was bumped to `P[200..202]` to avoid `/POS` collision. Outfeed `P[56..59]` placeholder. |
| `manual programs/M_6410820756.LS` | `PNS0005_R01.LS` | Outfeed `P[56..59]` + retrieve `P[100..102]` placeholders (source PNS outfeed was WIP). |
| `manual programs/M_08780.LS` | new | Template. **All** positions are zeroed placeholders. Infeed PR is `PR[55:INFD TBD]`. |
| `manual programs/M_07051.LS` | new | Template. Infeed PR `PR[56:INFD TBD]`. |
| `manual programs/M_15304.LS` | new | Template. Infeed PR `PR[57:INFD TBD]`. |
| `manual programs/M_0964.LS`  | new | Template. Infeed PR `PR[58:INFD TBD]`. |
| `manual programs/M_0965.LS`  | new | Template. Infeed PR `PR[59:INFD TBD]`. |
| `manual programs/README.md` | new | Naming convention, PAUSE semantics, live-teach checklist, rename checklist. |

### Naming convention

`M_<part number or suffix>.LS`. The `M_` prefix is required because FANUC `/PROG` names cannot start with a digit and the LDJ part numbers are all digit-leading. For the 5 new-part templates, the known 4–5-digit suffix is used; rename each once the full part number lands.

## How the manual flow differs from the automated `PNS*_R01` flow

| Section | `PNS*_R01` | `M_*` |
| ------- | ---------- | ----- |
| Pick from infeed | `SEARCH_R01`, Z-track, VAC ON + `DI[30]` grip verify | **same, verbatim** |
| Clear infeed (`P[4..P[7]`) | used | **same** |
| Zero-table reorient | drop, reorient, re-pick with grip verify | **same** |
| Approach press | `P[13..P[19]` (or equivalent) + `P[STAGED FOR BEND]` | **same** |
| Insert into press (UF3) | `L P[18:INSERT]` / `P[17]` / `P[21]` / `P[23]` | **same** |
| Pinch | `CALL PINCH_R01` (waits `DI[22:PRESS PINCHED]`) | **removed**. Replaced with a banner + `PAUSE ;`. Operator pinches by hand. |
| Release + retract | `CALL ALL_VAC_OFF_R01`, `PAYLOAD[1]`, `L P[23]` / `P[28]` / `P[24]` / `P[22]` | **same up to retract.** Then `CALL GO_HOME_R01` to move the robot clear. |
| Bend cycle | `CALL BEND_R01` (waits `DI[23]`+`DI[25]`), `WAIT R[22:BEND SETTLE]` | **removed**. Replaced with a second `PAUSE ;`; the robot sits at `PR[1:HOME]` while operator bends every bend by hand. |
| Regrip between bends | inter-bend reorient through zero table | **removed** (no inter-bend motion at all). |
| Retrieve finished part | n/a (stayed gripped through all bends) | **new**. `P[100..102]` / `P[200..202]` with `!TEACH` banners, then VAC ON + grip verify, then extract. |
| Outfeed (UF4) | `P[56..59]` (taught on PNS0001/PNS0002, WIP on PNS0003/4/5) | **same** for PNS0001/2 derivatives; **placeholder `P[56..59]`** on PNS0003/4/5 derivatives and all 5 templates. |
| End of cycle | `TIMER[1]` stop, `R[10]++`, `PR[5X,3] -= R[12]`, `JMP LBL[1]` | **same**, plus a third `PAUSE ;` banner (`PART DONE. RESUME FOR NEXT PART OR ABORT.`) before the JMP so the operator can abort or inspect between parts. |

Error tails are unchanged: `LBL[90]` sets `UALM[3]` (grip fail) and `PAUSE`, `LBL[99]` sets `UALM[8]` (out of parts) and `PAUSE`.

## PAUSE semantics

Each `M_*` program hard-stops with `PAUSE ;` at three operator hand-off points:

1. **Pinch** — part is in the press at the insert point, vacuum still on. Operator manually cycles the press ram to pinch the part. `RESUME` on the pendant continues the program, which then turns vacuum off and retracts.
2. **Bend** — robot is at `PR[1:HOME]`. Operator runs every bend by hand. `RESUME` sends the robot to the retrieve approach position.
3. **End-of-cycle** — part is on the outfeed pallet. Operator inspects, then `RESUME` for the next part or `ABORT` to stop.

All three PAUSEs are preceded by a 3-line banner comment (`!-- ... --`) so the TP display tells the operator exactly what's expected.

## Pendant-side data

**No new registers, PRs, or UALMs.** Every resource is already taught from the Phase 1–4 R01 rollout:

- `R[10:PART INDEX]`, `R[11:THRESHOLD]`, `R[12:THICKNESS]`, `R[19:VAC SETTLE]`, `R[20]`, `R[13:DEPLETED INFD]`
- `PR[1:HOME]`, `PR[2:OFFSET]`, `PR[10:infd search]`, `PR[50..54]` (INFD1..INFD5 Z-track)
- `PAYLOAD[1/2]`, `UFRAME[1..4]`, `UTOOL[1]`, `DI[30:PART DETECT]`, `DO[22..25]`
- `UALM[3]` (grip fail), `UALM[8]` (infeed depleted)

The 5 template programs tag their infeed PR as `PR[55..59:INFD TBD]`. These are *placeholders* — before running a template, either (a) point the template at an existing `PR[50..54]` for the correct infeed, or (b) create a new PR for the new infeed and update the program.

## What has to be live-taught before running

| Program | Points to teach |
| ------- | --------------- |
| `M_6410808783.LS` | `P[100:RETR APPROACH]`, `P[101:RETR GRIP]`, `P[102:RETR EXTRACT]` |
| `M_6410817074.LS` | `P[100..102]` |
| `M_6410816256.LS` | `P[100..102]`, `P[56..59]` |
| `M_6410818389.LS` | `P[200..202]`, `P[56..59]` |
| `M_6410820756.LS` | `P[100..102]`, `P[56..59]` |
| `M_08780 / M_07051 / M_15304 / M_0964 / M_0965` | **everything** — `P[1..P[9]`, `P[17]`, `P[18:INSERT]`, `P[23]`, `P[56..59]`, `P[100..102]`, plus the infeed PR assignment |

On each of those, walk the cursor to the `!TEACH: ...` banner directly above the motion line and record the point on the pendant.

## Things that were intentionally dropped

- All `CALL PINCH_R01`, `CALL BEND_R01`, `CALL OPEN_PRESS_R01`.
- All `WAIT DI[21..23]` and `DI[25]` press-side waits.
- All `WAIT R[22:BEND SETTLE]`.
- All second / third / fourth bend reorient motions (PNS0002 `P[28..P[55]`, PNS0003 `P[19..P[29]`, PNS0004 `P[25..P[108]`, PNS0005 `P[22..P[42]`). The robot is at HOME during every bend, so those waypoints aren't needed.
- Inter-cycle `TIMER[1]` sub-reports — only the end-of-cycle `R[20] = TIMER[1]` capture is kept.

## What the operator should verify before first run

1. Teach pendant is in T2, deadman working, override at 10 %.
2. `PR[1:HOME]` reaches a position that is clearly clear of the press ram.
3. `DI[30:PART DETECT]` toggles on/off when an EOAT cup is covered/uncovered.
4. `R[19:VAC SETTLE]` = 2.0 sec (set in Phase 1).
5. For templates: the placeholder `PR[5X:INFD TBD]` has been swapped to a real infeed PR.
6. For M_6410818389: retrieve `P[200..202]` are taught (not the stock `P[100..108]` that the source PNS uses).

## Rename / promotion path

Once a template's full part number lands:

1. Rename `M_<suffix>.LS` → `M_<full part number>.LS` on disk and on the controller.
2. Update `/PROG`, `COMMENT`, and the line-2 banner (`!TEMPLATE: PART ***<suffix> ;` → `!<full part number> MANUAL T2 ;`).
3. Decide whether this part gets its own infeed PR or reuses an existing `PR[50..54]`. Update the program's `PR[5X:INFD TBD]` references accordingly.
4. Live-teach every `!TEACH` position and delete the corresponding `!TEACH: ...` banner comment.
5. Remove the WIP banner (`!* TEMPLATE. ALL POSITIONS ... *`) once no placeholders remain.

## Files NOT changed

- `customer_programs/LDJ-BLM Robot/PNS0001_R01.LS` … `PNS0005_R01.LS` — untouched.
- All `_R01.LS` utility macros (`SEARCH_R01`, `ALL_VAC_ON_R01`, `ALL_VAC_OFF_R01`, `GO_HOME_R01`, `GO_ZERO_R01`, `ZERO_R01`, `PINCH_R01`, `BEND_R01`, `OPEN_PRESS_R01`, …) — untouched. The manual programs `CALL` the ones that apply (`SEARCH_R01`, `ALL_VAC_*_R01`, `GO_HOME_R01`) and simply omit the press ones.
- Phase 1–4 handoffs are still the source of truth for pendant data values.
