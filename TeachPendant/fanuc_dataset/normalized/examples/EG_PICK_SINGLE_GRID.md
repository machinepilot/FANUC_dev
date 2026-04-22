---
id: EG_PICK_SINGLE_GRID
title: "Grid Pick Operation - Single Hand"
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

# Grid Pick Operation - Single Hand

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PICK_Single_Grid.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  PICK_S_M3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1569;
CREATE		= DATE 20-01-21  TIME 13:07:20;
MODIFIED	= DATE 20-01-29  TIME 11:37:38;
FILE_NAME	= PICK_S_M;
VERSION		= 0;
LINE_COUNT	= 51;
MEMORY_SIZE	= 2013;
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
   3:  !Operation content:pick ;
   4:  !Hand type:single ;
   5:  !Work placement:Grid ;
   6:  !********************* ;
   7:   ;
   8:  !Various setting ;
   9:  UFRAME_NUM=5 ;
  10:  UTOOL_NUM=5 ;
  11:   ;
  12:  TIMER[5]=RESET ;
  13:  TIMER[5]=START ;
  14:  !--------------------- ;
  15:   ;
  16:  !Operation of pick ;
  17:  !an unmachined work from pallet ;
  18:  LBL[1000:PICK] ;
  19:J PR[42] 10% FINE    ;
  20:   ;
  21:  !Calculate of correction amount ;
  22:  !to pick position ;
  23:  PR[43]=LPOS    ;
  24:  PR[43]=PR[43]-PR[43]    ;
  25:  PR[43,1]=R[81] MOD R[83]*R[89]    ;
  26:  PR[43,2]=R[81] DIV R[83]*R[90]    ;
  27:  !--------------------- ;
  28:   ;
  29:  !Operation pick unmachined work ;
  30:  LBL[1100] ;
  31:  CALL CH1_OP    ;
  32:J P[1:Work pos] 100% CNT100 Offset,PR[43] Tool_Offset,PR[5]    ;
  33:J P[1:Work pos] 100% CNT10 Offset,PR[43] Tool_Offset,PR[6]    ;
  34:L P[1:Work pos] 100mm/sec FINE Offset,PR[43]    ;
  35:   ;
  36:  PAYLOAD[2] ;
  37:  CALL CH1_CL    ;
  38:   ;
  39:L P[1:Work pos] 100mm/sec CNT10 Offset,PR[43] Tool_Offset,PR[6]    ;
  40:  WAIT DO[102]=OFF    ;
  41:J P[1:Work pos] 100% CNT100 Offset,PR[43] Tool_Offset,PR[5]    ;
  42:  !--------------------- ;
  43:   ;
  44:  !Count up ;
  45:  R[81]=R[81]+1    ;
  46:  !--------------------- ;
  47:   ;
  48:  !Move to wait pos and end program ;
  49:J PR[42] 100% FINE    ;
  50:  TIMER[5]=STOP ;
  51:  END ;
/POS
P[1:"Work pos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   183.455  mm,	Y =    26.722  mm,	Z =  -105.429  mm,
	W =     1.269 deg,	P =     -.138 deg,	R =     2.269 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: PICK, grid, pallet, MOD, DIV, offset, Tool_Offset, approach, retreat, single hand, material handling).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PICK_Single_Grid.txt`.
- Classification: examples / topic=anti_pattern.

