---
id: EG_CALIB_POSITION
title: "Calibration Position Routine"
topic: frames
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

# Calibration Position Routine

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Calib_Position.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  CALIB_POS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 596;
CREATE		= DATE 20-01-23  TIME 23:09:44;
MODIFIED	= DATE 20-02-07  TIME 01:42:36;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 10;
MEMORY_SIZE	= 928;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  UFRAME_NUM=0 ;
   2:  UTOOL_NUM=1 ;
   3:   ;
   4:J P[1] 100% FINE    ;
   5:   ;
   6:J P[2] 100% FINE    ;
   7:   ;
   8:J PR[1] 100% FINE    ;
   9:   ;
  10:  END ;
/POS
P[1]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   877.708  mm,	Y =    74.828  mm,	Z =   155.829  mm,
	W =    90.552 deg,	P =      .987 deg,	R =     9.909 deg
};
P[2]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   891.749  mm,	Y =    74.765  mm,	Z =    83.803  mm,
	W =    90.927 deg,	P =     3.079 deg,	R =     9.923 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: calibration, position, reference, teach, calibrate, zero point).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Calib_Position.txt`.
- Classification: examples / topic=frames.

