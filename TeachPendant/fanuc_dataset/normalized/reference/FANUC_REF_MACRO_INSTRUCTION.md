---
id: FANUC_REF_MACRO_INSTRUCTION
title: "Macro Instruction"
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

# Macro Instruction

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Macro_Instruction.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


11. MACRO COMMAND INSTRUCTION 11. MACRO COMMAND INSTRUCTION PROGRAM ELEMENTS 11.
MACRO COMMAND INSTRUCTION The macro command instruction specifies the macro comm
and to be executed when the program is run. A macro command is a separate progra
m that contains a series of instructions to perform a task. You can define as ma
ny as 20 to 99 macro commands, depending on how your system was set . In SpotToo
l+, you can define as many as 40 macro commands. See Figure 60, " Macro Command 
Instruction " . Figure 60. Macro Command Instruction Refer to the “General Setup
” chapter of this manual for information on how to set and execute macro command
s. Refer to Section 17, " PARAMETERS FOR PROGRAM CALL AND MACRO INSTRUCTIONS " f
or information on macro instruction parameters. Note When using Parameters for M
acros, you can include parameters in the macro command instruction. Refer to Sec
tion 17, " PARAMETERS FOR PROGRAM CALL AND MACRO INSTRUCTIONS " for more informa
tion. The DispenseTool software provides macro commands in the following areas. 
General, and macro command setup Tool control Four position tool Dispense materi
al handling tool Interference zone control Dispensing equipment-specific control
Common dispensing equipment ISD Gear Meter ISD Double Acting Shot Meter ISD Sing
le Acting Shot Meter The SpotTool+ software provides predefined macros to assist
in the spot welding process. These are: CLR OF TRANSFER ENTER I-ZONE EXIT I-ZONE
SAFE ZONE MOVE TO MOVE TO REPAIR AT POUNCE OPEN CLAMP EARLY REPOSITION CLAMP Not
e The predefined macros listed above might differ for customized software packag
es. For SpotTool+ applications, Macro is on page two of the [INST] subwindow. 10
. INPUT/OUTPUT INSTRUCTIONS 12. MATH FUNCTION INSTRUCTIONS
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: macro, macro command, manual function, MF, group mask, no motion group).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Macro_Instruction.txt`.
- Classification: reference / topic=motion.

