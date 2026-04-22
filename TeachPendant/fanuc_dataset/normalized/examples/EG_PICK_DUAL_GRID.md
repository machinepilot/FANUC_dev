---
id: EG_PICK_DUAL_GRID
title: "Grid Pick Operation - Dual Hand"
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

# Grid Pick Operation - Dual Hand

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PICK_Dual_Grid.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  PICK_D_M3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1612;
CREATE		= DATE 20-01-21  TIME 13:07:02;
MODIFIED	= DATE 20-01-29  TIME 11:37:16;
FILE_NAME	= PICK_D_M;
VERSION		= 0;
LINE_COUNT	= 54;
MEMORY_SIZE	= 2044;
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
   3:  !Operation content:pick ;
   4:  !Hand type:dual ;
   5:  !Work placement:Grid ;
   6:  !********************* ;
   7:   ;
   8:  !Various setting and ;
   9:  !move to wait position ;
  10:  UFRAME_NUM=5 ;
  11:  UTOOL_NUM=5 ;
  12:   ;
  13:  LBL[100] ;
  14:   ;
  15:  TIMER[5]=RESET ;
  16:  TIMER[5]=START ;
  17:   ;
  18:  LBL[1000] ;
  19:J PR[42] 10% FINE    ;
  20:  !--------------------- ;
  21:   ;
  22:  !Calculate of correction amount ;
  23:  !to pick position ;
  24:  PR[43]=LPOS    ;
  25:  PR[43]=PR[43]-PR[43]    ;
  26:  PR[43,1]=R[81] MOD R[83]*R[89]    ;
  27:  PR[43,2]=R[81] DIV R[83]*R[90]    ;
  28:  !--------------------- ;
  29:   ;
  30:  !Operation pick unmachined work ;
  31:  CALL CH1_OP    ;
  32:J P[1:Work pos] 100% CNT100 Offset,PR[43] Tool_Offset,PR[5]    ;
  33:J P[1:Work pos] 100% CNT10 Offset,PR[43] Tool_Offset,PR[6]    ;
  34:L P[1:Work pos] 100mm/sec FINE Offset,PR[43]    ;
  35:   ;
  36:  CALL CH1_CL    ;
  37:  PAYLOAD[2] ;
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
  49:J PR[22] 100% FINE    ;
  50:   ;
  51:  TIMER[5]=STOP ;
  52:   ;
  53:  END ;
  54:  !--------------------- ;
/POS
P[1:"Work pos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   317.845  mm,	Y =   141.385  mm,	Z =  -132.010  mm,
	W =     0.000 deg,	P =     -.283 deg,	R =    -1.560 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: PICK, grid, pallet, MOD, DIV, offset, Tool_Offset, approach, retreat, dual hand).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PICK_Dual_Grid.txt`.
- Classification: examples / topic=anti_pattern.

