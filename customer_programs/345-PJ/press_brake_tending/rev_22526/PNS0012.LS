/PROG  PNS0012
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5352685";
PROG_SIZE	= 11737;
CREATE		= DATE 25-10-01  TIME 13:35:12;
MODIFIED	= DATE 25-12-18  TIME 22:42:02;
FILE_NAME	= PART_PRO;
VERSION		= 0;
LINE_COUNT	= 539;
MEMORY_SIZE	= 12245;
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
   1:  !PART #: 5352685 ;
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
 167:  UFRAME_NUM=Constant ;
 168:   ;
 169:  !Begin Infeed Pick ;
 170:J P[1:Approach/Exit] 50% FINE    ;
 171:   ;
 172:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 173:L P[2:On Part] 700mm/sec FINE SkipJump,LBL[1]    ;
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
 189:L PR[10:Measured Position] 700mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
 190:   ;
 191:   ;
 192:  WAIT    .25(sec) ;
 193:   ;
 194:  CALL ALL_VAC_ON    ;
 195:   ;
 196:  WAIT    .25(sec) ;
 197:   ;
 198:L P[1:Approach/Exit] 700mm/sec FINE    ;
 199:   ;
 200:  CALL MAG_GRIP_ON    ;
 201:  !End Infeed Pick ;
 202:   ;
 203:  !Begin Zero ;
 204:  UFRAME_NUM=3 ;
 205:   ;
 206:J P[39:Rotate Torwards Zero] 100% CNT50    ;
 207:   ;
 208:J P[3:Approach/Exit] 50% CNT50    ;
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
 236:L P[41:Above Zero] 100mm/sec CNT50    ;
 237:   ;
 238:L P[3:Approach/Exit] 700mm/sec CNT50    ;
 239:  !End Zero ;
 240:   ;
 241:  !Begin Bend 1 ;
 242:  UFRAME_NUM=4 ;
 243:   ;
 244:J P[6:Transition to Press] 50% CNT25    ;
 245:   ;
 246:J P[7:Avoid Collision] 50% CNT50    ;
 247:   ;
 248:J P[8:Rotate to Press Orientation] 50% CNT50    ;
 249:   ;
 250:L P[42:Keep Part Off Arm] 100mm/sec CNT25    ;
 251:   ;
 252:L P[9:Approach Press] 2000mm/sec CNT25    ;
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
 274:  !Change time for wait and next ;
 275:  !Waypoint to adjust follow ;
 276:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 277:   ;
 278:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 279:L P[11:Bend 1 Pick] 1.0sec FINE SkipJump,LBL[100]    ;
 280:   ;
 281:  LBL[100] ;
 282:   ;
 283:  DO[27:RB_PEDALDN]=OFF ;
 284:   ;
 285:L P[11:Bend 1 Pick] 1.0sec FINE    ;
 286:   ;
 287:  WAIT    .25(sec) ;
 288:   ;
 289:  CALL ALL_VAC_ON    ;
 290:   ;
 291:  CALL MAG_GRIP_ON    ;
 292:   ;
 293:  WAIT   1.00(sec) ;
 294:   ;
 295:  CALL OPEN_PRESS    ;
 296:   ;
 297:  WAIT    .25(sec) ;
 298:   ;
 299:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 300:   ;
 301:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 302:  !End Bend 1 ;
 303:   ;
 304:  !Bend 2 Sequence ;
 305:  UFRAME_NUM=4 ;
 306:   ;
 307:  CALL PRE_BG    ;
 308:   ;
 309:L P[9:Approach Press] 2000mm/sec FINE    ;
 310:   ;
 311:L P[14:In Front of Press] 1500mm/sec CNT50    ;
 312:   ;
 313:L P[18:Part Insert in Press] 750mm/sec FINE    ;
 314:   ;
 315:L P[19:In Press] 700mm/sec FINE    ;
 316:   ;
 317:  CALL ADJ_BG    ;
 318:   ;
 319:  WAIT    .25(sec) ;
 320:   ;
 321:  CALL PINCH    ;
 322:   ;
 323:  WAIT    .25(sec) ;
 324:   ;
 325:  CALL ALL_VAC_OFF    ;
 326:   ;
 327:  CALL MAG_GRIP_OFF    ;
 328:   ;
 329:  WAIT   1.00(sec) ;
 330:   ;
 331:  CALL BEND    ;
 332:   ;
 333:  !Change time for wait and next ;
 334:  !Waypoint to adjust follow ;
 335:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 336:   ;
 337:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 338:L P[20:Bend 2 Pick] 1.0sec FINE SkipJump,LBL[101]    ;
 339:   ;
 340:  LBL[101] ;
 341:   ;
 342:  DO[27:RB_PEDALDN]=OFF ;
 343:   ;
 344:L P[20:Bend 2 Pick] 1.0sec FINE    ;
 345:   ;
 346:  WAIT    .25(sec) ;
 347:   ;
 348:  CALL ALL_VAC_ON    ;
 349:   ;
 350:  CALL MAG_GRIP_ON    ;
 351:   ;
 352:  WAIT   1.00(sec) ;
 353:   ;
 354:  CALL OPEN_PRESS    ;
 355:   ;
 356:  WAIT    .25(sec) ;
 357:   ;
 358:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 359:   ;
 360:L P[15:Rotate for Clearance] 750mm/sec CNT25    ;
 361:   ;
 362:L P[22:Pull Part out of Press] 700mm/sec CNT50    ;
 363:  !End Bend 2 ;
 364:   ;
 365:  !Start Regrip/Flip ;
 366:  UFRAME_NUM=5 ;
 367:   ;
 368:L P[16:Transition to Regrip] 1500mm/sec CNT50    ;
 369:   ;
 370:L P[43:Over Regrip] 1500mm/sec CNT50    ;
 371:   ;
 372:L P[44:In Outfeed] 700mm/sec FINE    ;
 373:   ;
 374:  WAIT    .75(sec) ;
 375:   ;
 376:  CALL ALL_VAC_OFF    ;
 377:   ;
 378:  CALL MAG_GRIP_OFF    ;
 379:   ;
 380:  WAIT    .25(sec) ;
 381:   ;
 382:L P[17:Pull Away From Part] 700mm/sec FINE    ;
 383:   ;
 384:L P[45:Clear Regrip Arms] 1500mm/sec CNT50    ;
 385:   ;
 386:L P[46:Prep for Rotating Wrist] 1500mm/sec CNT50    ;
 387:   ;
 388:J P[47:Rotate Wrist] 50% CNT50    ;
 389:   ;
 390:L P[48:Above regrip Pick] 1500mm/sec CNT50    ;
 391:   ;
 392:L P[49:Regrip Pick] 700mm/sec FINE    ;
 393:   ;
 394:  WAIT    .25(sec) ;
 395:   ;
 396:  CALL ALL_VAC_ON    ;
 397:   ;
 398:  CALL MAG_GRIP_ON    ;
 399:   ;
 400:  WAIT    .25(sec) ;
 401:   ;
 402:L P[50:Pull Part Off Regrip] 1500mm/sec CNT50    ;
 403:   ;
 404:L P[51:Exit Regrip] 1500mm/sec CNT50    ;
 405:  !End Regrip/Flip ;
 406:   ;
 407:  !Bend 3 Sequence ;
 408:  UFRAME_NUM=4 ;
 409:   ;
 410:  CALL PRE_BG    ;
 411:   ;
 412:J P[23:Prep for Rotation to Bend 3] 100% CNT100    ;
 413:   ;
 414:J P[24:Rotate to Bend 3] 50% FINE    ;
 415:   ;
 416:L P[25:Rotate for Part Entry] 1500mm/sec CNT50    ;
 417:   ;
 418:L P[26:Lower Part for Press Entry] 1500mm/sec CNT50    ;
 419:   ;
 420:L P[27:In Press] 700mm/sec FINE    ;
 421:   ;
 422:  CALL PINCH    ;
 423:   ;
 424:  WAIT    .25(sec) ;
 425:   ;
 426:  CALL ALL_VAC_OFF    ;
 427:   ;
 428:  CALL MAG_GRIP_OFF    ;
 429:   ;
 430:  WAIT   1.00(sec) ;
 431:   ;
 432:  CALL BEND    ;
 433:   ;
 434:  !Change time for wait and next ;
 435:  !Waypoint to adjust follow ;
 436:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 437:   ;
 438:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 439:L P[28:Bend 3 Pick] 1.0sec FINE SkipJump,LBL[102]    ;
 440:   ;
 441:  DO[27:RB_PEDALDN]=OFF ;
 442:   ;
 443:L P[28:Bend 3 Pick] 1.0sec FINE    ;
 444:   ;
 445:  WAIT    .25(sec) ;
 446:   ;
 447:  CALL ALL_VAC_ON    ;
 448:   ;
 449:  CALL MAG_GRIP_ON    ;
 450:   ;
 451:  WAIT   1.00(sec) ;
 452:   ;
 453:  CALL OPEN_PRESS    ;
 454:   ;
 455:  WAIT    .25(sec) ;
 456:   ;
 457:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 458:   ;
 459:L P[30:Pull Part out of Press] 1500mm/sec CNT50    ;
 460:  !End Bend 3 ;
 461:   ;
 462:J P[31:Prep for Rotation] 50% FINE    ;
 463:   ;
 464:J P[32:Rotate to Outfeed Vertical Orien] 50% FINE    ;
 465:   ;
 466:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 467:   ;
 468:  !Outfeed Pallet Sequence ;
 469:  UFRAME_NUM=6 ;
 470:   ;
 471:  PR[15,1:Pallet Offset]=0    ;
 472:  PR[15,2:Pallet Offset]=0    ;
 473:  PR[15,3:Pallet Offset]=0    ;
 474:   ;
 475:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 476:   ;
 477:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 478:   ;
 479:  IF (R[1:Layer Count]>1 AND R[1:Layer Count]<=3) THEN ;
 480:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-R[12:Part Offset 2]) ;
 481:  ENDIF ;
 482:   ;
 483:  IF (R[1:Layer Count]>=4 AND R[1:Layer Count]<6) THEN ;
 484:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[12:Part Offset 2]*2)) ;
 485:  ENDIF ;
 486:   ;
 487:  IF (R[1:Layer Count]=1 OR R[1:Layer Count]=3 OR R[1:Layer Count]=5) THEN ;
 488:  PR[15,3:Pallet Offset]=(50) ;
 489:  ENDIF ;
 490:   ;
 491:  WAIT (DI[32:RB_OUTFEED_SET]=ON)    ;
 492:   ;
 493:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 494:   ;
 495:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 496:   ;
 497:L P[36:Place Part in Outfeed Pallet] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 498:   ;
 499:  WAIT    .25(sec) ;
 500:   ;
 501:  CALL ALL_VAC_OFF    ;
 502:   ;
 503:  CALL MAG_GRIP_OFF    ;
 504:   ;
 505:  WAIT    .25(sec) ;
 506:   ;
 507:L P[37:Pull Away from Part] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 508:   ;
 509:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 510:   ;
 511:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 512:   ;
 513:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 514:   ;
 515:  R[10:Current Part]=R[10:Current Part]+1    ;
 516:   ;
 517:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 518:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 519:  ENDIF ;
 520:   ;
 521:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 522:  R[1:Layer Count]=0    ;
 523:  R[2:Pallet Count]=0    ;
 524:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 525:  ENDIF ;
 526:   ;
 527:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
 528:  R[1:Layer Count]=0    ;
 529:  R[2:Pallet Count]=0    ;
 530:  R[10:Current Part]=1    ;
 531:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 532:  PAUSE ;
 533:  ENDIF ;
 534:   ;
 535:  F[1:First Part]=(OFF) ;
 536:   ;
 537:  CALL END_PART    ;
 538:   ;
 539:  JMP LBL[2] ;
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
	X =  1232.142  mm,	Y =   628.387  mm,	Z =    -2.000  mm,
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
	X =   109.923  mm,	Y =  -499.908  mm,	Z =    -7.348  mm,
	W =      .244 deg,	P =     -.103 deg,	R =   -89.490 deg,
	E1=  3345.277  mm
};
P[11:"Bend 1 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   108.915  mm,	Y =  -343.592  mm,	Z =   259.306  mm,
	W =     -.153 deg,	P =   -40.565 deg,	R =   -89.358 deg,
	E1=  3345.282  mm
};
P[12:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   108.898  mm,	Y =  -342.922  mm,	Z =   312.230  mm,
	W =     -.153 deg,	P =   -40.565 deg,	R =   -89.358 deg,
	E1=  3345.282  mm
};
P[13:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   108.996  mm,	Y =  -504.480  mm,	Z =   314.276  mm,
	W =     -.153 deg,	P =   -40.565 deg,	R =   -89.358 deg,
	E1=  3345.282  mm
};
P[14:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   109.813  mm,	Y =  -500.027  mm,	Z =    -7.293  mm,
	W =      .245 deg,	P =     -.104 deg,	R =   -89.490 deg,
	E1=  3345.519  mm
};
P[15:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.603  mm,	Y =  -308.719  mm,	Z =   317.285  mm,
	W =     -.740 deg,	P =   -68.214 deg,	R =   -89.013 deg,
	E1=  3059.733  mm
};
P[16:"Transition to Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1390.718  mm,	Y =   555.024  mm,	Z =  1203.839  mm,
	W =   -93.613 deg,	P =   -70.197 deg,	R =     4.161 deg,
	E1=  1250.000  mm
};
P[17:"Pull Away From Part"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1194.133  mm,	Y =   -65.197  mm,	Z =   253.994  mm,
	W =  -108.146 deg,	P =   -89.311 deg,	R =    18.306 deg,
	E1=  1315.194  mm
};
P[18:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   114.969  mm,	Y =  -313.538  mm,	Z =     -.742  mm,
	W =      .245 deg,	P =     -.103 deg,	R =   -89.491 deg,
	E1=  3135.223  mm
};
P[19:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   114.934  mm,	Y =  -312.867  mm,	Z =   -11.109  mm,
	W =      .245 deg,	P =     -.104 deg,	R =   -89.490 deg,
	E1=  3135.232  mm
};
P[20:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.592  mm,	Y =  -225.132  mm,	Z =   162.225  mm,
	W =     -.153 deg,	P =   -40.310 deg,	R =   -89.495 deg,
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
P[23:"Prep for Rotation to Bend 3"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1440.628  mm,	Y = -1798.498  mm,	Z =   437.875  mm,
	W =  -177.775 deg,	P =   -75.081 deg,	R =    21.395 deg,
	E1=  2011.864  mm
};
P[24:"Rotate to Bend 3"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, -1',
	X =  1440.629  mm,	Y = -1798.499  mm,	Z =   437.875  mm,
	W =  -171.985 deg,	P =   -75.161 deg,	R =    70.714 deg,
	E1=  2723.563  mm
};
P[25:"Rotate for Part Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   228.307  mm,	Y =  -763.458  mm,	Z =   380.019  mm,
	W =     -.801 deg,	P =   -19.587 deg,	R =   -88.301 deg,
	E1=  3529.864  mm
};
P[26:"Lower Part for Press Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   228.272  mm,	Y =  -566.141  mm,	Z =   104.784  mm,
	W =     -.476 deg,	P =    -8.460 deg,	R =   -88.376 deg,
	E1=  3400.753  mm
};
P[27:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    87.930  mm,	Y =  -427.934  mm,	Z =    -8.809  mm,
	W =      .320 deg,	P =    -1.113 deg,	R =   -89.303 deg,
	E1=  3358.132  mm
};
P[28:"Bend 3 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    87.372  mm,	Y =  -311.371  mm,	Z =   281.699  mm,
	W =     -.426 deg,	P =   -45.446 deg,	R =   -88.920 deg,
	E1=  3358.100  mm
};
P[29:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    87.310  mm,	Y =  -310.229  mm,	Z =   369.522  mm,
	W =     -.426 deg,	P =   -45.447 deg,	R =   -88.919 deg,
	E1=  3358.100  mm
};
P[30:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =    87.576  mm,	Y =  -752.479  mm,	Z =   375.122  mm,
	W =     -.426 deg,	P =   -45.447 deg,	R =   -88.919 deg,
	E1=  3358.100  mm
};
P[31:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 1, -1',
	X = -1022.343  mm,	Y = -1126.166  mm,	Z =   844.182  mm,
	W =   -18.416 deg,	P =   -87.730 deg,	R =   -71.228 deg,
	E1=  3358.100  mm
};
P[32:"Rotate to Outfeed Vertical Orien"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.647  mm,	Y =  -605.916  mm,	Z =   688.787  mm,
	W =  -111.925 deg,	P =   -89.020 deg,	R =    22.069 deg,
	E1=  3255.056  mm
};
P[33:"Move Part to Left Side of Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X = -2480.074  mm,	Y = -1425.627  mm,	Z =   698.351  mm,
	W =  -111.926 deg,	P =   -89.020 deg,	R =    22.070 deg,
	E1=  3255.056  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -613.716  mm,	Y =  1167.333  mm,	Z =  1820.350  mm,
	W =      .003 deg,	P =    87.000 deg,	R =      .002 deg,
	E1=  7000.000  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   952.281  mm,	Y =  1167.350  mm,	Z =  1820.360  mm,
	W =      .000 deg,	P =    87.000 deg,	R =      .000 deg,
	E1=  8000.000  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   952.280  mm,	Y =  1167.350  mm,	Z =   623.360  mm,
	W =     -.000 deg,	P =    87.000 deg,	R =     -.000 deg,
	E1=  8000.000  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.279  mm,	Y =  1167.350  mm,	Z =   623.360  mm,
	W =     -.000 deg,	P =    87.000 deg,	R =     -.000 deg,
	E1=  8000.000  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.279  mm,	Y =  1167.350  mm,	Z =  1830.360  mm,
	W =     -.000 deg,	P =    87.000 deg,	R =     -.000 deg,
	E1=  8000.000  mm
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
P[43:"Over Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1194.138  mm,	Y =   219.926  mm,	Z =  1043.649  mm,
	W =   179.528 deg,	P =   -88.896 deg,	R =    91.912 deg,
	E1=  1375.100  mm
};
P[44:"In Outfeed"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1194.131  mm,	Y =    14.811  mm,	Z =   253.986  mm,
	W =  -108.148 deg,	P =   -89.312 deg,	R =    18.308 deg,
	E1=  1315.194  mm
};
P[45:"Clear Regrip Arms"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1146.970  mm,	Y =  -478.420  mm,	Z =  1494.688  mm,
	W =  -108.146 deg,	P =   -89.311 deg,	R =    18.306 deg,
	E1=  2623.743  mm
};
P[46:"Prep for Rotating Wrist"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =  1636.428  mm,	Y =   141.917  mm,	Z =  2361.756  mm,
	W =  -167.824 deg,	P =   -66.021 deg,	R =    77.765 deg,
	E1=  2623.743  mm
};
P[47:"Rotate Wrist"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1688.250  mm,	Y =  -409.655  mm,	Z =  2538.831  mm,
	W =  -127.587 deg,	P =    62.878 deg,	R =   140.734 deg,
	E1=  2623.743  mm
};
P[48:"Above regrip Pick"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1141.792  mm,	Y =   331.060  mm,	Z =   503.766  mm,
	W =  -168.410 deg,	P =    89.680 deg,	R =   104.481 deg,
	E1=   270.206  mm
};
P[49:"Regrip Pick"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1122.399  mm,	Y =     2.958  mm,	Z =   287.909  mm,
	W =   144.060 deg,	P =    89.513 deg,	R =    54.047 deg,
	E1=     6.742  mm
};
P[50:"Pull Part Off Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1881.788  mm,	Y =   323.983  mm,	Z =   543.260  mm,
	W =   144.057 deg,	P =    89.514 deg,	R =    54.045 deg,
	E1=     4.250  mm
};
P[51:"Exit Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.490  mm,	Y =  -169.282  mm,	Z =  2024.277  mm,
	W =   166.556 deg,	P =    69.033 deg,	R =    75.841 deg,
	E1=  1566.265  mm
};
/END
