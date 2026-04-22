---
id: EG_OUTSET_DUAL_EXCHANGE
title: "Part Exchange Operation - Dual Hand (OUTSET)"
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

# Part Exchange Operation - Dual Hand (OUTSET)

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_OUTSET_Dual_Exchange.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  OUTSET_D3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2165;
CREATE		= DATE 20-01-21  TIME 13:06:34;
MODIFIED	= DATE 20-01-29  TIME 11:36:52;
FILE_NAME	= OUTSET_D;
VERSION		= 0;
LINE_COUNT	= 77;
MEMORY_SIZE	= 2641;
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

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:  !********************* ;
   2:  !Each operation program ;
   3:  !Operation content:unload+load ;
   4:  !Hand type:dual ;
   5:  !********************* ;
   6:   ;
   7:  !Various setting ;
   8:  !and move to wait position ;
   9:  UFRAME_NUM=0 ;
  10:  UTOOL_NUM=6 ;
  11:   ;
  12:  LBL[100] ;
  13:   ;
  14:  TIMER[3]=RESET ;
  15:  TIMER[3]=START ;
  16:   ;
  17:J PR[42] 10% FINE    ;
  18:  !--------------------- ;
  19:   ;
  20:  !Operation unload machined work ;
  21:  LBL[1000:UNLOAD] ;
  22:J P[1:Relay point] 100% CNT100 Offset,PR[60]    ;
  23:J P[2:Work pos] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  24:   ;
  25:  !Skip when system started ;
  26:  IF R[7]>0,JMP LBL[2000] ;
  27:  CALL CH2_OP    ;
  28:J P[2:Work pos] 100% CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  29:L P[2:Work pos] 100mm/sec FINE Offset,PR[60]    ;
  30:   ;
  31:  CALL CH2_CL    ;
  32:  PAYLOAD[4] ;
  33:   ;
  34:L P[2:Work pos] 100mm/sec CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  35:  WAIT DO[102]=OFF    ;
  36:  !--------------------- ;
  37:   ;
  38:  !Skip when program end ;
  39:  IF R[6]>0,JMP LBL[3000] ;
  40:  !--------------------- ;
  41:   ;
  42:  !Operation load unmachined work ;
  43:  LBL[2000:LOAD] ;
  44:   ;
  45:  UTOOL_NUM=5 ;
  46:   ;
  47:J P[3:Work pos2] 100% CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  48:  PAYLOAD[3] ;
  49:L P[3:Work pos2] 100mm/sec FINE Offset,PR[60]    ;
  50:   ;
  51:  CALL CH1_OP    ;
  52:   ;
  53:L P[3:Work pos2] 100mm/sec CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  54:  WAIT DO[102]=OFF    ;
  55:J P[3:Work pos2] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  56:   ;
  57:J P[4:Relay point] 100% CNT100    ;
  58:   ;
  59:  JMP LBL[9000] ;
  60:  !--------------------- ;
  61:   ;
  62:  !Only at the time of completion ;
  63:  !of the following process ;
  64:  LBL[3000] ;
  65:J P[2:Work pos] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  66:J P[1:Relay point] 100% CNT100 Offset,PR[60]    ;
  67:  !--------------------- ;
  68:   ;
  69:  !Move to wait pos and end program ;
  70:  LBL[9000] ;
  71:   ;
  72:J PR[22] 100% FINE    ;
  73:   ;
  74:  TIMER[3]=STOP ;
  75:   ;
  76:  END ;
  77:  !--------------------- ;
/POS
P[1:"Relay point"]{
   GP1:
	UF : 0, UT : 6,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.284  mm,	Y =  -353.644  mm,	Z =   266.044  mm,
	W =     0.000 deg,	P =     -.286 deg,	R =   -90.086 deg
};
P[2:"Work pos"]{
   GP1:
	UF : 0, UT : 6,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.322  mm,	Y =  -815.597  mm,	Z =   -43.302  mm,
	W =     0.000 deg,	P =     -.284 deg,	R =   -90.084 deg
};
P[3:"Work pos2"]{
   GP1:
	UF : 0, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.333  mm,	Y =  -815.593  mm,	Z =   -43.331  mm,
	W =     0.000 deg,	P =     -.281 deg,	R =   -90.084 deg
};
P[4:"Relay point"]{
   GP1:
	UF : 0, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.290  mm,	Y =  -353.641  mm,	Z =   266.037  mm,
	W =     -.000 deg,	P =     -.285 deg,	R =   -90.086 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: OUTSET, exchange, swap, dual hand, unload and load, CNC, simultaneous, machine tending).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_OUTSET_Dual_Exchange.txt`.
- Classification: examples / topic=anti_pattern.

