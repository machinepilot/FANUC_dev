# Handoff — LDJ-BLM R01 Review Fixes — Phase 3

Date: 2026-04-20
Scope: Hardening (timing tunability, ADJ_BG loop-counter integrity, press reset gap placeholders).
Target files: `customer_programs/LDJ-BLM Robot/*_R01.LS`

## Files changed

| File | Change |
| --- | --- |
| `ADJ_BG_R01.LS` | Removed `R[18]=1` overwrite on success — loop now relies solely on `JMP LBL[1]` to exit the `FOR R[18]=1 TO 30` block. `R[18]` retains its true iteration count for diagnostics. |
| `PNS0001_R01.LS` | 4 × `WAIT .75(sec)` → `WAIT R[22:BEND SETTLE]`. |
| `PNS0002_R01.LS` | 2 × `WAIT .75(sec)` + 2 × `WAIT .50(sec)` + 2 × `WAIT 1.00(sec)` (post-`CALL BEND_R01`) → `WAIT R[22:BEND SETTLE]`. |
| `PNS0004_R01.LS` | 8 × `WAIT .75(sec)` → `WAIT R[22:BEND SETTLE]`. |
| `PINCH_R01.LS` | Top-of-file placeholder for `RESET MUTE` / `RESET CLAMP` pre-sends with `TODO: confirm DO indices from Modbus map`. Sends are **commented out** until the real DOs are confirmed. |
| `BEND_R01.LS` | Same `RESET MUTE` / `RESET CLAMP` placeholder + TODO. Also added a trailing `WAIT R[22:BEND SETTLE]` inside the macro so the post-bend settle is centralized. |

## What the operator must do on the pendant before running an R01 program

### 1. Numeric registers

| R[ ] | Comment | Initial value | Used by |
| --- | --- | --- | --- |
| `R[22]` | `BEND SETTLE` | **1.00 (sec)** *(start value — matches the longest of the three old hardcoded values; adjust down once cycle looks good)* | PNS0001/0002/0004 bend blocks, `BEND_R01` macro tail |

Note: PNS0001/0004 only had `.75s` hardcoded, PNS0002 had `.50s` and `1.00s` mixed in — bumping everything to the longest value (1.00s) initially is conservative. Operator should dial `R[22]` down during commissioning.

### 2. Confirm Modbus DO mapping for press reset signals

`PINCH_R01.LS` and `BEND_R01.LS` now have commented-out placeholder lines:

```
!DO[40:RESET MUTE]=ON ;
!DO[41:RESET CLAMP]=ON ;
```

Before uncommenting, confirm the actual Modbus coil → digital output mapping on the controller (Phase 3 finding from the review: the A21.0/A21.1 signals documented in the PLC source were not wired through the I/O table). When you uncomment them:

1. Remove the leading `!` from both lines (both macros).
2. Update `DO[40]` / `DO[41]` to the real DO indices and edit the `:RESET MUTE` / `:RESET CLAMP` comments if the controller comment table uses different text.
3. Delete the `!TODO:` comment block.

Until that's done, the macros behave exactly as they did after Phase 1.

## Behavior changes to verify

1. **ADJ_BG_R01** — `R[18]` now stops at the value where alignment was achieved instead of being reset to 1. This is only visible in diagnostics / data monitoring. No motion change.
2. **PNS0001/0002/0004 bend cycles** — cycle time equivalent to the largest of the old hardcoded waits, assuming `R[22]=1.00 (sec)` (step 1 above). Reduce progressively to see if part settles / pinch settles before release.
3. **BEND_R01 macro** — now ends with `WAIT R[22:BEND SETTLE]`. If you don't want this extra settle in some callers, we can factor it out — raise a ticket, but the PNS changes in Phase 3 already cover for it.
4. **PINCH/BEND pre-sends** — no change until the Modbus DOs are confirmed and placeholders are uncommented.

## NOT in Phase 3

- WIP banners on PNS0003/PNS0004 → Phase 4.
- `AUTO_SINGULARITY_HEADER` normalization → Phase 4.
- `-BCKED*-` stub comments → Phase 4.

## Rollback

All changes remain on `_R01` files. The non-R01 originals are still untouched.
