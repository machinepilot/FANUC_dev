---
id: EG_INITIAL_CHECK
title: "Initial Check / Pre-Run Validation"
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

# Initial Check / Pre-Run Validation

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Initial_Check.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  INITIAL_CHECK3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 705;
CREATE		= DATE 20-01-21  TIME 13:05:14;
MODIFIED	= DATE 20-01-21  TIME 13:19:16;
FILE_NAME	= INITIAL_;
VERSION		= 0;
LINE_COUNT	= 24;
MEMORY_SIZE	= 1113;
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
   1:  !********************* ;
   2:  !Program checks initial condition ;
   3:  !********************* ;
   4:   ;
   5:  LBL[100] ;
   6:   ;
   7:  !Check the number of drill1 work ;
   8:  IF R[83]<=0,JMP LBL[20100] ;
   9:  IF R[84]<=0,JMP LBL[20100] ;
  10:  IF R[85]<=0,JMP LBL[20100] ;
  11:  IF (R[85]>R[83]*R[84]),JMP LBL[20100] ;
  12:  IF R[81]>=R[85],JMP LBL[20100] ;
  13:  IF R[82]>=R[85],JMP LBL[20100] ;
  14:  !--------------------- ;
  15:   ;
  16:  LBL[9000] ;
  17:  END ;
  18:   ;
  19:  !Abnormal processing ;
  20:  LBL[20100] ;
  21:  UALM[4] ;
  22:  JMP LBL[100] ;
  23:  !--------------------- ;
  24:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: initial check, validation, pre-run, startup check, safety check, gripper state, I/O verify).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Initial_Check.txt`.
- Classification: examples / topic=anti_pattern.

