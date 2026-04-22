---
id: FANUC_REF_SKIP_INSTRUCTIONS
title: "Skip Instructions"
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

# Skip Instructions

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Skip_Instructions.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


23. SKIP INSTRUCTION 23. SKIP INSTRUCTION PROGRAM ELEMENTS 23. SKIP INSTRUCTION 
SKIP CONDITION [I/O] = [VALUE] The skip instruction sets the conditions to execu
te robot motion when you use the skip motion option in a motion instruction. The
se conditions are true until they are reset by another skip instruction. Refer t
o Section 6, "MOTION OPTIONS INSTRUCTION" for more information. See Figure 109, 
" Skip Condition for DO/DI, RO/RI, SO/SI, and UO/UI " to Figure 112, " Skip Cond
ition " . Figure 109. Skip Condition for DO/DI, RO/RI, SO/SI, and UO/UI Figure 1
10. Skip Condition for DI/DO, RI/RO, SI/SO, UI/UO, and WI/WO Figure 111. Skip Co
ndition for R, GI/GO, AI/AO, and Parameters Figure 112. Skip Condition Error Num
ber ERR_NUM =aaabbb aaa : Error ID (decimal); bbb : Error number (decimal) Refer
to the “Error Codes and Recovery”appendix in the Setup and Operations Manual. If
0 is specified as error number "aaabbb," when any kind of error occurs, the cond
ition is satisfied. For example, SKIP CONDITION ERR_NUM=11006 This specifies the
"SRVO-006 Hand broken" error because SRVO ID number is 11. Operators For the SKI
P instruction, you can connect conditions using AND or OR operators, as follows:
AND operator SKIP CONDITION [cond1] AND [cond2] AND ... For example, 1: SKIP CON
DITION R[1]=1 AND R[2]=2 OR instruction SKIP CONDITION [cond1] OR [cond2] OR ...
For example, 1: IF DI[10]=ON OR R[7]=R[8], JMP LBL[2] 1: SKIP CONDITION R[1]=1 O
R R[2]=2 Note You cannot mix AND and OR in the same operation. If you replace th
e operator between AND and OR, any other operators taught in the same line are a
lso replaced automatically and the following message is displayed: TPIF-062 AND 
operator was replaced to OR PIF-063 OR operator was replaced to AND The maximum 
number of logical conditions that can be taught in the same operation is 5. SKIP
CONDITION [cond1] OR [cond2] OR [cond3]OR[cond4] OR [cond5] (Maximum of five log
ical conditions) 22. REGISTER INSTRUCTIONS 24. STRING REGISTER INSTRUCTIONS
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: skip, skip condition, SKIP CONDITION, Skip LBL, skip label, search, contact detect, part detect, sensor trigger).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Skip_Instructions.txt`.
- Classification: reference / topic=motion.

