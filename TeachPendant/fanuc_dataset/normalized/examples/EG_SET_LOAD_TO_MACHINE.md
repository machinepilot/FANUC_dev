---
id: EG_SET_LOAD_TO_MACHINE
title: "Load Part to RoboDrill (SET operation)"
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

# Load Part to RoboDrill (SET operation)

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_SET_Load_To_Machine.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  SET_S3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1252;
CREATE		= DATE 20-01-21  TIME 13:09:04;
MODIFIED	= DATE 20-01-29  TIME 11:39:24;
FILE_NAME	= SET_S2;
VERSION		= 0;
LINE_COUNT	= 36;
MEMORY_SIZE	= 1748;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/MN
   1:  !********************* ;
   2:  !Each operation program ;
   3:  !Operation content:load ;
   4:  !Hand type:single ;
   5:  !********************* ;
   6:   ;
   7:  !Various setting ;
   8:  UFRAME_NUM=0 ;
   9:  UTOOL_NUM=5 ;
  10:   ;
  11:  TIMER[6]=RESET ;
  12:  TIMER[6]=START ;
  13:   ;
  14:  !Operation of load to robodrill ;
  15:  LBL[1000:LOAD] ;
  16:J P[1:Relay point] 100% CNT100 Offset,PR[60]    ;
  17:J P[2:Work pos] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  18:J P[2:Work pos] 100% CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  19:  PAYLOAD[1] ;
  20:L P[2:Work pos] 100mm/sec FINE Offset,PR[60]    ;
  21:   ;
  22:  CALL CH1_OP    ;
  23:   ;
  24:L P[2:Work pos] 100mm/sec CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  25:  WAIT DO[102]=OFF    ;
  26:J P[2:Work pos] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  27:J P[1:Relay point] 100% CNT100 Offset,PR[60]    ;
  28:  !--------------------- ;
  29:   ;
  30:  !Move to wait pos and end program ;
  31:J PR[42] 100% FINE    ;
  32:   ;
  33:  TIMER[6]=STOP ;
  34:   ;
  35:  END ;
  36:  !--------------------- ;
/POS
P[1:"Relay point"]{
   GP1:
	UF : 0, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.288  mm,	Y =  -353.643  mm,	Z =   266.044  mm,
	W =     0.000 deg,	P =     -.287 deg,	R =   -90.084 deg
};
P[2:"Work pos"]{
   GP1:
	UF : 0, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.318  mm,	Y =  -815.598  mm,	Z =   -43.292  mm,
	W =     0.000 deg,	P =     -.285 deg,	R =   -90.088 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: SET, load, install, RoboDrill, CNC, machine load, chuck, offset, Tool_Offset, approach).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_SET_Load_To_Machine.txt`.
- Classification: examples / topic=anti_pattern.

