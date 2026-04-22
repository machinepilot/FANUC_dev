---
id: FANUC_REF_LINE_NUMBER_PROGRAM_END
title: "Line Number Program End"
topic: anti_pattern
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

# Line Number Program End

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Line_Number_Program_End.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


4. LINE NUMBER AND PROGRAM END MARKER 4. LINE NUMBER AND PROGRAM END MARKER PROG
RAM ELEMENTS 4. LINE NUMBER AND PROGRAM END MARKER A line number is automaticall
y inserted to each instruction you add to a program. If you remove an instructio
n or move an instruction to a new position in the program, the program instructi
ons will be renumbered automatically so that the first line is always line 1, th
e second line 2, and so forth. You use line numbers to identify which lines to m
ove, remove, and mark when you modify a program. The program end marker ( [End] 
) automatically appears after the last instruction in a program. As new instruct
ions are added, the program end marker moves down on the screen, retaining its p
osition as the last line in the program. 3. COLLECTIONS 5. MOTION INSTRUCTION
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: line number, program end, END, /END, line numbering, program termination).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Line_Number_Program_End.txt`.
- Classification: reference / topic=anti_pattern.

