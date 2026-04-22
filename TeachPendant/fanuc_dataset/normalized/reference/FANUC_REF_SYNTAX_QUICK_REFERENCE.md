---
id: FANUC_REF_SYNTAX_QUICK_REFERENCE
title: "TP Syntax Quick Reference"
topic: registers
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

# TP Syntax Quick Reference

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Syntax_Quick_Reference.txt` as part of the TeachPendant migration. Original source: FANUC_dev legacy dataset. Review and update `related:` with neighbor entry IDs.

## Body


/PROG EXAMPLE
/ATTR
COMMENT                 = "Program Comment";
DEFAULT_GROUP           = 1,*,*,*,*;
CONTROL_CODE            = 00000000 00000000;
/MN
   : ! Registers ;
   : R[5] = R[AR[40]];
   : VR[5];
   : PR[5];
   : RO[1]=ON;
   : RI[1];
   : DI[1];
   : DO[1] = OFF;

   : ! Control Flow;
   : LBL[300];
   : FOR R[50] = 1 TO 5;
   :    IF (R[105]=3) THEN;
   :       JMP LBL[500];
   :    ELSE;
   :       ABORT;
   :       END;
   :    ENDIF;
   : ENDFOR;

   : ! Functions;
   : CALL BINPICKING(1, R[30], 'AREASENSOR2');
   : CALL MAGNET_ON;
   : RUN BACKGROUNDPROC;

   : ! Motion;
   : J P[3] 100% CNT10;
   : L PR[3] 100mm/sec FINE;
   : L PR[3] 100cm/min FINE INC;
   : L PR[3] 100cm/min FINE VOFFSET, VR[1];
   : L PR[3] 100cm/min FINE OFFSET, PR[1];
   : L PR[3] 100cm/min FINE TOOL_OFFSET, PR[1];
   : C PR[3] PR[4] 100mm/sec FINE; 
   : A PR[3] 100cm/sec CNT100;

   : ! Vision & Other;
   : VISION RUN_FIND 'PROCESSNAME';
   : VISION GET_NFOUND 'PROCESSNAME' R[52];
   : WAIT 5sec;
   : FORCE CTRL[2:JIG];
   : MESSAGE[A user message];
   : UALM[3];
   : -- multiline 
   : comment;
/POS
/END



## Citations

- Primary: FANUC_dev legacy dataset (keywords: syntax, quick reference, cheat sheet, TP commands, instruction format).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Syntax_Quick_Reference.txt`.
- Classification: reference / topic=registers.

