---
id: EG_PUT_DUAL_GRID
title: "Grid Put/Place Operation - Dual Hand"
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

# Grid Put/Place Operation - Dual Hand

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PUT_Dual_Grid.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  PUT_D_M3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1572;
CREATE		= DATE 20-01-21  TIME 13:08:14;
MODIFIED	= DATE 20-01-29  TIME 11:38:34;
FILE_NAME	= PUT_D_M2;
VERSION		= 0;
LINE_COUNT	= 53;
MEMORY_SIZE	= 2000;
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
   3:  !Operation content:put ;
   4:  !Hand type:dual ;
   5:  !Work placement:Grid ;
   6:  !********************* ;
   7:   ;
   8:  !Various setting and ;
   9:  !move to wait position ;
  10:   ;
  11:  UFRAME_NUM=5 ;
  12:  UTOOL_NUM=6 ;
  13:   ;
  14:  LBL[100] ;
  15:   ;
  16:  TIMER[4]=RESET ;
  17:  TIMER[4]=START ;
  18:   ;
  19:  LBL[1000] ;
  20:J PR[42] 10% FINE    ;
  21:  !--------------------- ;
  22:   ;
  23:  !Calculate correction amount ;
  24:  !to placement position ;
  25:  PR[44]=LPOS    ;
  26:  PR[44]=PR[44]-PR[44]    ;
  27:  PR[44,1]=R[82] MOD R[83]*R[89]    ;
  28:  PR[44,2]=R[82] DIV R[83]*R[90]    ;
  29:  !--------------------- ;
  30:   ;
  31:  !Operation of put machined work ;
  32:J P[1:Work pos] 100% CNT100 Offset,PR[44] Tool_Offset,PR[5]    ;
  33:J P[1:Work pos] 100% CNT10 Offset,PR[44] Tool_Offset,PR[6]    ;
  34:  PAYLOAD[1] ;
  35:L P[1:Work pos] 100mm/sec FINE Offset,PR[44]    ;
  36:   ;
  37:  CALL CH2_OP    ;
  38:   ;
  39:L P[1:Work pos] 100mm/sec CNT10 Offset,PR[44] Tool_Offset,PR[6]    ;
  40:  WAIT DO[102]=OFF    ;
  41:J P[1:Work pos] 100% CNT100 Offset,PR[44] Tool_Offset,PR[5]    ;
  42:  !--------------------- ;
  43:   ;
  44:  !Count up+ move to ;
  45:  !wait pos and end program ;
  46:  R[82]=R[82]+1    ;
  47:   ;
  48:J PR[42] 100% FINE    ;
  49:   ;
  50:  TIMER[4]=STOP ;
  51:   ;
  52:  END ;
  53:  !--------------------- ;
/POS
P[1:"Work pos"]{
   GP1:
	UF : 5, UT : 6,		CONFIG : 'N U T, 0, 0, 0',
	X =   317.840  mm,	Y =   141.383  mm,	Z =  -132.021  mm,
	W =     0.000 deg,	P =     -.281 deg,	R =    -1.560 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: PUT, place, grid, pallet, MOD, DIV, offset, Tool_Offset, timer, dual hand).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_PUT_Dual_Grid.txt`.
- Classification: examples / topic=anti_pattern.

