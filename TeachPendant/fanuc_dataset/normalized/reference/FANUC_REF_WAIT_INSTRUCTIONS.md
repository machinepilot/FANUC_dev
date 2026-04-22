---
id: FANUC_REF_WAIT_INSTRUCTIONS
title: "Wait Instructions"
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

# Wait Instructions

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Wait_Instructions.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


26. WAIT INSTRUCTIONS 26. WAIT INSTRUCTIONS PROGRAM ELEMENTS 26. WAIT INSTRUCTIO
NS Wait instructions delay program execution for a specified time or until a spe
cified condition is true. When a wait instruction is executed, the robot does no
t execute any motion instructions. There are two kinds of wait instructions: WAI
T time - delays program execution for a specified time. WAIT condition - delay p
rogram execution until specified conditions are true. Note Using WAIT instructio
ns in line- or rail-tracking paths is NOT recommended. If an E-STOP occurs durin
g the execution of a WAIT instruction, the robot might not continue to track the
part until the position comes into bounds. WAIT time The WAIT time instruction d
elays program execution for a specified time. The time in a WAIT time instructio
n is specified in seconds, with a minimum unit of 0.01 seconds. See Figure 118, 
" Wait Time " . Figure 118. Wait Time WAIT [item] [operator] [value] [time] WAIT
condition instructions delay program execution until specified conditions are tr
ue or until an amount of time elapses (a timeout occurs). The timeout can be spe
cified as one of the following: Forever - the program will wait until the condit
ion is true. Time out, LBL[i] - the program will wait for the time specified in 
Timeout. If the condition is still not true, the program will branch to the spec
ified label. Specify the timeout by setting the system variable $WAITTMOUT to a 
time, in 100ths of a second. The default timeout value is 3000 hundredths of a s
econd. You can set $WAITTMOUT using the parameter name instruction. Refer to Sec
tion 13.10, " Parameter Name Instruction " for information on the parameter name
instruction. See Figure 119, " WAIT Condition for DI/DO, RI/RO, SI/SO, and UI/UO
" to Figure 122, " WAIT Condition " for examples. Figure 119. WAIT Condition for
DI/DO, RI/RO, SI/SO, and UI/UO Figure 120. WAIT Condition for DI/DO, RI/RO, SI/S
O, UI/UO, and WI/WO Figure 121. WAIT Condition for R, GI/GO, AI/AO, and Paramete
rs Figure 122. WAIT Condition Error Number Where: ERR_NUM =aaabbb aaa : Error fa
cility code (decimal); bbb : Error number (decimal) Refer to the “Error Codes an
d Recovery” appendix in the Setup and Operations Manual. If 0 is specified as th
e error number "aaabbb" when an error occurs, the condition is satisfied. For ex
ample, the instruction WAIT ERR_NUM=11006, CALL PROG_A Will cause the program PR
OG_A to be called when a "SRVO-0 06 HAND BROKEN" error occurs. (SRVO errors are 
facility code 11.) Operators For WAIT instructions, logical instruction editing 
can contain multiple logical statements connected by AND or OR operators. AND op
erator WAIT [cond1] AND [cond2] AND ... For example, 1: WAIT DI[1]=ON AND DI[2]=
ON, TIMEOUT,LBL[1] OR instruction WAIT [cond1] OR [cond2] OR ... For example, 1:
WAIT DI[10]=ON OR R[7]=R[8], TIMEOUT,LBL[2] Note You cannot mix the AND and OR o
perators in the same operation. If an instruction contains multiple ORs or ANDs,
and you change one of them, the others will also change. In this case, the follo
wing message is displayed: TPIF-062 AND operator was replaced to OR TPIF-063 OR 
operator was replaced to AND The maximum number of logical conditions that you c
an teach in the same operation is 5. For example WAIT [cond1] OR [cond2] OR [con
d3] OR [cond4]OR [cond5] (Maximum of five logical conditions) WAIT Mixed Logic I
nstruction Figure 123. Mixed Logic WAIT Example WAIT (DI[1] AND (!DI[2] OR DI[3]
)) Mixed Logic expressions can be specified in the condition of a WAIT statement
The result of the expression must be boolean. The WAIT statement waits until the
result of the expression becomes ON. “On+”,“Off-” and “ERR_NUM” cannot be specif
ied in mixed logic instructions. You must use normal logic instructions to speci
fy them. The maximum number of items (data or operators) in a WAIT statement is 
approximately 20. The exact maximum number of items varies according to the data
type. Refer to Section 14, " MIXED LOGIC INSTRUCTIONS " for more information on 
mixed logic instructions. Output when WAITing on Input The Output when WAITING o
n Input feature allows you to turn on a digital output that indicates that a WAI
T instruction in a teach pendant program has been waiting on a specified digital
input for longer than a specified time. This item is set on the SYSTEM Configura
tion menu. Refer to “SYSTEM Configuration Setup,” in your application-specific S
etup and Operations Manual for more information. 25. VISION INSTRUCTIONS Metadat
a:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: WAIT, wait instruction, timeout, TIMEOUT, delay, timer, condition wait, timed wait, LBL, wait for signal).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Wait_Instructions.txt`.
- Classification: reference / topic=motion.

