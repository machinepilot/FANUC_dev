---
id: EG_DQ_C_RESET
title: "Counter Reset - Dual Machine Variant"
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

# Counter Reset - Dual Machine Variant

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_DQ_C_Reset.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  C_RESET	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 433;
CREATE		= DATE 18-01-26  TIME 11:03:28;
MODIFIED	= DATE 18-11-22  TIME 19:46:32;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 17;
MEMORY_SIZE	= 869;
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
   2:  IF R[1]=0 AND R[2]=0 AND R[3]=0 AND R[4]=0,JMP LBL[9000] ;
   3:   ;
   4:  R[191]=R[1]    ;
   5:  R[192]=R[2]    ;
   6:  R[193]=R[3]    ;
   7:  R[194]=R[4]    ;
   8:   ;
   9:  R[1]=0    ;
  10:  R[2]=0    ;
  11:  R[3]=0    ;
  12:  R[4]=0    ;
  13:   ;
  14:  MESSAGE[The counter was reseted] ;
  15:   ;
  16:  LBL[9000] ;
  17:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: reset, counter, dual machine, zero, initialize).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_DQ_C_Reset.txt`.
- Classification: examples / topic=anti_pattern.

