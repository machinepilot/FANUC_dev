# Code Review: LDJ-BLM — Press Brake Tending (R01)

**Customer:** LDJ-BLM Robot
**Application:** Press brake tending (BLM Kvara press brake)
**Robot:** R01 (primary press brake tending robot)
**Reviewer:** Cowork QA Agent
**Date:** 2026-04-15
**Status:** Findings Complete

---

## 1. Programs Reviewed


| #   | Program               | Description                             | Lines | Role                 |
| --- | --------------------- | --------------------------------------- | ----- | -------------------- |
| 1   | PNS0001_R01.LS        | Job 1 — 2-bend part cycle               | 207   | PNS job (main cycle) |
| 2   | PNS0002_R01.LS        | Job 2 — 2-bend part cycle (alt routing) | 190   | PNS job (main cycle) |
| 3   | PNS0003_R01.LS        | Job 3 — 1-bend part cycle               | 143   | PNS job (main cycle) |
| 4   | PNS0004_R01.LS        | Job 4 — 4-bend part cycle               | 327   | PNS job (main cycle) |
| 5   | PNS0005_R01.LS        | Job 5 — 2-bend part cycle               | 143   | PNS job (main cycle) |
| 6   | BG_LOGIC_R01.LS       | Background I/O monitoring               | 18    | Background logic     |
| 7   | BEND_R01.LS           | Bend command macro                      | 13    | Shared macro         |
| 8   | PINCH_R01.LS          | Pinch/clamp command macro               | 22    | Shared macro         |
| 9   | OPEN_PRESS_R01.LS     | Open press command                      | 16    | Shared macro         |
| 10  | START_PART_R01.LS     | Part start signal pulse                 | 1     | Signal macro         |
| 11  | END_PART_R01.LS       | Part end signal pulse                   | 1     | Signal macro         |
| 12  | SEARCH_R01.LS         | Part detection search loop              | 25    | Shared macro         |
| 13  | GO_HOME_R01.LS        | Move to home position                   | 5     | Utility              |
| 14  | GO_ZERO_R01.LS        | Move to zero position                   | 5     | Utility              |
| 15  | GO_MAINTENANCE_R01.LS | Move to maintenance position            | 5     | Utility              |
| 16  | ZERO_R01.LS           | Move to zero (alt)                      | 4     | Utility              |
| 17  | CHANGE_TOOLS_R01.LS   | Tool change sequence (2 tools)          | 125   | Utility              |
| 18  | TOOL_LOCK_R01.LS      | Lock EOAT (RO[6]=OFF)                   | 1     | Utility              |
| 19  | TOOL_UNLOCK_R01.LS    | Unlock EOAT (RO[6]=ON)                  | 1     | Utility              |
| 20  | ALL_VAC_ON_R01.LS     | All vacuum zones ON                     | 4     | Gripper macro        |
| 21  | ALL_VAC_OFF_R01.LS    | All vacuum zones OFF                    | 4     | Gripper macro        |
| 22  | VAC_CONFIG_R01.LS     | Vacuum zone configuration (3 modes)     | 26    | Gripper macro        |
| 23  | PRE_BG_R01.LS         | Pre-position back gauge wait            | 16    | Press macro          |
| 24  | ADJ_BG_R01.LS         | Smart back gauge adjustment loop        | 54    | Press macro          |
| 25  | -BCKED2-_R01.LS       | Background stub (empty)                 | 0     | Placeholder          |
| 26  | -BCKED8-_R01.LS       | Background stub (empty)                 | 0     | Placeholder          |
| 27  | -BCKED9-_R01.LS       | Background stub (empty)                 | 0     | Placeholder          |
| 28  | -BCKEDT-_R01.LS       | Background stub (empty)                 | 0     | Placeholder          |


**Total active programs:** 24 (4 are empty background stubs)

---

## 2. Convention Compliance


| #   | Convention                                | Status      | Notes                                                                                                                                                                                                                                                                                                                                                                     |
| --- | ----------------------------------------- | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Main program uses LBL[100] loop           | **FAIL**    | No main dispatcher program exists. PNS jobs are selected externally (PNS scheduling), not via a LBL[100]/SELECT pattern. Each PNS program runs its own LBL[1] cycle loop independently.                                                                                                                                                                                   |
| 2   | SELECT with ELSE for dispatching          | **FAIL**    | No SELECT statement used anywhere in PNS jobs. CHANGE_TOOLS_R01 uses `SELECT R[13]` but lacks ELSE clause. VAC_CONFIG_R01 uses IF/JMP chain instead of SELECT.                                                                                                                                                                                                            |
| 3   | Register comments present (R[n:DESC])     | **PARTIAL** | Some registers have comments (R[10:PART INDEX], R[12:THICKNESS], R[14:SEARCH CNT], R[15:VAC CONFIG], R[50:OVERRIDE], DO[22:VACUUM_1]-DO[25:VACUUM_4], DO[26:EOAT_UNLOCK]). Many critical registers lack comments: R[5] (tool number), R[11] (threshold?), R[13] (target tool?), R[18] (loop counter), R[20] (unknown). DI[21]-DI[30] and DO[27] lack comments throughout. |
| 4   | WAIT instructions include TIMEOUT         | **FAIL**    | Only PRE_BG_R01 uses TIMEOUT (via $WAITTMOUT). All other WAIT statements across all PNS programs lack TIMEOUT: BEND_R01 line 5 (`WAIT (DI[22])`), PINCH_R01 line 3 (`WAIT DI[21]=ON`), line 5 (`WAIT (DI[22])`), OPEN_PRESS_R01 line 3 (`WAIT DI[23]=ON`), line 5 (`WAIT (DI[21])`). These can hang indefinitely on sensor failure.                                       |
| 5   | PAYLOAD set in destination programs       | **FAIL**    | No PAYLOAD instruction appears anywhere in any program. No payload is set for loaded tool, loaded part, or empty gripper states.                                                                                                                                                                                                                                          |
| 6   | UFRAME/UTOOL set at program top           | **PARTIAL** | PNS programs set UFRAME_NUM=0 and UTOOL_NUM=1 at top. GO_HOME/GO_ZERO/GO_MAINTENANCE set them. But BEND_R01, PINCH_R01, OPEN_PRESS_R01, SEARCH_R01, ALL_VAC_ON/OFF, START_PART, END_PART do not set frame/tool — they inherit from caller, which is fragile. ADJ_BG_R01 correctly sets UFRAME_NUM=4 and UTOOL_NUM=R[5].                                                   |
| 7   | Recovery logic in dedicated macros        | **PARTIAL** | Error handling exists (UALM + PAUSE/ABORT) in BEND, PINCH, OPEN_PRESS, PRE_BG, ADJ_BG, SEARCH. But there is no dedicated recovery dispatcher — errors halt the program with PAUSE/ABORT and require manual intervention. No recovery path to resume from a known safe state.                                                                                              |
| 8   | Background logic separated from main      | **PASS**    | BG_LOGIC_R01 runs as a separate background task. Four -BCKED*- stubs are reserved background slots. Clean separation.                                                                                                                                                                                                                                                     |
| 9   | Gripper state verified before operations  | **FAIL**    | No vacuum state verification before pick or place. PNS programs call ALL_VAC_ON_R01 then proceed to motion without checking DI feedback that vacuum is actually established. No vacuum sensor check (e.g., WAIT DI[vac_confirm]=ON) anywhere.                                                                                                                             |
| 10  | No hardcoded values where registers apply | **PARTIAL** | SEARCH_R01 hardcodes 30mm step size and 50-iteration limit instead of using registers. Multiple PNS programs hardcode WAIT times (1.00sec, 1.50sec, 0.50sec). OVERRIDE is properly parameterized via R[50] in utility programs but PNS programs use hardcoded speed overrides.                                                                                            |


**Summary: 0 PASS, 1 PASS, 3 PARTIAL, 6 FAIL**

---

## 3. Findings


| #   | Severity     | File(s)                 | Line(s)        | Description                                                                                                                                                                                                                                                                                                                   | Dataset Reference                                                                                            | Suggested Fix                                                                                                                                                                                                                                                                 |
| --- | ------------ | ----------------------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | **CRITICAL** | ALL PNS programs        | Multiple       | **No WAIT TIMEOUT on press signals.** BEND_R01:5 `WAIT (DI[22])`, PINCH_R01:3 `WAIT DI[21]=ON`, PINCH_R01:5 `WAIT (DI[22])`, OPEN_PRESS_R01:3 `WAIT DI[23]=ON`, OPEN_PRESS_R01:5 `WAIT (DI[21])` — all can hang indefinitely if a press signal fails to arrive.                                                               | `EG_Press_Brake_Modbus_Handshake.txt` lines 35-49: all WAITs use `TIMEOUT,LBL[100]`                          | Add TIMEOUT,LBL[err] to every press signal WAIT. Route to UALM + controlled recovery.                                                                                                                                                                                         |
| 2   | **CRITICAL** | ALL PNS programs        | Top            | **No PAYLOAD instruction.** Robot carries sheet metal parts of varying weight across 5 jobs. No payload is declared for loaded vs. unloaded states. This affects path accuracy, servo torques, and can trigger servo alarms at speed.                                                                                         | `EG_JOB_A_CRDrill_SingleHand.txt` line 9: `PAYLOAD[1]` at program top                                        | Add `PAYLOAD[n]` at PNS program top (unloaded), switch to loaded payload after vacuum grip confirmed, switch back after place.                                                                                                                                                |
| 3   | **CRITICAL** | ALL PNS programs        | Pick sequences | **No vacuum grip verification.** After CALL ALL_VAC_ON_R01, programs immediately proceed to motion without confirming vacuum is established. If vacuum fails, robot moves an unsecured part at speed.                                                                                                                         | `EG_JOB_A_CRDrill_SingleHand.txt` pattern: verify gripper DI after grip command                              | Add `WAIT DI[vac_confirm]=ON TIMEOUT,LBL[err]` after each ALL_VAC_ON_R01 call. If no hardware sensor exists, add a timed delay + DI check.                                                                                                                                    |
| 4   | **CRITICAL** | BEND_R01                | Header         | **FILE_NAME mismatch.** Header shows `FILE_NAME = PINCH_R01` — program was likely copy/pasted from PINCH_R01 and renamed. Logic diverges from PINCH but the metadata is misleading. Risk: confusion during backup/restore.                                                                                                    | —                                                                                                            | Correct FILE_NAME in program header to match actual program name.                                                                                                                                                                                                             |
| 5   | **CRITICAL** | SEARCH_R01              | 4-8            | **Hardcoded search parameters.** 30mm step increment and 50-iteration limit (1500mm total) are hardcoded. If part stack height changes or table dimensions change, code must be edited rather than registers adjusted. Also no TIMEOUT on the inner WAIT.                                                                     | `EG_JOB_A_CRDrill_SingleHand.txt` pattern: parameterize with registers                                       | Replace `30` with `R[n:SEARCH STEP]`, `50` with `R[n:SEARCH MAX]`. Add TIMEOUT to inner motion waits.                                                                                                                                                                         |
| 6   | **WARNING**  | CHANGE_TOOLS_R01        | 18-19          | **SELECT without ELSE.** `SELECT R[13]=1,JMP LBL[1] / =2,JMP LBL[2]` has no ELSE clause. If R[13] is corrupted or out of range, execution falls through silently to LBL[1] (Change to Tool 1). The guard at line 5 (`IF R[5]<1 OR R[5]>2 OR R[13]<1 OR R[13]>2`) partially mitigates this, but SELECT should still have ELSE. | `EG_JOB_A_CRDrill_SingleHand.txt` SELECT patterns always include ELSE                                        | Add ELSE clause to SELECT: `ELSE,JMP LBL[4]` (route to existing UALM[4]/ABORT handler).                                                                                                                                                                                       |
| 7   | **WARNING**  | VAC_CONFIG_R01          | 8-9            | **IF/JMP chain instead of SELECT.** `IF R[15]=2,JMP LBL[2] / IF R[15]=3,JMP LBL[3]` should be a SELECT on R[15] with ELSE for invalid values. Currently, any value other than 2 or 3 falls through to "ALL ZONES" — silent default behavior.                                                                                  | `FANUC_REF_Branching_Instructions.txt`                                                                       | Refactor to `SELECT R[15:VAC CONFIG]=1,JMP LBL[1] / =2,JMP LBL[2] / =3,JMP LBL[3] / ELSE,JMP LBL[err]`.                                                                                                                                                                       |
| 8   | **WARNING**  | Multiple                | Multiple       | **Register comments missing.** R[5] (tool number — critical), R[11], R[13] (target tool), R[18] (adj loop counter), R[20] used without comments. DI[21]-DI[30] and DO[27] used extensively without descriptive comments. Hard to maintain or troubleshoot without signal descriptions.                                        | TWA convention: `R[n:DESCRIPTION]` for all registers                                                         | Add descriptive comments to all bare register/IO references. Suggested: R[5:CURRENT TOOL], R[11:SEARCH THRESHOLD], R[13:TARGET TOOL], R[18:ADJ LOOP CNT], R[20:CYCLE TIME], DI[21:BEAM AT UDP], DI[22:BEAM AT CP], DI[23:BEAM OPEN], DI[25:PRESS AUTO], DO[27:BEAM DOWN CMD]. |
| 9   | **WARNING**  | PNS0001-0005            | Multiple       | **No main dispatcher.** Each PNS job runs independently via PNS scheduling. There is no master program with LBL[100] that handles common initialization, recovery, and dispatching. This means each PNS program duplicates initialization code (UFRAME, UTOOL, R[10]=0) and there is no common recovery path.                 | `EG_JOB_A_CRDrill_SingleHand.txt` lines 7-16: common init then LBL[100] dispatch loop; `EG_PNS_Programs.txt` | Consider creating a MAIN_R01 program that handles initialization, calls GO_HOME, then enters LBL[100] dispatch. PNS programs would then focus only on their unique cycle logic.                                                                                               |
| 10  | **WARNING**  | PINCH_R01               | 7-12           | **Redundant condition check.** Line 5 already does `WAIT (DI[22])` which blocks until DI[22]=ON. Line 7 then checks `IF (DI[22]=ON)` — this is always true at that point. The ENDIF on line 12 creates a false impression of a conditional block.                                                                             | —                                                                                                            | Remove the IF/ENDIF wrapper (lines 7, 12). The logic inside executes unconditionally after the WAIT.                                                                                                                                                                          |
| 11  | **WARNING**  | ADJ_BG_R01              | 41-43          | **Loop counter overwritten on success.** `R[18]=1` is set when aligned, but R[18] is the FOR loop variable. Setting it to 1 inside the loop could cause unexpected iteration behavior before the JMP LBL[1] exits. Works in practice because JMP exits the loop, but fragile.                                                 | —                                                                                                            | Use a dedicated flag (e.g., F[n:BG ALIGNED]) instead of overwriting the loop counter. Or simply JMP LBL[1] without resetting R[18].                                                                                                                                           |
| 12  | **WARNING**  | ZERO_R01 vs GO_ZERO_R01 | —              | **Duplicate functionality.** Both move to PR[100:ZERO]. ZERO_R01 uses hardcoded `OVERRIDE=50%`, GO_ZERO_R01 uses `R[50:OVERRIDE]`. Having two programs that do the same thing with different override behavior is confusing.                                                                                                  | —                                                                                                            | Consolidate to one program (GO_ZERO_R01 with parameterized override). Remove or deprecate ZERO_R01.                                                                                                                                                                           |
| 13  | **INFO**     | PNS0003, PNS0004        | Bottom         | **"OUTFEED POSITIONS NEED LIVE TEACH" comments.** These indicate unfinished programs — positions are placeholders. If these jobs are in production, the comments should be removed. If not, they should be marked as WIP more prominently.                                                                                    | —                                                                                                            | Resolve: teach the positions and remove the comment, or add a guard at program top that prevents execution if positions aren't taught.                                                                                                                                        |
| 14  | **INFO**     | ALL_VAC_OFF_R01         | Header         | **SINGULARITY_AVOIDANCE differs.** ALL_VAC_OFF has `ENABLE_SINGULARITY_AVOIDANCE: FALSE` while ALL_VAC_ON has no singularity header. These are I/O-only programs with no motion, so the setting is irrelevant, but the inconsistency suggests copy/paste artifacts.                                                           | —                                                                                                            | Standardize headers across utility programs.                                                                                                                                                                                                                                  |
| 15  | **INFO**     | -BCKED*- programs       | —              | **Four empty background stubs.** -BCKED2-, -BCKED8-, -BCKED9-, -BCKEDT- have zero lines of logic. These are reserved background slots from the FANUC system. Non-issue but note they consume program slots.                                                                                                                   | —                                                                                                            | Leave as-is (standard FANUC background task placeholders).                                                                                                                                                                                                                    |
| 16  | **INFO**     | Multiple                | Multiple       | **Hardcoded WAIT times.** PINCH_R01: `WAIT 1.50(sec)`, BEND_R01/PNS programs: `WAIT 1.00(sec)`, `WAIT .50(sec)`. These should be parameterized for tuning without code edits.                                                                                                                                                 | —                                                                                                            | Replace with `WAIT R[n:PINCH DWELL]`, `WAIT R[n:BEND SETTLE]`, etc.                                                                                                                                                                                                           |


---

## 4. Pattern Comparison


| Program Section                                       | Closest Dataset Example                                                       | Deviations                                                                                                        |
| ----------------------------------------------------- | ----------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| PNS job structure (init, cycle loop, pick/bend/place) | `EG_JOB_A_CRDrill_SingleHand.txt` — main job with init → LBL → service loop   | Missing PAYLOAD, missing main dispatcher, no common error routing (LBL[21000+] pattern)                           |
| Press signal handshake (BEND, PINCH, OPEN_PRESS)      | `EG_Press_Brake_Modbus_Handshake.txt` Pattern A — XC2F/XC3M cycle             | Missing TIMEOUT on all WAITs, no pre-send of RESET MUTE/RESET CP signals, no explicit UDP check before load entry |
| Back gauge adjustment (ADJ_BG_R01)                    | No direct dataset example — novel "smart" adjustment with 4 proximity sensors | Good concept (iterative alignment with rotation correction), but loop counter overwrite is fragile                |
| Tool change (CHANGE_TOOLS_R01)                        | No direct dataset example                                                     | Well-structured with validation guard (line 5), SELECT for tool routing, but SELECT lacks ELSE                    |
| Search routine (SEARCH_R01)                           | No direct dataset example — incremental Z search with DI detection            | Functional but hardcoded parameters reduce reusability                                                            |
| Vacuum control (ALL_VAC_ON/OFF, VAC_CONFIG)           | `EG_Chuck_Operations.txt` — gripper state management                          | Missing grip confirmation feedback, VAC_CONFIG uses IF/JMP instead of SELECT                                      |


### Comparison to `robot_interface_reference.md` Signal Mapping


| R01 Signal | Likely BLM Signal (per robot_interface_reference.md) | Status                                       |
| ---------- | ---------------------------------------------------- | -------------------------------------------- |
| DI[21]     | E20.2 — Beam at UDP                                  | Used in PINCH (wait for UDP before pinch)    |
| DI[22]     | E20.3 — Beam at Clamping Point                       | Used in PINCH (wait for CP to confirm clamp) |
| DI[23]     | E20.2 — Beam at UDP (used in OPEN_PRESS)             | Used to confirm beam open before triggering  |
| DI[24]     | E20.6 — Axis in Position (back gauge ready)          | Used in PRE_BG (wait for BG ready)           |
| DI[25]     | E20.0 — Press in Automatic Mode                      | Used as guard in BEND/PINCH/OPEN_PRESS       |
| DI[26-29]  | E21.0-E21.3 — Finger sensors 1-4                     | Used in ADJ_BG for back gauge alignment      |
| DI[30]     | Part detect sensor (not press signal)                | Used in SEARCH_R01 and BG_LOGIC              |
| DO[22-25]  | Vacuum zones 1-4 (robot EOAT)                        | Not press signals                            |
| DO[27]     | A20.1 — Beam Downwards command                       | Used in BEND/PINCH/OPEN_PRESS                |
| DO[30-31]  | Part start/end signals to PLC                        | Used in START_PART/END_PART                  |
| DO[33]     | Error reset (cleared by BG_LOGIC when DI[30] active) | BG managed                                   |
| DO[120]    | EOAT lock indicator                                  | Used in CHANGE_TOOLS                         |
| RO[3,5,6]  | Robot output signals (tool lock/unlock, status)      | BG managed / TOOL_LOCK/UNLOCK                |


**Critical gap:** The dataset pattern (`EG_Press_Brake_Modbus_Handshake.txt`) calls for pre-sending RESET MUTE (A21.0) and RESET CLAMPING (A21.1) before initiating bend to avoid the press pausing at mute/CP. The R01 programs do not send these signals — the press will pause at each point and wait for manual intervention or PLC-level workaround. Per `robot_interface_reference.md` line 88-89, these can be sent continuously from CHANGE STEP to avoid pauses.

---

## 5. Implementation Order

### Phase 1: Critical Safety & Reliability

- **Finding #1** — Add TIMEOUT to all press signal WAITs in BEND_R01, PINCH_R01, OPEN_PRESS_R01. Route timeouts to UALM + controlled PAUSE with recovery label.
- **Finding #2** — Add PAYLOAD[n] declarations to all PNS programs. Define at least 2 payloads: unloaded gripper and max loaded part.
- **Finding #3** — Add vacuum grip verification after every ALL_VAC_ON_R01 call. If no hardware feedback DI exists, document the gap and add timed delay as minimum.
- **Finding #5** — Parameterize SEARCH_R01 step size and iteration limit into registers.

### Phase 2: Convention Alignment

- **Finding #6** — Add ELSE to SELECT in CHANGE_TOOLS_R01 line 18.
- **Finding #7** — Refactor VAC_CONFIG_R01 from IF/JMP to SELECT with ELSE.
- **Finding #8** — Add descriptive comments to all bare register and I/O references.
- **Finding #9** — Design and create MAIN_R01 dispatcher program.
- **Finding #10** — Remove redundant IF wrapper in PINCH_R01.
- **Finding #12** — Consolidate ZERO_R01 and GO_ZERO_R01.

### Phase 3: Robustness Improvements

- **Finding #4** — Fix FILE_NAME header in BEND_R01.
- **Finding #11** — Replace loop counter overwrite in ADJ_BG_R01 with flag.
- **Finding #16** — Parameterize hardcoded WAIT times into registers.
- **Press signal gap** — Add RESET MUTE POINT (A21.0) and RESET CLAMPING POINT (A21.1) pre-sends to PINCH_R01 and BEND_R01 per robot_interface_reference.md guidance.

### Phase 4: Polish

- **Finding #13** — Resolve "OUTFEED POSITIONS NEED LIVE TEACH" in PNS0003/PNS0004.
- **Finding #14** — Standardize singularity avoidance headers across utility programs.
- **Finding #15** — Document purpose of empty -BCKED*- background stubs.

---

## 6. Cursor Handoff

**Applicable rules:**


| Rule                          | Reason                                |
| ----------------------------- | ------------------------------------- |
| `fanuc-tp-conventions.mdc`    | TWA structure patterns for all fixes  |
| `fanuc-dataset-reference.mdc` | Dataset pattern references for syntax |
| `press-brake-modbus.mdc`      | Press brake signal handshake patterns |
| `ldj-integration.mdc`         | LDJ/BLM signal mapping context        |


**Dataset files Cursor should consult:**


| File                                             | For Finding(s)                                          |
| ------------------------------------------------ | ------------------------------------------------------- |
| `examples/EG_Press_Brake_Modbus_Handshake.txt`   | #1 (TIMEOUT patterns), press signal gap (RESET MUTE/CP) |
| `examples/EG_JOB_A_CRDrill_SingleHand.txt`       | #2 (PAYLOAD), #3 (grip verify), #9 (main dispatcher)    |
| `examples/EG_PNS_Programs.txt`                   | #9 (PNS dispatch architecture)                          |
| `examples/EG_Chuck_Operations.txt`               | #3 (gripper state verification)                         |
| `reference/FANUC_REF_Branching_Instructions.txt` | #6, #7 (SELECT with ELSE)                               |
| `reference/FANUC_REF_IO_Instructions.txt`        | #1 (WAIT TIMEOUT syntax)                                |
| `LDJ/robot_interface_reference.md`               | Press signal gap (A21.0, A21.1 pre-sends)               |


All dataset paths relative to `FANUC_Optimized_Dataset/optimized_dataset/`.

**Handoff document:** Create `HANDOFF_LDJ-BLM_Phase1_<date>.md` when ready to begin Phase 1 fixes.

---

## 7. Register Map (Discovered)

For reference during fixes — these registers were identified across all 28 programs:

### Numeric Registers (R[])


| Register | Comment (if any) | Used In                                  | Purpose (inferred)                 |
| -------- | ---------------- | ---------------------------------------- | ---------------------------------- |
| R[5]     | *(none)*         | CHANGE_TOOLS, ADJ_BG                     | Current tool number (1 or 2)       |
| R[10]    | PART INDEX       | PNS programs, BG_LOGIC                   | Part counter / index               |
| R[11]    | *(none)*         | PNS programs                             | Threshold (search related?)        |
| R[12]    | THICKNESS        | PNS programs                             | Part thickness for Z offset        |
| R[13]    | *(none)*         | CHANGE_TOOLS, PNS programs               | Target tool number                 |
| R[14]    | SEARCH CNT       | SEARCH_R01                               | Search iteration counter           |
| R[15]    | VAC CONFIG       | VAC_CONFIG_R01                           | Vacuum zone mode (1/2/3)           |
| R[18]    | *(none)*         | ADJ_BG_R01                               | Back gauge adjustment loop counter |
| R[20]    | *(none)*         | PNS programs                             | Unknown (cycle time?)              |
| R[50]    | OVERRIDE         | GO_HOME, GO_ZERO, GO_MAINT, CHANGE_TOOLS | Speed override percentage          |


### Position Registers (PR[])


| Register | Comment (if any) | Purpose                                 |
| -------- | ---------------- | --------------------------------------- |
| PR[1]    | HOME             | Home position                           |
| PR[10]   | *(none)*         | Temporary position (search, adjustment) |
| PR[50]   | *(none)*         | PNS0001 Z-depth tracking                |
| PR[51]   | *(none)*         | PNS0002 Z-depth tracking                |
| PR[52]   | *(none)*         | PNS0003 Z-depth tracking                |
| PR[53]   | *(none)*         | PNS0004 Z-depth tracking                |
| PR[54]   | *(none)*         | PNS0005 Z-depth tracking                |
| PR[99]   | MAINTENANCE      | Maintenance position                    |
| PR[100]  | ZERO             | Zero/mastering position                 |


### Digital I/O


| Signal  | Comment (if any) | Purpose (inferred from robot_interface_reference.md) |
| ------- | ---------------- | ---------------------------------------------------- |
| DI[21]  | *(none)*         | E20.2 — Beam at UDP                                  |
| DI[22]  | *(none)*         | E20.3 — Beam at Clamping Point                       |
| DI[23]  | *(none)*         | E20.2 — Beam at UDP (open confirm)                   |
| DI[24]  | *(none)*         | E20.6 — Axis in Position                             |
| DI[25]  | *(none)*         | E20.0 — Press in Automatic                           |
| DI[26]  | *(none)*         | E21.0 — Finger sensor 1                              |
| DI[27]  | *(none)*         | E21.1 — Finger sensor 2                              |
| DI[28]  | *(none)*         | E21.2 — Finger sensor 3                              |
| DI[29]  | *(none)*         | E21.3 — Finger sensor 4                              |
| DI[30]  | *(none)*         | Part detect sensor                                   |
| DO[22]  | VACUUM_1         | Vacuum zone 1                                        |
| DO[23]  | VACUUM_2         | Vacuum zone 2                                        |
| DO[24]  | VACUUM_3         | Vacuum zone 3                                        |
| DO[25]  | VACUUM_4         | Vacuum zone 4                                        |
| DO[26]  | EOAT_UNLOCK      | Tool changer unlock                                  |
| DO[27]  | *(none)*         | A20.1 — Beam Downwards command                       |
| DO[30]  | *(none)*         | Part start signal                                    |
| DO[31]  | *(none)*         | Part end signal                                      |
| DO[33]  | *(none)*         | Error reset (BG managed)                             |
| DO[120] | *(none)*         | EOAT lock indicator                                  |
| RO[3]   | *(none)*         | Status output (BG managed)                           |
| RO[5]   | *(none)*         | Status output (BG managed)                           |
| RO[6]   | *(none)*         | Tool lock/unlock                                     |
| GO[1]   | Error Code       | Error code output = R[10]                            |
| RI[1]   | *(none)*         | Input for BG logic condition                         |


