---
id: EG_JOB_C_DUALDRILL
title: "Main Job Program - Dual RoboDrill"
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

# Main Job Program - Dual RoboDrill

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_C_DualDrill.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  JOB_C2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 6403;
CREATE		= DATE 21-01-06  TIME 14:17:54;
MODIFIED	= DATE 21-01-06  TIME 14:17:54;
FILE_NAME	= JOB_C;
VERSION		= 0;
LINE_COUNT	= 270;
MEMORY_SIZE	= 7047;
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
   4:  !Door type:cylinder ;
   5:  !Number of robodrills:2 ;
   6:  !********************* ;
   7:   ;
   8:  !Various set and move to wait pos ;
   9:  UFRAME_NUM=0 ;
  10:  UTOOL_NUM=1 ;
  11:  PAYLOAD[1] ;
  12:   ;
  13:J PR[1:HOME POS] 10% FINE    ;
  14:J PR[2:WAIT POS] 100% FINE    ;
  15:  !--------------------- ;
  16:   ;
  17:  !Detect request from robodrill ;
  18:  LBL[100] ;
  19:  WAIT ((DI[1:SERVICE REQUEST]=ON OR DI[2:WORK INSTALL.REQ.]=ON OR DI[3:WORK REMOV. REQ.]=ON) OR (DI[257:SERVICE REQUEST]=ON OR DI[258:WORK INSTALL.REQ.]=ON OR DI[259:WORK REMOV. REQ.]=ON))    ;
  20:  !--------------------- ;
  21:   ;
  22:  !Determine the drill to load work ;
  23:  IF DI[1:SERVICE REQUEST]=ON OR DI[2:WORK INSTALL.REQ.]=ON OR DI[3:WORK REMOV. REQ.]=ON,JMP LBL[1000] ;
  24:  IF DI[257:SERVICE REQUEST]=ON OR DI[258:WORK INSTALL.REQ.]=ON OR DI[259:WORK REMOV. REQ.]=ON,JMP LBL[2000] ;
  25:  JMP LBL[9000] ;
  26:  !--------------------- ;
  27:   ;
  28:  !Exchange the work to drill1 ;
  29:  LBL[1000] ;
  30:  !Judge the stop and start request ;
  31:  IF ((DI[5:CYCLE STOP REQ.]=ON OR (R[29:setting position]=0 AND R[1:pick counter L]>=R[7:all work num L]) OR (R[29:setting position]=1 AND R[3:pick counter R]>=R[13:all work num R])) AND DI[2:WORK INSTALL.REQ.]=OFF),
    :  R[17:end flag]=(1) ;
  32:  IF (DI[6:SYSTEM STOP REQ.]=ON AND DI[2:WORK INSTALL.REQ.]=OFF),R[17:end flag]=(3) ;
  33:  IF (DI[2:WORK INSTALL.REQ.]=ON),R[18:start flag]=(1) ;
  34:  !--------------------- ;
  35:   ;
  36:  !Check the door opening ;
  37:  !and the work exchange position ;
  38:  WAIT DI[8:SIDE GATE OPEN]=ON TIMEOUT,LBL[21000] ;
  39:  WAIT DI[9:WORK L/UL POS]=ON TIMEOUT,LBL[21010] ;
  40:  !--------------------- ;
  41:   ;
  42:  !Start signal processing ;
  43:  CALL SIGNAL_INT    ;
  44:  !--------------------- ;
  45:   ;
  46:  !Remove the machined work, ;
  47:  !skip when the system start ;
  48:  IF R[18:start flag]>0,JMP LBL[1100] ;
  49:  IF R[29:setting position]=0,CALL OUTPUT_S_M_L ;
  50:  IF R[29:setting position]=1,CALL OUTPUT_S_M_R ;
  51:  !--------------------- ;
  52:   ;
  53:  !Mounting of unmachined work, ;
  54:  !skip when the system stop ;
  55:  LBL[1100] ;
  56:  IF R[17:end flag]>0,JMP LBL[1200] ;
  57:  IF R[29:setting position]=0,CALL PICKSET_S_M_L ;
  58:  IF R[29:setting position]=1,CALL PICKSET_S_M_R ;
  59:  !--------------------- ;
  60:   ;
  61:  LBL[1200] ;
  62:  !Signal processing at completion ;
  63:  CALL SIGNAL_END    ;
  64:  R[18:start flag]=0    ;
  65:  !--------------------- ;
  66:   ;
  67:  !Check the door closing ;
  68:  IF R[17:end flag]>0,JMP LBL[1300] ;
  69:  WAIT DI[8:SIDE GATE OPEN]=OFF TIMEOUT,LBL[21200] ;
  70:  !--------------------- ;
  71:   ;
  72:  !End mode transition determine ;
  73:  LBL[1300] ;
  74:  IF (R[17:end flag]>0 OR (R[29:setting position]=0 AND R[2:put counter L]>=R[7:all work num L]) OR (R[4:put counter R]>=R[13:all work num R])),JMP LBL[3000] ;
  75:  !--------------------- ;
  76:   ;
  77:  !Back to the top ;
  78:  JMP LBL[100] ;
  79:  !--------------------- ;
  80:   ;
  81:  !Exchange the work to drill2 ;
  82:  LBL[2000] ;
  83:  !Judge the stop and start request ;
  84:  IF ((DI[261:CYCLE STOP REQ.]=ON OR (R[29:setting position]=0 AND R[3:pick counter R]>=R[13:all work num R]) OR (R[29:setting position]=1 AND R[1:pick counter L]>=R[7:all work num L])) AND DI[258:WORK INSTALL.REQ.]=OFF),
    :  R[17:end flag]=(2) ;
  85:  IF (DI[262:SYSTEM STOP REQ.]=ON AND DI[258:WORK INSTALL.REQ.]=OFF),R[17:end flag]=(4) ;
  86:  IF (DI[258:WORK INSTALL.REQ.]=ON),R[18:start flag]=(1) ;
  87:  !--------------------- ;
  88:   ;
  89:  !Check the door opening ;
  90:  !and the work exchange position ;
  91:  WAIT DI[264:SIDE GATE OPEN]=ON TIMEOUT,LBL[22000] ;
  92:  WAIT DI[265:WORK L/UL POS]=ON TIMEOUT,LBL[22010] ;
  93:  !--------------------- ;
  94:   ;
  95:  !Start signal processing ;
  96:  CALL SIGNAL_INT2    ;
  97:  !--------------------- ;
  98:   ;
  99:  !Remove the machined work, ;
 100:  !skip when the system start ;
 101:  IF R[18:start flag]>0,JMP LBL[2100] ;
 102:  IF R[29:setting position]=0,CALL OUTPUT_S_M_R ;
 103:  IF R[29:setting position]=1,CALL OUTPUT_S_M_L ;
 104:  !--------------------- ;
 105:   ;
 106:  !Mounting of unmachined work, ;
 107:  !skip when the system stop ;
 108:  LBL[2100] ;
 109:  IF R[17:end flag]>0,JMP LBL[2200] ;
 110:  IF R[29:setting position]=0,CALL PICKSET_S_M_R ;
 111:  IF R[29:setting position]=1,CALL PICKSET_S_M_L ;
 112:  !--------------------- ;
 113:   ;
 114:  LBL[2200] ;
 115:  !Signal processing at completion ;
 116:  CALL SIGNAL_END2    ;
 117:  R[18:start flag]=0    ;
 118:  !--------------------- ;
 119:   ;
 120:  !Check the door closing ;
 121:  IF R[17:end flag]>0,JMP LBL[2300] ;
 122:  WAIT DI[264:SIDE GATE OPEN]=OFF TIMEOUT,LBL[22200] ;
 123:  !--------------------- ;
 124:   ;
 125:  !End mode transition determine ;
 126:  LBL[2300] ;
 127:  IF (R[17:end flag]>0 OR (R[29:setting position]=0 AND R[4:put counter R]>=R[13:all work num R]) OR (R[29:setting position]=1 AND R[2:put counter L]>=R[7:all work num L])),JMP LBL[3000] ;
 128:  !--------------------- ;
 129:   ;
 130:  !Back to the top ;
 131:  JMP LBL[100] ;
 132:  !--------------------- ;
 133:   ;
 134:  !End mode ;
 135:  LBL[3000:ROBOT STOP   ] ;
 136:  !Decide processing according to ;
 137:  !the value of the end flag ;
 138:  IF R[17:end flag]=3,JMP LBL[3300] ;
 139:  IF R[17:end flag]=4,JMP LBL[3400] ;
 140:  IF R[17:end flag]=1,JMP LBL[3100] ;
 141:  IF R[17:end flag]=2,JMP LBL[3200] ;
 142:  JMP LBL[9000] ;
 143:  !--------------------- ;
 144:   ;
 145:  LBL[3100] ;
 146:  !Cycle stop request or ;
 147:  !0 unmachined work at robodrill1 ;
 148:  !Send cycle stop req from robot ;
 149:  IF DI[5:CYCLE STOP REQ.]=ON,JMP LBL[3150] ;
 150:  DO[15:Cycle Stop Req.]=PULSE,0.2sec ;
 151:  WAIT DI[5:CYCLE STOP REQ.]=ON    ;
 152:  LBL[3150] ;
 153:  DO[3:CYCLE STOP OK]=PULSE,0.3sec ;
 154:  WAIT (DI[1:SERVICE REQUEST]=OFF AND DI[5:CYCLE STOP REQ.]=OFF)    ;
 155:  !--------------------- ;
 156:   ;
 157:  !Reset the end flag ;
 158:  R[17:end flag]=0    ;
 159:  !--------------------- ;
 160:   ;
 161:  !If unmachined work remains, ;
 162:  !start cueing ;
 163:  IF ((R[29:setting position]=0 AND R[1:pick counter L]<R[7:all work num L]) OR (R[29:setting position]=1 AND R[3:pick counter R]<R[13:all work num R])),JMP LBL[100] ;
 164:  !--------------------- ;
 165:   ;
 166:  !There is no unmachined work ;
 167:  !and robodrill2 is stopped ;
 168:  !Reset count and go to LBL[9000] ;
 169:  IF (R[29:setting position]=0) THEN ;
 170:  R[1:pick counter L]=0    ;
 171:  R[2:put counter L]=0    ;
 172:  ENDIF ;
 173:   ;
 174:  IF (R[29:setting position]=1) THEN ;
 175:  R[3:pick counter R]=0    ;
 176:  R[4:put counter R]=0    ;
 177:  ENDIF ;
 178:   ;
 179:  IF DI[268:ROBODRILL System Running]=OFF,JMP LBL[9000] ;
 180:  JMP LBL[100] ;
 181:  !--------------------- ;
 182:   ;
 183:  LBL[3200] ;
 184:  !Cycle stop request or ;
 185:  !0 unmachined work at robodrill2 ;
 186:  !Send cycle stop req from robot ;
 187:  IF DI[261:CYCLE STOP REQ.]=ON,JMP LBL[3250] ;
 188:  DO[271:Cycle Stop Req.]=PULSE,0.2sec ;
 189:  WAIT DI[261:CYCLE STOP REQ.]=ON    ;
 190:  LBL[3250] ;
 191:  DO[259:CYCLE STOP OK]=PULSE,0.3sec ;
 192:  WAIT (DI[257:SERVICE REQUEST]=OFF AND DI[261:CYCLE STOP REQ.]=OFF)    ;
 193:  !--------------------- ;
 194:   ;
 195:  !Reset the end flag ;
 196:  R[17:end flag]=0    ;
 197:  !--------------------- ;
 198:   ;
 199:  !If unmachined work remains, ;
 200:  !start cueing ;
 201:  IF ((R[29:setting position]=0 AND R[3:pick counter R]<R[13:all work num R]) OR (R[29:setting position]=1 AND R[1:pick counter L]<R[7:all work num L])),JMP LBL[100] ;
 202:  !--------------------- ;
 203:   ;
 204:  !There is no unmachined work ;
 205:  !and robodrill1 is stopped ;
 206:  !Reset count and go to LBL[9000] ;
 207:  IF (R[29:setting position]=0) THEN ;
 208:  R[3:pick counter R]=0    ;
 209:  R[4:put counter R]=0    ;
 210:  ENDIF ;
 211:   ;
 212:  IF (R[29:setting position]=1) THEN ;
 213:  R[1:pick counter L]=0    ;
 214:  R[2:put counter L]=0    ;
 215:  ENDIF ;
 216:   ;
 217:  IF DI[12:ROBODRILL System Running]=OFF,JMP LBL[9000] ;
 218:  JMP LBL[100] ;
 219:  !--------------------- ;
 220:   ;
 221:  !System stop processing of drill1 ;
 222:  LBL[3300] ;
 223:  DO[4:SYSTEM STOP OK]=PULSE,0.3sec ;
 224:  WAIT DI[6:SYSTEM STOP REQ.]=OFF    ;
 225:  R[17:end flag]=0    ;
 226:  IF DI[268:ROBODRILL System Running]=ON,JMP LBL[100] ;
 227:  JMP LBL[9000] ;
 228:  !--------------------- ;
 229:   ;
 230:  !System stop processing of drill2 ;
 231:  LBL[3400] ;
 232:  DO[260:SYSTEM STOP OK]=PULSE,0.3sec ;
 233:  WAIT DI[262:SYSTEM STOP REQ.]=OFF    ;
 234:  R[17:end flag]=0    ;
 235:  IF DI[12:ROBODRILL System Running]=ON,JMP LBL[100] ;
 236:  JMP LBL[9000] ;
 237:  !--------------------- ;
 238:   ;
 239:  !Move to home pos and end program ;
 240:  LBL[9000] ;
 241:J PR[1:HOME POS] 100% FINE    ;
 242:  END ;
 243:  !--------------------- ;
 244:   ;
 245:  !Abnormal processing ;
 246:  LBL[21000] ;
 247:  UALM[1] ;
 248:  JMP LBL[1000] ;
 249:   ;
 250:  LBL[21010] ;
 251:  UALM[9] ;
 252:  JMP LBL[1000] ;
 253:   ;
 254:  LBL[21200] ;
 255:  UALM[2] ;
 256:  JMP LBL[1200] ;
 257:   ;
 258:  LBL[22000] ;
 259:  UALM[1] ;
 260:  JMP LBL[2000] ;
 261:   ;
 262:  LBL[22010] ;
 263:  UALM[9] ;
 264:  JMP LBL[2000] ;
 265:   ;
 266:  LBL[22200] ;
 267:  UALM[2] ;
 268:  JMP LBL[2200] ;
 269:  !--------------------- ;
 270:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: JOB, main program, dual machine, two CNC, RoboDrill, machine tending, dual drill).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_C_DualDrill.txt`.
- Classification: examples / topic=anti_pattern.

