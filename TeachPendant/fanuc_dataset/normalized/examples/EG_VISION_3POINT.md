---
id: EG_VISION_3POINT
title: "Vision 3-Point Calibration/Offset Program"
topic: vision
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

# Vision 3-Point Calibration/Offset Program

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Vision_3Point.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  VISION_3POINT3
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4038;
CREATE		= DATE 20-01-21  TIME 13:09:28;
MODIFIED	= DATE 21-01-07  TIME 20:46:28;
FILE_NAME	= VISION_3;
VERSION		= 0;
LINE_COUNT	= 191;
MEMORY_SIZE	= 4574;
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
/MN
   1:  LBL[100] ;
   2:  UFRAME_NUM=0 ;
   3:  UTOOL_NUM=5 ;
   4:J PR[42] 10% FINE    ;
   5:  VISION OVERRIDE 'EXPO' R[102] ;
   6:  R[101:Infeed Type]=0    ;
   7:   ;
   8:  !First point of vision detection ;
   9:  LBL[1000] ;
  10:  R[108:Num Finish]=1    ;
  11:J P[1:Detec. p 1-1 ] 50% FINE ACC50    ;
  12:  WAIT    .50(sec) ;
  13:  VISION RUN_FIND 'VP1'    ;
  14:  VISION GET_OFFSET 'VP1' VR[1] JMP LBL[11000] ;
  15:  PR[49]=VR[1].FOUND_POS[1] ;
  16:  VISION OVERRIDE 'EXPO' R[102] ;
  17:  R[101:Infeed Type]=0    ;
  18:   ;
  19:  LBL[1100] ;
  20:  R[108:Num Finish]=2    ;
  21:J P[2:Detec. p 1-2] 50% FINE ACC50    ;
  22:  WAIT    .50(sec) ;
  23:  VISION RUN_FIND 'VP1'    ;
  24:  VISION GET_OFFSET 'VP1' VR[1] JMP LBL[11100] ;
  25:  PR[50]=VR[1].FOUND_POS[1] ;
  26:  VISION OVERRIDE 'EXPO' R[102] ;
  27:  R[101:Infeed Type]=0    ;
  28:  !------------------- ;
  29:   ;
  30:  !Second point of vision detection ;
  31:  LBL[2000] ;
  32:  R[108:Num Finish]=3    ;
  33:J P[3:Detec. p 2-1] 50% FINE ACC50    ;
  34:  WAIT    .50(sec) ;
  35:  VISION RUN_FIND 'VP1'    ;
  36:  VISION GET_OFFSET 'VP1' VR[1] JMP LBL[12000] ;
  37:  PR[51]=VR[1].FOUND_POS[1] ;
  38:  VISION OVERRIDE 'EXPO' R[102] ;
  39:  R[101:Infeed Type]=0    ;
  40:   ;
  41:  LBL[2100] ;
  42:  R[108:Num Finish]=4    ;
  43:J P[4:Detec. p 2-2] 50% FINE ACC50    ;
  44:  WAIT    .50(sec) ;
  45:  VISION RUN_FIND 'VP1'    ;
  46:  VISION GET_OFFSET 'VP1' VR[1] JMP LBL[12100] ;
  47:  PR[52]=VR[1].FOUND_POS[1] ;
  48:  VISION OVERRIDE 'EXPO' R[102] ;
  49:  R[101:Infeed Type]=0    ;
  50:  !---------------------- ;
  51:   ;
  52:  !Third point of vision detection ;
  53:  LBL[3000] ;
  54:  R[108:Num Finish]=5    ;
  55:J P[5:Detec. p 3-1] 50% FINE ACC50    ;
  56:  WAIT    .50(sec) ;
  57:  VISION RUN_FIND 'VP1'    ;
  58:  VISION GET_OFFSET 'VP1' VR[1] JMP LBL[13000] ;
  59:  PR[53]=VR[1].FOUND_POS[1] ;
  60:  VISION OVERRIDE 'EXPO' R[102] ;
  61:  R[101:Infeed Type]=0    ;
  62:   ;
  63:  LBL[3100] ;
  64:  R[108:Num Finish]=6    ;
  65:J P[6:Detec. p 3-2] 50% FINE ACC50    ;
  66:  WAIT    .50(sec) ;
  67:  VISION RUN_FIND 'VP1'    ;
  68:  VISION GET_OFFSET 'VP1' VR[1] JMP LBL[13100] ;
  69:  PR[54]=VR[1].FOUND_POS[1] ;
  70:  R[101:Infeed Type]=0    ;
  71:  !--------------------- ;
  72:   ;
  73:  !3D position calculation ;
  74:  LBL[4000] ;
  75:  CALL STVS1(49,50,92,55,91) ;
  76:  IF R[91]>0,JMP LBL[24000] ;
  77:  LBL[4100] ;
  78:  CALL STVS1(51,52,92,56,91) ;
  79:  IF R[91]>0,JMP LBL[24100] ;
  80:  LBL[4200] ;
  81:  CALL STVS1(53,54,92,57,91) ;
  82:  IF R[91]>0,JMP LBL[24200] ;
  83:  !-------------------------- ;
  84:   ;
  85:  !Compensation amount calculation ;
  86:  LBL[5000] ;
  87:  CALL MERGE3D2(55,56,57,0,58) ;
  88:  CALL OFS_RJ3(93,58,0,59,0,60,0,91) ;
  89:  IF R[91]<>0,JMP LBL[25000] ;
  90:  !------------------------------ ;
  91:   ;
  92:  UFRAME[6]=PR[60] ;
  93:  PR[60]=UFRAME[6] ;
  94:J PR[42] 100% FINE    ;
  95:  END ;
  96:   ;
  97:  !Vision detection retry ;
  98:  LBL[11000] ;
  99:  LBL[11100] ;
 100:  LBL[12000] ;
 101:  LBL[12100] ;
 102:  LBL[13000] ;
 103:  LBL[13100] ;
 104:   ;
 105:  R[101:Infeed Type]=R[101:Infeed Type]+1    ;
 106:   ;
 107:  IF R[101:Infeed Type]>100 AND R[108:Num Finish]=1,JMP LBL[21000] ;
 108:  IF R[101:Infeed Type]>100 AND R[108:Num Finish]=2,JMP LBL[21100] ;
 109:  IF R[101:Infeed Type]>100 AND R[108:Num Finish]=3,JMP LBL[22000] ;
 110:  IF R[101:Infeed Type]>100 AND R[108:Num Finish]=4,JMP LBL[22100] ;
 111:  IF R[101:Infeed Type]>100 AND R[108:Num Finish]=5,JMP LBL[23000] ;
 112:  IF R[101:Infeed Type]>100 AND R[108:Num Finish]=6,JMP LBL[23100] ;
 113:   ;
 114:  R[103:Post Process]=R[101:Infeed Type] MOD 2    ;
 115:  R[104:Machine No]=R[101:Infeed Type] DIV 2    ;
 116:  R[105:Num Machines]=R[103:Post Process]+R[104:Machine No]    ;
 117:   ;
 118:  IF R[103:Post Process]=0,JMP LBL[14000] ;
 119:  JMP LBL[14100] ;
 120:   ;
 121:  LBL[14000] ;
 122:  R[101:Infeed Type]=R[101:Infeed Type]*(-1)    ;
 123:   ;
 124:  LBL[14100] ;
 125:  R[106:Finish Type]=R[105:Num Machines]*1    ;
 126:  R[107:Num Infeed]=R[106:Finish Type]+R[102:Pre Process]    ;
 127:   ;
 128:  IF R[107:Num Infeed]>250,JMP LBL[14200] ;
 129:  IF R[107:Num Infeed]<.04,JMP LBL[14300] ;
 130:  JMP LBL[14400] ;
 131:   ;
 132:  LBL[14200] ;
 133:  R[107:Num Infeed]=250    ;
 134:  JMP LBL[14400] ;
 135:   ;
 136:  LBL[14300] ;
 137:  R[107:Num Infeed]=.04    ;
 138:   ;
 139:  LBL[14400] ;
 140:  VISION OVERRIDE 'EXPO' R[107] ;
 141:   ;
 142:  IF R[108:Num Finish]=1,JMP LBL[1000] ;
 143:  IF R[108:Num Finish]=2,JMP LBL[1100] ;
 144:  IF R[108:Num Finish]=3,JMP LBL[2000] ;
 145:  IF R[108:Num Finish]=4,JMP LBL[2100] ;
 146:  IF R[108:Num Finish]=5,JMP LBL[3000] ;
 147:  IF R[108:Num Finish]=6,JMP LBL[3100] ;
 148:  !---------------------- ;
 149:   ;
 150:  !Abnormal processing ;
 151:  LBL[21000] ;
 152:  UALM[9] ;
 153:  JMP LBL[1000] ;
 154:   ;
 155:  LBL[21100] ;
 156:  UALM[10] ;
 157:  JMP LBL[1100] ;
 158:   ;
 159:  LBL[22000] ;
 160:  UALM[11] ;
 161:  JMP LBL[1000] ;
 162:   ;
 163:  LBL[22100] ;
 164:  UALM[12] ;
 165:  JMP LBL[1100] ;
 166:   ;
 167:  LBL[23000] ;
 168:  UALM[13] ;
 169:  JMP LBL[1000] ;
 170:   ;
 171:  LBL[23100] ;
 172:  UALM[14] ;
 173:  JMP LBL[1100] ;
 174:   ;
 175:  LBL[24000] ;
 176:  UALM[15] ;
 177:  JMP LBL[1000] ;
 178:   ;
 179:  LBL[24100] ;
 180:  UALM[16] ;
 181:  JMP LBL[1100] ;
 182:   ;
 183:  LBL[24200] ;
 184:  UALM[17] ;
 185:  JMP LBL[1000] ;
 186:   ;
 187:  LBL[25000] ;
 188:  UALM[18] ;
 189:  JMP LBL[1100] ;
 190:  !----------------------------- ;
 191:   ;
/POS
P[1:"Detec. p 1-1 "]{
   GP1:
	UF : 0, UT : 5,	
	J1=     -.069 deg,	J2=    69.849 deg,	J3=  -109.261 deg,
	J4=    -3.180 deg,	J5=   -99.994 deg,	J6=      .025 deg
};
P[2:"Detec. p 1-2"]{
   GP1:
	UF : 0, UT : 5,	
	J1=     -.048 deg,	J2=    53.335 deg,	J3=   -80.349 deg,
	J4=    -3.201 deg,	J5=   -99.994 deg,	J6=      .025 deg
};
P[3:"Detec. p 2-1"]{
   GP1:
	UF : 0, UT : 5,	
	J1=     -.046 deg,	J2=    19.502 deg,	J3=     4.792 deg,
	J4=    -3.211 deg,	J5=   -99.994 deg,	J6=      .025 deg
};
P[4:"Detec. p 2-2"]{
   GP1:
	UF : 0, UT : 5,	
	J1=     -.046 deg,	J2=    10.941 deg,	J3=    11.461 deg,
	J4=    -3.211 deg,	J5=   -99.994 deg,	J6=      .025 deg
};
P[5:"Detec. p 3-1"]{
   GP1:
	UF : 0, UT : 5,	
	J1=     -.044 deg,	J2=   -40.177 deg,	J3=    51.572 deg,
	J4=     9.788 deg,	J5=   -99.994 deg,	J6=      .024 deg
};
P[6:"Detec. p 3-2"]{
   GP1:
	UF : 0, UT : 5,	
	J1=     -.045 deg,	J2=   -31.398 deg,	J3=    51.572 deg,
	J4=    21.069 deg,	J5=   -99.994 deg,	J6=      .024 deg
};
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: vision, 3-point, calibration, iRVision, offset, VR, VISION RUN_FIND, VISION GET_OFFSET, camera).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_Vision_3Point.txt`.
- Classification: examples / topic=vision.

