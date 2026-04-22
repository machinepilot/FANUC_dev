---
id: EG_JOB_D_DUALDRILL_DUALHAND
title: "Main Job Program - Dual RoboDrill, Dual Hand"
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

# Main Job Program - Dual RoboDrill, Dual Hand

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_D_DualDrill_DualHand.txt` as part of the TeachPendant migration. Original source: TWA (The Way Automation) Standard Programs. Review and update `related:` with neighbor entry IDs.

## Body


/PROG  JOB_D2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 7067;
CREATE		= DATE 21-01-06  TIME 14:17:58;
MODIFIED	= DATE 21-01-06  TIME 14:17:58;
FILE_NAME	= JOB_D;
VERSION		= 0;
LINE_COUNT	= 297;
MEMORY_SIZE	= 7747;
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
   3:  !Hand type:dual hand ;
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
  18:  !Normally a notice of M30/M02 ;
  19:  !is the triggers ;
  20:  LBL[100] ;
  21:  WAIT ((DI[1:SERVICE REQUEST]=ON OR DI[2:WORK INSTALL.REQ.]=ON OR DI[3:WORK REMOV. REQ.]=ON OR DI[4:NOTICE OF M30/M02]=ON) OR (DI[257:SERVICE REQUEST]=ON OR DI[258:WORK INSTALL.REQ.]=ON OR 
    :  DI[259:WORK REMOV. REQ.]=ON OR DI[260:NOTICE OF M30/M02]=ON))    ;
  22:  !--------------------- ;
  23:   ;
  24:  !Determine the drill to load work ;
  25:  IF DI[1:SERVICE REQUEST]=ON OR DI[2:WORK INSTALL.REQ.]=ON OR DI[3:WORK REMOV. REQ.]=ON OR DI[4:NOTICE OF M30/M02]=ON,JMP LBL[1000] ;
  26:  IF DI[257:SERVICE REQUEST]=ON OR DI[258:WORK INSTALL.REQ.]=ON OR DI[259:WORK REMOV. REQ.]=ON OR DI[260:NOTICE OF M30/M02]=ON,JMP LBL[2000] ;
  27:  JMP LBL[9000] ;
  28:  !--------------------- ;
  29:   ;
  30:  !Exchange the work to drill1 ;
  31:  LBL[1000] ;
  32:  !Judge the stop and start request ;
  33:  IF ((DI[5:CYCLE STOP REQ.]=ON OR (R[29:setting position]=0 AND R[1:pick counter L]>=R[7:all work num L]) OR (R[29:setting position]=1 AND R[3:pick counter R]>=R[13:all work num R])) AND DI[2:WORK INSTALL.REQ.]=OFF),
    :  R[17:end flag]=(1) ;
  34:  IF (DI[6:SYSTEM STOP REQ.]=ON AND DI[2:WORK INSTALL.REQ.]=OFF),R[17:end flag]=(3) ;
  35:  IF (DI[2:WORK INSTALL.REQ.]=ON),R[18:start flag]=(1) ;
  36:  !--------------------- ;
  37:   ;
  38:  !Pick an unmachined work ;
  39:  !Skip when finished ;
  40:  IF R[17:end flag]>0,JMP LBL[1100] ;
  41:  IF R[29:setting position]=0,CALL PICK_D_M_L ;
  42:  IF R[29:setting position]=1,CALL PICK_D_M_R ;
  43:  !--------------------- ;
  44:   ;
  45:  LBL[1100] ;
  46:  !Wait until M60 execution ;
  47:  WAIT DI[1:SERVICE REQUEST]=ON OR DI[2:WORK INSTALL.REQ.]=ON OR DI[3:WORK REMOV. REQ.]=ON    ;
  48:  !--------------------- ;
  49:   ;
  50:  !Check the door opening ;
  51:  !and the work exchange position ;
  52:  WAIT DI[8:SIDE GATE OPEN]=ON TIMEOUT,LBL[21100] ;
  53:  WAIT DI[9:WORK L/UL POS]=ON TIMEOUT,LBL[21110] ;
  54:  !--------------------- ;
  55:   ;
  56:  !Start signal processing ;
  57:  CALL SIGNAL_INT    ;
  58:  !--------------------- ;
  59:   ;
  60:  !Remove machined work ;
  61:  !and mount unmachined work ;
  62:  IF R[29:setting position]=0,CALL OUTSET_D_L ;
  63:  IF R[29:setting position]=1,CALL OUTSET_D_R ;
  64:  !--------------------- ;
  65:   ;
  66:  LBL[1200] ;
  67:  !Signal processing at completion ;
  68:  CALL SIGNAL_END    ;
  69:  !--------------------- ;
  70:   ;
  71:  !Check the door closing ;
  72:  IF R[17:end flag]>0,JMP LBL[1300] ;
  73:  WAIT DI[8:SIDE GATE OPEN]=OFF TIMEOUT,LBL[21200] ;
  74:  !--------------------- ;
  75:   ;
  76:  !Processing of workpiece ;
  77:  !placement operation ;
  78:  !Skip when starting ;
  79:  LBL[1300] ;
  80:  IF R[18:start flag]>0,JMP LBL[1400] ;
  81:  IF R[29:setting position]=0,CALL PUT_D_M_L ;
  82:  IF R[29:setting position]=1,CALL PUT_D_M_R ;
  83:  !--------------------- ;
  84:   ;
  85:  LBL[1400] ;
  86:  R[18:start flag]=0    ;
  87:  !End mode transition determine ;
  88:  IF (R[17:end flag]>0 OR (R[29:setting position]=0 AND R[2:put counter L]>=R[7:all work num L]) OR (R[29:setting position]=1 AND R[4:put counter R]>=R[13:all work num R])),JMP LBL[3000] ;
  89:  !--------------------- ;
  90:   ;
  91:  !Back to the top ;
  92:  JMP LBL[100] ;
  93:  !--------------------- ;
  94:   ;
  95:  !Exchange the work to drill2 ;
  96:  LBL[2000] ;
  97:  !Judge the stop and start request ;
  98:  IF ((DI[261:CYCLE STOP REQ.]=ON OR (R[29:setting position]=0 AND R[3:pick counter R]>=R[13:all work num R]) OR (R[29:setting position]=1 AND R[1:pick counter L]>=R[7:all work num L])) AND DI[258:WORK INSTALL.REQ.]=OFF),
    :  R[17:end flag]=(2) ;
  99:  IF (DI[262:SYSTEM STOP REQ.]=ON AND DI[258:WORK INSTALL.REQ.]=OFF),R[17:end flag]=(4) ;
 100:  IF (DI[258:WORK INSTALL.REQ.]=ON),R[18:start flag]=(1) ;
 101:  !--------------------- ;
 102:   ;
 103:  !Pick an unmachined work ;
 104:  !Skip when finished ;
 105:  IF R[17:end flag]>0,JMP LBL[2100] ;
 106:  IF R[29:setting position]=0,CALL PICK_D_M_R ;
 107:  IF R[29:setting position]=1,CALL PICK_D_M_L ;
 108:  !--------------------- ;
 109:   ;
 110:  LBL[2100] ;
 111:  !Wait until M60 execution ;
 112:  WAIT DI[257:SERVICE REQUEST]=ON OR DI[258:WORK INSTALL.REQ.]=ON OR DI[259:WORK REMOV. REQ.]=ON    ;
 113:  !--------------------- ;
 114:   ;
 115:  !Check the door opening ;
 116:  !and the work exchange position ;
 117:  WAIT DI[264:SIDE GATE OPEN]=ON TIMEOUT,LBL[22100] ;
 118:  WAIT DI[265:WORK L/UL POS]=ON TIMEOUT,LBL[22110] ;
 119:  !--------------------- ;
 120:   ;
 121:  !Start signal processing ;
 122:  CALL SIGNAL_INT2    ;
 123:  !--------------------- ;
 124:   ;
 125:  !Remove machined work ;
 126:  !and mount unmachined work ;
 127:  IF R[29:setting position]=0,CALL OUTSET_D_R ;
 128:  IF R[29:setting position]=1,CALL OUTSET_D_L ;
 129:  !--------------------- ;
 130:   ;
 131:  LBL[2200] ;
 132:  !Signal processing at completion ;
 133:  CALL SIGNAL_END2    ;
 134:  !--------------------- ;
 135:   ;
 136:  !Check the door closing ;
 137:  IF R[17:end flag]>0,JMP LBL[2300] ;
 138:  WAIT DI[264:SIDE GATE OPEN]=OFF TIMEOUT,LBL[22200] ;
 139:  !--------------------- ;
 140:   ;
 141:  !Processing of workpiece ;
 142:  !placement operation ;
 143:  !Skip when starting ;
 144:  LBL[2300] ;
 145:  IF R[18:start flag]>0,JMP LBL[2400] ;
 146:  IF R[29:setting position]=0,CALL PUT_D_M_R ;
 147:  IF R[29:setting position]=1,CALL PUT_D_M_L ;
 148:  !--------------------- ;
 149:   ;
 150:  LBL[2400] ;
 151:  R[18:start flag]=0    ;
 152:  !End mode transition determine ;
 153:  IF (R[17:end flag]>0 OR (R[29:setting position]=0 AND R[4:put counter R]>=R[13:all work num R]) OR (R[29:setting position]=1 AND R[2:put counter L]>=R[7:all work num L])),JMP LBL[3000] ;
 154:  !--------------------- ;
 155:   ;
 156:  !Back to the top ;
 157:  JMP LBL[100] ;
 158:  !--------------------- ;
 159:   ;
 160:  !End mode ;
 161:  LBL[3000:ROBOT STOP   ] ;
 162:  !Decide processing according to ;
 163:  !the value of the end flag ;
 164:  IF R[17:end flag]=3,JMP LBL[3300] ;
 165:  IF R[17:end flag]=4,JMP LBL[3400] ;
 166:  IF R[17:end flag]=1,JMP LBL[3100] ;
 167:  IF R[17:end flag]=2,JMP LBL[3200] ;
 168:  JMP LBL[9000] ;
 169:  !--------------------- ;
 170:   ;
 171:  LBL[3100] ;
 172:  !Cycle stop request or ;
 173:  !0 unprocessed work at robodrill1 ;
 174:  !Send cycle req from robot ;
 175:  IF DI[5:CYCLE STOP REQ.]=ON,JMP LBL[3150] ;
 176:  DO[15:Cycle Stop Req.]=PULSE,0.2sec ;
 177:  WAIT DI[5:CYCLE STOP REQ.]=ON    ;
 178:  LBL[3150] ;
 179:  DO[3:CYCLE STOP OK]=PULSE,0.3sec ;
 180:  WAIT (DI[1:SERVICE REQUEST]=OFF AND DI[5:CYCLE STOP REQ.]=OFF)    ;
 181:  !--------------------- ;
 182:   ;
 183:  !Reset the end flag ;
 184:  R[17:end flag]=0    ;
 185:  !--------------------- ;
 186:   ;
 187:  !If unprocessed work remains, ;
 188:  !start cueing ;
 189:  IF ((R[29:setting position]=0 AND R[1:pick counter L]<R[7:all work num L]) OR (R[29:setting position]=1 AND R[3:pick counter R]<R[13:all work num R])),JMP LBL[100] ;
 190:  !--------------------- ;
 191:   ;
 192:  !There is no unmachined work ;
 193:  !and robodrill2 is stopped ;
 194:  !Reset count and go to LBL[9000] ;
 195:  IF (R[29:setting position]=0) THEN ;
 196:  R[1:pick counter L]=0    ;
 197:  R[2:put counter L]=0    ;
 198:  ENDIF ;
 199:   ;
 200:  IF (R[29:setting position]=1) THEN ;
 201:  R[3:pick counter R]=0    ;
 202:  R[4:put counter R]=0    ;
 203:  ENDIF ;
 204:   ;
 205:  IF DI[268:ROBODRILL System Running]=OFF,JMP LBL[9000] ;
 206:  JMP LBL[100] ;
 207:  !--------------------- ;
 208:   ;
 209:  LBL[3200] ;
 210:  !Cycle stop request or ;
 211:  !0 unprocessed work at robodrill2 ;
 212:  !Send cycle stop req from robot ;
 213:  IF DI[261:CYCLE STOP REQ.]=ON,JMP LBL[3250] ;
 214:  DO[271:Cycle Stop Req.]=PULSE,0.2sec ;
 215:  WAIT DI[261:CYCLE STOP REQ.]=ON    ;
 216:  LBL[3250] ;
 217:  DO[259:CYCLE STOP OK]=PULSE,0.3sec ;
 218:  WAIT (DI[257:SERVICE REQUEST]=OFF AND DI[261:CYCLE STOP REQ.]=OFF)    ;
 219:  !--------------------- ;
 220:   ;
 221:  !Reset the end flag ;
 222:  R[17:end flag]=0    ;
 223:  !--------------------- ;
 224:   ;
 225:  !If unprocessed work remains, ;
 226:  !start cueing ;
 227:  IF ((R[29:setting position]=0 AND R[3:pick counter R]<R[13:all work num R]) OR (R[29:setting position]=1 AND R[1:pick counter L]<R[7:all work num L])),JMP LBL[100] ;
 228:  !--------------------- ;
 229:   ;
 230:  !There is no unmachined work ;
 231:  !and robodrill1 is stopped ;
 232:  !Reset count and go to LBL[9000] ;
 233:  IF (R[29:setting position]=0) THEN ;
 234:  R[3:pick counter R]=0    ;
 235:  R[4:put counter R]=0    ;
 236:  ENDIF ;
 237:   ;
 238:  IF (R[29:setting position]=1) THEN ;
 239:  R[1:pick counter L]=0    ;
 240:  R[2:put counter L]=0    ;
 241:  ENDIF ;
 242:   ;
 243:  IF DI[12:ROBODRILL System Running]=OFF,JMP LBL[9000] ;
 244:  JMP LBL[100] ;
 245:  !--------------------- ;
 246:   ;
 247:  !System stop processing of drill1 ;
 248:  LBL[3300] ;
 249:  DO[4:SYSTEM STOP OK]=PULSE,0.3sec ;
 250:  WAIT DI[6:SYSTEM STOP REQ.]=OFF    ;
 251:  R[17:end flag]=0    ;
 252:  IF DI[268:ROBODRILL System Running]=ON,JMP LBL[100] ;
 253:  JMP LBL[9000] ;
 254:  !--------------------- ;
 255:   ;
 256:  !System stop processing of drill2 ;
 257:  LBL[3400] ;
 258:  DO[260:SYSTEM STOP OK]=PULSE,0.3sec ;
 259:  WAIT DI[262:SYSTEM STOP REQ.]=OFF    ;
 260:  R[17:end flag]=0    ;
 261:  IF DI[12:ROBODRILL System Running]=ON,JMP LBL[100] ;
 262:  JMP LBL[9000] ;
 263:  !--------------------- ;
 264:   ;
 265:  !Move to home pos and end program ;
 266:  LBL[9000] ;
 267:J PR[1:HOME POS] 100% FINE    ;
 268:  END ;
 269:  !--------------------- ;
 270:   ;
 271:  !Abnormal processing ;
 272:  LBL[21100] ;
 273:  UALM[1] ;
 274:  JMP LBL[1100] ;
 275:   ;
 276:  LBL[21110] ;
 277:  UALM[9] ;
 278:  JMP LBL[1100] ;
 279:   ;
 280:  LBL[21200] ;
 281:  UALM[2] ;
 282:  JMP LBL[1200] ;
 283:   ;
 284:  LBL[22100] ;
 285:  UALM[1] ;
 286:  JMP LBL[2100] ;
 287:   ;
 288:  LBL[22110] ;
 289:  UALM[9] ;
 290:  JMP LBL[2100] ;
 291:   ;
 292:  LBL[22200] ;
 293:  UALM[2] ;
 294:  JMP LBL[2200] ;
 295:   ;
 296:  !--------------------- ;
 297:   ;
/POS
/END


## Citations

- Primary: TWA (The Way Automation) Standard Programs (keywords: JOB, main program, dual machine, dual hand, two CNC, RoboDrill, complex tending, left right setting).
- Applicability: R-30iB Plus, CNC Machine Tending, RoboDrill.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/EG_JOB_D_DualDrill_DualHand.txt`.
- Classification: examples / topic=anti_pattern.

