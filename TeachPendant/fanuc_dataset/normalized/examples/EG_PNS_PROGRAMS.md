---
id: EG_PNS_PROGRAMS
title: "PNS (Program Number Select) Programs"
topic: protocols
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

# PNS (Program Number Select) Programs

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PNS_Programs.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


============================================================
! Source: crdq_pns0001_eg.txt
============================================================

/PROG  PNS0001
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 835;
CREATE		= DATE 17-08-28  TIME 14:11:24;
MODIFIED	= DATE 20-01-08  TIME 18:09:32;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 34;
MEMORY_SIZE	= 1363;
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
   1:  !******************* ;
   2:  !Startup program ;
   3:  !Hand type:single ;
   4:  !******************* ;
   5:   ;
   6:  !Check initial setting ;
   7:  LBL[100] ;
   8:  CALL INITIAL_CHECK    ;
   9:  !--------------------- ;
  10:   ;
  11:  !Check hand condition ;
  12:  LBL[200] ;
  13:  IF R[8]=1,JMP LBL[1000] ;
  14:  IF RI[1:Gripper Closed]=ON,JMP LBL[20200] ;
  15:  !--------------------- ;
  16:   ;
  17:  !Call main program ;
  18:  !Call program for drill number ;
  19:  LBL[1000] ;
  20:  CALL RESET    ;
  21:  CALL VISION_3POINT    ;
  22:  CALL JOB_A    ;
  23:  CALL RESET    ;
  24:  !--------------------- ;
  25:   ;
  26:  LBL[9000] ;
  27:  END ;
  28:   ;
  29:  !Abnormal processing ;
  30:  LBL[20200] ;
  31:  UALM[7] ;
  32:  JMP LBL[200] ;
  33:  !--------------------- ;
  34:   ;
/POS
/END


============================================================
! Source: crdq_pns0002_eg.txt
============================================================

/PROG  PNS0002
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 805;
CREATE		= DATE 18-02-06  TIME 15:28:44;
MODIFIED	= DATE 20-01-08  TIME 18:13:06;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 33;
MEMORY_SIZE	= 1337;
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
   1:  !******************* ;
   2:  !Startup program ;
   3:  !Hand type:dual ;
   4:  !******************* ;
   5:   ;
   6:  !Check initial setting ;
   7:  LBL[100] ;
   8:  CALL INITIAL_CHECK    ;
   9:  !--------------------- ;
  10:   ;
  11:  !Check hand condition ;
  12:  LBL[200] ;
  13:  IF R[8]=1,JMP LBL[1000] ;
  14:  IF (RI[1:Gripper Closed]=ON OR RI[3:Finish Closed]=ON),JMP LBL[20200] ;
  15:  !--------------------- ;
  16:   ;
  17:  !Call main program ;
  18:  LBL[1000] ;
  19:  CALL RESET    ;
  20:  CALL VISION_3POINT    ;
  21:  CALL JOB_B    ;
  22:  CALL RESET    ;
  23:  !--------------------- ;
  24:   ;
  25:  LBL[9000] ;
  26:  END ;
  27:   ;
  28:  !Abnormal processing ;
  29:  LBL[20200] ;
  30:  UALM[7] ;
  31:  JMP LBL[200] ;
  32:  !--------------------- ;
  33:   ;
/POS
/END


============================================================
! Source: crdq_pns0003_eg.txt
============================================================

/PROG  PNS0003
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 869;
CREATE		= DATE 20-01-21  TIME 13:07:32;
MODIFIED	= DATE 20-01-21  TIME 15:07:24;
FILE_NAME	= PNS0001;
VERSION		= 0;
LINE_COUNT	= 34;
MEMORY_SIZE	= 1397;
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
   1:  !******************* ;
   2:  !Startup program ;
   3:  !Hand type:single ;
   4:  !******************* ;
   5:   ;
   6:  !Check initial setting ;
   7:  LBL[100] ;
   8:  CALL INITIAL_CHECK2    ;
   9:  !--------------------- ;
  10:   ;
  11:  !Check hand condition ;
  12:  LBL[200] ;
  13:  IF R[8]=1,JMP LBL[1000] ;
  14:  IF RI[1:Gripper Closed]=ON,JMP LBL[20200] ;
  15:  !--------------------- ;
  16:   ;
  17:  !Call main program ;
  18:  !Call program for drill number ;
  19:  LBL[1000] ;
  20:  CALL RESET2    ;
  21:  CALL VISION_3POINT2    ;
  22:  CALL JOB_A2    ;
  23:  CALL RESET2    ;
  24:  !--------------------- ;
  25:   ;
  26:  LBL[9000] ;
  27:  END ;
  28:   ;
  29:  !Abnormal processing ;
  30:  LBL[20200] ;
  31:  UALM[7] ;
  32:  JMP LBL[200] ;
  33:  !--------------------- ;
  34:   ;
/POS
/END


============================================================
! Source: crdq_pns0004_eg.txt
============================================================

/PROG  PNS0004
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 839;
CREATE		= DATE 20-01-21  TIME 13:07:44;
MODIFIED	= DATE 20-01-21  TIME 15:09:04;
FILE_NAME	= PNS0002;
VERSION		= 0;
LINE_COUNT	= 33;
MEMORY_SIZE	= 1371;
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
   1:  !******************* ;
   2:  !Startup program ;
   3:  !Hand type:dual ;
   4:  !******************* ;
   5:   ;
   6:  !Check initial setting ;
   7:  LBL[100] ;
   8:  CALL INITIAL_CHECK2    ;
   9:  !--------------------- ;
  10:   ;
  11:  !Check hand condition ;
  12:  LBL[200] ;
  13:  IF R[8]=1,JMP LBL[1000] ;
  14:  IF (RI[1:Gripper Closed]=ON OR RI[3:Finish Closed]=ON),JMP LBL[20200] ;
  15:  !--------------------- ;
  16:   ;
  17:  !Call main program ;
  18:  LBL[1000] ;
  19:  CALL RESET2    ;
  20:  CALL VISION_3POINT2    ;
  21:  CALL JOB_B2    ;
  22:  CALL RESET2    ;
  23:  !--------------------- ;
  24:   ;
  25:  LBL[9000] ;
  26:  END ;
  27:   ;
  28:  !Abnormal processing ;
  29:  LBL[20200] ;
  30:  UALM[7] ;
  31:  JMP LBL[200] ;
  32:  !--------------------- ;
  33:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: PNS, program number select, job scheduling, production sequence).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PNS_Programs.txt`.
- Classification: examples / topic=protocols.

