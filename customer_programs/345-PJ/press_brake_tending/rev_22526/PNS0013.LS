/PROG  PNS0013
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5353026_SPM400L2";
PROG_SIZE	= 11406;
CREATE		= DATE 25-10-01  TIME 13:27:28;
MODIFIED	= DATE 26-02-19  TIME 14:16:44;
FILE_NAME	= PART_PRO;
VERSION		= 0;
LINE_COUNT	= 529;
MEMORY_SIZE	= 11954;
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
   1:  !PART #: 5353026 ;
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
  15:  R[1:Layer Count]=0    ;
  16:  R[4:Pallet Limit]=6    ;
  17:  R[7:Part Width]=2216    ;
  18:  R[8:Num of Pallets]=1    ;
  19:  R[9]=0    ;
  20:  R[11:Part Offset Pal]=76    ;
  21:  R[12:Part Offset 2]=228    ;
  22:  R[13:Tool Required]=1    ;
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
  33:  //CALL CHECK_REGRIP    ;
  34:   ;
  35:  UFRAME_NUM=1 ;
  36:  UTOOL_NUM=R[13:Tool Required] ;
  37:   ;
  38:  PAYLOAD[R[13]] ;
  39:   ;
  40:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
  41:   ;
  42:  UFRAME_NUM=1 ;
  43:   ;
  44:  JMP LBL[999] ;
  45:   ;
  46:  !Measure Part Sequence ;
  47:J P[1:Approach/Exit] 50% FINE    ;
  48:   ;
  49:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
  50:L P[2:On Part] 700mm/sec FINE SkipJump,LBL[3]    ;
  51:   ;
  52:  !Recovery if no parts found ;
  53:L P[1:Approach/Exit] 700mm/sec FINE    ;
  54:   ;
  55:  CALL GO_HOME    ;
  56:   ;
  57:  UALM[1] ;
  58:   ;
  59:  ABORT ;
  60:  !End Recovery ;
  61:   ;
  62:  LBL[3] ;
  63:   ;
  64:  WAIT    .25(sec) ;
  65:   ;
  66:  PR[10:Measured Position]=LPOS    ;
  67:   ;
  68:  WAIT    .25(sec) ;
  69:   ;
  70:J PR[10:Measured Position] 50% FINE Offset,PR[51:LINEAR RAIL OFFSET]    ;
  71:   ;
  72:  WAIT    .25(sec) ;
  73:   ;
  74:  PR[10:Measured Position]=LPOS    ;
  75:   ;
  76:  WAIT    .25(sec) ;
  77:   ;
  78:  SKIP CONDITION RI[1:PART PRESENT]=OFF    ;
  79:L PR[10:Measured Position] 680mm/sec FINE Offset,PR[53:Y_OFFSET] SkipJump,LBL[4]    ;
  80:   ;
  81:  !Recovery if part end is not foud ;
  82:  PR[10:Measured Position]=LPOS    ;
  83:   ;
  84:  WAIT    .25(sec) ;
  85:   ;
  86:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
  87:   ;
  88:  CALL GO_HOME    ;
  89:   ;
  90:  UALM[2] ;
  91:   ;
  92:  ABORT ;
  93:  !End Recovery ;
  94:   ;
  95:  LBL[4] ;
  96:   ;
  97:  JMP LBL[5] ;
  98:  !Zero point for part width  ;
  99:L P[40:Zero Point] 700mm/sec FINE    ;
 100:  LBL[5] ;
 101:   ;
 102:  PR[5:Zero Point]=P[40:Zero Point]    ;
 103:   ;
 104:  PR[10:Measured Position]=LPOS    ;
 105:   ;
 106:  WAIT    .25(sec) ;
 107:   ;
 108:  R[6:Measured Width]=PR[5,2:Zero Point]-PR[10,2:Measured Position]    ;
 109:   ;
 110:  SELECT R[5:Current Tool]=1,JMP LBL[7] ;
 111:         =2,JMP LBL[8] ;
 112:   ;
 113:  LBL[7] ;
 114:   ;
 115:  R[6:Measured Width]=R[6:Measured Width]+R[14:Tool 1 Prox Off]    ;
 116:   ;
 117:  JMP LBL[9] ;
 118:   ;
 119:  LBL[8] ;
 120:   ;
 121:  R[6:Measured Width]=R[6:Measured Width]+R[15:Tool 2 Prox Off]    ;
 122:   ;
 123:  LBL[9] ;
 124:   ;
 125:  WAIT    .25(sec) ;
 126:   ;
 127:  R[6:Measured Width]=R[6:Measured Width] DIV 1    ;
 128:   ;
 129:  R[16:Difference]=R[6:Measured Width]-R[7:Part Width]    ;
 130:   ;
 131:  R[16:Difference]=R[16:Difference] DIV 1    ;
 132:   ;
 133:  IF (R[16:Difference]>=(-50) AND R[16:Difference]<=50) THEN ;
 134:   ;
 135:  PR[10:Measured Position]=LPOS    ;
 136:   ;
 137:  WAIT    .25(sec) ;
 138:   ;
 139:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 140:   ;
 141:  CALL GO_HOME    ;
 142:   ;
 143:  UALM[3] ;
 144:   ;
 145:  ABORT ;
 146:  ELSE ;
 147:  PR[10:Measured Position]=LPOS    ;
 148:   ;
 149:  WAIT    .25(sec) ;
 150:   ;
 151:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 152:  ENDIF ;
 153:   ;
 154:  LBL[999] ;
 155:   ;
 156:  !Top of Main Program Loop ;
 157:  LBL[2:Loop Program] ;
 158:   ;
 159:  CALL START_PART    ;
 160:   ;
 161:  IF (F[1:First Part]=ON),JMP LBL[99] ;
 162:   ;
 163:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
 164:   ;
 165:  LBL[99] ;
 166:   ;
 167:  !Begin Infeed Pick ;
 168:  UFRAME_NUM=1 ;
 169:   ;
 170:J P[1:Approach/Exit] 50% FINE    ;
 171:   ;
 172:L P[30:above infeed pick] 1500mm/sec FINE    ;
 173:   ;
 174:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 175:L P[2:On Part] 75mm/sec FINE SkipJump,LBL[1]    ;
 176:   ;
 177:  !Recovery if no parts found ;
 178:L P[1:Approach/Exit] 700mm/sec FINE    ;
 179:   ;
 180:  CALL GO_HOME    ;
 181:   ;
 182:  UALM[1] ;
 183:   ;
 184:  ABORT ;
 185:  !End Recovery ;
 186:   ;
 187:  LBL[1] ;
 188:   ;
 189:  PR[10:Measured Position]=LPOS    ;
 190:   ;
 191:L PR[10:Measured Position] 700mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
 192:   ;
 193:   ;
 194:  WAIT    .25(sec) ;
 195:   ;
 196:  CALL ALL_VAC_ON    ;
 197:   ;
 198:  WAIT    .25(sec) ;
 199:   ;
 200:L P[1:Approach/Exit] 700mm/sec FINE    ;
 201:   ;
 202:  CALL MAG_GRIP_ON    ;
 203:  !End Infeed Pick ;
 204:   ;
 205:  !Begin Zero ;
 206:  UFRAME_NUM=3 ;
 207:   ;
 208:J P[39:Rotate Torwards Zero] 100% CNT50    ;
 209:   ;
 210:J P[3:Approach/Exit] 50% CNT50    ;
 211:   ;
 212:L P[41:Above Zero] 1500mm/sec CNT100    ;
 213:   ;
 214:L P[4:Place in Zero] 700mm/sec FINE    ;
 215:   ;
 216:  WAIT    .25(sec) ;
 217:   ;
 218:  CALL ALL_VAC_OFF    ;
 219:   ;
 220:  CALL MAG_GRIP_OFF    ;
 221:   ;
 222:  WAIT    .25(sec) ;
 223:   ;
 224:L P[4:Place in Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 225:   ;
 226:L P[5:Pick from Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 227:   ;
 228:L P[5:Pick from Zero] 700mm/sec FINE    ;
 229:   ;
 230:  WAIT    .25(sec) ;
 231:   ;
 232:  CALL ALL_VAC_ON    ;
 233:   ;
 234:  CALL MAG_GRIP_ON    ;
 235:   ;
 236:  WAIT    .25(sec) ;
 237:   ;
 238:L P[41:Above Zero] 750mm/sec CNT50    ;
 239:   ;
 240:L P[3:Approach/Exit] 1500mm/sec CNT50    ;
 241:  !End Zero ;
 242:   ;
 243:  !Begin Bend 1 ;
 244:  UFRAME_NUM=4 ;
 245:   ;
 246:J P[6:Transition to Press] 50% CNT25    ;
 247:   ;
 248:J P[7:Avoid Collision] 50% CNT50    ;
 249:   ;
 250:J P[8:Rotate to Press Orientation] 50% CNT50    ;
 251:   ;
 252:L P[27:approach press] 750mm/sec FINE    ;
 253:   ;
 254:  CALL PRE_BG    ;
 255:   ;
 256:L P[10:In Press] 750mm/sec FINE    ;
 257:   ;
 258:  CALL ADJ_BG    ;
 259:   ;
 260:  WAIT    .25(sec) ;
 261:   ;
 262:  CALL PINCH    ;
 263:   ;
 264:  WAIT    .25(sec) ;
 265:   ;
 266:  CALL ALL_VAC_OFF    ;
 267:   ;
 268:  CALL MAG_GRIP_OFF    ;
 269:   ;
 270:  WAIT   1.00(sec) ;
 271:   ;
 272:  CALL BEND    ;
 273:   ;
 274:  !Change time for next ;
 275:  !Waypoint to adjust follow ;
 276:  UFRAME_NUM=4 ;
 277:   ;
 278:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 279:   ;
 280:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 281:L P[11:Bend 1 Pick] 1.0sec FINE SkipJump,LBL[100]    ;
 282:   ;
 283:  LBL[100] ;
 284:   ;
 285:  DO[27:RB_PEDALDN]=OFF ;
 286:   ;
 287:L P[11:Bend 1 Pick] 1.0sec FINE    ;
 288:   ;
 289:  WAIT    .25(sec) ;
 290:   ;
 291:  CALL ALL_VAC_ON    ;
 292:   ;
 293:  CALL MAG_GRIP_ON    ;
 294:   ;
 295:  WAIT   1.00(sec) ;
 296:   ;
 297:  CALL OPEN_PRESS    ;
 298:   ;
 299:  WAIT    .25(sec) ;
 300:   ;
 301:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 302:   ;
 303:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 304:  !End Bend 1 ;
 305:  !Bend 2 Sequence ;
 306:  UFRAME_NUM=4 ;
 307:   ;
 308:  CALL PRE_BG    ;
 309:   ;
 310:J P[54:Prep for Rotation to Bend 2] 100% CNT100    ;
 311:   ;
 312:L P[55:Rotate to Bend 2] 2000mm/sec FINE    ;
 313:   ;
 314:   ;
 315:L P[57:Lower Part for Press Entry] 750mm/sec CNT50    ;
 316:   ;
 317:L P[58:In Press] 100mm/sec FINE    ;
 318:   ;
 319:  CALL ADJ_BG    ;
 320:   ;
 321:  WAIT    .25(sec) ;
 322:   ;
 323:  CALL PINCH    ;
 324:   ;
 325:  WAIT    .25(sec) ;
 326:   ;
 327:  CALL ALL_VAC_OFF    ;
 328:   ;
 329:  CALL MAG_GRIP_OFF    ;
 330:   ;
 331:L P[23:clear part for bend] 1000mm/sec FINE    ;
 332:   ;
 333:L P[24:rotate for pick] 1500mm/sec FINE    ;
 334:   ;
 335:J P[28:get under part] 50% FINE    ;
 336:   ;
 337:  WAIT    .25(sec) ;
 338:   ;
 339:  CALL BEND    ;
 340:   ;
 341:  !Change time for next ;
 342:  !Waypoint to adjust follow ;
 343:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 344:   ;
 345:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 346:L P[59:Bend 2 Pick] 3.5sec FINE SkipJump,LBL[102]    ;
 347:   ;
 348:  LBL[102] ;
 349:   ;
 350:  DO[27:RB_PEDALDN]=OFF ;
 351:   ;
 352:L P[60:Bend 2 Pick] 0.7sec FINE    ;
 353:   ;
 354:  WAIT    .25(sec) ;
 355:   ;
 356:  CALL ALL_VAC_ON    ;
 357:   ;
 358:  CALL MAG_GRIP_ON    ;
 359:   ;
 360:  WAIT   1.00(sec) ;
 361:   ;
 362:  CALL OPEN_PRESS    ;
 363:   ;
 364:  WAIT    .25(sec) ;
 365:   ;
 366:L P[61:Lift Part out of Die] 700mm/sec FINE    ;
 367:   ;
 368:L P[62:Pull Part out of Press] 1500mm/sec CNT50    ;
 369:  !End Bend 2 ;
 370:   ;
 371:   ;
 372:   ;
 373:  !Bend 3 Sequence ;
 374:  UFRAME_NUM=4 ;
 375:   ;
 376:   ;
 377:  CALL PRE_BG    ;
 378:   ;
 379:L P[9:Approach Press] 2000mm/sec FINE    ;
 380:   ;
 381:L P[14:In Front of Press] 1500mm/sec CNT50    ;
 382:   ;
 383:L P[18:Part Insert in Press] 750mm/sec FINE    ;
 384:   ;
 385:L P[19:In Press] 50mm/sec FINE    ;
 386:   ;
 387:  CALL ADJ_BG    ;
 388:   ;
 389:  WAIT    .25(sec) ;
 390:   ;
 391:  CALL PINCH    ;
 392:   ;
 393:  WAIT    .25(sec) ;
 394:   ;
 395:  CALL ALL_VAC_OFF    ;
 396:   ;
 397:  CALL MAG_GRIP_OFF    ;
 398:   ;
 399:  WAIT   1.00(sec) ;
 400:   ;
 401:L P[25:move off part] 100mm/sec FINE    ;
 402:   ;
 403:L P[26:clear part] 700mm/sec FINE    ;
 404:   ;
 405:L P[16:lower under part] 1500mm/sec FINE    ;
 406:   ;
 407:L P[17:below part] 1000mm/sec FINE    ;
 408:   ;
 409:  CALL BEND    ;
 410:   ;
 411:   ;
 412:  !Change time for next ;
 413:  !Waypoint to adjust follow ;
 414:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 415:   ;
 416:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 417:L P[20:Bend 3 Pick] 4.5sec FINE SkipJump,LBL[101]    ;
 418:   ;
 419:  LBL[101] ;
 420:   ;
 421:  DO[27:RB_PEDALDN]=OFF ;
 422:   ;
 423:L P[20:Bend 3 Pick] 0.7sec FINE    ;
 424:   ;
 425:  WAIT    .25(sec) ;
 426:   ;
 427:  CALL ALL_VAC_ON    ;
 428:   ;
 429:  CALL MAG_GRIP_ON    ;
 430:   ;
 431:  WAIT   1.00(sec) ;
 432:   ;
 433:  CALL OPEN_PRESS    ;
 434:   ;
 435:  WAIT    .25(sec) ;
 436:   ;
 437:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 438:   ;
 439:L P[15:Rotate for Clearance] 750mm/sec CNT25    ;
 440:   ;
 441:L P[22:Pull Part out of Press] 700mm/sec CNT50    ;
 442:  !End Bend 3 ;
 443:   ;
 444:   ;
 445:   ;
 446:L P[31:Prep for Rotation] 2000mm/sec FINE    ;
 447:   ;
 448:J P[33:Move Part to Left Side of Arm] 50% CNT50    ;
 449:   ;
 450:  !Outfeed Pallet Sequence ;
 451:  UFRAME_NUM=6 ;
 452:   ;
 453:  PR[15,1:Pallet Offset]=0    ;
 454:  PR[15,2:Pallet Offset]=0    ;
 455:  PR[15,3:Pallet Offset]=0    ;
 456:   ;
 457:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 458:   ;
 459:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 460:   ;
 461:  IF (R[1:Layer Count]>1 AND R[1:Layer Count]<=3) THEN ;
 462:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-R[12:Part Offset 2]) ;
 463:  ENDIF ;
 464:   ;
 465:  IF (R[1:Layer Count]>=4 AND R[1:Layer Count]<6) THEN ;
 466:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[12:Part Offset 2]*2)) ;
 467:  ENDIF ;
 468:   ;
 469:  IF (R[1:Layer Count]=1 OR R[1:Layer Count]=3 OR R[1:Layer Count]=5) THEN ;
 470:  PR[15,3:Pallet Offset]=(50) ;
 471:  ENDIF ;
 472:   ;
 473:L P[32:Transition To Outfeed] 4000mm/sec CNT50    ;
 474:   ;
 475:   ;
 476:  WAIT (DI[32:RB_OUTFEED_SET]=ON)    ;
 477:   ;
 478:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 479:   ;
 480:L P[29:lower to pallet] 1500mm/sec FINE    ;
 481:   ;
 482:J P[35:Approach] 37% CNT50 Offset,PR[15:Pallet Offset]    ;
 483:   ;
 484:L P[36:Place Part in Outfeed Pallet] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 485:   ;
 486:  WAIT    .25(sec) ;
 487:   ;
 488:  CALL ALL_VAC_OFF    ;
 489:   ;
 490:  CALL MAG_GRIP_OFF    ;
 491:   ;
 492:  WAIT    .25(sec) ;
 493:   ;
 494:J P[37:Pull Away from Part] 17% FINE Offset,PR[15:Pallet Offset]    ;
 495:   ;
 496:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 497:   ;
 498:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 499:   ;
 500:  CALL END_PART    ;
 501:  WAIT    .25(sec) ;
 502:   ;
 503:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 504:   ;
 505:  R[10:Current Part]=R[10:Current Part]+1    ;
 506:   ;
 507:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 508:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 509:  ENDIF ;
 510:   ;
 511:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 512:  R[1:Layer Count]=0    ;
 513:  R[2:Pallet Count]=0    ;
 514:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 515:  ENDIF ;
 516:   ;
 517:  IF (R[10:Current Part]>=R[3:Run QTY]) THEN ;
 518:  R[1:Layer Count]=0    ;
 519:  R[2:Pallet Count]=0    ;
 520:  R[10:Current Part]=1    ;
 521:L P[53:clear outfeed] 1000mm/sec FINE    ;
 522:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 523:  PAUSE ;
 524:  ENDIF ;
 525:   ;
 526:  F[1:First Part]=(OFF) ;
 527:   ;
 528:   ;
 529:  JMP LBL[2] ;
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
	X =  1231.361  mm,	Y =   498.784  mm,	Z =     3.554  mm,
	W =  -179.633 deg,	P =     -.080 deg,	R =    88.782 deg,
	E1=   300.024  mm
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
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    38.687  mm,	Y = -1276.185  mm,	Z =   427.244  mm,
	W =  -179.425 deg,	P =    -2.043 deg,	R =    89.176 deg,
	E1=  2376.469  mm
};
P[10:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    78.956  mm,	Y =  -494.144  mm,	Z =    -7.432  mm,
	W =      .248 deg,	P =     -.103 deg,	R =   -89.766 deg,
	E1=  3345.277  mm
};
P[11:"Bend 1 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   107.844  mm,	Y =  -394.139  mm,	Z =   324.392  mm,
	W =     -.202 deg,	P =   -43.895 deg,	R =   -89.327 deg,
	E1=  3345.282  mm
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
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.228  mm,	Y =  -753.464  mm,	Z =    48.439  mm,
	W =  -179.425 deg,	P =    -2.043 deg,	R =    89.176 deg,
	E1=  2376.469  mm
};
P[15:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    48.504  mm,	Y =  -210.645  mm,	Z =   262.730  mm,
	W =     -.819 deg,	P =   -64.803 deg,	R =   -89.230 deg,
	E1=  2050.236  mm
};
P[16:"lower under part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    15.941  mm,	Y = -1077.482  mm,	Z =  -323.981  mm,
	W =     -.101 deg,	P =   -40.933 deg,	R =   -89.498 deg,
	E1=  4108.862  mm
};
P[17:"below part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    33.370  mm,	Y =  -433.738  mm,	Z =  -317.122  mm,
	W =     -.239 deg,	P =   -36.804 deg,	R =   -89.528 deg,
	E1=  3481.165  mm
};
P[18:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    -2.395  mm,	Y =  -449.834  mm,	Z =     4.840  mm,
	W =  -179.727 deg,	P =      .060 deg,	R =    89.174 deg,
	E1=  2376.469  mm
};
P[19:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    -3.483  mm,	Y =  -361.628  mm,	Z =     3.723  mm,
	W =  -179.721 deg,	P =      .060 deg,	R =    89.623 deg,
	E1=  2112.819  mm
};
P[20:"Bend 3 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    45.988  mm,	Y =  -211.332  mm,	Z =   148.194  mm,
	W =     -.451 deg,	P =   -42.424 deg,	R =   -89.538 deg,
	E1=  2139.666  mm
};
P[21:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    48.523  mm,	Y =  -211.400  mm,	Z =   203.091  mm,
	W =     -.437 deg,	P =   -42.296 deg,	R =   -89.537 deg,
	E1=  2050.236  mm
};
P[22:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   100.145  mm,	Y = -1208.576  mm,	Z =   328.680  mm,
	W =     -.740 deg,	P =   -68.214 deg,	R =   -89.013 deg,
	E1=  3059.733  mm
};
P[23:"clear part for bend"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.129  mm,	Y = -1265.758  mm,	Z =    62.512  mm,
	W =  -179.734 deg,	P =      .936 deg,	R =    89.468 deg,
	E1=  2113.447  mm
};
P[24:"rotate for pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1111.442  mm,	Y = -2177.195  mm,	Z =  -222.607  mm,
	W =     3.037 deg,	P =    -4.143 deg,	R =  -159.195 deg,
	E1=  3560.024  mm
};
P[25:"move off part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.463  mm,	Y =  -355.563  mm,	Z =    29.757  mm,
	W =  -179.813 deg,	P =    -2.046 deg,	R =    89.670 deg,
	E1=  2376.469  mm
};
P[26:"clear part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    -1.770  mm,	Y = -1506.793  mm,	Z =    44.335  mm,
	W =  -179.813 deg,	P =    -2.046 deg,	R =    89.670 deg,
	E1=  2952.755  mm
};
P[27:"approach press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   -67.453  mm,	Y =  -824.329  mm,	Z =   139.238  mm,
	W =      .772 deg,	P =    -2.084 deg,	R =   -91.283 deg,
	E1=  3947.274  mm
};
P[28:"get under part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    -5.490  mm,	Y =  -530.768  mm,	Z =  -212.194  mm,
	W =      .062 deg,	P =   -21.409 deg,	R =   -89.432 deg,
	E1=  3499.802  mm
};
P[29:"lower to pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -469.220  mm,	Y =  1989.168  mm,	Z =  1593.799  mm,
	W =    72.578 deg,	P =    89.108 deg,	R =    74.363 deg,
	E1=  6971.691  mm
};
P[30:"above infeed pick"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.058  mm,	Y =  3614.757  mm,	Z =   257.039  mm,
	W =   179.999 deg,	P =      .009 deg,	R =     -.001 deg,
	E1=  3863.061  mm
};
P[31:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    49.180  mm,	Y = -1768.337  mm,	Z =  1131.809  mm,
	W =     -.819 deg,	P =   -64.803 deg,	R =   -89.230 deg,
	E1=  1248.391  mm
};
P[32:"Transition To Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, -1, 1',
	X =  -515.420  mm,	Y =  1794.042  mm,	Z =  1739.645  mm,
	W =  -118.972 deg,	P =   -89.325 deg,	R =   -59.166 deg,
	E1=  6549.753  mm
};
P[33:"Move Part to Left Side of Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1123.530  mm,	Y = -2855.458  mm,	Z =  1123.041  mm,
	W =   -37.137 deg,	P =   -87.867 deg,	R =    36.594 deg,
	E1=  1569.551  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -468.787  mm,	Y =  2044.960  mm,	Z =  2015.149  mm,
	W =   -88.583 deg,	P =    85.887 deg,	R =   -88.381 deg,
	E1=  6326.139  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   921.109  mm,	Y =  2085.544  mm,	Z =  1416.097  mm,
	W =    72.905 deg,	P =    89.111 deg,	R =    73.538 deg,
	E1=  6971.691  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   918.340  mm,	Y =  2059.350  mm,	Z =   604.364  mm,
	W =    50.900 deg,	P =    88.879 deg,	R =    50.965 deg,
	E1=  7037.850  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   749.561  mm,	Y =  2059.418  mm,	Z =   604.528  mm,
	W =    50.900 deg,	P =    88.879 deg,	R =    50.965 deg,
	E1=  6869.071  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   750.430  mm,	Y =  2055.028  mm,	Z =  1499.731  mm,
	W =    50.900 deg,	P =    88.879 deg,	R =    50.965 deg,
	E1=  6869.071  mm
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
P[53:"clear outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -1409.665  mm,	Y =  2063.839  mm,	Z =  1943.992  mm,
	W =    -8.302 deg,	P =   -72.730 deg,	R =  -174.735 deg,
	E1=  5388.098  mm
};
P[54:"Prep for Rotation to Bend 2"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   105.082  mm,	Y = -1118.369  mm,	Z =   592.364  mm,
	W =      .794 deg,	P =   -41.646 deg,	R =   -89.216 deg,
	E1=  3702.517  mm
};
P[55:"Rotate to Bend 2"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   105.220  mm,	Y = -1123.869  mm,	Z =   158.113  mm,
	W =  -178.633 deg,	P =   -10.511 deg,	R =    89.457 deg,
	E1=  3267.261  mm
};
P[57:"Lower Part for Press Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.641  mm,	Y =  -458.143  mm,	Z =    22.503  mm,
	W =   179.688 deg,	P =      .930 deg,	R =    89.462 deg,
	E1=  2113.442  mm
};
P[58:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    -2.688  mm,	Y =  -372.716  mm,	Z =     7.189  mm,
	W =   179.830 deg,	P =      .931 deg,	R =    89.467 deg,
	E1=  2113.442  mm
};
P[59:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    -2.570  mm,	Y =  -551.000  mm,	Z =    89.819  mm,
	W =     -.636 deg,	P =   -41.841 deg,	R =   -89.982 deg,
	E1=  2113.447  mm
};
P[60:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    -2.775  mm,	Y =  -266.305  mm,	Z =   193.723  mm,
	W =     -.636 deg,	P =   -41.841 deg,	R =   -89.982 deg,
	E1=  2113.447  mm
};
P[61:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    72.590  mm,	Y =  -292.870  mm,	Z =   317.737  mm,
	W =     -.210 deg,	P =   -45.057 deg,	R =   -89.456 deg,
	E1=  2439.467  mm
};
P[62:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    89.918  mm,	Y =  -958.322  mm,	Z =   353.950  mm,
	W =     -.119 deg,	P =   -45.781 deg,	R =   -89.339 deg,
	E1=  3358.710  mm
};
/END
