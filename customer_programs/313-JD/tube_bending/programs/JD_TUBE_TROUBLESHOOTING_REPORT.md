# JD Tube Cell – Troubleshooting Analysis Report

**For:** Austin (Programmer)  
**Date:** March 2, 2025  
**Source:** Consolidated field notes + robot program analysis

---

## Executive Summary

This report consolidates field troubleshooting notes with references to the JD Tube robot programs in `313-JDtube-LS_FILES`. Four carts are fixed and running; Carts 1–3 operate normally. Remaining concerns center on: (1) the Robot Error signal to YLM being stuck high while the robot continues to run, (2) intermittent ghost trips on outfeed approach, (3) Cart 4 logic validation after DCS changes, and (4) the safe-zone handshake and gripper/collet hazard during transfer.

**Priority:** Treat the safe-zone handshake and gripper/collet hazard as safety-critical. If a ghost trip occurs while placing a tube in the collet, the bender could drive into the gripper and cause major damage.

---

## Confirmed Resolved / Current Baseline

- **All four cart pick positions fixed** (Carts 1–4)
- **Carts 1–3 run normally** (no known logic issues)
- **Area scanner replaced**; old scanner stored behind HMI in control cabinet
- **DCS safety zones adjusted** by Austin to address suspected ghost stops

---

## Robot Program Structure

| Program | Purpose |
|--------|---------|
| `JD600_6AL.LS` | Main loop; uses `INFEED_PICK_4_R2` for Cart 4 |
| `YT447838_AO_90_BEND.LS` | Example part program (same structure) |
| `LOAD_BENDER_YT435891.LS` | Collet load + safe zone handshake |
| `UNLOAD_BENDER.LS` | Part removal from bender |
| `CLAMP_TUBE.LS` / `UNCLAMP_TUBE.LS` | Gripper open/close |
| `INFEED_PICK_4_R2.LS` | Cart 4 pick logic (active) |
| `MUTE_LIGHT_CURTAIN.LS` | Outfeed light curtain mute |

---

## I/O Quick Reference

| Signal | Type | Usage |
|--------|------|-------|
| DI[106] | Input | Manual override / abort; `IF (DI[106])` → ABORT |
| DO[21] | Output | Home/ready; `IF DO[21]=OFF,CALL GO_HOME` |
| DO[25] | Output | Bender ready request |
| DI[120] | Input | Bender ready ack |
| DO[27] | Output | Load complete request |
| DI[121] | Input | Load complete ack |
| DO[29] | Output | Outfeed approach request |
| DI[122], DI[123] | Input | Light curtain / outfeed permissive |
| DO[31] | Output | Outfeed table enable |
| DO[26], DI[118] | Output/Input | Clamp (gripper open) |
| DO[28], DI[119] | Output/Input | Unclamp |
| RO[1], RO[2] | Robot Output | Gripper open = ON (robot safe signal) |
| DI[113]–DI[116] | Input | Cart 1–4 enable (DI[116] = Cart 4) |
| RI[2], RI[3], RI[4] | Robot Input | Part/gripper presence |

**Note:** Robot Error signal to YLM (relay #90, wire T7:02:04) is not driven by TP logic; it is likely a system alarm output. Check I/O configuration.

---

## Issue 1: Robot Error Signal Stuck High (YLM Interconnect) — CRITICAL

### Symptom

- YLM HMI shows **Robot Error HIGH** continuously
- Wire T7:02:04 (Terminal Block 3, right side, second level) is **24VDC hot all the time**
- Ice cube relay #90 (far right) stays high
- Robot continues operating despite error display
- This should interlock and stop robot/bender operation

### Root Cause / Theory

- Wiring or I/O expectation mismatch (sourcing vs sinking, or ground-switched logic on YLM side)
- Error state may be cosmetic on HMI but not tied into permissive chain — dangerous because it can mask real faults

### Code Reference

- **Location:** Not in TP program; system-level I/O
- Robot TP does not set robot error output; it is driven by controller alarm logic
- `DI[106]` is used for manual override abort in many programs; no TP logic drives the error signal

**Example:** `LOAD_BENDER_YT435891.LS` line 6, `JD600_6AL.LS` line 10:
```
IF (DI[106]),JMP LBL[1] ;
```

### Action Items

1. Confirm robot I/O mapping for alarm/error output
2. Verify YLM side wiring (sourcing vs sinking, ground-switched logic)
3. Confirm whether YLM uses this signal for permissive or only display
4. Determine why relay #90 stays high — is the robot output wired correctly?

---

## Issue 2: Safety Ghost Trips (Outfeed Approach)

### Symptom

- Stoppages occur as robot heads toward outfeed table **before breaking the light barrier plane**
- Appears random / intermittent
- DCS edge interaction remains a leading theory (speed-dependent J-move apex cutting into zone)

### Root Cause / Theory

- J-move apex with CNT50 may cut into DCS zone; speed-dependent
- Ghost trips occur on P[14] Transition to Table and P[1] Wait on Light Curtain — both before robot breaks light barrier (DI[122]/DI[123])

### Code Reference

**File:** `JD600_6AL.LS` lines 81–95

```
 81:J P[14:Transition to Table] 50% CNT50    ;
 82:   ;
 83:J P[1:Wait on Light Curtain] 50% FINE    ;
 84:   ;
 85:  DO[29]=ON ;
 86:   ;
 87:  WAIT (DI[120])    ;
 88:   ;
 89:  DO[29]=OFF ;
 90:   ;
 91:  CALL MUTE_LIGHT_CURTAIN    ;
 92:   ;
 93:  WAIT (!DI[122] AND DI[123])    ;
 94:   ;
 95:  DO[31]=ON ;
```

**Ghost trip zone:** P[14] (J 50% CNT50) and P[1] (J 50% FINE) — both occur before the robot breaks the light barrier.

### Action Items

1. Confirm DCS changes and scanner swap resolved trips
2. Use Mosaic counters to identify which safety channel trips
3. Consider reducing speed or CNT on P[14] if DCS edge interaction is suspected

---

## Issue 3: Cart 4 Logic

### Symptom

- **Only Cart 4** reported to have logic issues; Carts 1–3 operate fine
- Cart 4 not fully validated after recent DCS changes
- Historical: Cart 4 appeared to refuse last position / last part under certain count conditions (off-by-one style behavior)

### Root Cause / Theory

- No obvious differences seen in logic vs other carts; root cause unclear
- May be safety stop presenting as cart logic failure

### Code Reference

**Active program:** `INFEED_PICK_4_R2.LS`

- Uses DI[116] for cart enable, F[4] for cart complete
- Uses R[21] for total count (vs R[18] in non-R2 variants)
- Uses R[32], R[33] for layer logic
- Correct R[14] calculation: `R[14]=R[21]-R[4]+1` (line 81)

### Action Items

1. Re-test Cart 4 under production-like cycle
2. Monitor Mosaic counters, robot alarm logs, DCS events
3. Rule out safety stop presenting as cart logic failure

---

## Issue 4: Safe Zone Handshake + Gripper/Collet Hazard — HIGH RISK

### Symptom

- Gripper hang / "won't open" / stuck in collet transfer occurs specifically during the program segment where **robot is telling the bender it is in the safe zone**
- Rare, but if a ghost trip occurs while placing tube in the collet, there is credible risk that **bender drives into the gripper**, causing **major damage**

### Root Cause / Theory

- Ghost trip during collet transfer can leave robot in danger zone while bender gets permissive
- Bender motion permissive may be granted during ambiguous state (robot not fully clear, safety trip mid-transfer)

### Code Reference

**File:** `LOAD_BENDER_YT435891.LS` lines 10–22

```
  10:L PR[25] 700mm/sec FINE    ;
  11:   ;
  12:  WAIT   1.00(sec) ;
  13:   ;
  14:  CALL CLAMP_TUBE    ;
  15:   ;
  16:  RO[2]=ON ;
  17:   ;
  18:  WAIT   1.00(sec) ;
  19:   ;
  20:L PR[29] 2000mm/sec CNT25    ;
  21:   ;
  22:L P[1] 2000mm/sec FINE    ;
```

**Sequence:** Robot enters collet → CLAMP_TUBE (gripper open) → RO[2]=ON (robot safe) → 1 s wait → move out (CNT25). RO[2]=ON tells bender "robot is clear."

### Action Items

1. Treat as safety-critical sequence integrity issue, not just nuisance downtime
2. Confirm bender cannot move unless robot-safe is truly valid and stable
3. Confirm ghost-trip handling cannot leave robot in danger zone while bender gets permissive
4. Ensure bender motion permissive cannot be granted during any ambiguous state (robot not fully clear, safety trip mid-transfer, robot I/O latched in wrong state)

---

## Potential Code Fixes

### R[14] + Constant Bug (INFEED_PICK_4.LS, INFEED_PICK_3.LS)

**Files:** `INFEED_PICK_4.LS` line 95, `INFEED_PICK_3.LS` line 95

**Current (incorrect):**
```
R[14]=R[18]-R[4]+Constant    ;
```

**Should be:**
```
R[14]=R[18]-R[4]+1    ;
```

- **Impact:** If `Constant` is undefined or 0, R[14] (remaining count) can be wrong for Cart 3/4
- **Status:** `INFEED_PICK_4_R2.LS` uses `R[14]=R[21]-R[4]+1` (correct). JD600_6AL calls `INFEED_PICK_4_R2`, so this bug may not affect current production
- **Action:** Replace `Constant` with `1` in `INFEED_PICK_4.LS` and `INFEED_PICK_3.LS` if those variants are ever used

---

## Austin Action Checklist

**Priority order:**

1. **Safe-zone handshake integrity** — Ensure bender motion permissive cannot be granted during ambiguous states (robot not clear, safety trip mid-transfer)
2. **Robot Error signal chain** — Why is relay #90 stuck high? Verify YLM input expectation (dry contact vs 24V, sinking vs sourcing) and whether signal is used for permissive
3. **Ghost trip causality** — Are trips eliminated after DCS change + scanner replacement? If not, use Mosaic counters to identify which channel trips
4. **Cart 4 re-test** — Validate under production-like cycle; verify if failure is truly cart logic vs safety/DCS presenting as cart failure
5. **Code fix** — Replace `Constant` with `1` in `INFEED_PICK_4.LS` and `INFEED_PICK_3.LS` if those variants are used

---

## Open Questions

- Which robot program is used in production (JD600_6AL vs another)?
- Is there an I/O mapping document for robot alarm/error output?
- Are Mosaic counters enabled and logging?
