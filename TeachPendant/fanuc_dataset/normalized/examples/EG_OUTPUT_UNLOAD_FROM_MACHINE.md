---
id: EG_OUTPUT_UNLOAD_FROM_MACHINE
title: "Unload Part from RoboDrill (OUTPUT operation)"
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

# Unload Part from RoboDrill (OUTPUT operation)

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_OUTPUT_Unload_From_Machine.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  OUTPUT_S_M3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2192;
CREATE		= DATE 20-01-21  TIME 13:06:20;
MODIFIED	= DATE 20-01-29  TIME 11:36:30;
FILE_NAME	= OUTPUT_S;
VERSION		= 0;
LINE_COUNT	= 80;
MEMORY_SIZE	= 2648;
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
   3:  !Operation content:unload+put ;
   4:  !Hand type:single ;
   5:  !Workplacemrnt:Grid ;
   6:  !********************* ;
   7:   ;
   8:  !Various setting ;
   9:  !and move to wait position ;
  10:  TIMER[3]=RESET ;
  11:  TIMER[3]=START ;
  12:   ;
  13:  UFRAME_NUM=0 ;
  14:  UTOOL_NUM=5 ;
  15:   ;
  16:  LBL[100] ;
  17:   ;
  18:J PR[22] 10% FINE    ;
  19:   ;
  20:  CALL CH1_OP    ;
  21:  !--------------------- ;
  22:   ;
  23:  !Operation of unload from drill ;
  24:  LBL[1000:UNLOAD] ;
  25:J P[1:Relay point] 100% CNT100 Offset,PR[60]    ;
  26:J P[2:Work pos] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  27:J P[2:Work pos] 100% CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  28:L P[2:Work pos] 100mm/sec FINE Offset,PR[60]    ;
  29:   ;
  30:  LBL[1100] ;
  31:  PAYLOAD[3] ;
  32:  CALL CH1_CL    ;
  33:   ;
  34:L P[2:Work pos] 100mm/sec CNT10 Offset,PR[60] Tool_Offset,PR[6]    ;
  35:  WAIT DO[102]=OFF    ;
  36:J P[2:Work pos] 100% CNT100 Offset,PR[60] Tool_Offset,PR[7]    ;
  37:J P[1:Relay point] 100% CNT100 Offset,PR[60]    ;
  38:   ;
  39:  TIMER[3]=STOP ;
  40:   ;
  41:  TIMER[4]=RESET ;
  42:  TIMER[4]=START ;
  43:  !--------------------- ;
  44:   ;
  45:  !Operation of putting ;
  46:  !the machined work to pallet ;
  47:  UFRAME_NUM=5 ;
  48:   ;
  49:  LBL[2000:PUT TO PALLET] ;
  50:   ;
  51:  !Calculate of correction amount ;
  52:  !to placement position ;
  53:  PR[44]=LPOS    ;
  54:  PR[44]=PR[44]-PR[44]    ;
  55:  PR[44,1]=R[82] MOD R[83]*R[89]    ;
  56:  PR[44,2]=R[82] DIV R[83]*R[90]    ;
  57:  !--------------------- ;
  58:   ;
  59:  !Operation of putting ;
  60:J P[3:Work pos] 100% CNT100 Offset,PR[44] Tool_Offset,PR[5]    ;
  61:J P[3:Work pos] 100% CNT10 Offset,PR[44] Tool_Offset,PR[6]    ;
  62:  PAYLOAD[1] ;
  63:L P[3:Work pos] 100mm/sec FINE Offset,PR[44]    ;
  64:   ;
  65:  CALL CH1_OP    ;
  66:   ;
  67:L P[3:Work pos] 100mm/sec CNT10 Offset,PR[44] Tool_Offset,PR[6]    ;
  68:  WAIT DO[102]=OFF    ;
  69:J P[3:Work pos] 100% CNT100 Offset,PR[44] Tool_Offset,PR[5]    ;
  70:   ;
  71:J PR[42] 100% CNT100 BREAK    ;
  72:   ;
  73:  TIMER[4]=STOP ;
  74:  !--------------------- ;
  75:   ;
  76:  !Count up and end program ;
  77:  R[82]=R[82]+1    ;
  78:   ;
  79:  END ;
  80:  !--------------------- ;
/POS
P[1:"Relay point"]{
   GP1:
	UF : 0, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.295  mm,	Y =  -353.644  mm,	Z =   266.048  mm,
	W =     -.000 deg,	P =     -.287 deg,	R =   -90.088 deg
};
P[2:"Work pos"]{
   GP1:
	UF : 0, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.308  mm,	Y =  -815.601  mm,	Z =   -43.279  mm,
	W =     0.000 deg,	P =     -.286 deg,	R =   -90.088 deg
};
P[3:"Work pos"]{
   GP1:
	UF : 5, UT : 5,		CONFIG : 'N U T, 0, 0, 0',
	X =   217.858  mm,	Y =   141.399  mm,	Z =  -131.982  mm,
	W =     -.000 deg,	P =     -.286 deg,	R =    -1.559 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: OUTPUT, unload, remove, RoboDrill, CNC, machine unload, chuck, retrieval).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_OUTPUT_Unload_From_Machine.txt`.
- Classification: examples / topic=anti_pattern.

