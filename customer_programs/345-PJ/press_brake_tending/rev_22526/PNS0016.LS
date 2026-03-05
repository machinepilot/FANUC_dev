/PROG  PNS0016
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5354692";
PROG_SIZE	= 10694;
CREATE		= DATE 25-10-01  TIME 13:26:20;
MODIFIED	= DATE 26-02-25  TIME 16:06:28;
FILE_NAME	= PART_PRO;
VERSION		= 0;
LINE_COUNT	= 508;
MEMORY_SIZE	= 11198;
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
   1:  !PART #: 5354692 ;
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
 155:  !Top of Main Program Loop ;
 156:  LBL[2:Loop Program] ;
 157:   ;
 158:  CALL START_PART    ;
 159:   ;
 160:  IF (F[1:First Part]=ON),JMP LBL[99] ;
 161:   ;
 162:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
 163:   ;
 164:  LBL[99] ;
 165:   ;
 166:  !Begin Infeed Pick ;
 167:  UFRAME_NUM=1 ;
 168:   ;
 169:J P[1:Approach/Exit] 50% FINE    ;
 170:   ;
 171:L P[17:approach infeed] 1500mm/sec FINE    ;
 172:   ;
 173:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 174:L P[2:On Part] 75mm/sec FINE SkipJump,LBL[1]    ;
 175:   ;
 176:  !Recovery if no parts found ;
 177:L P[1:Approach/Exit] 700mm/sec FINE    ;
 178:   ;
 179:  CALL GO_HOME    ;
 180:   ;
 181:  UALM[1] ;
 182:   ;
 183:  ABORT ;
 184:  !End Recovery ;
 185:   ;
 186:  LBL[1] ;
 187:   ;
 188:  PR[10:Measured Position]=LPOS    ;
 189:   ;
 190:L PR[10:Measured Position] 700mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
 191:   ;
 192:   ;
 193:  WAIT    .25(sec) ;
 194:   ;
 195:  CALL ALL_VAC_ON    ;
 196:   ;
 197:  WAIT    .25(sec) ;
 198:   ;
 199:L P[1:Approach/Exit] 700mm/sec FINE    ;
 200:   ;
 201:  CALL MAG_GRIP_ON    ;
 202:  !End Infeed Pick ;
 203:   ;
 204:  !Begin Zero ;
 205:  UFRAME_NUM=3 ;
 206:   ;
 207:J P[39:Rotate Torwards Zero] 100% CNT50    ;
 208:   ;
 209:J P[3:Approach/Exit] 50% CNT50    ;
 210:   ;
 211:L P[41:Above Zero] 1500mm/sec CNT100    ;
 212:   ;
 213:L P[4:Place in Zero] 700mm/sec FINE    ;
 214:   ;
 215:  WAIT    .25(sec) ;
 216:   ;
 217:  CALL ALL_VAC_OFF    ;
 218:   ;
 219:  CALL MAG_GRIP_OFF    ;
 220:   ;
 221:  WAIT    .25(sec) ;
 222:   ;
 223:L P[4:Place in Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 224:   ;
 225:L P[5:Pick from Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 226:   ;
 227:L P[5:Pick from Zero] 700mm/sec FINE    ;
 228:   ;
 229:  WAIT    .25(sec) ;
 230:   ;
 231:  CALL ALL_VAC_ON    ;
 232:   ;
 233:  CALL MAG_GRIP_ON    ;
 234:   ;
 235:  WAIT    .25(sec) ;
 236:   ;
 237:L P[41:Above Zero] 700mm/sec CNT50    ;
 238:   ;
 239:L P[3:Approach/Exit] 700mm/sec CNT50    ;
 240:  !End Zero ;
 241:   ;
 242:  !Begin Bend 1 ;
 243:  UFRAME_NUM=4 ;
 244:   ;
 245:J P[6:Transition to Press] 50% CNT25    ;
 246:   ;
 247:J P[7:Avoid Collision] 50% CNT50    ;
 248:   ;
 249:J P[8:Rotate to Press Orientation] 50% CNT50    ;
 250:   ;
 251:L P[42:Keep Part Off Arm] 700mm/sec CNT25    ;
 252:   ;
 253:L P[9:Approach Press] 2000mm/sec CNT25    ;
 254:   ;
 255:  CALL PRE_BG    ;
 256:   ;
 257:L P[10:In Press] 50mm/sec FINE    ;
 258:   ;
 259:  CALL ADJ_BG    ;
 260:   ;
 261:  WAIT    .25(sec) ;
 262:   ;
 263:  CALL PINCH    ;
 264:   ;
 265:  WAIT    .25(sec) ;
 266:   ;
 267:  CALL ALL_VAC_OFF    ;
 268:   ;
 269:  CALL MAG_GRIP_OFF    ;
 270:   ;
 271:  WAIT   1.00(sec) ;
 272:   ;
 273:  CALL BEND    ;
 274:   ;
 275:  !Change time for wait and next ;
 276:  !Waypoint to adjust follow ;
 277:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 278:   ;
 279:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 280:L P[11:Bend 1 Pick] 0.5sec FINE SkipJump,LBL[100]    ;
 281:   ;
 282:  LBL[100] ;
 283:   ;
 284:  DO[27:RB_PEDALDN]=OFF ;
 285:   ;
 286:  WAIT   1.00(sec) ;
 287:   ;
 288:L P[11:Bend 1 Pick] 0.5sec FINE    ;
 289:   ;
 290:  WAIT    .25(sec) ;
 291:   ;
 292:  CALL ALL_VAC_ON    ;
 293:   ;
 294:  CALL MAG_GRIP_ON    ;
 295:   ;
 296:  WAIT   1.00(sec) ;
 297:   ;
 298:  CALL OPEN_PRESS    ;
 299:   ;
 300:  WAIT    .25(sec) ;
 301:   ;
 302:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 303:   ;
 304:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 305:  !End Bend 1 ;
 306:   ;
 307:  !Bend 2 Sequence ;
 308:  UFRAME_NUM=4 ;
 309:   ;
 310:  CALL PRE_BG    ;
 311:   ;
 312:L P[9:Approach Press] 2000mm/sec FINE    ;
 313:   ;
 314:L P[14:In Front of Press] 1500mm/sec CNT50    ;
 315:   ;
 316:L P[18:Part Insert in Press] 750mm/sec FINE    ;
 317:   ;
 318:L P[19:In Press] 50mm/sec FINE    ;
 319:   ;
 320:  CALL ADJ_BG    ;
 321:   ;
 322:  WAIT    .25(sec) ;
 323:   ;
 324:  CALL PINCH    ;
 325:   ;
 326:  WAIT    .25(sec) ;
 327:   ;
 328:  CALL ALL_VAC_OFF    ;
 329:   ;
 330:  CALL MAG_GRIP_OFF    ;
 331:   ;
 332:  WAIT   1.00(sec) ;
 333:   ;
 334:  CALL BEND    ;
 335:   ;
 336:  !Change time for wait and next ;
 337:  !Waypoint to adjust follow ;
 338:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 339:   ;
 340:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 341:L P[20:Bend 2 Pick] 0.5sec FINE SkipJump,LBL[101]    ;
 342:   ;
 343:  LBL[101] ;
 344:   ;
 345:  DO[27:RB_PEDALDN]=OFF ;
 346:   ;
 347:L P[20:Bend 2 Pick] 0.5sec FINE    ;
 348:   ;
 349:  WAIT    .25(sec) ;
 350:   ;
 351:  CALL ALL_VAC_ON    ;
 352:   ;
 353:  CALL MAG_GRIP_ON    ;
 354:   ;
 355:  //WAIT   1.00(sec) ;
 356:   ;
 357:  CALL OPEN_PRESS    ;
 358:   ;
 359:  WAIT    .25(sec) ;
 360:   ;
 361:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 362:   ;
 363:L P[15:Rotate for Clearance] 750mm/sec CNT25    ;
 364:   ;
 365:L P[22:Pull Part out of Press] 700mm/sec CNT50    ;
 366:  !End Bend 2 ;
 367:   ;
 368:  !Bend 3 Sequence ;
 369:  UFRAME_NUM=4 ;
 370:   ;
 371:  CALL PRE_BG    ;
 372:   ;
 373:L P[23:Prep for Rotation] 2000mm/sec FINE    ;
 374:   ;
 375:J P[24:Rotate to Bend 3] 50% FINE    ;
 376:   ;
 377:L P[25:Rotate for Part Entry] 1500mm/sec CNT50    ;
 378:   ;
 379:L P[26:Lower Part for Press Entry] 1500mm/sec CNT50    ;
 380:   ;
 381:L P[27:In Press] 60mm/sec FINE    ;
 382:   ;
 383:  CALL ADJ_BG    ;
 384:   ;
 385:  CALL PINCH    ;
 386:   ;
 387:  WAIT    .25(sec) ;
 388:   ;
 389:  CALL ALL_VAC_OFF    ;
 390:   ;
 391:  CALL MAG_GRIP_OFF    ;
 392:   ;
 393:  WAIT   1.00(sec) ;
 394:   ;
 395:  CALL BEND    ;
 396:   ;
 397:  !Change time for wait and next ;
 398:  !Waypoint to adjust follow ;
 399:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 400:   ;
 401:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 402:L P[28:Bend 3 Pick] 0.7sec FINE SkipJump,LBL[102]    ;
 403:   ;
 404:  LBL[102] ;
 405:   ;
 406:  DO[27:RB_PEDALDN]=OFF ;
 407:   ;
 408:L P[28:Bend 3 Pick] 0.5sec FINE    ;
 409:   ;
 410:  WAIT    .25(sec) ;
 411:   ;
 412:  CALL ALL_VAC_ON    ;
 413:   ;
 414:  CALL MAG_GRIP_ON    ;
 415:   ;
 416:  //WAIT   1.00(sec) ;
 417:   ;
 418:  CALL OPEN_PRESS    ;
 419:   ;
 420:  WAIT    .25(sec) ;
 421:   ;
 422:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 423:   ;
 424:L P[30:Pull Part out of Press] 1500mm/sec CNT50    ;
 425:  !End Bend 3 ;
 426:   ;
 427:L P[31:Prep for Rotation] 2000mm/sec FINE    ;
 428:   ;
 429:J P[32:Rotate to Outfeed Vertical Orien] 50% FINE    ;
 430:   ;
 431:L P[33:Move Part to Left Side of Arm] 2000mm/sec CNT50    ;
 432:   ;
 433:L P[16:flip for pallet] 1500mm/sec FINE    ;
 434:   ;
 435:  !Outfeed Pallet Sequence ;
 436:  UFRAME_NUM=6 ;
 437:   ;
 438:  PR[15,1:Pallet Offset]=0    ;
 439:  PR[15,2:Pallet Offset]=0    ;
 440:  PR[15,3:Pallet Offset]=0    ;
 441:   ;
 442:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 443:   ;
 444:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 445:   ;
 446:  IF (R[1:Layer Count]>1 AND R[1:Layer Count]<=3) THEN ;
 447:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-R[12:Part Offset 2]) ;
 448:  ENDIF ;
 449:   ;
 450:  IF (R[1:Layer Count]>=4 AND R[1:Layer Count]<6) THEN ;
 451:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[12:Part Offset 2]*2)) ;
 452:  ENDIF ;
 453:   ;
 454:  IF (R[1:Layer Count]=1 OR R[1:Layer Count]=3 OR R[1:Layer Count]=5) THEN ;
 455:  PR[15,3:Pallet Offset]=(50) ;
 456:  ENDIF ;
 457:   ;
 458:  WAIT (DI[32:RB_OUTFEED_SET]=ON)    ;
 459:   ;
 460:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 461:   ;
 462:L P[35:Approach] 500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 463:   ;
 464:L P[36:Place Part in Outfeed Pallet] 250mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 465:   ;
 466:  WAIT    .25(sec) ;
 467:   ;
 468:  CALL ALL_VAC_OFF    ;
 469:   ;
 470:  CALL MAG_GRIP_OFF    ;
 471:   ;
 472:  WAIT    .25(sec) ;
 473:   ;
 474:L P[37:Pull Away from Part] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 475:   ;
 476:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 477:   ;
 478:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 479:   ;
 480:  CALL END_PART    ;
 481:   ;
 482:  WAIT    .25(sec) ;
 483:   ;
 484:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 485:   ;
 486:  R[10:Current Part]=R[10:Current Part]+1    ;
 487:   ;
 488:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 489:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 490:  ENDIF ;
 491:   ;
 492:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 493:  R[1:Layer Count]=0    ;
 494:  R[2:Pallet Count]=0    ;
 495:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 496:  ENDIF ;
 497:   ;
 498:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
 499:  R[1:Layer Count]=0    ;
 500:  R[2:Pallet Count]=0    ;
 501:  R[10:Current Part]=1    ;
 502:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 503:  PAUSE ;
 504:  ENDIF ;
 505:   ;
 506:  F[1:First Part]=(OFF) ;
 507:   ;
 508:  JMP LBL[2] ;
/POS
P[1:"Approach/Exit"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   650.000  mm,	Y =  3727.583  mm,	Z =   649.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  3750.000  mm
};
P[2:"On Part"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   650.000  mm,	Y =  3727.583  mm,	Z =     4.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  3750.000  mm
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
	X =  1235.400  mm,	Y =   457.268  mm,	Z =    10.044  mm,
	W =  -179.934 deg,	P =     -.403 deg,	R =    89.764 deg,
	E1=   303.179  mm
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
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    87.340  mm,	Y =  -527.179  mm,	Z =     4.064  mm,
	W =      .325 deg,	P =     -.178 deg,	R =   -89.750 deg,
	E1=  3395.140  mm
};
P[10:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    87.323  mm,	Y =  -488.795  mm,	Z =   -14.852  mm,
	W =      .245 deg,	P =     -.177 deg,	R =   -89.831 deg,
	E1=  3395.140  mm
};
P[11:"Bend 1 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   104.639  mm,	Y =  -366.114  mm,	Z =   343.159  mm,
	W =     -.256 deg,	P =   -47.222 deg,	R =   -89.289 deg,
	E1=  3345.282  mm
};
P[12:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   108.933  mm,	Y =  -441.062  mm,	Z =   392.050  mm,
	W =     -.135 deg,	P =   -39.266 deg,	R =   -89.369 deg,
	E1=  3345.282  mm
};
P[13:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    55.214  mm,	Y =  -561.736  mm,	Z =   345.596  mm,
	W =      .309 deg,	P =   -32.926 deg,	R =   -89.698 deg,
	E1=  3464.528  mm
};
P[14:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   111.600  mm,	Y =  -542.170  mm,	Z =     3.063  mm,
	W =      .245 deg,	P =     -.104 deg,	R =   -89.491 deg,
	E1=  3345.519  mm
};
P[15:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.764  mm,	Y =  -270.454  mm,	Z =   238.564  mm,
	W =     -.137 deg,	P =   -36.252 deg,	R =   -89.505 deg,
	E1=  3059.733  mm
};
P[16:"flip for pallet"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, -1, 0',
	X = -5497.427  mm,	Y = -2384.788  mm,	Z =  1124.412  mm,
	W =  -166.956 deg,	P =    88.936 deg,	R =     9.963 deg,
	E1=  5819.928  mm
};
P[17:"approach infeed"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   650.001  mm,	Y =  3727.560  mm,	Z =   233.099  mm,
	W =   180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  3749.994  mm
};
P[18:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   111.599  mm,	Y =  -446.102  mm,	Z =    -6.936  mm,
	W =      .030 deg,	P =     -.102 deg,	R =   -89.490 deg,
	E1=  3204.896  mm
};
P[19:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   111.542  mm,	Y =  -308.270  mm,	Z =    -8.687  mm,
	W =      .031 deg,	P =     -.102 deg,	R =   -89.574 deg,
	E1=  3053.397  mm
};
P[20:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.818  mm,	Y =  -256.379  mm,	Z =   130.858  mm,
	W =     -.275 deg,	P =   -31.816 deg,	R =   -89.430 deg,
	E1=  3059.733  mm
};
P[21:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    99.764  mm,	Y =  -270.455  mm,	Z =   238.564  mm,
	W =     -.041 deg,	P =   -27.166 deg,	R =   -89.555 deg,
	E1=  3059.733  mm
};
P[22:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   101.641  mm,	Y =  -614.391  mm,	Z =   238.524  mm,
	W =  -154.337 deg,	P =   -89.072 deg,	R =    64.489 deg,
	E1=  3059.733  mm
};
P[23:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   101.447  mm,	Y =  -606.678  mm,	Z =   847.582  mm,
	W =   -91.228 deg,	P =   -47.077 deg,	R =     1.177 deg,
	E1=  3059.733  mm
};
P[24:"Rotate to Bend 3"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   101.447  mm,	Y =  -606.678  mm,	Z =   847.582  mm,
	W =   150.810 deg,	P =    89.042 deg,	R =  -118.915 deg,
	E1=  3059.733  mm
};
P[25:"Rotate for Part Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 0',
	X =   101.641  mm,	Y =  -672.426  mm,	Z =   197.456  mm,
	W =      .096 deg,	P =      .091 deg,	R =    90.572 deg,
	E1=  3555.020  mm
};
P[26:"Lower Part for Press Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 0',
	X =   122.490  mm,	Y =  -506.406  mm,	Z =    38.038  mm,
	W =      .096 deg,	P =      .091 deg,	R =    90.571 deg,
	E1=  3308.219  mm
};
P[27:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 0',
	X =    95.572  mm,	Y =  -375.935  mm,	Z =   -12.898  mm,
	W =     -.178 deg,	P =     -.168 deg,	R =    90.364 deg,
	E1=  3255.052  mm
};
P[28:"Bend 3 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.751  mm,	Y =  -409.111  mm,	Z =    98.319  mm,
	W =     -.064 deg,	P =    13.479 deg,	R =    90.482 deg,
	E1=  3255.052  mm
};
P[29:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.700  mm,	Y =  -408.660  mm,	Z =   132.316  mm,
	W =     -.078 deg,	P =    11.745 deg,	R =    90.481 deg,
	E1=  3255.056  mm
};
P[30:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.823  mm,	Y =  -612.930  mm,	Z =   134.903  mm,
	W =     -.078 deg,	P =    11.745 deg,	R =    90.481 deg,
	E1=  3255.056  mm
};
P[31:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.823  mm,	Y =  -612.930  mm,	Z =   134.903  mm,
	W =     -.371 deg,	P =    78.046 deg,	R =    90.133 deg,
	E1=  3255.056  mm
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
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X = -5497.133  mm,	Y = -2384.852  mm,	Z =  1124.750  mm,
	W =  -168.198 deg,	P =   -82.083 deg,	R =   164.281 deg,
	E1=  5819.945  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -647.958  mm,	Y =  1940.960  mm,	Z =  1899.367  mm,
	W =   172.332 deg,	P =    87.130 deg,	R =   172.154 deg,
	E1=  6250.101  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   918.965  mm,	Y =  1968.152  mm,	Z =  1353.485  mm,
	W =    28.621 deg,	P =    89.140 deg,	R =    28.164 deg,
	E1=  7005.723  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   918.319  mm,	Y =  1971.406  mm,	Z =   689.922  mm,
	W =    28.622 deg,	P =    89.140 deg,	R =    28.164 deg,
	E1=  7005.723  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   742.354  mm,	Y =  1947.428  mm,	Z =   634.712  mm,
	W =  -171.796 deg,	P =    87.502 deg,	R =  -171.995 deg,
	E1=  6151.387  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -536.610  mm,	Y =  1941.699  mm,	Z =  1612.781  mm,
	W =   172.331 deg,	P =    87.130 deg,	R =   172.153 deg,
	E1=  6517.701  mm
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
/END
