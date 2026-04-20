# Handoff — LDJ-BLM R01 Review Fixes — Phase 1

Date: 2026-04-20
Scope: Safety / correctness first pass (SEARCH cleanup, press-macro timeouts, vacuum grip verification).
Target files: `customer_programs/LDJ-BLM Robot/*_R01.LS`

## Files changed

| File | Change |
| --- | --- |
| `SEARCH_R01.LS` | Rewritten. Dead loop/counter code removed; program is now the minimal 9-line SKIP-based search already tested on the pendant. |
| `PINCH_R01.LS` | `$WAITTMOUT=3000`, `TIMEOUT,LBL[1]` on every press-signal WAIT, IO comments (`DI[21]`, `DI[22]`, `DI[25]`, `DO[27]`), dwell parameterized to `R[21:PINCH DWELL]`, redundant `IF (DI[22]=ON) THEN … ENDIF` removed. |
| `BEND_R01.LS` | `$WAITTMOUT=3000`, `TIMEOUT,LBL[1]` on every press-signal WAIT, IO comments, `FILE_NAME` header cleared (was `PINCH_R01`). |
| `OPEN_PRESS_R01.LS` | `$WAITTMOUT=3000`, `TIMEOUT,LBL[1]`, IO comments (`DI[21]`, `DI[23]`, `DI[25]`, `DO[27]`). |
| `PNS0001_R01.LS` – `PNS0005_R01.LS` | `PAYLOAD[1]` at init, banner `!DI[30:PART DETECT] USED AS GRIP CONFIRM (NO VAC SWITCH) ;`, `WAIT R[19:VAC SETTLE]` + `WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90]` + `PAYLOAD[2]` after every `CALL ALL_VAC_ON_R01`, `PAYLOAD[1]` after every `CALL ALL_VAC_OFF_R01`, new `LBL[90]` grip-verify error tail (`UALM[3]`/`PAUSE`) inserted before existing `LBL[99]` (out of parts). |

## What the operator must do on the pendant before running an R01 program

These changes introduce **new data** that is NOT stored in the .LS files themselves. The controller will happily load the programs, but the first cycle will fault unless these items are set on the teach pendant.

### 1. System variable

- `$WAITTMOUT = 3000` (ms)
  - Already written as a literal at line 1 of PINCH/BEND/OPEN_PRESS macros, so the value is re-applied every call. No operator action required beyond loading the macros.

### 2. Numeric registers (MENU → DATA → Registers)

| R[ ] | Comment | Initial value | Used by |
| --- | --- | --- | --- |
| `R[19]` | `VAC SETTLE` | **2.00 (sec)** | all PNS programs (vacuum confirm delay) |
| `R[21]` | `PINCH DWELL` | **1.50 (sec)** | PINCH_R01 |
| `R[22]` | `BEND SETTLE` | **1.00 (sec)** | (landing in Phase 3, but add comment now) |

### 3. Payload schedules (MENU → SYSTEM → Motion → PAYLOAD)

- `PAYLOAD[1]` = empty EOAT (no part)
- `PAYLOAD[2]` = EOAT + one sheet (mass + COG as measured/estimated)

Both schedules must exist before any PNS_R01 program is cycled. The schedule numbers are now hardcoded in every PNS program.

### 4. User alarms (MENU → SETUP → User Alarm)

- `UALM[3]` must be configured with text like `GRIP CONFIRM FAIL` (prints on pendant when DI[30] doesn’t assert after `ALL_VAC_ON`).
- `UALM[5]` (`PRESS HANDSHAKE TIMEOUT`) — used by PINCH/BEND/OPEN_PRESS. Confirm text exists.
- `UALM[8]` (`OUT OF PARTS`) — already in use.
- `UALM[9]` (`STACK DEPLETED` / SEARCH fell through) — used by SEARCH_R01.

## Behavior changes to verify on the robot

1. **SEARCH_R01** — expected behavior unchanged from the tested pendant version. Now stored in git without dead code.
2. **PINCH/BEND/OPEN_PRESS** — will now `UALM[5]` + `PAUSE` if any press-signal WAIT exceeds 3 s, instead of hanging forever. Confirm signal wiring is healthy first (beam in auto, reasonable cycle time) so timeouts don't fire on normal operation.
3. **PNS0001–0005_R01** — after each pick the robot will wait up to 3 s for `DI[30]=ON`; if the sheet isn’t pulled flush to the cups it drops into `LBL[90]` / `UALM[3]` / `PAUSE` instead of running off into the press with no payload. After release, `PAYLOAD[1]` is re-commanded so deceleration limits are correct on the return trip.

## NOT in Phase 1 (deferred by phase)

- `R[18]=1` counter overwrite in `ADJ_BG_R01` → Phase 3.
- `RESET MUTE` / `RESET CLAMP` pre-sends in PINCH/BEND → Phase 3 (placeholder `DO[?]` + TODO comment, real DO indices pending Modbus map confirmation).
- `R[13]` / `R[24:TARGET TOOL]` split in `CHANGE_TOOLS_R01` → Phase 2.
- `ZERO_R01` / `GO_ZERO_R01` consolidation, `VAC_CONFIG_R01` SELECT refactor → Phase 2.
- WIP banner promotion (PNS0003/PNS0004), `AUTO_SINGULARITY_HEADER` normalization, `-BCKED*-` stubs → Phase 4.

## Rollback

Every change is in `_R01` files. The originals (no suffix) are untouched. If a Phase 1 change misbehaves, select the non-R01 program on the pendant to revert to the previous behavior.
