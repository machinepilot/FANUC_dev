---
id: EG_DQ_C_RECOVERY
title: "Counter Recovery - Dual Machine Variant"
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

# Counter Recovery - Dual Machine Variant

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_DQ_C_Recovery.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  C_RECOVERY	  Macro
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 285;
CREATE		= DATE 18-01-26  TIME 12:13:04;
MODIFIED	= DATE 18-11-22  TIME 19:44:30;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 8;
MEMORY_SIZE	= 625;
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
   2:  R[1]=R[191]    ;
   3:  R[2]=R[192]    ;
   4:  R[3]=R[193]    ;
   5:  R[4]=R[194]    ;
   6:   ;
   7:  MESSAGE[The counter was restored] ;
   8:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: recovery, counter, dual machine, restore, crash recovery).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_DQ_C_Recovery.txt`.
- Classification: examples / topic=anti_pattern.

