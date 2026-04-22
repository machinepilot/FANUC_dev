---
id: EG_DQ_INITIAL_CHECK
title: "Initial Check - Dual Machine Variant"
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

# Initial Check - Dual Machine Variant

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_DQ_Initial_Check.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  INITIAL_CHECK
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1617;
CREATE		= DATE 20-12-16  TIME 16:49:42;
MODIFIED	= DATE 20-12-24  TIME 15:38:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 68;
MEMORY_SIZE	= 2105;
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
   6:  !Check the number of robodrill ;
   7:  IF R[28]<1 OR R[28]>4,JMP LBL[20000] ;
   8:  IF R[29]<0 OR R[29]>1,JMP LBL[20000] ;
   9:  IF R[28]=1 AND R[29]=0,JMP LBL[150] ;
  10:  IF R[28]=1 AND R[29]=1,JMP LBL[200] ;
  11:  IF R[28]=2,JMP LBL[150] ;
  12:  !--------------------- ;
  13:   ;
  14:  !Check the number of drill L work ;
  15:  LBL[150] ;
  16:  IF R[5]<=0,JMP LBL[20100] ;
  17:  IF R[6]<=0,JMP LBL[20100] ;
  18:  IF R[7]<=0,JMP LBL[20100] ;
  19:  IF (R[7]>R[5]*R[6]),JMP LBL[20100] ;
  20:  IF R[1]>=R[7],JMP LBL[20100] ;
  21:  IF R[2]>=R[7],JMP LBL[20100] ;
  22:  !--------------------- ;
  23:   ;
  24:  !Num of drill is 1, finish check ;
  25:  IF R[28]=1,JMP LBL[9000] ;
  26:  !--------------------- ;
  27:   ;
  28:  !Check the number of drill R work ;
  29:  LBL[200] ;
  30:  IF R[11]<=0,JMP LBL[20200] ;
  31:  IF R[12]<=0,JMP LBL[20200] ;
  32:  IF R[13]<=0,JMP LBL[20200] ;
  33:  IF (R[13]>R[11]*R[12]),JMP LBL[20200] ;
  34:  IF R[3]>=R[13],JMP LBL[20200] ;
  35:  IF R[4]>=R[13],JMP LBL[20200] ;
  36:  !--------------------- ;
  37:   ;
  38:  !Num of drill is 2, finish check ;
  39:  IF R[29]=1,JMP LBL[9000] ;
  40:  IF R[28]=2,JMP LBL[9000] ;
  41:  !--------------------- ;
  42:   ;
  43:  !Create the program to drill3,4 ;
  44:  LBL[300] ;
  45:   ;
  46:  IF R[28]=3,JMP LBL[9000] ;
  47:   ;
  48:  LBL[400] ;
  49:   ;
  50:  IF R[28]=4,JMP LBL[9000] ;
  51:  !--------------------- ;
  52:   ;
  53:  LBL[9000] ;
  54:  END ;
  55:   ;
  56:  !Abnormal proccesing ;
  57:  LBL[20000] ;
  58:  UALM[8] ;
  59:  JMP LBL[100] ;
  60:   ;
  61:  LBL[20100] ;
  62:  LBL[20200] ;
  63:  LBL[20300] ;
  64:  LBL[20400] ;
  65:  UALM[4] ;
  66:  JMP LBL[100] ;
  67:  !--------------------- ;
  68:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: initial check, dual machine, validation, startup).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_DQ_Initial_Check.txt`.
- Classification: examples / topic=anti_pattern.

