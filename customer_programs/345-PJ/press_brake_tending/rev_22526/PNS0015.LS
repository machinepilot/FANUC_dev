/PROG  PNS0015
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5353571";
PROG_SIZE	= 11587;
CREATE		= DATE 25-10-16  TIME 10:30:50;
MODIFIED	= DATE 26-02-19  TIME 12:55:34;
FILE_NAME	= P_535488;
VERSION		= 0;
LINE_COUNT	= 533;
MEMORY_SIZE	= 12119;
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
   1:  !PART #: 5353571 ;
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
 167:  UFRAME_NUM=1 ;
 168:   ;
 169:  !Begin Infeed Pick ;
 170:J P[1:Approach/Exit] 50% FINE    ;
 171:   ;
 172:L P[14:above infeed pick] 1500mm/sec FINE    ;
 173:   ;
 174:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 175:L P[2:On Part] 100mm/sec FINE SkipJump,LBL[1]    ;
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
 191:L PR[10:Measured Position] 500mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
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
 224:   ;
 225:L P[5:Pick from Zero] 700mm/sec FINE    ;
 226:   ;
 227:  WAIT    .25(sec) ;
 228:   ;
 229:  CALL ALL_VAC_ON    ;
 230:   ;
 231:  CALL MAG_GRIP_ON    ;
 232:   ;
 233:  WAIT    .25(sec) ;
 234:   ;
 235:L P[41:Above Zero] 1000mm/sec CNT50    ;
 236:   ;
 237:L P[3:Approach/Exit] 700mm/sec CNT50    ;
 238:  !End Zero ;
 239:   ;
 240:  !Begin Bend 1 ;
 241:  UFRAME_NUM=4 ;
 242:   ;
 243:J P[6:Transition to Press] 50% CNT25    ;
 244:   ;
 245:J P[7:Avoid Collision] 50% CNT50    ;
 246:   ;
 247:J P[8:Rotate to Press Orientation] 50% CNT50    ;
 248:   ;
 249:J P[55:ROTATE OFF ARM] 50% FINE    ;
 250:   ;
 251:L P[56:MOVE AWAY FROM ELBOW] 2000mm/sec CNT25    ;
 252:   ;
 253:L P[42:Keep Part Off Arm] 700mm/sec CNT25    ;
 254:   ;
 255:L P[9:Approach Press] 2000mm/sec CNT25    ;
 256:   ;
 257:  CALL PRE_BG    ;
 258:   ;
 259:L P[10:In Press] 750mm/sec FINE    ;
 260:   ;
 261:L P[17:17:On Die] 250mm/sec FINE    ;
 262:   ;
 263:L P[43: 43:At Back Gauge] 100mm/sec FINE    ;
 264:   ;
 265:  CALL ADJ_BG    ;
 266:   ;
 267:  WAIT    .25(sec) ;
 268:   ;
 269:  CALL PINCH    ;
 270:   ;
 271:  WAIT    .25(sec) ;
 272:   ;
 273:  CALL ALL_VAC_OFF    ;
 274:   ;
 275:  CALL MAG_GRIP_OFF    ;
 276:   ;
 277:  WAIT   1.00(sec) ;
 278:   ;
 279:  CALL BEND    ;
 280:   ;
 281:  !Change time for wait and next ;
 282:  !Waypoint to adjust follow ;
 283:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 284:   ;
 285:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 286:L P[11:Bend 1 Pick] 0.3sec FINE SkipJump,LBL[100]    ;
 287:   ;
 288:  LBL[100] ;
 289:   ;
 290:  DO[27:RB_PEDALDN]=OFF ;
 291:   ;
 292:L P[11:Bend 1 Pick] 0.3sec FINE    ;
 293:   ;
 294:  WAIT    .25(sec) ;
 295:   ;
 296:  CALL ALL_VAC_ON    ;
 297:   ;
 298:  CALL MAG_GRIP_ON    ;
 299:   ;
 300:  WAIT   1.00(sec) ;
 301:   ;
 302:  CALL OPEN_PRESS    ;
 303:   ;
 304:  WAIT    .25(sec) ;
 305:   ;
 306:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 307:   ;
 308:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 309:  !End Bend 1 ;
 310:   ;
 311:   ;
 312:L P[25:lower to press] 1500mm/sec FINE    ;
 313:   ;
 314:L P[27:get behind part] 1500mm/sec FINE    ;
 315:   ;
 316:  !Bend 2 Sequence ;
 317:  UFRAME_NUM=4 ;
 318:   ;
 319:L P[57:rotate to press] 1500mm/sec CNT5    ;
 320:   ;
 321:  CALL PRE_BG    ;
 322:   ;
 323:   ;
 324:L P[18:Part Insert in Press] 480mm/sec FINE    ;
 325:   ;
 326:L P[26:on die] 500mm/sec FINE    ;
 327:   ;
 328:L P[19:In Press] 50mm/sec FINE    ;
 329:   ;
 330:  CALL ADJ_BG    ;
 331:   ;
 332:  WAIT    .25(sec) ;
 333:   ;
 334:  CALL PINCH    ;
 335:   ;
 336:  WAIT    .25(sec) ;
 337:   ;
 338:  CALL ALL_VAC_OFF    ;
 339:   ;
 340:  CALL MAG_GRIP_OFF    ;
 341:   ;
 342:L P[28:pull off part] 1500mm/sec FINE    ;
 343:   ;
 344:  WAIT    .25(sec) ;
 345:   ;
 346:  CALL BEND    ;
 347:   ;
 348:  WAIT   1.00(sec) ;
 349:   ;
 350:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 351:   ;
 352:L P[16:get around arm ] 1500mm/sec FINE SkipJump,LBL[103]    ;
 353:   ;
 354:  LBL[103] ;
 355:   ;
 356:  DO[27:RB_PEDALDN]=OFF ;
 357:   ;
 358:  !Change time for wait and next ;
 359:  !Waypoint to adjust follow ;
 360:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 361:   ;
 362:L P[30:under pick] 700mm/sec FINE    ;
 363:   ;
 364:L P[20:Bend 2 Pick] 0.5sec FINE SkipJump,LBL[101]    ;
 365:   ;
 366:  LBL[101] ;
 367:   ;
 368:  DO[27:RB_PEDALDN]=OFF ;
 369:   ;
 370:L P[20:Bend 2 Pick] 0.3sec FINE    ;
 371:   ;
 372:  WAIT    .25(sec) ;
 373:   ;
 374:  CALL ALL_VAC_ON    ;
 375:   ;
 376:  CALL MAG_GRIP_ON    ;
 377:   ;
 378:  WAIT   1.00(sec) ;
 379:   ;
 380:  CALL OPEN_PRESS    ;
 381:   ;
 382:  WAIT    .25(sec) ;
 383:   ;
 384:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 385:   ;
 386:L P[22:Pull Part out of Press] 700mm/sec CNT25    ;
 387:  !End Bend 2 ;
 388:   ;
 389:  !Bend 3 Sequence ;
 390:  UFRAME_NUM=4 ;
 391:   ;
 392:  CALL PRE_BG    ;
 393:   ;
 394:L P[53:Rotate for Insert] 1000mm/sec FINE    ;
 395:   ;
 396:L P[54:Insert in Press] 700mm/sec FINE    ;
 397:   ;
 398:L P[59:ON DIE] 750mm/sec FINE    ;
 399:   ;
 400:L P[47:In Press] 100mm/sec FINE    ;
 401:   ;
 402:  CALL ADJ_BG    ;
 403:   ;
 404:  WAIT    .25(sec) ;
 405:   ;
 406:  CALL PINCH    ;
 407:   ;
 408:  WAIT    .25(sec) ;
 409:   ;
 410:  CALL ALL_VAC_OFF    ;
 411:   ;
 412:  CALL MAG_GRIP_OFF    ;
 413:   ;
 414:  WAIT   1.00(sec) ;
 415:   ;
 416:  CALL BEND    ;
 417:   ;
 418:  !Change time for wait and next ;
 419:  !Waypoint to adjust follow ;
 420:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 421:   ;
 422:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 423:  WAIT    .25(sec) ;
 424:   ;
 425:L P[32:clear arm] 1500mm/sec FINE    ;
 426:   ;
 427:L P[49:Bend 3 Pick] 0.5sec FINE SkipJump,LBL[102]    ;
 428:   ;
 429:  LBL[102] ;
 430:   ;
 431:  DO[27:RB_PEDALDN]=OFF ;
 432:   ;
 433:L P[49:Bend 3 Pick] 0.5sec FINE    ;
 434:   ;
 435:  WAIT    .25(sec) ;
 436:   ;
 437:  CALL ALL_VAC_ON    ;
 438:   ;
 439:  CALL MAG_GRIP_ON    ;
 440:   ;
 441:  WAIT   1.00(sec) ;
 442:   ;
 443:  CALL OPEN_PRESS    ;
 444:   ;
 445:  WAIT    .25(sec) ;
 446:   ;
 447:L P[50:Lift Part out of Die] 700mm/sec FINE    ;
 448:   ;
 449:L P[51:Rotate for Clearance] 750mm/sec CNT25    ;
 450:   ;
 451:L P[52:Pull Part out of Press] 700mm/sec CNT50    ;
 452:  !End Bend 3 ;
 453:   ;
 454:  UFRAME_NUM=4 ;
 455:   ;
 456:J P[31:Rotation for Outfeed] 50% FINE    ;
 457:   ;
 458:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 459:   ;
 460:  !Outfeed Pallet Sequence ;
 461:  UFRAME_NUM=6 ;
 462:   ;
 463:  PR[15,1:Pallet Offset]=0    ;
 464:  PR[15,2:Pallet Offset]=0    ;
 465:  PR[15,3:Pallet Offset]=0    ;
 466:   ;
 467:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 468:   ;
 469:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 470:   ;
 471:  IF (R[1:Layer Count]>1 AND R[1:Layer Count]<=3) THEN ;
 472:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-R[12:Part Offset 2]) ;
 473:  ENDIF ;
 474:   ;
 475:  IF (R[1:Layer Count]>=4 AND R[1:Layer Count]<6) THEN ;
 476:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[12:Part Offset 2]*2)) ;
 477:  ENDIF ;
 478:   ;
 479:  IF (R[1:Layer Count]=1 OR R[1:Layer Count]=3 OR R[1:Layer Count]=5) THEN ;
 480:  PR[15,3:Pallet Offset]=(50) ;
 481:  ENDIF ;
 482:   ;
 483:J P[93:Transition to Outfeed] 100% CNT50    ;
 484:   ;
 485:  WAIT (DI[32:RB_OUTFEED_SET]=ON)    ;
 486:   ;
 487:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 488:   ;
 489:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 490:   ;
 491:L P[36:Place Part in Outfeed Pallet] 250mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 492:   ;
 493:  WAIT    .25(sec) ;
 494:   ;
 495:  CALL ALL_VAC_OFF    ;
 496:   ;
 497:  CALL MAG_GRIP_OFF    ;
 498:   ;
 499:  WAIT    .25(sec) ;
 500:   ;
 501:L P[37:Pull Away from Part] 4000mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 502:   ;
 503:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 504:   ;
 505:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 506:   ;
 507:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 508:   ;
 509:  R[10:Current Part]=R[10:Current Part]+1    ;
 510:   ;
 511:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 512:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 513:  ENDIF ;
 514:   ;
 515:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 516:  R[1:Layer Count]=0    ;
 517:  R[2:Pallet Count]=0    ;
 518:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 519:  ENDIF ;
 520:   ;
 521:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
 522:  R[1:Layer Count]=0    ;
 523:  R[2:Pallet Count]=0    ;
 524:  R[10:Current Part]=1    ;
 525:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 526:  PAUSE ;
 527:  ENDIF ;
 528:   ;
 529:  F[1:First Part]=(OFF) ;
 530:   ;
 531:  CALL END_PART    ;
 532:   ;
 533:  JMP LBL[2] ;
/POS
P[1:"Approach/Exit"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   725.630  mm,	Y =  3670.446  mm,	Z =   649.403  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
	E1=  3750.000  mm
};
P[2:"On Part"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   727.000  mm,	Y =  3668.000  mm,	Z =     4.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  3750.000  mm
};
P[3:"Approach/Exit"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1295.879  mm,	Y =   841.868  mm,	Z =  1123.074  mm,
	W =   175.343 deg,	P =    -4.139 deg,	R =    91.967 deg,
	E1=  1040.082  mm
};
P[4:"Place in Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1238.749  mm,	Y =   606.074  mm,	Z =    25.914  mm,
	W =  -179.872 deg,	P =     -.149 deg,	R =    89.737 deg,
	E1=   302.051  mm
};
P[5:"Pick from Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1117.098  mm,	Y =   778.722  mm,	Z =    -5.255  mm,
	W =  -179.906 deg,	P =     -.171 deg,	R =    91.110 deg,
	E1=   300.031  mm
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
	X =  -167.688  mm,	Y = -2325.269  mm,	Z =   985.034  mm,
	W =     2.642 deg,	P =   -42.252 deg,	R =   168.170 deg,
	E1=  3961.020  mm
};
P[8:"Rotate to Press Orientation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -167.688  mm,	Y = -2325.269  mm,	Z =   985.034  mm,
	W =    42.309 deg,	P =    -1.044 deg,	R =    83.243 deg,
	E1=  3961.020  mm
};
P[9:"Approach Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    84.757  mm,	Y = -1141.560  mm,	Z =    72.235  mm,
	W =     -.885 deg,	P =     1.627 deg,	R =    88.724 deg,
	E1=  4164.750  mm
};
P[10:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    84.582  mm,	Y =  -849.295  mm,	Z =    68.532  mm,
	W =     -.885 deg,	P =     1.627 deg,	R =    88.724 deg,
	E1=  3914.641  mm
};
P[11:"Bend 1 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    61.867  mm,	Y =  -670.245  mm,	Z =   506.159  mm,
	W =      .435 deg,	P =    39.927 deg,	R =    90.339 deg,
	E1=  3299.728  mm
};
P[12:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.331  mm,	Y =  -749.702  mm,	Z =   833.939  mm,
	W =    -1.909 deg,	P =    43.565 deg,	R =    89.723 deg,
	E1=  3299.215  mm
};
P[13:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.766  mm,	Y = -1472.501  mm,	Z =   843.091  mm,
	W =  -174.636 deg,	P =    87.936 deg,	R =   -84.617 deg,
	E1=  3299.215  mm
};
P[14:"above infeed pick"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   726.354  mm,	Y =  3669.015  mm,	Z =   270.935  mm,
	W =  -180.000 deg,	P =     -.000 deg,	R =      .000 deg,
	E1=  3749.995  mm
};
P[16:"get around arm "]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.156  mm,	Y = -1777.295  mm,	Z =   326.703  mm,
	W =    37.156 deg,	P =    88.749 deg,	R =   126.771 deg,
	E1=    44.413  mm
};
P[17:"17:On Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    93.761  mm,	Y =  -840.891  mm,	Z =    22.681  mm,
	W =     -.046 deg,	P =     2.525 deg,	R =    88.532 deg,
	E1=  3914.641  mm
};
P[18:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.639  mm,	Y =  -729.481  mm,	Z =    40.275  mm,
	W =   179.682 deg,	P =      .950 deg,	R =   -90.071 deg,
	E1=  2066.769  mm
};
P[19:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.581  mm,	Y =  -718.968  mm,	Z =   -14.947  mm,
	W =   179.498 deg,	P =      .721 deg,	R =   -90.181 deg,
	E1=  2066.769  mm
};
P[20:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.796  mm,	Y =  -821.182  mm,	Z =   577.477  mm,
	W =      .964 deg,	P =    36.158 deg,	R =    90.970 deg,
	E1=    44.400  mm
};
P[21:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.820  mm,	Y =  -820.233  mm,	Z =   652.471  mm,
	W =      .964 deg,	P =    36.158 deg,	R =    90.970 deg,
	E1=    44.400  mm
};
P[22:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.808  mm,	Y =  -911.297  mm,	Z =   709.311  mm,
	W =     2.352 deg,	P =    36.132 deg,	R =    91.775 deg,
	E1=    44.411  mm
};
P[25:"lower to press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.709  mm,	Y =  -973.216  mm,	Z =    50.277  mm,
	W =  -179.862 deg,	P =    29.431 deg,	R =   -89.755 deg,
	E1=  3414.035  mm
};
P[26:"on die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.589  mm,	Y =  -732.467  mm,	Z =   -14.776  mm,
	W =   179.498 deg,	P =      .721 deg,	R =   -90.181 deg,
	E1=  2066.769  mm
};
P[27:"get behind part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.667  mm,	Y =  -873.971  mm,	Z =    -9.914  mm,
	W =  -179.922 deg,	P =    13.077 deg,	R =   -89.782 deg,
	E1=  2066.769  mm
};
P[28:"pull off part"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    19.058  mm,	Y = -1740.135  mm,	Z =   450.878  mm,
	W =    13.960 deg,	P =    89.398 deg,	R =   104.514 deg,
	E1=  2066.769  mm
};
P[30:"under pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.451  mm,	Y = -1165.790  mm,	Z =   134.304  mm,
	W =     1.635 deg,	P =    58.344 deg,	R =    91.465 deg,
	E1=    44.400  mm
};
P[31:"Rotation for Outfeed"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =  -724.722  mm,	Y = -2753.198  mm,	Z =   582.065  mm,
	W =     3.947 deg,	P =    45.443 deg,	R =  -179.369 deg,
	E1=   300.843  mm
};
P[32:"clear arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.670  mm,	Y =  -812.776  mm,	Z =    83.307  mm,
	W =     1.504 deg,	P =    40.544 deg,	R =    91.340 deg,
	E1=    85.876  mm
};
P[33:"Move Part to Left Side of Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -724.822  mm,	Y = -2749.225  mm,	Z =   895.950  mm,
	W =  -120.840 deg,	P =   -86.787 deg,	R =   122.018 deg,
	E1=   300.843  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -452.495  mm,	Y =  1946.230  mm,	Z =  1763.905  mm,
	W =   -79.326 deg,	P =   -89.078 deg,	R =  -101.298 deg,
	E1=  6180.377  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, -1, 1',
	X =   107.827  mm,	Y =  2011.466  mm,	Z =  1430.685  mm,
	W =   -79.388 deg,	P =   -89.078 deg,	R =  -101.236 deg,
	E1=  6453.063  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, -1, 1',
	X =   128.002  mm,	Y =  2014.177  mm,	Z =   876.029  mm,
	W =   -79.387 deg,	P =   -89.078 deg,	R =  -101.237 deg,
	E1=  5623.334  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -281.288  mm,	Y =  1994.861  mm,	Z =   879.539  mm,
	W =   -76.055 deg,	P =   -89.076 deg,	R =  -103.751 deg,
	E1=  5829.862  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -567.703  mm,	Y =  1947.453  mm,	Z =  1473.039  mm,
	W =   -77.251 deg,	P =   -89.080 deg,	R =  -103.404 deg,
	E1=  6390.044  mm
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
	X =  1319.042  mm,	Y =  1048.919  mm,	Z =   501.789  mm,
	W =   175.343 deg,	P =    -4.139 deg,	R =    91.967 deg,
	E1=   384.795  mm
};
P[42:"Keep Part Off Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    84.843  mm,	Y = -1283.979  mm,	Z =    74.040  mm,
	W =     -.876 deg,	P =     1.627 deg,	R =    89.424 deg,
	E1=  4262.410  mm
};
P[43:" 43:At Back Gauge"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    70.996  mm,	Y =  -806.497  mm,	Z =    21.494  mm,
	W =     -.044 deg,	P =     2.528 deg,	R =    88.830 deg,
	E1=  3888.331  mm
};
P[47:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.643  mm,	Y =  -816.908  mm,	Z =    -6.328  mm,
	W =      .912 deg,	P =      .087 deg,	R =    90.724 deg,
	E1=   120.508  mm
};
P[49:"Bend 3 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.909  mm,	Y =  -633.576  mm,	Z =   498.572  mm,
	W =     1.473 deg,	P =    39.490 deg,	R =    91.320 deg,
	E1=   300.843  mm
};
P[50:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.927  mm,	Y =  -632.844  mm,	Z =   556.424  mm,
	W =     1.341 deg,	P =    34.664 deg,	R =    91.242 deg,
	E1=   300.843  mm
};
P[51:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.927  mm,	Y =  -632.844  mm,	Z =   556.424  mm,
	W =     1.684 deg,	P =    46.051 deg,	R =    91.462 deg,
	E1=   300.843  mm
};
P[52:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.591  mm,	Y = -1189.585  mm,	Z =   563.474  mm,
	W =     1.684 deg,	P =    46.051 deg,	R =    91.462 deg,
	E1=   300.843  mm
};
P[53:"Rotate for Insert"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.616  mm,	Y =  -919.032  mm,	Z =    98.475  mm,
	W =      .917 deg,	P =      .088 deg,	R =    91.077 deg,
	E1=    44.411  mm
};
P[54:"Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.657  mm,	Y =  -834.849  mm,	Z =    61.691  mm,
	W =      .916 deg,	P =      .088 deg,	R =    91.077 deg,
	E1=   102.443  mm
};
P[55:"ROTATE OFF ARM"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -158.420  mm,	Y = -1794.953  mm,	Z =   980.815  mm,
	W =     2.597 deg,	P =     1.152 deg,	R =    89.472 deg,
	E1=  4430.909  mm
};
P[56:"MOVE AWAY FROM ELBOW"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   -83.423  mm,	Y = -1473.227  mm,	Z =   433.842  mm,
	W =     -.876 deg,	P =     1.626 deg,	R =    89.416 deg,
	E1=  4430.896  mm
};
P[57:"rotate to press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    18.658  mm,	Y =  -873.532  mm,	Z =    24.726  mm,
	W =  -179.951 deg,	P =      .939 deg,	R =   -90.572 deg,
	E1=  2066.769  mm
};
P[59:"ON DIE"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 1, 0',
	X =   -83.636  mm,	Y =  -835.708  mm,	Z =    -6.089  mm,
	W =      .912 deg,	P =      .088 deg,	R =    90.723 deg,
	E1=   102.443  mm
};
P[93:"Transition to Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X = -2914.028  mm,	Y =  1906.274  mm,	Z =  1455.961  mm,
	W =    -4.453 deg,	P =   -75.732 deg,	R =   150.876 deg,
	E1=  4043.633  mm
};
/END
