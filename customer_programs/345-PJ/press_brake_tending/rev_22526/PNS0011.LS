/PROG  PNS0011
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5354185_2bend ";
PROG_SIZE	= 9523;
CREATE		= DATE 25-10-02  TIME 15:46:00;
MODIFIED	= DATE 26-02-18  TIME 14:26:40;
FILE_NAME	= P_535302;
VERSION		= 0;
LINE_COUNT	= 453;
MEMORY_SIZE	= 10111;
PROTECT		= READ_WRITE;
STORAGE		= SHADOW;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
LOCAL_REGISTERS	= 0,0,0;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;

LINE_TRACK;
  LINE_TRACK_SCHEDULE_NUMBER      : 0;
  LINE_TRACK_BOUNDARY_NUMBER      : 0;
  CONTINUE_TRACK_AT_PROG_END      : TRUE;

/MN
   1:  !PART #: 5354185 ;
   2:  !FRONT PANEL ;
   3:  UTOOL_NUM=1 ;
   4:  UFRAME_NUM=1 ;
   5:  OVERRIDE=R[50:Speed Override] ;
   6:  !User Frame 1 = Infeed ;
   7:  !User Frame 2 = Press 1 ;
   8:  !User Frame 3 = Zero Table ;
   9:  !User Frame 4 = Press 2 ;
  10:  !User Frame 5 = Regrip ;
  11:  !User Frame 6 = Outfeed ;
  12:  !User Frame 7 = Tool Rack ;
  13:   ;
  14:  !Part Program Parameters ;
  15:  R[4:Pallet Limit]=6    ;
  16:  R[7:Part Width]=2216    ;
  17:  R[8:Num of Pallets]=1    ;
  18:  R[9]=0    ;
  19:  R[11:Part Offset Pal]=76    ;
  20:  R[12:Part Offset 2]=228    ;
  21:  R[13:Tool Required]=1    ;
  22:  F[1:First Part]=(ON) ;
  23:   ;
  24:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
  25:   ;
  26:  !Verify Tool and Regrip are Corrt ;
  27:  IF R[5:Current Tool]=R[13:Tool Required],JMP LBL[6] ;
  28:   ;
  29:  CALL CHANGE_TOOLS    ;
  30:   ;
  31:  LBL[6] ;
  32:   ;
  33:  UFRAME_NUM=1 ;
  34:  UTOOL_NUM=R[13:Tool Required] ;
  35:   ;
  36:  PAYLOAD[R[13]] ;
  37:   ;
  38:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
  39:   ;
  40:  UFRAME_NUM=1 ;
  41:   ;
  42:  JMP LBL[999] ;
  43:   ;
  44:  !Measure Part Sequence ;
  45:J P[1:Approach/Exit] 50% FINE    ;
  46:   ;
  47:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
  48:L P[2:On Part] 700mm/sec FINE SkipJump,LBL[3]    ;
  49:   ;
  50:  !Recovery if no parts found ;
  51:L P[1:Approach/Exit] 700mm/sec FINE    ;
  52:   ;
  53:  CALL GO_HOME    ;
  54:   ;
  55:  UALM[1] ;
  56:   ;
  57:  ABORT ;
  58:  !End Recovery ;
  59:   ;
  60:  LBL[3] ;
  61:   ;
  62:  WAIT    .25(sec) ;
  63:   ;
  64:  PR[10:Measured Position]=LPOS    ;
  65:   ;
  66:  WAIT    .25(sec) ;
  67:   ;
  68:J PR[10:Measured Position] 50% FINE Offset,PR[51:LINEAR RAIL OFFSET]    ;
  69:   ;
  70:  WAIT    .25(sec) ;
  71:   ;
  72:  PR[10:Measured Position]=LPOS    ;
  73:   ;
  74:  WAIT    .25(sec) ;
  75:   ;
  76:  SKIP CONDITION RI[1:PART PRESENT]=OFF    ;
  77:L PR[10:Measured Position] 680mm/sec FINE Offset,PR[53:Y_OFFSET] SkipJump,LBL[4]    ;
  78:   ;
  79:  !Recovery if part end is not foud ;
  80:  PR[10:Measured Position]=LPOS    ;
  81:   ;
  82:  WAIT    .25(sec) ;
  83:   ;
  84:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
  85:   ;
  86:  CALL GO_HOME    ;
  87:   ;
  88:  UALM[2] ;
  89:   ;
  90:  ABORT ;
  91:  !End Recovery ;
  92:   ;
  93:  LBL[4] ;
  94:   ;
  95:  JMP LBL[5] ;
  96:  !Zero point for part width  ;
  97:L P[40:Zero Point] 700mm/sec FINE    ;
  98:  LBL[5] ;
  99:   ;
 100:  PR[5:Zero Point]=P[40:Zero Point]    ;
 101:   ;
 102:  PR[10:Measured Position]=LPOS    ;
 103:   ;
 104:  WAIT    .25(sec) ;
 105:   ;
 106:  R[6:Measured Width]=PR[5,2:Zero Point]-PR[10,2:Measured Position]    ;
 107:   ;
 108:  SELECT R[5:Current Tool]=1,JMP LBL[7] ;
 109:         =2,JMP LBL[8] ;
 110:   ;
 111:  LBL[7] ;
 112:   ;
 113:  R[6:Measured Width]=R[6:Measured Width]+R[14:Tool 1 Prox Off]    ;
 114:   ;
 115:  JMP LBL[9] ;
 116:   ;
 117:  LBL[8] ;
 118:   ;
 119:  R[6:Measured Width]=R[6:Measured Width]+R[15:Tool 2 Prox Off]    ;
 120:   ;
 121:  LBL[9] ;
 122:   ;
 123:  WAIT    .25(sec) ;
 124:   ;
 125:  R[6:Measured Width]=R[6:Measured Width] DIV 1    ;
 126:   ;
 127:  R[16:Difference]=R[6:Measured Width]-R[7:Part Width]    ;
 128:   ;
 129:  R[16:Difference]=R[16:Difference] DIV 1    ;
 130:   ;
 131:  IF (R[16:Difference]>=(-100) AND R[16:Difference]<=100) THEN ;
 132:   ;
 133:  PR[10:Measured Position]=LPOS    ;
 134:   ;
 135:  WAIT    .25(sec) ;
 136:   ;
 137:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 138:   ;
 139:  CALL GO_HOME    ;
 140:   ;
 141:  UALM[3] ;
 142:   ;
 143:  ABORT ;
 144:  ELSE ;
 145:  PR[10:Measured Position]=LPOS    ;
 146:   ;
 147:  WAIT    .25(sec) ;
 148:   ;
 149:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 150:  ENDIF ;
 151:   ;
 152:  LBL[999] ;
 153:   ;
 154:  !Top of Main Program Loop ;
 155:  LBL[2:Loop Program] ;
 156:   ;
 157:  CALL START_PART    ;
 158:   ;
 159:  IF (F[1:First Part]=ON),JMP LBL[99] ;
 160:   ;
 161:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
 162:   ;
 163:  LBL[99] ;
 164:   ;
 165:  !Begin Infeed Pick ;
 166:  UFRAME_NUM=1 ;
 167:   ;
 168:J P[1:Approach/Exit] 50% FINE    ;
 169:   ;
 170:L P[24:above infeed pick] 1500mm/sec FINE    ;
 171:   ;
 172:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 173:L P[2:On Part] 100mm/sec FINE SkipJump,LBL[1]    ;
 174:   ;
 175:  !Recovery if no parts found ;
 176:L P[1:Approach/Exit] 700mm/sec FINE    ;
 177:   ;
 178:  CALL GO_HOME    ;
 179:   ;
 180:  UALM[1] ;
 181:   ;
 182:  ABORT ;
 183:  !End Recovery ;
 184:   ;
 185:  LBL[1] ;
 186:   ;
 187:  PR[10:Measured Position]=LPOS    ;
 188:   ;
 189:L PR[10:Measured Position] 250mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
 190:   ;
 191:   ;
 192:  WAIT    .25(sec) ;
 193:   ;
 194:  CALL ALL_VAC_ON    ;
 195:   ;
 196:  WAIT    .25(sec) ;
 197:   ;
 198:L P[1:Approach/Exit] 1000mm/sec FINE    ;
 199:   ;
 200:  CALL MAG_GRIP_ON    ;
 201:  !End Infeed Pick ;
 202:   ;
 203:  !Begin Zero ;
 204:  UFRAME_NUM=3 ;
 205:   ;
 206:J P[39:Rotate Torwards Zero] 75% CNT50    ;
 207:   ;
 208:J P[3:Approach/Exit] 75% CNT50    ;
 209:   ;
 210:L P[41:Above Zero] 1500mm/sec CNT100    ;
 211:   ;
 212:L P[4:Place in Zero] 700mm/sec FINE    ;
 213:   ;
 214:  WAIT    .25(sec) ;
 215:   ;
 216:  CALL ALL_VAC_OFF    ;
 217:   ;
 218:  CALL MAG_GRIP_OFF    ;
 219:   ;
 220:  WAIT    .25(sec) ;
 221:   ;
 222:L P[4:Place in Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 223:   ;
 224:L P[5:Pick from Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 225:   ;
 226:L P[5:Pick from Zero] 700mm/sec FINE    ;
 227:   ;
 228:  WAIT    .25(sec) ;
 229:   ;
 230:  CALL ALL_VAC_ON    ;
 231:   ;
 232:  CALL MAG_GRIP_ON    ;
 233:   ;
 234:  WAIT    .25(sec) ;
 235:   ;
 236:L P[41:Above Zero] 700mm/sec CNT50    ;
 237:   ;
 238:L P[3:Approach/Exit] 1500mm/sec CNT50    ;
 239:  !End Zero ;
 240:   ;
 241:  !Begin Bend 1 ;
 242:  UFRAME_NUM=4 ;
 243:   ;
 244:J P[6:Transition to Press] 75% CNT50    ;
 245:   ;
 246:J P[7:Avoid Collision] 75% CNT50    ;
 247:   ;
 248:J P[8:Rotate to Press Orientation] 75% CNT50    ;
 249:   ;
 250:L P[42:Keep Part Off Arm] 2000mm/sec CNT50    ;
 251:   ;
 252:L P[9:Approach Press] 2000mm/sec CNT25    ;
 253:   ;
 254:L P[16:INSERT IN PRESS] 750mm/sec FINE    ;
 255:   ;
 256:L P[17:lower to press] 750mm/sec FINE    ;
 257:   ;
 258:  CALL PRE_BG    ;
 259:   ;
 260:L P[10:In Press] 750mm/sec FINE    ;
 261:   ;
 262:  CALL ADJ_BG    ;
 263:   ;
 264:  WAIT    .25(sec) ;
 265:   ;
 266:  CALL PINCH    ;
 267:   ;
 268:  WAIT    .25(sec) ;
 269:   ;
 270:  CALL ALL_VAC_OFF    ;
 271:   ;
 272:  CALL MAG_GRIP_OFF    ;
 273:   ;
 274:  WAIT   1.00(sec) ;
 275:   ;
 276:  CALL BEND    ;
 277:   ;
 278:  !Change time for next ;
 279:  !Waypoint to adjust follow ;
 280:  UFRAME_NUM=4 ;
 281:   ;
 282:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 283:   ;
 284:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 285:L P[11:Bend 1 Pick] 1.2sec FINE SkipJump,LBL[100]    ;
 286:   ;
 287:  LBL[100] ;
 288:   ;
 289:  DO[27:RB_PEDALDN]=OFF ;
 290:   ;
 291:L P[11:Bend 1 Pick] 0.6sec FINE    ;
 292:   ;
 293:  WAIT    .25(sec) ;
 294:   ;
 295:  CALL ALL_VAC_ON    ;
 296:   ;
 297:  CALL MAG_GRIP_ON    ;
 298:   ;
 299:  WAIT   1.00(sec) ;
 300:   ;
 301:  CALL OPEN_PRESS    ;
 302:   ;
 303:  WAIT    .25(sec) ;
 304:   ;
 305:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 306:   ;
 307:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 308:  !End Bend 1 ;
 309:   ;
 310:  !Bend 2 Sequence ;
 311:  UFRAME_NUM=4 ;
 312:   ;
 313:  CALL PRE_BG    ;
 314:   ;
 315:L P[9:Approach Press] 2000mm/sec CNT50    ;
 316:   ;
 317:L P[14:In Front of Press] 1500mm/sec CNT50    ;
 318:   ;
 319:L P[18:Part Insert in Press] 750mm/sec FINE    ;
 320:   ;
 321:L P[19:In Press] 700mm/sec FINE    ;
 322:   ;
 323:  CALL ADJ_BG    ;
 324:   ;
 325:  WAIT    .25(sec) ;
 326:   ;
 327:  CALL PINCH    ;
 328:   ;
 329:  WAIT    .25(sec) ;
 330:   ;
 331:  CALL ALL_VAC_OFF    ;
 332:   ;
 333:  CALL MAG_GRIP_OFF    ;
 334:   ;
 335:  WAIT   1.00(sec) ;
 336:   ;
 337:  CALL BEND    ;
 338:   ;
 339:  !Change time for next ;
 340:  !Waypoint to adjust follow ;
 341:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 342:   ;
 343:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 344:L P[20:Bend 2 Pick] 0.6sec FINE SkipJump,LBL[101]    ;
 345:   ;
 346:  LBL[101] ;
 347:   ;
 348:  DO[27:RB_PEDALDN]=OFF ;
 349:   ;
 350:L P[20:Bend 2 Pick] 0.6sec FINE    ;
 351:   ;
 352:  WAIT    .25(sec) ;
 353:   ;
 354:  CALL ALL_VAC_ON    ;
 355:   ;
 356:  CALL MAG_GRIP_ON    ;
 357:   ;
 358:  WAIT   1.00(sec) ;
 359:   ;
 360:  CALL OPEN_PRESS    ;
 361:   ;
 362:  WAIT    .25(sec) ;
 363:   ;
 364:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 365:   ;
 366:L P[15:Rotate for Clearance] 750mm/sec CNT25    ;
 367:   ;
 368:L P[22:Pull Part out of Press] 700mm/sec CNT50    ;
 369:   ;
 370:J P[31:Prep for Rotation] 50% FINE    ;
 371:   ;
 372:J P[33:Move Part to Left Side of Arm] 50% CNT50    ;
 373:  !End Bend 2 ;
 374:   ;
 375:  !Outfeed Pallet Sequence ;
 376:  UFRAME_NUM=6 ;
 377:   ;
 378:  PR[15,1:Pallet Offset]=0    ;
 379:  PR[15,2:Pallet Offset]=0    ;
 380:  PR[15,3:Pallet Offset]=0    ;
 381:   ;
 382:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 383:   ;
 384:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 385:   ;
 386:  IF (R[1:Layer Count]>1 AND R[1:Layer Count]<=3) THEN ;
 387:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-R[12:Part Offset 2]) ;
 388:  ENDIF ;
 389:   ;
 390:  IF (R[1:Layer Count]>=4 AND R[1:Layer Count]<6) THEN ;
 391:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[12:Part Offset 2]*2)) ;
 392:  ENDIF ;
 393:   ;
 394:  IF (R[1:Layer Count]=1 OR R[1:Layer Count]=3 OR R[1:Layer Count]=5) THEN ;
 395:  PR[15,3:Pallet Offset]=(50) ;
 396:  ENDIF ;
 397:   ;
 398:J P[32:Transition To Outfeed] 50% CNT50    ;
 399:   ;
 400:J P[52:Rotate Part] 100% CNT50    ;
 401:   ;
 402:  WAIT (DI[32:RB_OUTFEED_SET]=ON)    ;
 403:   ;
 404:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 405:   ;
 406:L P[35:Approach] 1500mm/sec CNT25 Offset,PR[15:Pallet Offset]    ;
 407:   ;
 408:L P[36:Place Part in Outfeed Pallet] 1500mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 409:   ;
 410:  WAIT    .25(sec) ;
 411:   ;
 412:  CALL ALL_VAC_OFF    ;
 413:   ;
 414:  CALL MAG_GRIP_OFF    ;
 415:   ;
 416:  WAIT    .25(sec) ;
 417:   ;
 418:L P[37:Pull Away from Part] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 419:   ;
 420:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 421:   ;
 422:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 423:   ;
 424:  CALL END_PART    ;
 425:   ;
 426:  WAIT    .25(sec) ;
 427:   ;
 428:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 429:   ;
 430:  R[10:Current Part]=R[10:Current Part]+1    ;
 431:   ;
 432:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 433:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 434:  ENDIF ;
 435:   ;
 436:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 437:  R[1:Layer Count]=0    ;
 438:  R[2:Pallet Count]=0    ;
 439:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 440:  ENDIF ;
 441:   ;
 442:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
 443:  R[1:Layer Count]=0    ;
 444:  R[2:Pallet Count]=0    ;
 445:  R[10:Current Part]=1    ;
 446:L P[23:clear outfeed] 1000mm/sec FINE    ;
 447:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 448:  PAUSE ;
 449:  ENDIF ;
 450:   ;
 451:  F[1:First Part]=(OFF) ;
 452:   ;
 453:  JMP LBL[2] ;
/POS
P[1:"Approach/Exit"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.110  mm,	Y =  3614.806  mm,	Z =   649.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  3863.073  mm
};
P[2:"On Part"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.110  mm,	Y =  3614.806  mm,	Z =     4.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  3863.073  mm
};
P[3:"Approach/Exit"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1263.279  mm,	Y =   460.521  mm,	Z =  1792.207  mm,
	W =   175.320 deg,	P =    -4.114 deg,	R =    92.293 deg,
	E1=  2017.712  mm
};
P[4:"Place in Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1232.141  mm,	Y =   562.886  mm,	Z =    -2.004  mm,
	W =  -179.757 deg,	P =     -.046 deg,	R =    89.686 deg,
	E1=   300.000  mm
};
P[5:"Pick from Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1108.125  mm,	Y =   518.663  mm,	Z =     -.873  mm,
	W =  -179.757 deg,	P =     -.046 deg,	R =    89.686 deg,
	E1=   300.000  mm
};
P[6:"Transition to Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -168.043  mm,	Y = -1801.298  mm,	Z =   978.421  mm,
	W =   148.326 deg,	P =   -61.870 deg,	R =    28.511 deg,
	E1=  3961.031  mm
};
P[7:"Avoid Collision"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -168.916  mm,	Y = -1801.299  mm,	Z =   978.421  mm,
	W =  -155.674 deg,	P =   -61.870 deg,	R =    28.511 deg,
	E1=  3961.904  mm
};
P[8:"Rotate to Press Orientation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -168.917  mm,	Y = -1801.299  mm,	Z =   978.421  mm,
	W =     1.300 deg,	P =    -3.371 deg,	R =   -94.988 deg,
	E1=  3961.904  mm
};
P[9:"Approach Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -168.989  mm,	Y =  -800.417  mm,	Z =   132.802  mm,
	W =     1.224 deg,	P =    -1.016 deg,	R =   -90.387 deg,
	E1=  3961.647  mm
};
P[10:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    68.255  mm,	Y =  -492.588  mm,	Z =   -28.982  mm,
	W =      .235 deg,	P =     -.121 deg,	R =   -89.691 deg,
	E1=  3345.324  mm
};
P[11:"Bend 1 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   109.596  mm,	Y =  -391.093  mm,	Z =   332.075  mm,
	W =     -.154 deg,	P =   -43.915 deg,	R =   -89.624 deg,
	E1=  3345.296  mm
};
P[12:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   109.540  mm,	Y =  -400.232  mm,	Z =   384.986  mm,
	W =     -.153 deg,	P =   -40.564 deg,	R =   -89.358 deg,
	E1=  3345.282  mm
};
P[13:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   109.760  mm,	Y =  -763.632  mm,	Z =   389.587  mm,
	W =     -.153 deg,	P =   -40.564 deg,	R =   -89.358 deg,
	E1=  3345.282  mm
};
P[14:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   110.360  mm,	Y =  -597.742  mm,	Z =    68.241  mm,
	W =      .245 deg,	P =     -.104 deg,	R =   -89.491 deg,
	E1=  3345.519  mm
};
P[15:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.603  mm,	Y =  -308.719  mm,	Z =   317.285  mm,
	W =     -.740 deg,	P =   -68.214 deg,	R =   -89.013 deg,
	E1=  3059.733  mm
};
P[16:"INSERT IN PRESS"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    68.249  mm,	Y =  -511.159  mm,	Z =    27.543  mm,
	W =      .235 deg,	P =     -.121 deg,	R =   -89.691 deg,
	E1=  3345.324  mm
};
P[17:"lower to press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    68.261  mm,	Y =  -501.874  mm,	Z =   -28.865  mm,
	W =      .235 deg,	P =     -.121 deg,	R =   -89.691 deg,
	E1=  3345.324  mm
};
P[18:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   115.230  mm,	Y =  -394.820  mm,	Z =    -2.882  mm,
	W =      .244 deg,	P =     -.103 deg,	R =   -89.491 deg,
	E1=  3135.224  mm
};
P[19:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   115.228  mm,	Y =  -340.384  mm,	Z =   -13.340  mm,
	W =      .244 deg,	P =     -.103 deg,	R =   -89.632 deg,
	E1=  3135.231  mm
};
P[20:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.564  mm,	Y =  -220.854  mm,	Z =   166.828  mm,
	W =     -.093 deg,	P =   -43.105 deg,	R =   -89.489 deg,
	E1=  3059.733  mm
};
P[21:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.580  mm,	Y =  -226.354  mm,	Z =   227.164  mm,
	W =     -.147 deg,	P =   -39.731 deg,	R =   -89.499 deg,
	E1=  3059.733  mm
};
P[22:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   100.145  mm,	Y = -1208.576  mm,	Z =   328.680  mm,
	W =     -.740 deg,	P =   -68.214 deg,	R =   -89.013 deg,
	E1=  3059.733  mm
};
P[23:"clear outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =  -463.210  mm,	Y =  2067.303  mm,	Z =  1944.565  mm,
	W =     3.497 deg,	P =    72.750 deg,	R =      .656 deg,
	E1=  6335.357  mm
};
P[24:"above infeed pick"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   711.822  mm,	Y =  3618.323  mm,	Z =   350.745  mm,
	W =   180.000 deg,	P =      .000 deg,	R =      .093 deg,
	E1=  3862.353  mm
};
P[31:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X = -1238.865  mm,	Y = -1295.727  mm,	Z =   759.037  mm,
	W =     -.740 deg,	P =   -68.214 deg,	R =   -89.013 deg,
	E1=  3059.733  mm
};
P[32:"Transition To Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X = -3669.783  mm,	Y =  2329.916  mm,	Z =  1155.235  mm,
	W =    36.406 deg,	P =    87.721 deg,	R =    14.351 deg,
	E1=  3059.737  mm
};
P[33:"Move Part to Left Side of Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X = -1938.586  mm,	Y = -1168.124  mm,	Z =   533.433  mm,
	W =    42.144 deg,	P =    88.292 deg,	R =   136.173 deg,
	E1=  3059.737  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =  -267.939  mm,	Y =  2067.240  mm,	Z =  1894.485  mm,
	W =     3.496 deg,	P =    72.748 deg,	R =      .654 deg,
	E1=  6454.675  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   917.487  mm,	Y =  2031.828  mm,	Z =  1265.481  mm,
	W =    43.559 deg,	P =    88.548 deg,	R =    43.298 deg,
	E1=  6969.459  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   923.342  mm,	Y =  2058.781  mm,	Z =   516.583  mm,
	W =    43.650 deg,	P =    88.550 deg,	R =    43.389 deg,
	E1=  6969.459  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   388.344  mm,	Y =  2083.896  mm,	Z =   554.376  mm,
	W =   105.817 deg,	P =    88.923 deg,	R =   106.369 deg,
	E1=  6969.468  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =  -335.678  mm,	Y =  2081.825  mm,	Z =  1024.806  mm,
	W =   105.817 deg,	P =    88.923 deg,	R =   106.369 deg,
	E1=  5788.941  mm
};
P[39:"Rotate Torwards Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1983.815  mm,	Y =  -307.792  mm,	Z =  3411.414  mm,
	W =  -175.452 deg,	P =   -13.024 deg,	R =    93.757 deg,
	E1=  3750.000  mm
};
P[40:"Zero Point"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.135  mm,	Y =  4668.521  mm,	Z =   167.504  mm,
	W =  -179.989 deg,	P =     -.061 deg,	R =      .000 deg,
	E1=  2807.345  mm
};
P[41:"Above Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1319.037  mm,	Y =   958.927  mm,	Z =   296.675  mm,
	W =   175.343 deg,	P =    -4.140 deg,	R =    91.966 deg,
	E1=   384.795  mm
};
P[42:"Keep Part Off Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -167.477  mm,	Y = -1202.469  mm,	Z =   714.790  mm,
	W =    -1.066 deg,	P =    -6.044 deg,	R =   -94.784 deg,
	E1=  3961.334  mm
};
P[52:"Rotate Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X = -1658.964  mm,	Y =  2077.058  mm,	Z =  1683.312  mm,
	W =     4.069 deg,	P =    72.745 deg,	R =     1.202 deg,
	E1=  5063.851  mm
};
/END
