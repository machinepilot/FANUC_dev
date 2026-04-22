---
id: FANUC_REF_PROGRAM_CONTROL
title: "Program Control"
topic: io
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

# Program Control

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Program_Control.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


20. PROGRAM CONTROL INSTRUCTIONS 20. PROGRAM CONTROL INSTRUCTIONS PROGRAM ELEMEN
TS 20. PROGRAM CONTROL INSTRUCTIONS 20.1. Overview Program control instructions 
direct program execution. Use these when you want areas of your program to pause
, abort, resume a program, and handle errors. 20.2. PAUSE Instruction A PAUSE in
struction suspends program execution in the following manner: Any motion already
begun continues until completed. All connected timers continue being incremented
. All PULSE instructions that are currently running continue to run until they a
re completed. Any instruction that is currently running, except program call ins
tructions, is completed. Program call instructions are performed when the progra
m is resumed. See Figure 96, " PAUSE " . Figure 96. PAUSE 20.3. ABORT Instructio
n An ABORT instruction ends the program and cancels any motion in progress or pe
nding. After an ABORT instruction is executed, the program cannot continue; it m
ust be restarted. See Figure 97, " ABORT " . Figure 97. ABORT 20.4. Maintenance 
Program Instruction The maintenance program instruction defines the program name
that will be used as the maintenance program, if the error recovery option is us
ed. See Figure 98, " MAINT_PROG = program " . MAINT_PROG = program Refer to the 
“Advanced Functions” chapter in the Setup and Operations Manual for more informa
tion. Figure 98. MAINT_PROG = program 20.5. Clear Resume Program Instruction The
clear resume program instruction clears the resume program, if the error recover
y option is used. See Figure 99, " CLEAR_RESUME_PRO " . CLEAR_RESUME_PROG Refer 
to the “Advanced Functions” chapter in the Setup and Operations Manual for more 
information. Figure 99. CLEAR_RESUME_PRO 20.6. Return Path Disable Instruction T
he return path disable instruction disables the ability to use the return path, 
if the error recovery option is used. See Figure 100, " RETURN_PATH_DSBL " . RET
URN_PATH_DSBL Refer to the “Advanced Functions” chapter in the Setup and Operati
ons Manual for more information. Figure 100. RETURN_PATH_DSBL 19. POSITION REGIS
TER INSTRUCTIONS 21. PROCESS SYNCHRONIZATION
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: program control, RUN, CALL, ABORT, PAUSE, CONTINUE, RESUME, END, multitask, task, background, program execution).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Program_Control.txt`.
- Classification: reference / topic=io.

