---
id: FANUC_REF_ADVANCED_MOTION_CONTROL
title: "Advanced Motion Control Settings"
topic: motion
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

# Advanced Motion Control Settings

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Advanced_Motion_Control.txt` as part of the TeachPendant migration. Original source: FANUC_dev legacy dataset. Review and update `related:` with neighbor entry IDs.

## Body


/PROG ADVANCED_MOTION_CONTROL
/ATTR
OWNER       = MNEDITOR;
COMMENT     = "Advanced Motion";
CREATE      = DATE 24-03-14  TIME 10:04:00;
PROTECT     = READ_WRITE;
DEFAULT_GROUP = 1,*,*,*,*;

/MN
   1:  ! Advanced Motion Control Module ;
   2:  ! Implements complex motion patterns ;
   
   3:  AUTO_SINGULARITY_HEADER ;
   4:  ENABLE_SINGULARITY_AVOIDANCE = TRUE ;
   
   5:  ! Configure motion parameters ;
   6:  R[40:PathType]=1 ;
   7:  R[41:Speed]=100 ;
   8:  R[42:Acceleration]=50 ;
   
   9:  ! Execute optimized motion sequence ;
  10:  SELECT R[40:PathType]=1,JMP LBL[100] ;
  11:         =2,JMP LBL[200] ;
  12:         =3,JMP LBL[300] ;
  
  13:LBL[100] ;
  14:J P[1] R[41]% FINE ACC R[42] ;
  15:L P[2] 500mm/sec FINE CONSTANT_PATH ;
  16:C P[3] P[4] 250mm/sec CNT100 ;
  17:  JMP LBL[999] ;
  
  18:LBL[200] ;
  19:L P[5] 200mm/sec FINE Tool_Offset,PR[1] ;
  20:  JMP LBL[999] ;
  
  21:LBL[300] ;
  22:  CALL SPLINE_MOTION ;
  
  23:LBL[999] ;
  24:  END ;
/POS
P[1]{
   GP1:
    UF : 1, UT : 1,	CONFIG : 'N U T, 0, 0, 0',
    X =   400.0  mm,	Y =   0.0  mm,	Z =   500.0  mm,
    W =   180.0 deg,	P =   0.0 deg,	R =   180.0 deg
};
/END

## Citations

- Primary: FANUC_dev legacy dataset (keywords: advanced motion control, path accuracy, motion smoothing, acceleration, deceleration, jerk, servo, trajectory).
- Applicability: R-30iB Plus, Motion Tuning.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Advanced_Motion_Control.txt`.
- Classification: reference / topic=motion.

