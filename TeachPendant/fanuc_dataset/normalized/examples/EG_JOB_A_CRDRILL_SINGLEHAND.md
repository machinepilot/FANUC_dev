---
id: EG_JOB_A_CRDRILL_SINGLEHAND
title: "Main Job Program - Single RoboDrill, Vision Integration"
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

# Main Job Program - Single RoboDrill, Vision Integration

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_A_CRDrill_SingleHand.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  JOB_A3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 3517;
CREATE		= DATE 20-01-21  TIME 13:05:40;
MODIFIED	= DATE 20-01-29  TIME 11:34:48;
FILE_NAME	= JOB_A2;
VERSION		= 0;
LINE_COUNT	= 151;
MEMORY_SIZE	= 3993;
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
   2:  !Main program ;
   3:  !Hand type:single hand ;
   4:  !********************* ;
   5:   ;
   6:  !Various set and move to wait pos ;
   7:  UFRAME_NUM=0 ;
   8:  UTOOL_NUM=5 ;
   9:  PAYLOAD[1] ;
  10:   ;
  11:J PR[42] 100% FINE    ;
  12:  !--------------------- ;
  13:   ;
  14:  !Detect request from robodrill ;
  15:  LBL[100] ;
  16:  WAIT DI[1]=ON OR DI[2]=ON OR DI[3]=ON    ;
  17:  !--------------------- ;
  18:   ;
  19:  !3-point correction if there is a ;
  20:  !displacement of the cart ;
  21:  CALL VISION_WAIT3    ;
  22:  IF R[100:Num Grippers]=1,CALL VISION_3POINT3 ;
  23:  IF R[100:Num Grippers]=1,CALL VISION_WAIT3 ;
  24:  R[100:Num Grippers]=0    ;
  25:  !--------------------- ;
  26:   ;
  27:  !Job of exchanging the work ;
  28:  LBL[1000] ;
  29:  !Judge the stop request and start ;
  30:  IF ((DI[5]=ON OR R[41]>=R[45]) AND DI[2]=OFF),R[6]=(1) ;
  31:  IF (DI[6]=ON AND DI[2]=OFF),R[6]=(2) ;
  32:  IF (DI[2]=ON),R[7]=(1) ;
  33:  !--------------------- ;
  34:   ;
  35:  !Check the door opening ;
  36:  !and the work exchange position ;
  37:  WAIT DI[10]=ON TIMEOUT,LBL[21000] ;
  38:  WAIT DI[9]=ON TIMEOUT,LBL[21010] ;
  39:  !--------------------- ;
  40:   ;
  41:  !Start signal processing ;
  42:  CALL SIGNAL_INT    ;
  43:  !--------------------- ;
  44:   ;
  45:  !Remove the machined work, ;
  46:  !skip when the system start ;
  47:  IF R[7]>0,JMP LBL[1100] ;
  48:  CALL OUTPUT_S_M3    ;
  49:  !--------------------- ;
  50:   ;
  51:  !Mounting of unmachined work, ;
  52:  !skip when the system stop ;
  53:  LBL[1100] ;
  54:  IF R[6]>0,JMP LBL[1200] ;
  55:  CALL PICK_S_M3    ;
  56:  CALL VISION_WAIT3    ;
  57:  IF R[100:Num Grippers]=1,JMP LBL[1110] ;
  58:  R[100:Num Grippers]=0    ;
  59:  CALL SET_S3    ;
  60:  JMP LBL[1200] ;
  61:   ;
  62:  LBL[1110] ;
  63:  CALL RETURN_M3    ;
  64:  CALL VISION_3POINT3    ;
  65:  CALL VISION_WAIT3    ;
  66:  JMP LBL[1100] ;
  67:  !--------------------- ;
  68:   ;
  69:  LBL[1200] ;
  70:  !Signal processing at completion ;
  71:  CALL SIGNAL_END    ;
  72:  R[7]=0    ;
  73:  !--------------------- ;
  74:   ;
  75:  !Check the door closing ;
  76:  IF R[6]>0,JMP LBL[1300] ;
  77:  WAIT DI[10]=OFF TIMEOUT,LBL[21200] ;
  78:  !--------------------- ;
  79:   ;
  80:  !End mode transition determine ;
  81:  LBL[1300] ;
  82:  IF R[6]>0 OR R[82]>=R[85],JMP LBL[3000] ;
  83:  !--------------------- ;
  84:   ;
  85:  !Back to the top ;
  86:  JMP LBL[100] ;
  87:  !--------------------- ;
  88:   ;
  89:  !End mode ;
  90:  LBL[3000:ROBOT STOP   ] ;
  91:  !Decide processing acccording to ;
  92:  !the value of the end flag ;
  93:  IF R[6]=2,JMP LBL[3200] ;
  94:  IF R[6]=1,JMP LBL[3100] ;
  95:  JMP LBL[9000] ;
  96:  !--------------------- ;
  97:   ;
  98:  LBL[3100] ;
  99:  !Cycle stop request or ;
 100:  !0 unprocessed work ;
 101:  !Send cycle stop req from robot ;
 102:  IF DI[5]=ON,JMP LBL[3150] ;
 103:  DO[15]=PULSE,0.2sec ;
 104:  WAIT DO[15]=OFF    ;
 105:  LBL[3150] ;
 106:  DO[3]=PULSE,0.3sec ;
 107:  WAIT DI[5]=OFF    ;
 108:  !--------------------- ;
 109:   ;
 110:  !Reset the end flag ;
 111:  R[6]=0    ;
 112:  !--------------------- ;
 113:   ;
 114:  !If unprocessed work remains, ;
 115:  !start cueing ;
 116:  IF R[81]<R[85],JMP LBL[100] ;
 117:  !--------------------- ;
 118:   ;
 119:  !When there is no unmachined work ;
 120:  !Reset count and go to LBL[9000] ;
 121:  R[81]=0    ;
 122:  R[82]=0    ;
 123:  JMP LBL[9000] ;
 124:  !--------------------- ;
 125:   ;
 126:  !System stop processing ;
 127:  LBL[3200] ;
 128:  DO[4]=PULSE,0.3sec ;
 129:  WAIT DI[6]=OFF    ;
 130:  !--------------------- ;
 131:   ;
 132:  !Move to home pos and end program ;
 133:  LBL[9000] ;
 134:J PR[1] 100% FINE    ;
 135:  END ;
 136:  !--------------------- ;
 137:   ;
 138:  !Abnormal processing ;
 139:  LBL[21000] ;
 140:  UALM[1] ;
 141:  JMP LBL[1000] ;
 142:   ;
 143:  LBL[21010] ;
 144:  UALM[8] ;
 145:  JMP LBL[1000] ;
 146:   ;
 147:  LBL[21200] ;
 148:  UALM[2] ;
 149:  JMP LBL[1200] ;
 150:  !--------------------- ;
 151:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: JOB, main program, CNC tending, RoboDrill, vision, cycle stop, system stop, single hand, machine tending, service request).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_A_CRDrill_SingleHand.txt`.
- Classification: examples / topic=anti_pattern.

