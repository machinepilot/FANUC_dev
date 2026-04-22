---
id: EG_BACKGROUND_LOGIC
title: "Background Logic Program Pattern"
topic: bg_logic
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "FANUC_dev legacy dataset"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# Background Logic Program Pattern

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Background_Logic.txt` as part of the TeachPendant migration. Original source: FANUC_dev legacy dataset. Review and update `related:` with neighbor entry IDs.

## Body


/PROG Background_Logic
/ATTR
COMMENT = 'Background Logic Routine for I/O and fault monitoring';
/MN
   1:  ! Background monitoring loop;
   2:LBL[10];
   3:  ! Monitor part presence;
   4:  IF DI[2:Part Detected] = ON THEN;
   5:    R[1:Part Count] = R[1:Part Count] + 1;
   6:    MESSAGE['Part Detected'];
   7:  ENDIF;

   8:  ! Check for faults;
   9:  IF DI[3:Fault Detected] = ON THEN;
   10:    MESSAGE['Fault Detected! Logging Error.'];
   11:    LOG_ERROR 'FAULT-001', 'Fault detected during operation.';
   12:    ABORT;
   13:  ENDIF;

   14:JMP LBL[10];  ! Continue monitoring.

## Citations

- Primary: FANUC_dev legacy dataset (keywords: background logic, BG Logic, monitoring, watchdog, override control, continuous loop, background program, I/O monitoring).
- Applicability: R-30iB Plus, Background Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Background_Logic.txt`.
- Classification: examples / topic=bg_logic.

