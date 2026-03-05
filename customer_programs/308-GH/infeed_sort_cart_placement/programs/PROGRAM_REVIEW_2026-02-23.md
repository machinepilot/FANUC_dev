# GH Program Set — Programmer Checklist & Training Guide

**Date:** February 23, 2026  
**Prepared for:** The Way Automation LLC  
**System:** Infeed Sort → Cart Placement (Slot / Bin / Panel / Foam)  
**Controller:** R-30iB Plus, 7-axis w/ E1 Track  

---

## How to Use This Document

This checklist is designed to guide you through fixing the GH program set. Each task includes:

- **What to do** — The exact change to make
- **Why it matters** — What goes wrong if you skip it
- **Concept** — A brief explanation of the FANUC TP concept involved (helpful if this is your first robot project)

Work through the tasks in order. Critical items (🔴) will cause faults or wrong motion; warnings (🟡) cause incorrect counts or broken recovery; suggestions (🔵) improve safety and maintainability.

**Start with Section 2 (Prioritized Checklist)** — that's your main work. Section 1 is a quick reference table if you need to look up a finding by program.

**Important:** The register and I/O maps in Sections 8–9 are derived from `GH_PROGRAM_FILES/IO.txt`, `numreg.txt`, and `posreg.txt`. These exports may not match the live robot configuration. **Always verify register numbers, I/O mapping, and PR assignments on the teach pendant during updates** — treat the appendices as a starting point, not the final word.

---

## 1. Per-Program Findings Reference (Quick Lookup)

| Program | Line(s) | Severity | Issue | Recommended Fix | Dataset Reference |
|---------|---------|----------|-------|-----------------|-------------------|
| GH_AAAMAIN | 37, 43, 49 | 🔴 | LBL[*2] unassigned — SELECT will fault | Assign `LBL[3]`, `LBL[4]`, `LBL[5]` | `reference/FANUC_REF_Branching_Instructions.txt` |
| GH_AAAMAIN | 28–29, 34–35, 40–41, 46–47 | 🔴 | Fall-through after each CALL | Add `JMP LBL[100]` after each flag clear | `examples/EG_JOB_A_CRDrill_SingleHand.txt` (LBL[100], JMP pattern) |
| GH_AAAMAIN | 40 | 🔴 | Wrong flag: F[1] instead of F[3] | `F[3:BIN]=(OFF)` | — |
| GH_AAAMAIN | 17–21 | 🔵 | No SELECT ELSE | Add `ELSE,JMP LBL[99]` with error output | `reference/FANUC_REF_Branching_Instructions.txt` |
| GH_AAAMAIN | 1–5 | 🔵 | No UFRAME/UTOOL at top | Add UFRAME_NUM=0, UTOOL_NUM=1 | `examples/EG_JOB_A_CRDrill_SingleHand.txt` |
| BG_LOGIC | 33 | 🔴 | Panel count uses S_SLOT pointer | `R[102]=R[R[92]]` | — |
| BG_LOGIC | 4, 10, 17 | 🔴 | Dead code — R[96] overwritten by line 52 | Remove conditional R[96] assignments | — |
| GH_PANEL | 15 | 🔴 | Overflow check blocks after first panel | `IF (R[102]>=R[51:MAX PANEL]) THEN` — verify R[51] on pendant | — |
| GH_PARSE | 1–2 | 🔴 | No R[3] default; unknown part passes | Add `R[3:DEST_CLASS]=0` at top; add catch-all after ENDIF | — |
| GH_PARSE | 49 | 🔴 | Typo GO[12] | `GO[1:ERROR CODE]=0` | — |
| GH_PARSE | 45–50 | 🔴 | ELSE pairs with IF R[1]=36 only | Restructure: set R[3]=0, then IF R[3]=0 error | — |
| GH_BIN | 93 | 🔴 | P[5] frame mismatch — wrong location | Use P[3] or re-teach P[5] in UF:20/UT:1 | `reference/FANUC_REF_Offset_Frame.txt` |
| GH_BIN | 3 | 🟡 | UTOOL_NUM=1 (should be 2) | `UTOOL_NUM=2` | — |
| GH_BIN | 17–24 | 🟡 | No BIN1→BIN2 routing | Add `JMP LBL[1]` when BIN1 full, BIN2 not | — |
| GH_BIN | 51, 88 | 🔵 | WAIT DI[R[96]]=ON no TIMEOUT | Add `TIMEOUT,LBL[20100]` + UALM | `reference/FANUC_REF_Wait_Instructions.txt` |
| GH_S_SLOT | 1 | 🟡 | Comment says L_SLOT | `!S_SLOT` | — |
| GH_S_SLOT | 17 | 🟡 | Uses R[100], R[31] (L_SLOT) | R[101], R[41] | — |
| GH_S_SLOT | 97 | 🟡 | Uses R[100] for slot offset | `R[101:S_SLOT_COUNT]*R[60]` | — |
| GH_S_SLOT | 107 | 🟡 | Uses R[R[90]] | `R[R[91]]=R[R[91]]+1` | — |
| GH_L_SLOT | 38 | 🔵 | LENGTH_CLASS=4 sets PR[10,2] (Y) | Verify vs physical layout | — |
| GH_FOAM | 1 | 🔵 | Comment says L_SLOT | `!FOAM` | — |
| GH_FOAM_RECOVER | 10 | 🔴 | PR[10,3]=Constant | Replace with numeric (e.g. 300) | — |
| GH_PANEL_RECOVER | 10, 11, 14 | 🔴 | PR[10,1/3]=Constant | Replace with numeric values | — |
| GH_BIN_RECOVER | 9–101 | 🟡 | Empty recovery body | Implement LPOS→PR[10], Z offset, retract, home | `examples/EG_C_Recovery_Macro.txt`, `examples/EG_DQ_C_Recovery.txt` |
| GH_RECOVER | 8–12 | 🟡 | JMP LBL[2],[3],[4] don't exist; F[5] missing | Use CALL pattern for all 5 types | — |
| GH_RECOVER | 6–12 | 🟡 | Incomplete dispatcher | `IF F[2]=ON,CALL GH_SLOT_RECOVER` etc. | — |
| ALL motion | — | 🔵 | No PAYLOAD instructions | PAYLOAD[1] empty, PAYLOAD[2] loaded after grip | `articles/ONE_12_FANUC_Payload_Setup_and_Configuration.txt` |

---

## 3. Dataset Conventions (Reference)

### 3.1 Main Loop Structure

**Dataset pattern** (`EG_JOB_A_CRDrill_SingleHand.txt`):
```
LBL[100]
  WAIT ...
  SELECT / CALL / logic
  JMP LBL[100]
```

**GH_AAAMAIN:** Has LBL[100] and SELECT, but:
- Labels LBL[3],[4],[5] are LBL[*2] (unassigned)
- No JMP LBL[100] after each branch — execution falls through
- No SELECT ELSE

### 3.2 Register Usage

**Dataset:** Descriptive comments (e.g. R[90:LSLOTREG]), indirect via pointer registers.

**GH programs:** Generally good (R[98:PR_REG], R[99:UFRAME_TEMP], etc.). Exceptions:
- BG_LOGIC line 42: R[94:BIN1REG] used for BIN2 — consider R[94:BIN2REG]
- Bare R[96] in some WAIT/IF — R[96:DI_REG] is documented

### 3.3 I/O Handling

**Dataset:** Verify DI before motion; WAIT with TIMEOUT where appropriate.

**GH programs:**
- ✅ DI verification before cart motion (IF DI[R[96]] THEN error)
- ❌ WAIT DI[R[96]]=ON has no TIMEOUT — robot can hang if sensor fails
- ✅ Gripper state reset at program start (RO[1]–RO[6]=OFF)

### 3.4 Error Recovery

**Dataset** (`EG_C_Recovery_Macro.txt`, `EG_DQ_C_Recovery.txt`): Flag-based dispatch, counter restore from backup.

**GH programs:**
- GH_RECOVER: Uses JMP to non-existent labels; F[5] not handled
- GH_BIN_RECOVER: Empty body
- GH_FOAM_RECOVER, GH_PANEL_RECOVER: Constant placeholders
- GH_SLOT_RECOVER: ✅ Proper structure (LPOS, offset, retract)

### 3.5 Macro Organization

**Dataset:** Reset, chuck, recovery grouped into reusable macros.

**GH programs:** Good separation (GO_ZERO, GH_*_RECOVER). Recovery macros need completion.

---

## 4. Safety and Robustness

| Check | Status | Notes |
|------|--------|------|
| PAYLOAD instructions | ❌ | No program sets PAYLOAD |
| UFRAME/UTOOL setup | ⚠️ | GH_AAAMAIN has none; sub-programs set per destination |
| SELECT ELSE clause | ❌ | R[3] outside 1–5 falls through |
| Gripper state checks | ✅ | RO reset at start of BIN, PANEL, FOAM, L_SLOT, S_SLOT |
| WAIT TIMEOUT | ❌ | Cart safety WAIT has no TIMEOUT |
| Frame consistency | ❌ | GH_BIN P[5] taught in wrong frame |

---

## 5. Optimization Opportunities

| Program | Issue | Recommendation |
|---------|-------|----------------|
| GH_L_SLOT / GH_S_SLOT | LENGTH_CLASS IF block repeated (lines 25–39, 62–76) | Extract to macro or use SELECT |
| GH_BIN | BIN 1 and BIN 2 blocks nearly identical | Consider shared pick/place macro with parameter |
| GH_PARSE | Many sequential IF R[1]=N | Consider SELECT R[1] with cases |
| BG_LOGIC | R[96] assigned 4 times (3 overwritten) | Remove dead code (already in punch list) |

---

## 2. Prioritized Checklist (with Explanations)

Work through these in order. Check off each item (☐ → ☑) as you complete and verify it.

---

### 🔴 CRITICAL — GH_AAAMAIN (Main Program Structure)

#### ☐ Task 1: Assign LBL[3], LBL[4], LBL[5]  
**Location:** GH_AAAMAIN, lines 37, 43, 49  
**Fix:** Change `LBL[*2]` to `LBL[3]`, `LBL[4]`, and `LBL[5]` respectively.

**Why it matters:** The `*` means the label was never assigned on the pendant. When the SELECT instruction jumps to LBL[3], LBL[4], or LBL[5], the controller doesn't find them and faults. Any part routed to BIN, PANEL, or FOAM will cause an immediate program fault.

**Concept:** In FANUC TP, `LBL[n]` marks a spot in the program that JMP or SELECT can jump to. The label must exist and be assigned. An unassigned label shows as `LBL[*n]` in the .LS file.

**Verify:** Run GH_AAAMAIN with R[3]=3, 4, and 5. Confirm the robot executes BIN, PANEL, and FOAM without faulting.

---

#### ☐ Task 2: Add JMP LBL[100] after each destination branch  
**Location:** GH_AAAMAIN, after lines 28, 34, 40, 46  
**Fix:** After each `F[x]=(OFF)` line (L_SLOT, S_SLOT, BIN, PANEL), add `JMP LBL[100] ;` so execution returns to the top of the main loop.

**Why it matters:** Without the JMP, execution "falls through" from one branch into the next. A part destined for L_SLOT would run L_SLOT, then S_SLOT, then BIN, then PANEL, then FOAM — all in one cycle. The robot would try to process the same part five times and likely fault or move incorrectly.

**Concept:** In a main loop, each branch must explicitly jump back to the loop start (LBL[100]). TP doesn't automatically return; it executes line by line. Think of JMP as "go back to the top and wait for the next part."

**Verify:** Single-step through AAAMAIN with R[3]=1. Confirm only GH_L_SLOT runs, then execution returns to LBL[100].

---

#### ☐ Task 3: Fix wrong flag cleared after BIN (line 40)  
**Location:** GH_AAAMAIN, line 40  
**Fix:** Change `F[1:L_SLOT]=(OFF)` to `F[3:BIN]=(OFF)`.

**Why it matters:** After a BIN cycle, we need to turn off F[3:BIN] so BG_LOGIC and the recovery dispatcher know we're done. Clearing F[1] instead leaves F[3] stuck ON. BG_LOGIC uses these flags to calculate frame offsets and select the right recovery program — wrong flag = wrong math and wrong recovery.

**Concept:** Flags (F[]) are used to track which destination type is active. Each destination (L_SLOT, S_SLOT, BIN, PANEL, FOAM) has its own flag. We set it ON before the CALL and OFF after. Copy-paste errors are common here — always double-check which flag you're clearing.

**Verify:** After a BIN cycle, go to DATA → Flags. F[3] must be OFF.

---

#### ☐ Task 4: Add SELECT ELSE clause  
**Location:** GH_AAAMAIN, lines 17–21 (SELECT statement)  
**Fix:** Add `ELSE,JMP LBL[99] ;` as the last case. Create LBL[99] with an error output (e.g., GO[1:ERROR CODE]=4) and JMP LBL[100] to continue.

**Why it matters:** If R[3] is 0, 6, 99, or any value not 1–5, the SELECT has no matching case. Execution falls through to the next line (LBL[1]) and the robot runs L_SLOT with invalid data. That can cause wrong motion or a fault.

**Concept:** SELECT is like a switch/case: it jumps based on the value of a register. The ELSE clause catches any value that doesn't match. Always include ELSE for safety — "if we don't recognize it, error out and don't move."

**Verify:** Set R[3]=99 and run. Robot should output error code 4 and not execute any destination.

---

### 🔴 CRITICAL — BG_LOGIC (Background Logic)

#### ☐ Task 5: Fix panel count register pointer  
**Location:** BG_LOGIC, line 33  
**Fix:** Change `R[102:PANEL_COUNT]=R[R[91]]` to `R[102:PANEL_COUNT]=R[R[92]]`.

**Why it matters:** R[91] points to the S_SLOT count register; R[92] points to the panel count register. This is a copy-paste bug. Panel count would mirror S_SLOT count instead of tracking panels. Overflow checks and placement offsets would be wrong.

**Concept:** BG_LOGIC uses "pointer" registers: R[90], R[91], R[92], etc. hold the *index* of the actual count (e.g., R[91]=34 means "read R[34]"). So R[R[91]] means "read the register whose number is in R[91]." Each destination type has its own pointer — don't mix them.

**Verify:** Place one panel. R[102] should increment. R[101] (S_SLOT count) should not change.

---

#### ☐ Task 6: Remove dead R[96] assignments (lines 4, 10, 17)  
**Location:** BG_LOGIC, lines 4, 10, 17  
**Fix:** Delete or comment out these three lines. Keep line 52 (`R[96:DI_REG]=R[2:SORT CODE]+128`).

**Why it matters:** Lines 4, 10, and 17 set R[96] based on which flag is ON. But line 52 always overwrites R[96] with the universal formula (SORT CODE + 128). So the first three assignments do nothing — they're leftover from an older design. Removing them reduces confusion and keeps the logic clear.

**Concept:** "Dead code" is code that never affects the result because something else overwrites it later. It's safe to remove but can mislead someone reading the program.

**Verify:** With SORT CODE=1, confirm R[96]=129. Check that DI[129] maps to the correct cart sensor.

---

### 🔴 CRITICAL — GH_PANEL

#### ☐ Task 7: Fix overflow check comparison  
**Location:** GH_PANEL, line 15  
**Fix:** Change `IF (R[102:PANEL_COUNT]) THEN` to `IF (R[102:PANEL_COUNT]>=R[51:MAX PANEL]) THEN`. **Verify on the pendant** that R[51] is the MAX PANEL register for your cell — if it's a different register, use that instead. Set max panel capacity (e.g., 3 or 10) in the correct register.

**Why it matters:** The current check is true whenever R[102] is *any* non-zero value. So after the first panel is placed (R[102]=1), every subsequent panel triggers the error and skips placement. We need to compare against the maximum allowed, not just "is it non-zero."

**Concept:** Overflow checks prevent overfilling a destination. The logic should be: "if count >= max, error and don't place." A bare `IF (R[x])` means "if R[x] is not zero" — that's wrong for a capacity check. L_SLOT uses R[31], S_SLOT uses R[41]; panel uses a similar register — confirm on pendant.

**Verify:** On pendant, confirm R[51] (or your MAX PANEL register). Set R[102]=0 and max register to test value. Run panel — should place. Set R[102]=max — should error 101.

---

### 🔴 CRITICAL — GH_PARSE

#### ☐ Task 8: Add default R[3] and unknown-part error handling  
**Location:** GH_PARSE, top and after main ENDIF  
**Fix:**  
1. At the very top (before line 2), add `R[3:DEST_CLASS]=0 ;`  
2. After the main ENDIF (around line 50), add:
   ```
   IF (R[3:DEST_CLASS]=0) THEN ;
     GO[1:ERROR CODE]=4 ;
     WAIT .25(sec) ;
     GO[1:ERROR CODE]=0 ;
   ENDIF ;
   ```
3. Fix line 49: change `GO[12]=0` to `GO[1:ERROR CODE]=0` (typo).

**Why it matters:** If R[1] (part index) is unknown (e.g., 99) or zero, R[3] keeps its value from the last cycle. The robot might route a part to the wrong destination. By setting R[3]=0 at the start and checking it at the end, we catch unknown parts and output an error instead of moving.

**Concept:** "Defensive programming" — assume inputs can be wrong. Initialize outputs (R[3]=0), then only set them when we have a valid match. At the end, if R[3] is still 0, we know something was wrong.

**Verify:** Set R[1]=99. Run. Error code 4 should appear; robot should not move.

---

### 🔴 CRITICAL — GH_BIN

#### ☐ Task 9: Fix P[5] frame mismatch (line 93)  
**Location:** GH_BIN, line 93  
**Fix:** Either use `P[3:IN FRONT OF CART]` (which is taught in UF:20/UT:1, matching the active frame) or re-teach P[5] in UF:20 and UT:1.

**Why it matters:** P[5] was taught in UF:13 and UT:2. At line 93, the program is using UF:20 and UT:1. The same X,Y,Z values mean different physical positions in different frames. The robot would move to a completely wrong location — collision risk.

**Concept:** User frames (UFRAME) and tool frames (UTOOL) define coordinate systems. A position taught in one frame is only correct when that frame is active. Always match the frame when teaching and when using a position. Check the /POS section of the .LS file to see which UF/UT each point was taught in.

**Verify:** Jog to P[5] with UFRAME=20, UTOOL=1. Visually confirm the position is correct (in front of BIN 2 cart).

---

### 🟡 WARNING — GH_BIN

#### ☐ Task 10: Add UTOOL_NUM=2  
**Location:** GH_BIN, after line 2  
**Fix:** Add `UTOOL_NUM=2 ;` (BIN uses tool frame 2 per the logic diagram).

**Why it matters:** UFRAME_NUM is set but UTOOL_NUM was left at 1. The previous program might have used UT:3, 4, or 5. BIN pick positions will be offset by the tool frame difference — the robot may miss the part or collide.

**Concept:** UTOOL defines where the tool center point (TCP) is relative to the robot flange. Different grippers use different tool frames. Each program that moves to pick/place positions must set the correct UTOOL before those motions.

**Verify:** During BIN execution, check the pendant — UTOOL should show 2.

---

#### ☐ Task 11: Add BIN1→BIN2 routing when BIN1 is full  
**Location:** GH_BIN, after the overflow check (around line 24)  
**Fix:** Inside the first IF block, after the ENDIF that checks BIN2, add `JMP LBL[1] ;` so that when BIN1 is full but BIN2 isn't, we skip to the BIN2 section (LBL[1]).

**Why it matters:** Currently, if BIN1 is full and BIN2 is not, the program still tries to place in BIN1 (it falls through). The part goes into an already-full bin. We need to explicitly jump to LBL[1] (BIN2 logic) when BIN1 is full but BIN2 has room.

**Concept:** Overflow logic often has two levels: "if both full, error" and "if first full, use second." The JMP routes execution to the correct block. Without it, execution continues into the wrong block.

**Verify:** Set R[103]=MAX (BIN1 full), R[104]=0. Run BIN. Robot should go to BIN2 (LBL[1]).

---

### 🟡 WARNING — GH_S_SLOT

#### ☐ Task 12: Replace L_SLOT references with S_SLOT  
**Location:** GH_S_SLOT, lines 1, 17, 97, 107  
**Fix:**  
- Line 1: `!S_SLOT` (comment)  
- Line 17: `IF (R[101:S_SLOT_COUNT]>=R[41:MAX S_SLOT])`  
- Line 97: `PR[10,1]=R[101:S_SLOT_COUNT]*R[60:SLOT_OFFSET]`  
- Line 107: `R[R[91]]=R[R[91]]+1` (was R[R[90]])

**Why it matters:** GH_S_SLOT was copied from GH_L_SLOT. It still uses L_SLOT registers (R[100], R[31], R[90]). L_SLOT and S_SLOT would share the same counter and fight over it. Per the logic diagram, S_SLOT uses R[101], R[41], R[91].

**Concept:** Each destination type has its own set of registers. L_SLOT: R[100], R[31], R[90]. S_SLOT: R[101], R[41], R[91]. When you copy a program, do a global search for the old register names and replace with the new ones.

**Verify:** Place one S_SLOT part. R[101] should increment. R[100] should not change.

---

### 🟡 WARNING — GH_RECOVER

#### ☐ Task 13: Replace JMP with CALL for all 5 part types  
**Location:** GH_RECOVER, lines 6–12  
**Fix:** Replace the entire dispatcher with:
```
IF (F[1:L_SLOT]=ON),CALL GH_SLOT_RECOVER ;
IF (F[2:S_SLOT]=ON),CALL GH_SLOT_RECOVER ;
IF (F[3:BIN]=ON),CALL GH_BIN_RECOVER ;
IF (F[4:PANEL]=ON),CALL GH_PANEL_RECOVER ;
IF (F[5:FOAM]=ON),CALL GH_FOAM_RECOVER ;
```

**Why it matters:** The current code uses `JMP LBL[2]`, `JMP LBL[3]`, `JMP LBL[4]` — but those labels don't exist in GH_RECOVER. The program would fault. F[5:FOAM] isn't handled at all. Using CALL runs the correct recovery sub-program for each part type and returns when done.

**Concept:** A recovery "dispatcher" checks which flag is ON (telling us where the part was when we faulted) and calls the right recovery program. CALL is correct here because we want to run another program and come back. JMP would require the labels to exist in this program.

**Verify:** Set each flag F[1]–F[5] ON individually. Run GH_RECOVER. Confirm the correct recovery program is called each time.

---

### 🔴 CRITICAL — Recovery Programs (Constant Placeholders)

#### ☐ Task 14: GH_FOAM_RECOVER — Replace Constant (line 10)  
**Location:** GH_FOAM_RECOVER, line 10  
**Fix:** Change `PR[10,3:LINEAR OFFSET]=Constant` to a numeric value (e.g., `300` for 300 mm Z clearance). Adjust based on actual clearance needed.

**Why it matters:** `Constant` is a placeholder — it was never entered on the pendant. The controller doesn't accept it; you'll get INTP-304 (invalid value) when the recovery runs.

**Concept:** PR[10] is used as a work register for offsets. PR[10,3] is the Z component. We copy LPOS (current position) into PR[10], then add a Z offset to retract upward before moving away. The value depends on your cell — measure a safe clearance.

**Verify:** Call GH_FOAM_RECOVER from a safe position. No INTP-304 alarm.

---

#### ☐ Task 15: GH_PANEL_RECOVER — Replace Constant (lines 10, 11, 14)  
**Location:** GH_PANEL_RECOVER, lines 10, 11, 14  
**Fix:** Replace each `Constant` with numeric values (e.g., -500, 300, -1500 for linear offsets). Match the pattern used in GH_SLOT_RECOVER — Z retract, then X/Y clear.

**Why it matters:** Same as Task 14 — `Constant` will fault at runtime.

**Verify:** Call GH_PANEL_RECOVER. No INTP-304 alarm.

---

### 🟡 WARNING — GH_BIN_RECOVER

#### ☐ Task 16: Implement recovery logic  
**Location:** GH_BIN_RECOVER, lines 9–101 (inside the IF body)  
**Fix:** Implement the recovery sequence, similar to GH_SLOT_RECOVER:
1. `PR[10:LINEAR OFFSET]=LPOS` — capture current position  
2. `PR[10,3:LINEAR OFFSET]=300` (or appropriate Z clearance)  
3. `L PR[10] 100mm/sec FINE` — linear retract upward  
4. Add X/Y offset to clear the cart  
5. Joint move to home or infeed (e.g., `J PR[3:ACP_ABOVE_IF]` or equivalent)

**Why it matters:** The IF body is empty. When the robot faults in the cart zone, BIN_RECOVER runs but does nothing. The robot stays in the fault position. We need to retract safely, then return to a known good position.

**Concept:** Recovery programs follow a standard pattern: capture position → apply safe offset → retract → return to home/infeed. See GH_SLOT_RECOVER for a working example. Reference: `FANUC_Optimized_Dataset/optimized_dataset/examples/EG_C_Recovery_Macro.txt`.

**Note:** On the pendant, verify that PR[3:ACP_ABOVE_IF] (or equivalent) exists and is taught before recovery will work. If it's a different PR, use that.

**Verify:** Jog robot to a cart position. Run GH_BIN_RECOVER. Robot should retract and return safely.

---

### 🔵 SUGGESTION — Safety & Robustness

#### ☐ Task 17: Add PAYLOAD instructions (all motion programs)  
**Location:** Start of BIN, PANEL, FOAM, L_SLOT, S_SLOT  
**Fix:** Add `PAYLOAD[1]` at program start (empty gripper). After grip confirm, add `PAYLOAD[2]` (loaded). Define payloads 1 and 2 in the payload setup menu.

**Why it matters:** The controller uses payload for motion planning and collision detection. Wrong or missing payload affects track accuracy (E1 axis) and can make the robot less responsive to collisions.

**Concept:** PAYLOAD tells the robot the mass and center of gravity of what's on the tool. Empty vs. loaded changes the dynamics. Reference: `FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_12_FANUC_Payload_Setup_and_Configuration.txt`.

---

#### ☐ Task 18: Add WAIT TIMEOUT for cart safety DI  
**Location:** BIN, PANEL, FOAM, L_SLOT, S_SLOT — wherever `WAIT DI[R[96]]=ON` appears  
**Fix:** Add `TIMEOUT,LBL[20100]` to the WAIT. Create LBL[20100] with `UALM[1]` (or appropriate alarm) and a safe stop/retry.

**Why it matters:** If the cart sensor fails or is disconnected, `WAIT DI[R[96]]=ON` waits forever. The robot hangs with no indication. A TIMEOUT branches to an alarm so the operator knows something is wrong.

**Concept:** `WAIT condition TIMEOUT,LBL[x]` means "wait until condition is true, but if it doesn't happen within $WAITTMOUT, jump to LBL[x]." Always use TIMEOUT for safety-critical waits. Reference: `FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Wait_Instructions.txt`.

---

#### ☐ Task 19: Add UFRAME/UTOOL at top of GH_AAAMAIN  
**Location:** GH_AAAMAIN, before LBL[100]  
**Fix:** Add `UFRAME_NUM=0 ;` and `UTOOL_NUM=1 ;` at the top.

**Why it matters:** GH_AAAMAIN doesn't do motion itself, but if someone adds a motion instruction later, the default frame might be wrong. Setting a known default (world frame, tool 1) is a safety practice.

---

#### ☐ Task 20: Trim excessive blank lines  
**Location:** All programs  
**Fix:** Remove the 40–80 blank lines at the end of each program.

**Why it matters:** During FAT demos, less scrolling on the pendant looks more professional. It doesn't affect execution but improves readability.

---

**Total estimated time:** ~90 minutes

---

## 6. Verification Steps

### 6.1 Critical Fixes (Labels, Flags, Registers)

1. **Labels:** Run GH_AAAMAIN with R[3]=3, 4, 5 — confirm SELECT branches to BIN, PANEL, FOAM.
2. **Fall-through:** Single-step AAAMAIN; confirm only one sub-program executes per cycle.
3. **F[3] after BIN:** After BIN cycle, DATA → Flags — F[3] must be OFF.
4. **Panel count:** Place one panel; R[102] increments, R[101] unchanged.
5. **R[96]:** With SORT CODE=1, confirm R[96]=129 (or verify on pendant); verify DI[R[96]] maps to correct cart sensor.
6. **Panel overflow:** R[102]=0, R[51]=3 (or your MAX PANEL register — verify on pendant) — place OK; R[102]=max — error 101.
7. **Unknown part:** R[1]=99 — error code 4, no motion.
8. **P[5] frame:** Jog to P[5] with UF:20/UT:1 — confirm position correct.
9. **Constant placeholders:** Call GH_FOAM_RECOVER, GH_PANEL_RECOVER — no INTP-304.

### 6.2 Warning Fixes (Counters, Recovery)

10. **S_SLOT count:** Place one S_SLOT part — R[101] increments, R[100] unchanged.
11. **BIN routing:** R[103]=MAX, R[104]=0 — BIN goes to LBL[1] (BIN 2).
12. **UTOOL:** During BIN execution, pendant shows UT:2.
13. **GH_RECOVER:** Set each F[1]–F[5] ON; run GH_RECOVER; correct sub-program called.
14. **GH_BIN_RECOVER:** Jog to cart; run BIN_RECOVER; confirm safe extraction.

### 6.3 Suggestion Fixes

15. **PAYLOAD:** Verify track accuracy and collision sensitivity with payload set.
16. **WAIT TIMEOUT:** Simulate cart sensor failure; confirm timeout branches to UALM.
17. **LENGTH_CLASS=4:** Verify PR[10,2] (Y) vs physical layout.

### 6.4 Pre-FAT Verification (Before Customer Demo)

Before FAT, verify on the teach pendant:

- **Registers:** R[15] BIN MAX, R[31] MAX L_SLOT, R[41] MAX S_SLOT, R[51] MAX PANEL — confirm values match your cell capacity. Register numbers may differ; check DATA → Numeric Registers.
- **Position registers:** PR[94] BIN 1 PLACE, PR[95] BIN 2 PLACE, PR[96]–PR[99] FOAM 1–4 PLACE, PR[100] PANEL PLACE — must be taught in the correct UFRAME for each destination. PR[3] ACP_ABOVE_IF (or equivalent) for recovery.
- **I/O:** DI[129], DI[130] cart zone sensors — confirm mapping and function. DI[56] INFO READY, GI[1] SORT INDEX, GI[2] PART INDEX — verify with PLC/vision.

---

## 7. Dataset File References

| Topic | Path |
|-------|------|
| Main loop, PAYLOAD | `FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_A_CRDrill_SingleHand.txt` |
| Branching, SELECT, ELSE | `FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Branching_Instructions.txt` |
| WAIT, TIMEOUT | `FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Wait_Instructions.txt` |
| UFRAME, UTOOL | `FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Offset_Frame.txt` |
| Payload setup | `FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_12_FANUC_Payload_Setup_and_Configuration.txt` |
| Recovery patterns | `FANUC_Optimized_Dataset/optimized_dataset/examples/EG_C_Recovery_Macro.txt`, `EG_DQ_C_Recovery.txt` |

---

## 8. Register Quick Reference (Verify on Pendant)

*Derived from `GH_PROGRAM_FILES/numreg.txt`. These may not match your robot — confirm on the teach pendant before using.*

| Registers | Purpose |
|-----------|---------|
| R[1]–R[4] | PART INDEX, SORT CODE, DEST_CLASS, LENGTH_CLASS |
| R[5]–R[14] | CART 1–6 BIN 1/2 counts |
| R[15] | BIN MAX |
| R[25]–R[30] | CART 1–6 L_SLOT counts |
| R[31] | MAX L_SLOT |
| R[35]–R[40] | CART 1–6 S_SLOT counts |
| R[41] | MAX S_SLOT |
| R[45]–R[50] | CART 1–6 PANEL counts |
| R[51] | MAX PANEL |
| R[60], R[61] | SLOT_OFFSET, CART OFFSET |
| R[90]–R[99] | Pointers (LSLOTREG, SSLOTREG, PANELREG, etc.) |
| R[100]–R[104] | Current counts (L_SLOT, S_SLOT, PANEL, BIN1, BIN2) |

**Concept:** R[90]–R[92] hold the *index* of the count register for the active cart. BG_LOGIC sets these from SORT CODE. R[100]–R[104] hold the actual count values read from those registers.

---

## 9. I/O Quick Reference (Verify on Pendant)

*Derived from `GH_PROGRAM_FILES/IO.txt`. These may not match your robot — confirm on the teach pendant before using.*

| Signal | Type | Name | Used In |
|--------|------|------|---------|
| DI[56] | DI | INFO READY | GH_AAAMAIN (part ready) |
| DI[129] | DI | CART 1 ZONE | Recovery, cart safety |
| DI[130] | DI | CART 2 ZONE | Recovery, cart safety |
| DI[135] | DI | (infeed) | GH_SLOT_RECOVER (OUT OF INFEED) |
| DO[21] | DO | INFO REGISTERED | GH_AAAMAIN |
| DO[29] | DO | IN WAIT | GH_AAAMAIN |
| GI[1] | GI | SORT INDEX | GH_AAAMAIN |
| GI[2] | GI | PART INDEX | GH_AAAMAIN |
| GO[1] | GO | ERROR CODE | All programs |

**Concept:** R[96] is set by BG_LOGIC to the cart zone DI for the active SORT CODE (e.g., 129 for cart 1). Programs use DI[R[96]] so one routine works for all carts.

---

*Program review based on FANUC_Optimized_Dataset conventions. Use this as a training guide when working through the fixes. Register and I/O mappings must be verified on the teach pendant.*
