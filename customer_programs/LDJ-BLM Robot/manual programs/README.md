# LDJ-BLM Manual (T2) Programs

Operator-paced bending programs for the LDJ CRX cell where the **press brake is not integrated with the robot**. The robot loads the part into the press, stops at every operator hand-off, and waits for the operator (teach pendant in hand, T2 mode) to press RESUME to continue.

These files are scaffolded from the production `PNS000X_R01.LS` programs up the hall with all press-brake sequencing (`PINCH_R01`, `BEND_R01`, `OPEN_PRESS_R01`, DI[21..23]/DI[25] waits, and inter-bend regrip motion) removed.

## Files

| File | Part number | Derived from | Outfeed state |
| ---- | ----------- | ------------ | ------------- |
| `M_6410808783.LS` | 6410808783 | `PNS0001_R01.LS` | taught |
| `M_6410817074.LS` | 6410817074 | `PNS0002_R01.LS` | taught |
| `M_6410816256.LS` | 6410816256 | `PNS0003_R01.LS` | **placeholder — needs live teach** |
| `M_6410818389.LS` | 6410818389 | `PNS0004_R01.LS` | **placeholder — needs live teach** |
| `M_6410820756.LS` | 6410820756 | `PNS0005_R01.LS` | **placeholder — needs live teach** |
| `M_08780.LS` | *TBD, ends in `08780`* | (new) | **all placeholders** |
| `M_07051.LS` | *TBD, ends in `07051`* | (new) | **all placeholders** |
| `M_15304.LS` | *TBD, ends in `15304`* | (new) | **all placeholders** |
| `M_0964.LS`  | *TBD, ends in `0964`*  | (new) | **all placeholders** |
| `M_0965.LS`  | *TBD, ends in `0965`*  | (new) | **all placeholders** |

### Naming convention

- `M_` prefix because FANUC `/PROG` names cannot start with a digit. The raw 10-digit part numbers aren't legal program names by themselves, so each manual program is `M_<full part number>`.
- New-part templates use `M_<suffix>` as a placeholder until the full part number is known. **TODO:** rename each template once the full part number is documented (update `/PROG`, the filename, and the `COMMENT` banner together).

## Manual cycle flow (what every `M_*` does)

```
HOME
  ↓
LBL[1] ────────────────────────────────────────────────┐
  PICK (UF1)                                            │
    SEARCH_R01 (first part), depletion check, Z-track   │
    VAC ON + WAIT DI[30]=ON grip verify                 │
    clear infeed                                        │
  ZERO TABLE (UF2)                                      │
    drop, reorient, re-pick, VAC ON + grip verify       │
  APPROACH PRESS (UF2 → UF3)                            │
  INSERT (UF3) P[18] / P[17] / P[21] / P[23]            │
  ■ PAUSE #1 — operator manually pinches part           │
  VAC OFF, straight-up retract                          │
  GO_HOME_R01 — robot clear of press                    │
  ■ PAUSE #2 — operator manually bends all bends        │
  RETRIEVE FINISHED (UF3) P[100] / P[200]               │
    VAC ON + grip verify                                │
  OUTFEED (UF4)                                         │
  VAC OFF, return HOME                                  │
  R[10]++, PR[Z-track] -= R[12:THICKNESS]               │
  ■ PAUSE #3 — operator confirms before next cycle      │
└──────────────────────────── JMP LBL[1] ───────────────┘
```

- All `CALL PINCH_R01`, `CALL BEND_R01`, `CALL OPEN_PRESS_R01`, and `WAIT R[22:BEND SETTLE]` lines from the source `PNS000X_R01` programs are **removed**. No press I/O is referenced.
- The grip-verify chain (`WAIT R[19:VAC SETTLE]`, `WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90]`, `PAYLOAD[2]`) from the Phase 1 R01 upgrade is preserved at every pick point.
- `$WAITTMOUT=3000` is set at line 1 so the grip-confirm WAIT has its 3 s timeout even when the operator loads the program without first running a PNS.

### Operator hand-offs (PAUSE semantics)

The program stops with a full `PAUSE ;` at three places in every cycle:

| # | Banner comment | What the operator does | How to resume |
| - | -------------- | ---------------------- | ------------- |
| 1 | `HOLD POSITION. OPERATOR: PINCH PART IN PRESS. RESUME TO RELEASE.` | Steps the press down by hand to pinch the part while the robot holds it. | Press CYCLE START / RESUME on the pendant. Robot then releases vacuum and retracts. |
| 2 | `ROBOT CLEAR. OPERATOR: BEND PART MANUALLY. RESUME TO RETRIEVE.` | Runs every bend by hand at the press while the robot sits at `PR[1:HOME]`. | Press RESUME. Robot moves to retrieve the finished part at `P[100..102]` (or `P[200..202]` on M_6410818389). |
| 3 | `PART DONE. RESUME FOR NEXT PART OR ABORT.` | Inspects / removes the finished part from the outfeed pallet if desired. | Press RESUME for the next part, or ABORT to stop. |

On UALM tails (`LBL[90]` grip fail, `LBL[99]` out of parts) the program also `PAUSE`s after raising the user alarm so the operator can reset and retry.

## Pendant-side data expectations

No new registers or PRs are introduced. All of these must already be taught from the Phase 1–4 R01 rollout:

| Resource | Purpose |
| -------- | ------- |
| `R[10:PART INDEX]` | Cycle counter (shared; manual programs reset it at entry) |
| `R[11:THRESHOLD]` | Depletion threshold for `PR[5X,3]` |
| `R[12:THICKNESS]` | Sheet thickness, subtracted from `PR[5X,3]` each cycle |
| `R[19:VAC SETTLE]` | Vacuum settle dwell used by every grip |
| `R[20]` | Cycle time capture (`= TIMER[1]`) |
| `PR[1:HOME]` | Global HOME joint pose |
| `PR[2:OFFSET]` | Approach offset (Z only) |
| `PR[10:infd search]` | `SEARCH_R01` output |
| `PR[50..54]` | Per-infeed Z-track registers (INFD1..INFD5) for `M_641*` programs |
| `PR[55..59]` | **Placeholders** for the 5 new-part templates (`M_08780`..`M_0965`) — reassign to the correct infeed PR before running |
| `PAYLOAD[1]` | EOAT only |
| `PAYLOAD[2]` | EOAT + part |
| `UFRAME[1..4]` | 1 = infeed, 2 = zero table, 3 = press, 4 = outfeed |
| `UTOOL[1]` | Active end-effector |
| `DI[30:PART DETECT]` | Vacuum grip-verify input |
| `DO[22..25]` | Vacuum zones (driven via `ALL_VAC_ON_R01` / `ALL_VAC_OFF_R01`) |
| `UALM[3]` | Grip verify failed |
| `UALM[8]` | Infeed depleted |

## Positions that need live teach

Every `M_*.LS` that landed with placeholder positions tags them inline with `!TEACH: ...` banners. On the pendant, after loading the program, walk the cursor to each `!TEACH` banner and record the point with `F4 [RECORD]` (or equivalent) before running the cycle. Live-teach scope:

- **M_6410808783**, **M_6410817074**: only the 3 retrieval points `P[100..102]` / `P[100..102]`.
- **M_6410816256**, **M_6410820756**: retrieval `P[100..102]` + outfeed `P[56..59]`.
- **M_6410818389**: retrieval `P[200..202]` + outfeed `P[56..59]` (the source PNS already uses `P[100]..P[108]`, so retrieval was bumped to `P[200..202]` to avoid a collision when the manual `/POS` was cloned).
- **M_08780**, **M_07051**, **M_15304**, **M_0964**, **M_0965**: **every** position (pick path `P[1..P[7]`, zero table `P[8]`/`P[9]`, press approach `P[17]`, insert `P[18]`, retract `P[23]`, retrieval `P[100..102]`, outfeed `P[56..59]`). Also reassign the infeed PR tag `PR[5X:INFD TBD]` to the real infeed PR for that part.

## Things that are intentionally missing

- No press-integration macros (`PINCH_R01`, `BEND_R01`, `OPEN_PRESS_R01`).
- No press DIs (`DI[21]`, `DI[22]`, `DI[23]`, `DI[25]`).
- No `WAIT R[22:BEND SETTLE]` dwells (no bends are robot-driven).
- No second/third/fourth bend reorient motions from PNS0002/PNS0003/PNS0004/PNS0005. The robot is at `PR[1:HOME]` during **all** bends.
- No `TIMER[1]` reporting beyond the single end-of-cycle capture into `R[20]`.

## Rename checklist (when a full part number lands)

For each template as the customer locks in the full part number:

1. Rename `M_<suffix>.LS` to `M_<full part number>.LS` on disk and in the controller CMOS.
2. Update `/PROG  M_<...>` on line 1.
3. Update `COMMENT = "<full part number> MANUAL T2"` in `/ATTR`.
4. Update the line-2 banner `!TEMPLATE: PART ***<suffix> ;` to `!<full part number> MANUAL T2 ;`.
5. Replace the placeholder PR `PR[5X,3:INFD TBD]` with the actual infeed PR (or leave it if a new infeed PR is created for that part).
6. Remove the WIP banner (`!* TEMPLATE. ALL POSITIONS ... *`) once every position has been live-taught.

## Safety reminders for T2 stepping

- Teach pendant deadman must stay engaged through the whole cycle; a released deadman pauses the robot mid-motion.
- Override defaults to 10 % on T2; leave it there for the first approach to each new taught point.
- The two PAUSE points where the robot is holding the part in the press are the most dangerous — confirm the part is seated before stepping the press ram.
- `UALM[3]` (grip fail) fires if `DI[30:PART DETECT]` doesn't go ON within 3 s of vacuum on. Inspect EOAT / cup seating, then `RESET` and `CYCLE START`.
