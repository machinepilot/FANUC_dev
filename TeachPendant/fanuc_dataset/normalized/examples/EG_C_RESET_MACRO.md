---
id: EG_C_RESET_MACRO
title: "Counter Reset Macro"
topic: anti_pattern
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "TWA (The Way Automation) Standard Programs"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# Counter Reset Macro

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_C_Reset_Macro.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  C_RESET3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 387;
CREATE		= DATE 20-01-21  TIME 13:04:30;
MODIFIED	= DATE 20-01-21  TIME 13:16:30;
FILE_NAME	= C_RESET2;
VERSION		= 0;
LINE_COUNT	= 13;
MEMORY_SIZE	= 839;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:   ;
   2:  IF R[81]=0 AND R[82]=0,JMP LBL[9000] ;
   3:   ;
   4:  R[195]=R[81]    ;
   5:  R[196]=R[82]    ;
   6:   ;
   7:  R[81]=0    ;
   8:  R[82]=0    ;
   9:   ;
  10:  MESSAGE[The counter was reset] ;
  11:   ;
  12:  LBL[9000] ;
  13:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: reset, counter, zero, initialize, macro, R[], clear counters).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_C_Reset_Macro.txt`.
- Classification: examples / topic=anti_pattern.

