/PROG  PART_PROGAM_TEMPLATE_WITH_REGRIP
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 11337;
CREATE		= DATE 25-09-30  TIME 07:57:30;
MODIFIED	= DATE 25-10-08  TIME 10:46:10;
FILE_NAME	= PART_PRO;
VERSION		= 0;
LINE_COUNT	= 516;
MEMORY_SIZE	= 11937;
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
   1:  !PART #: template with regrip ;
   2:  UTOOL_NUM=1 ;
   3:  UFRAME_NUM=1 ;
   4:  OVERRIDE=R[50:Speed Override] ;
   5:  !User Frame 1 = Infeed ;
   6:  !User Frame 2 = Press 1 ;
   7:  !User Frame 3 = Zero Table ;
   8:  !User Frame 4 = Press 2 ;
   9:  !User Frame 5 = Regrip ;
  10:  !User Frame 6 = Outfeed ;
  11:  !User Frame 7 = Tool Rack ;
  12:   ;
  13:  !Part Program Parameters ;
  14:  R[4:Pallet Limit]=6    ;
  15:  R[7:Part Width]=2216    ;
  16:  R[8:Num of Pallets]=1    ;
  17:  R[9]=0    ;
  18:  R[11:Part Offset Pal]=100    ;
  19:  R[12:Part Offset 2]=200    ;
  20:  R[13:Tool Required]=1    ;
  21:  F[1:First Part]=(ON) ;
  22:   ;
  23:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
  24:   ;
  25:  !Verify Tool and Regrip are Corrt ;
  26:  IF R[5:Current Tool]=R[13:Tool Required],JMP LBL[6] ;
  27:   ;
  28:  CALL CHANGE_TOOLS    ;
  29:   ;
  30:  LBL[6] ;
  31:   ;
  32:  //CALL CHECK_REGRIP    ;
  33:   ;
  34:  UFRAME_NUM=1 ;
  35:  UTOOL_NUM=R[13:Tool Required] ;
  36:   ;
  37:  PAYLOAD[R[13]] ;
  38:   ;
  39:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
  40:   ;
  41:  UFRAME_NUM=1 ;
  42:   ;
  43:  !Measure Part Sequence ;
  44:J P[1:Approach/Exit] 50% FINE    ;
  45:   ;
  46:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
  47:L P[2:On Part] 700mm/sec FINE SkipJump,LBL[3]    ;
  48:   ;
  49:  !Recovery if no parts found ;
  50:L P[1:Approach/Exit] 700mm/sec FINE    ;
  51:   ;
  52:  CALL GO_HOME    ;
  53:   ;
  54:  UALM[1] ;
  55:   ;
  56:  ABORT ;
  57:  !End Recovery ;
  58:   ;
  59:  LBL[3] ;
  60:   ;
  61:  WAIT    .25(sec) ;
  62:   ;
  63:  PR[10:Measured Position]=LPOS    ;
  64:   ;
  65:  WAIT    .25(sec) ;
  66:   ;
  67:J PR[10:Measured Position] 50% FINE Offset,PR[51:LINEAR RAIL OFFSET]    ;
  68:   ;
  69:  WAIT    .25(sec) ;
  70:   ;
  71:  PR[10:Measured Position]=LPOS    ;
  72:   ;
  73:  WAIT    .25(sec) ;
  74:   ;
  75:  SKIP CONDITION RI[1:PART PRESENT]=OFF    ;
  76:L PR[10:Measured Position] 680mm/sec FINE Offset,PR[53:Y_OFFSET] SkipJump,LBL[4]    ;
  77:   ;
  78:  !Recovery if part end is not foud ;
  79:  PR[10:Measured Position]=LPOS    ;
  80:   ;
  81:  WAIT    .25(sec) ;
  82:   ;
  83:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
  84:   ;
  85:  CALL GO_HOME    ;
  86:   ;
  87:  UALM[2] ;
  88:   ;
  89:  ABORT ;
  90:  !End Recovery ;
  91:   ;
  92:  LBL[4] ;
  93:   ;
  94:  JMP LBL[5] ;
  95:  !Zero point for part width  ;
  96:L P[40:Zero Point] 700mm/sec FINE    ;
  97:  LBL[5] ;
  98:   ;
  99:  PR[5:Zero Point]=P[40:Zero Point]    ;
 100:   ;
 101:  PR[10:Measured Position]=LPOS    ;
 102:   ;
 103:  WAIT    .25(sec) ;
 104:   ;
 105:  R[6:Measured Width]=PR[5,2:Zero Point]-PR[10,2:Measured Position]    ;
 106:   ;
 107:  SELECT R[5:Current Tool]=1,JMP LBL[7] ;
 108:         =2,JMP LBL[8] ;
 109:   ;
 110:  LBL[7] ;
 111:   ;
 112:  R[6:Measured Width]=R[6:Measured Width]+R[14:Tool 1 Prox Off]    ;
 113:   ;
 114:  JMP LBL[9] ;
 115:   ;
 116:  LBL[8] ;
 117:   ;
 118:  R[6:Measured Width]=R[6:Measured Width]+R[15:Tool 2 Prox Off]    ;
 119:   ;
 120:  LBL[9] ;
 121:   ;
 122:  WAIT    .25(sec) ;
 123:   ;
 124:  R[6:Measured Width]=R[6:Measured Width] DIV 1    ;
 125:   ;
 126:  R[16:Difference]=R[6:Measured Width]-R[7:Part Width]    ;
 127:   ;
 128:  R[16:Difference]=R[16:Difference] DIV 1    ;
 129:   ;
 130:  IF (R[16:Difference]>=(-50) AND R[16:Difference]<=50) THEN ;
 131:   ;
 132:  PR[10:Measured Position]=LPOS    ;
 133:   ;
 134:  WAIT    .25(sec) ;
 135:   ;
 136:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 137:   ;
 138:  CALL GO_HOME    ;
 139:   ;
 140:  UALM[3] ;
 141:   ;
 142:  ABORT ;
 143:  ELSE ;
 144:  PR[10:Measured Position]=LPOS    ;
 145:   ;
 146:  WAIT    .25(sec) ;
 147:   ;
 148:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 149:  ENDIF ;
 150:   ;
 151:  !Top of Main Program Loop ;
 152:  LBL[2:Loop Program] ;
 153:   ;
 154:  CALL START_PART    ;
 155:   ;
 156:  IF (F[1:First Part]=ON),JMP LBL[99] ;
 157:   ;
 158:  IF (DO[26:AT HOME]=OFF),CALL GO_HOME ;
 159:   ;
 160:  LBL[99] ;
 161:   ;
 162:  !Begin Infeed Pick ;
 163:J P[1:Approach/Exit] 50% FINE    ;
 164:   ;
 165:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 166:L P[2:On Part] 700mm/sec FINE SkipJump,LBL[1]    ;
 167:   ;
 168:  !Recovery if no parts found ;
 169:L P[1:Approach/Exit] 700mm/sec FINE    ;
 170:   ;
 171:  CALL GO_HOME    ;
 172:   ;
 173:  UALM[1] ;
 174:   ;
 175:  ABORT ;
 176:  !End Recovery ;
 177:   ;
 178:  LBL[1] ;
 179:   ;
 180:  PR[10:Measured Position]=LPOS    ;
 181:   ;
 182:L PR[10:Measured Position] 700mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
 183:   ;
 184:   ;
 185:  WAIT    .25(sec) ;
 186:   ;
 187:  CALL ALL_VAC_ON    ;
 188:   ;
 189:  WAIT    .25(sec) ;
 190:   ;
 191:L P[1:Approach/Exit] 700mm/sec FINE    ;
 192:   ;
 193:  CALL MAG_GRIP_ON    ;
 194:  !End Infeed Pick ;
 195:   ;
 196:  !Begin Zero ;
 197:  UFRAME_NUM=3 ;
 198:   ;
 199:J P[39:Rotate Torwards Zero] 100% CNT50    ;
 200:   ;
 201:J P[3:Approach/Exit] 50% CNT50    ;
 202:   ;
 203:L P[41:Above Zero] 1500mm/sec CNT100    ;
 204:   ;
 205:L P[4:Place in Zero] 700mm/sec FINE    ;
 206:   ;
 207:  WAIT    .25(sec) ;
 208:   ;
 209:  CALL ALL_VAC_OFF    ;
 210:   ;
 211:  CALL MAG_GRIP_OFF    ;
 212:   ;
 213:  WAIT    .25(sec) ;
 214:   ;
 215:L P[4:Place in Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 216:   ;
 217:L P[5:Pick from Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 218:   ;
 219:L P[5:Pick from Zero] 700mm/sec FINE    ;
 220:   ;
 221:  WAIT    .25(sec) ;
 222:   ;
 223:  CALL ALL_VAC_ON    ;
 224:   ;
 225:  CALL MAG_GRIP_ON    ;
 226:   ;
 227:  WAIT    .25(sec) ;
 228:   ;
 229:L P[41:Above Zero] 100mm/sec CNT50    ;
 230:   ;
 231:L P[3:Approach/Exit] 700mm/sec CNT50    ;
 232:  !End Zero ;
 233:   ;
 234:  !Begin Bend 1 ;
 235:  UFRAME_NUM=4 ;
 236:   ;
 237:J P[6:Transition to Press] 50% CNT25    ;
 238:   ;
 239:J P[7:Avoid Collision] 50% CNT50    ;
 240:   ;
 241:J P[8:Rotate to Press Orientation] 50% CNT50    ;
 242:   ;
 243:L P[42:Keep Part Off Arm] 100mm/sec CNT25    ;
 244:   ;
 245:L P[9:Approach Press] 2000mm/sec CNT25    ;
 246:   ;
 247:  CALL PRE_BG    ;
 248:   ;
 249:L P[10:In Press] 750mm/sec FINE    ;
 250:   ;
 251:  CALL ADJ_BG    ;
 252:   ;
 253:  WAIT    .25(sec) ;
 254:   ;
 255:  CALL PINCH    ;
 256:   ;
 257:  WAIT    .25(sec) ;
 258:   ;
 259:  CALL ALL_VAC_OFF    ;
 260:   ;
 261:  CALL MAG_GRIP_OFF    ;
 262:   ;
 263:  WAIT   1.00(sec) ;
 264:   ;
 265:  CALL BEND    ;
 266:   ;
 267:  !Change time for wait and next ;
 268:  !Waypoint to adjust follow ;
 269:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 270:   ;
 271:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 272:L P[11:Bend 1 Pick] 1.0sec FINE SkipJump,LBL[100]    ;
 273:   ;
 274:  LBL[100] ;
 275:   ;
 276:  DO[27:RB_PEDALDN]=OFF ;
 277:   ;
 278:L P[11:Bend 1 Pick] 1.0sec FINE    ;
 279:   ;
 280:  WAIT    .25(sec) ;
 281:   ;
 282:  CALL ALL_VAC_ON    ;
 283:   ;
 284:  CALL MAG_GRIP_ON    ;
 285:   ;
 286:  WAIT   1.00(sec) ;
 287:   ;
 288:  CALL OPEN_PRESS    ;
 289:   ;
 290:  WAIT    .25(sec) ;
 291:   ;
 292:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 293:   ;
 294:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 295:  !End Bend 1 ;
 296:   ;
 297:  !Bend 2 Sequence ;
 298:  UFRAME_NUM=4 ;
 299:   ;
 300:  CALL PRE_BG    ;
 301:   ;
 302:L P[9:Approach Press] 2000mm/sec FINE    ;
 303:   ;
 304:L P[14:In Front of Press] 1500mm/sec CNT50    ;
 305:   ;
 306:L P[18:Part Insert in Press] 750mm/sec FINE    ;
 307:   ;
 308:L P[19:In Press] 700mm/sec FINE    ;
 309:   ;
 310:  CALL ADJ_BG    ;
 311:   ;
 312:  WAIT    .25(sec) ;
 313:   ;
 314:  CALL PINCH    ;
 315:   ;
 316:  WAIT    .25(sec) ;
 317:   ;
 318:  CALL ALL_VAC_OFF    ;
 319:   ;
 320:  CALL MAG_GRIP_OFF    ;
 321:   ;
 322:  WAIT   1.00(sec) ;
 323:   ;
 324:  CALL BEND    ;
 325:   ;
 326:  !Change time for wait and next ;
 327:  !Waypoint to adjust follow ;
 328:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 329:   ;
 330:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 331:L P[20:Bend 2 Pick] 1.0sec FINE SkipJump,LBL[101]    ;
 332:   ;
 333:  LBL[101] ;
 334:   ;
 335:  DO[27:RB_PEDALDN]=OFF ;
 336:   ;
 337:L P[20:Bend 2 Pick] 1.0sec FINE    ;
 338:   ;
 339:  WAIT    .25(sec) ;
 340:   ;
 341:  CALL ALL_VAC_ON    ;
 342:   ;
 343:  CALL MAG_GRIP_ON    ;
 344:   ;
 345:  WAIT   1.00(sec) ;
 346:   ;
 347:  CALL OPEN_PRESS    ;
 348:   ;
 349:  WAIT    .25(sec) ;
 350:   ;
 351:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 352:   ;
 353:L P[15:Rotate for Clearance] 750mm/sec CNT25    ;
 354:   ;
 355:L P[22:Pull Part out of Press] 700mm/sec CNT50    ;
 356:  !End Bend 2 ;
 357:   ;
 358:  !Start Regrip/Flip ;
 359:  UFRAME_NUM=5 ;
 360:   ;
 361:L P[16:Transition to Regrip] 1500mm/sec CNT50    ;
 362:   ;
 363:L P[43:Over Regrip] 1500mm/sec CNT50    ;
 364:   ;
 365:L P[44:In Outfeed] 700mm/sec FINE    ;
 366:   ;
 367:  WAIT    .75(sec) ;
 368:   ;
 369:  CALL ALL_VAC_OFF    ;
 370:   ;
 371:  CALL MAG_GRIP_OFF    ;
 372:   ;
 373:  WAIT    .25(sec) ;
 374:   ;
 375:L P[17:Pull Away From Part] 700mm/sec FINE    ;
 376:   ;
 377:L P[45:Clear Regrip Arms] 1500mm/sec CNT50    ;
 378:   ;
 379:L P[46:Prep for Rotating Wrist] 1500mm/sec CNT50    ;
 380:   ;
 381:J P[47:Rotate Wrist] 50% CNT50    ;
 382:   ;
 383:L P[48:Above regrip Pick] 1500mm/sec CNT50    ;
 384:   ;
 385:L P[49:Regrip Pick] 700mm/sec FINE    ;
 386:   ;
 387:  WAIT    .25(sec) ;
 388:   ;
 389:  CALL ALL_VAC_ON    ;
 390:   ;
 391:  CALL MAG_GRIP_ON    ;
 392:   ;
 393:  WAIT    .25(sec) ;
 394:   ;
 395:L P[50:Pull Part Off Regrip] 1500mm/sec CNT50    ;
 396:   ;
 397:L P[51:Exit Regrip] 1500mm/sec CNT50    ;
 398:  !End Regrip/Flip ;
 399:   ;
 400:  !Bend 3 Sequence ;
 401:  UFRAME_NUM=4 ;
 402:   ;
 403:  CALL PRE_BG    ;
 404:   ;
 405:J P[23:Prep for Rotation to Bend 3] 100% CNT100    ;
 406:   ;
 407:J P[24:Rotate to Bend 3] 50% FINE    ;
 408:   ;
 409:L P[25:Rotate for Part Entry] 1500mm/sec CNT50    ;
 410:   ;
 411:L P[26:Lower Part for Press Entry] 1500mm/sec CNT50    ;
 412:   ;
 413:L P[27:In Press] 700mm/sec FINE    ;
 414:   ;
 415:  CALL PINCH    ;
 416:   ;
 417:  WAIT    .25(sec) ;
 418:   ;
 419:  CALL ALL_VAC_OFF    ;
 420:   ;
 421:  CALL MAG_GRIP_OFF    ;
 422:   ;
 423:  WAIT   1.00(sec) ;
 424:   ;
 425:  CALL BEND    ;
 426:   ;
 427:  !Change time for wait and next ;
 428:  !Waypoint to adjust follow ;
 429:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 430:   ;
 431:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 432:L P[28:Bend 3 Pick] 1.0sec FINE SkipJump,LBL[102]    ;
 433:   ;
 434:  DO[27:RB_PEDALDN]=OFF ;
 435:   ;
 436:L P[28:Bend 3 Pick] 1.0sec FINE    ;
 437:   ;
 438:  WAIT    .25(sec) ;
 439:   ;
 440:  CALL ALL_VAC_ON    ;
 441:   ;
 442:  CALL MAG_GRIP_ON    ;
 443:   ;
 444:  WAIT   1.00(sec) ;
 445:   ;
 446:  CALL OPEN_PRESS    ;
 447:   ;
 448:  WAIT    .25(sec) ;
 449:   ;
 450:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 451:   ;
 452:L P[30:Pull Part out of Press] 1500mm/sec CNT50    ;
 453:  !End Bend 3 ;
 454:   ;
 455:J P[31:Prep for Rotation] 50% FINE    ;
 456:   ;
 457:J P[32:Rotate to Outfeed Vertical Orien] 50% FINE    ;
 458:   ;
 459:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 460:   ;
 461:  !Outfeed Pallet Sequence ;
 462:  UFRAME_NUM=6 ;
 463:   ;
 464:  PR[15,1:Pallet Offset]=0    ;
 465:  PR[15,2:Pallet Offset]=0    ;
 466:   ;
 467:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 468:   ;
 469:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 470:   ;
 471:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 472:   ;
 473:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 474:   ;
 475:L P[36:Place Part in Outfeed Pallet] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 476:   ;
 477:  WAIT    .25(sec) ;
 478:   ;
 479:  CALL ALL_VAC_OFF    ;
 480:   ;
 481:  CALL MAG_GRIP_OFF    ;
 482:   ;
 483:  WAIT    .25(sec) ;
 484:   ;
 485:L P[37:Pull Away from Part] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 486:   ;
 487:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 488:   ;
 489:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 490:   ;
 491:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 492:   ;
 493:  R[10:Current Part]=R[10:Current Part]+1    ;
 494:   ;
 495:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 496:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 497:  ENDIF ;
 498:   ;
 499:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 500:  R[1:Layer Count]=0    ;
 501:  R[2:Pallet Count]=0    ;
 502:  DO[33:RB_TEND]=ON ;
 503:  ENDIF ;
 504:   ;
 505:  IF (R[10:Current Part]>=R[3:Run QTY]) THEN ;
 506:  R[1:Layer Count]=0    ;
 507:  R[2:Pallet Count]=0    ;
 508:  R[10:Current Part]=1    ;
 509:  DO[33:RB_TEND]=ON ;
 510:  ENDIF ;
 511:   ;
 512:  CALL END_PART    ;
 513:   ;
 514:  F[1:First Part]=(OFF) ;
 515:   ;
 516:  JMP LBL[2] ;
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
