---
id: EG_COLLECTION_PROGRAMS
title: "Collection / PNS Programs"
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

# Collection / PNS Programs

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Collection_Programs.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


============================================================
! Source: crdq_col0001_eg.txt
============================================================

/PROG  COL0001	  Collection
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "1ST_SINGLE";
PROG_SIZE	= 168;
CREATE		= DATE 20-08-19  TIME 09:19:14;
MODIFIED	= DATE 20-08-19  TIME 09:28:16;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 3;
MEMORY_SIZE	= 536;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  CALL PNS0001    ;
/POS
/END


============================================================
! Source: crdq_col0002_eg.txt
============================================================

/PROG  COL0002	  Collection
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "1ST_DOUBLE";
PROG_SIZE	= 222;
CREATE		= DATE 20-08-19  TIME 09:28:30;
MODIFIED	= DATE 20-08-19  TIME 09:30:10;
FILE_NAME	= COL0001;
VERSION		= 0;
LINE_COUNT	= 5;
MEMORY_SIZE	= 582;
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
/MN
   1:  CALL PNS0002    ;
/POS
/END


============================================================
! Source: dq_col0001_eg.txt
============================================================

/PROG  COL0001	  Collection
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "SERVO_SINGLE";
PROG_SIZE	= 168;
CREATE		= DATE 20-08-19  TIME 09:19:14;
MODIFIED	= DATE 20-08-19  TIME 09:28:16;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 3;
MEMORY_SIZE	= 536;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= *,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  CALL PNS0001    ;
/POS
/END


============================================================
! Source: dq_col0002_eg.txt
============================================================

/PROG  COL0002	  Collection
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "SERVO_DOUBLE";
PROG_SIZE	= 222;
CREATE		= DATE 20-08-19  TIME 09:28:30;
MODIFIED	= DATE 20-08-19  TIME 09:30:10;
FILE_NAME	= COL0001;
VERSION		= 0;
LINE_COUNT	= 5;
MEMORY_SIZE	= 582;
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
/MN
   1:  CALL PNS0002    ;
/POS
/END


============================================================
! Source: dq_col0003_eg.txt
============================================================

/PROG  COL0003	  Collection
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "CYLINDER_SINGLE";
PROG_SIZE	= 254;
CREATE		= DATE 20-08-19  TIME 09:34:12;
MODIFIED	= DATE 20-08-19  TIME 09:58:26;
FILE_NAME	= COL0002;
VERSION		= 0;
LINE_COUNT	= 9;
MEMORY_SIZE	= 598;
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
/MN
   1:  CALL PNS0003    ;
/POS
/END


============================================================
! Source: dq_col0004_eg.txt
============================================================

/PROG  COL0004	  Collection
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "CYLINDER_DOUBLE";
PROG_SIZE	= 254;
CREATE		= DATE 20-08-19  TIME 09:38:18;
MODIFIED	= DATE 20-08-19  TIME 09:38:54;
FILE_NAME	= COL0003;
VERSION		= 0;
LINE_COUNT	= 9;
MEMORY_SIZE	= 598;
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
/MN
   1:  CALL PNS0004    ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: collection, PNS, program number select, production, job select).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Collection_Programs.txt`.
- Classification: examples / topic=anti_pattern.

