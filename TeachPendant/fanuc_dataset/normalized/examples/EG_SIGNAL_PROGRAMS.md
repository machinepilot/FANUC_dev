---
id: EG_SIGNAL_PROGRAMS
title: "Signal Handshake Programs (SIGNAL_INT / SIGNAL_END)"
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

# Signal Handshake Programs (SIGNAL_INT / SIGNAL_END)

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Signal_Programs.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


============================================================
! Source: crdq_signal_int_eg.txt
============================================================

/PROG  SIGNAL_INT
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 315;
CREATE		= DATE 17-04-26  TIME 15:57:20;
MODIFIED	= DATE 19-01-09  TIME 19:21:32;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 14;
MEMORY_SIZE	= 763;
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
   2:  LBL[100] ;
   3:   ;
   4:  TIMER[2]=STOP ;
   5:  TIMER[1]=RESET ;
   6:  TIMER[1]=START ;
   7:   ;
   8:  DO[2]=ON ;
   9:  DO[6]=ON ;
  10:  DO[8]=ON ;
  11:   ;
  12:  END ;
  13:   ;
  14:   ;
/POS
/END


============================================================
! Source: crdq_signal_end_eg.txt
============================================================

/PROG  SIGNAL_END
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 415;
CREATE		= DATE 17-04-26  TIME 16:09:58;
MODIFIED	= DATE 19-01-09  TIME 19:22:08;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 19;
MEMORY_SIZE	= 843;
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
   2:  LBL[100] ;
   3:   ;
   4:  DO[2]=OFF ;
   5:  DO[6]=OFF ;
   6:  DO[8]=OFF ;
   7:   ;
   8:  IF R[6]>0,JMP LBL[9000] ;
   9:   ;
  10:  IF (DI[1]=ON OR DI[2]=ON),DO[1]=PULSE,0.3sec ;
  11:   ;
  12:  WAIT DI[1]=OFF AND DI[2]=OFF    ;
  13:   ;
  14:  LBL[9000] ;
  15:   ;
  16:  TIMER[1]=STOP ;
  17:  TIMER[2]=RESET ;
  18:  TIMER[2]=START ;
  19:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: signal, handshake, SIGNAL_INT, SIGNAL_END, RoboDrill, acknowledge, machine communication, DO, DI).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Signal_Programs.txt`.
- Classification: examples / topic=anti_pattern.

