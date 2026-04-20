# Handoff — LDJ-BLM R01 Review Fixes — Phase 2

Date: 2026-04-20
Scope: Structural clean-up, register collision resolution, readability.
Target files: `customer_programs/LDJ-BLM Robot/*_R01.LS`

## Files changed

| File | Change |
| --- | --- |
| `CHANGE_TOOLS_R01.LS` | `R[13]` usage migrated to `R[24:TARGET TOOL]`. `SELECT` given an `ELSE,JMP LBL[4]` fallthrough. `WAIT 1.00(sec)` × 8 replaced with `WAIT R[23:TOOL DWELL]`. `DO[120]` labeled `EOAT LOCK IND`. `R[5]` labeled `CURRENT TOOL` in every reference. `FILE_NAME` header cleared (was `GO_ZERO_R01`). Top-of-program banner documents the register split. |
| `VAC_CONFIG_R01.LS` | `IF/JMP` chain replaced by `SELECT R[15:VAC CONFIG]` with `ELSE,JMP LBL[99]` → `UALM[6]` + `PAUSE`. `LBL[1]` now explicitly guards the “all zones” branch. |
| `ZERO_R01.LS` | Shrunk to a 3-line wrapper that `CALL`s `GO_ZERO_R01`. Inherits `OVERRIDE=R[50:OVERRIDE]`. |
| `GO_ZERO_R01.LS` | `FILE_NAME` header cleared (was `GO_HOME_R01`). No behavior change. |
| `ADJ_BG_R01.LS` | `DI[26]..DI[29]` commented as `FNGR1..FNGR4`. `R[5]` → `R[5:CURRENT TOOL]`. `R[18]` → `R[18:ADJ LOOP CNT]` (in `FOR` header). Note: the `R[18]=1` overwrite at old line 42 is still present — that’s a Phase 3 change. |
| `BG_LOGIC_R01.LS` | `DO[120]`, `RO[6]`, `DI[30]`, `DO[33]` labeled (`EOAT LOCK IND`, `TOOL LOCK`, `PART DETECT`, `ERR RESET`). |
| `TOOL_LOCK_R01.LS`, `TOOL_UNLOCK_R01.LS` | `RO[6]` → `RO[6:TOOL LOCK]`. |
| `START_PART_R01.LS`, `END_PART_R01.LS` | `DO[30]` → `DO[30:PART START]`, `DO[31]` → `DO[31:PART END]`. |
| `PRE_BG_R01.LS` | `DI[24]` → `DI[24:BG READY]`, `DI[21]` → `DI[21:BEAM AT UDP]`. |
| `PNS0001–0005_R01.LS` | Bare `PR[50..54]` motion targets now carry their `INFD# Z TRACK` comments (`PR[50:INFD1 Z TRACK]`, `PR[51:INFD2 Z TRACK]`, `PR[53:INFD4 Z TRACK]`, `PR[54:INFD5 Z TRACK]`). |

## What the operator must do on the pendant before running an R01 program

These changes introduce **new data** not stored in the .LS files:

### 1. Numeric registers (MENU → DATA → Registers)

| R[ ] | Comment | Initial value | Notes |
| --- | --- | --- | --- |
| `R[23]` | `TOOL DWELL` | **1.00 (sec)** | Tool change settling time. All eight `WAIT` calls in `CHANGE_TOOLS_R01` now read this. |
| `R[24]` | `TARGET TOOL` | *(set by caller)* | `1` or `2`. Anything else → `UALM[4]` + `ABORT` via `LBL[4]`. |

Callers of `CHANGE_TOOLS_R01` must now set `R[24:TARGET TOOL]` before `CALL`, not `R[13]`. `R[13]` is back to being the `DEPLETED INFD` tracker only.

### 2. Position register comments (MENU → DATA → Position Reg)

| PR[ ] | Comment |
| --- | --- |
| `PR[50]` | `INFD1 Z TRACK` (used by PNS0001) |
| `PR[51]` | `INFD2 Z TRACK` (used by PNS0002) |
| `PR[53]` | `INFD4 Z TRACK` (used by PNS0004) |
| `PR[54]` | `INFD5 Z TRACK` (used by PNS0005) |

(`PR[52]` already comes up as `save infd search` — used by PNS0003 — and was not retouched.)

### 3. User alarm

- `UALM[6]` — `VAC_CONFIG INVALID AR[1]` (new). Fires if `AR[1]` is passed into `VAC_CONFIG_R01` outside `{1, 2, 3}`.

## Behavior changes to verify

1. **Tool change** — Pass `R[24]=1` or `R[24]=2` before calling `CHANGE_TOOLS_R01`. If `R[24]` is 0/unset or out of range, the macro will fault with `UALM[4]` *before* any motion. Confirm this with a dry run (M-mode, T2, override 10%) before running a part program.
2. **VAC_CONFIG** — `CALL VAC_CONFIG_R01(1)`, `(2)`, `(3)` all still work as before. `(0)` or `(>3)` will now fault with `UALM[6]` instead of silently falling through to `LBL[10]` with zero zones on.
3. **ZERO_R01** — identical move as before, now delegates to `GO_ZERO_R01` so `OVERRIDE=R[50:OVERRIDE]` (not the hardcoded `OVERRIDE=50%` that used to be in `ZERO_R01`). If the operator relies on `ZERO_R01` moving at 50% regardless of `R[50]`, this is a behavior change — flag it during the T2 walk-through.
4. **Readability only** — `BG_LOGIC`, `ADJ_BG`, `TOOL_LOCK/UNLOCK`, `START/END_PART`, `PRE_BG`, PNS `PR[]` labels. No runtime behavior change.

## Cross-phase check — `R[13]` audit

`R[13]` is still referenced in the PNS programs as `R[13:DEPLETED INFD]` (depletion check against `R[11:THRESHOLD]`). `CHANGE_TOOLS_R01` no longer touches `R[13]`. Safe to run tool changes between PNS cycles without corrupting depletion state.

## NOT in Phase 2 (pushed to later phases)

- `R[18]=1` forced-exit hack in `ADJ_BG_R01` → Phase 3.
- `RESET MUTE` / `RESET CLAMP` pre-sends in PINCH/BEND → Phase 3.
- Hardcoded `WAIT .75(sec)` / `WAIT .50(sec)` inside PNS programs → Phase 3 (`R[22:BEND SETTLE]`).
- WIP banners, `-BCKED*-` comments, `AUTO_SINGULARITY_HEADER` normalization → Phase 4.
