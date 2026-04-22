---
id: FANUC_REF_POINT_LOGIC
title: "Point Logic"
topic: motion
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "FANUC Teach Pendant Help System / Operator Manual"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# Point Logic

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Point_Logic.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


18. POINT LOGIC INSTRUCTION 18. POINT LOGIC INSTRUCTION PROGRAM ELEMENTS 18. POI
NT LOGIC INSTRUCTION 18.1. Overview POINT_LOGIC instruction is used in conjuncti
on with Time Before/Time After and Distance Before instructions. The normal usag
e of Time Before and Distance Before instructions is as shown below. L P[1] 200m
m/sec CNT100 TB 1.0 sec, CALL PROG L P[1] 200mm/sec CNT100 DB 100.0mm, CALL PROG
where you create a subprogram called “PROG”. In place of “CALL PROG”, POINT_LOGI
C instruction can be used instead. L P[1] 200mm/sec CNT100 DB 100.0mm, POINT_LOG
IC The rules and timing of when POINT_LOGIC instructions are executed is the sam
e as using the normal CALL PROG option. The advantage of using POINT_LOGIC is th
at you do not need to create a subprogram. You can think of POINT_LOGIC as an in
line program, where you can teach multiple instructions as though it is a Teach 
Pendant program. Multiple instructions are taught in Point Logic instruction. Ea
ch Point Logic instruction of lines is independent. Each Point Logic can have di
fferent multiple instructions. Instructions in Point Logic instruction can be ex
ecuted at teaching point using Timer Before or Distance Before function. Point L
ogic execution timing can be adjusted with reference to teaching position by cha
nging time value or distance value of the functions. Figure 87. POINT_LOGIC Inst
ruction 18.2. Point Logic Instruction POINT_LOGIC instruction is used with Time 
Before (After) or Distance Before function. Figure 88. POINT_LOGIC Instruction P
rocedure 14. Inserting a Point Logic Instruction Move the cursor to the space af
ter Timer Before or Distance Before instruction. Press F4. Submenu to select ins
truction part is displayed. Select ’POINT_LOGIC’. Point Logic instruction is add
ed after Time before or Distance before instruction. Position the cursor on Logi
c instruction or top of line and press ENTER key. Edit screen of Point Logic ins
truction is displayed. If Multi program selection is invalid, edit screen of Poi
nt Logic instruction is not used when the program is paused. Abort the program t
o edit Logic instructions. Edit instructions for Logic. Operation procedure of t
his screen is the same as editing of main programs. Press key when editing of Po
int Logic statement is finished. Point Logic view screen is displayed. Press Ent
er key to edit main program or other Point Logic instructions. Edit screen is di
splayed. 18.3. Point Logic View Function Point Logic view screen can be used, wh
en Point Logic instructions exist in the programs. Instructions in Point Logic i
nstruction are uncompressed and displayed in view screen. Main program and instr
uctions in Point Logic instruction can be viewed on the same view screen. Point 
Logic view screen is displayed when key is pushed in Edit screen. When Point Log
ic instruction does not exist in the program, view screen cannot be displayed. E
dit screen is displayed when ENTER or F2 (EDIT) key is pushed in View screen. Wh
en the cursor positions on line of main program, Edit screen for main program is
displayed. When the cursor positions on line of Point Logic instructions, Edit s
creen for Point Logic instruction is displayed. In Point Logic view screen, the 
program cannot be edited. Move to Edit screen by ENTER key and edit the program.
When the program is paused while executing Point Logic instruction, the cursor c
annot move to line of main program. Abort the program or execute backward by SHI
FT and BWD key to move back cursor to line of main program. If ‘Multi program se
lection’ is invalid, the cursor is not stopped in line of Point Logic instructio
ns by manual when the program is paused in main program. The cursor is stopped o
nly line of main program. Figure 89. POINT_LOGIC View Screen (Main Program) Figu
re 90. POINT_LOGIC View Instruction (in Logic Statements) Caution Motion instruc
tions can not added in Point Logic instructions. When line with Logic instructio
n is copied, instructions in Point Logic instruction are also copied. When Point
Logic instruction is overwritten by Call instructions or other instruction, inst
ructions in Point Logic instruction are deleted. When line with Point Logic inst
ruction is deleted, instructions in Point Logic Instruction are also deleted. 17
. PARAMETERS FOR PROGRAM CALL AND MACRO INSTRUCTIONS 19. POSITION REGISTER INSTR
UCTIONS
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: point logic, POINT_LOGIC, concurrent, parallel, I/O during motion, distance before, time before, time after, DB, TB, TA).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Point_Logic.txt`.
- Classification: reference / topic=motion.

