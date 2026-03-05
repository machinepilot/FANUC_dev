/PROG  PNS0017
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5354880";
PROG_SIZE	= 17825;
CREATE		= DATE 25-10-06  TIME 15:00:48;
MODIFIED	= DATE 26-02-16  TIME 17:20:54;
FILE_NAME	= P_535469;
VERSION		= 0;
LINE_COUNT	= 767;
MEMORY_SIZE	= 18449;
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
   1:  !PART #: 5354880 ;
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
  40:  CALL START_PART    ;
  41:   ;
  42:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
  43:   ;
  44:  UFRAME_NUM=1 ;
  45:   ;
  46:  JMP LBL[999] ;
  47:   ;
  48:  !Measure Part Sequence ;
  49:J P[1:Approach/Exit] 50% FINE    ;
  50:   ;
  51:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
  52:L P[2:On Part] 700mm/sec FINE SkipJump,LBL[3]    ;
  53:   ;
  54:  !Recovery if no parts found ;
  55:L P[1:Approach/Exit] 700mm/sec FINE    ;
  56:   ;
  57:  CALL GO_HOME    ;
  58:   ;
  59:  UALM[1] ;
  60:   ;
  61:  ABORT ;
  62:  !End Recovery ;
  63:   ;
  64:  LBL[3] ;
  65:   ;
  66:  WAIT    .25(sec) ;
  67:   ;
  68:  PR[10:Measured Position]=LPOS    ;
  69:   ;
  70:  WAIT    .25(sec) ;
  71:   ;
  72:J PR[10:Measured Position] 50% FINE Offset,PR[51:LINEAR RAIL OFFSET]    ;
  73:   ;
  74:  WAIT    .25(sec) ;
  75:   ;
  76:  PR[10:Measured Position]=LPOS    ;
  77:   ;
  78:  WAIT    .25(sec) ;
  79:   ;
  80:  SKIP CONDITION RI[1:PART PRESENT]=OFF    ;
  81:L PR[10:Measured Position] 680mm/sec FINE Offset,PR[53:Y_OFFSET] SkipJump,LBL[4]    ;
  82:   ;
  83:  !Recovery if part end is not foud ;
  84:  PR[10:Measured Position]=LPOS    ;
  85:   ;
  86:  WAIT    .25(sec) ;
  87:   ;
  88:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
  89:   ;
  90:  CALL GO_HOME    ;
  91:   ;
  92:  UALM[2] ;
  93:   ;
  94:  ABORT ;
  95:  !End Recovery ;
  96:   ;
  97:  LBL[4] ;
  98:   ;
  99:  JMP LBL[5] ;
 100:  !Zero point for part width  ;
 101:L P[40:Zero Point] 700mm/sec FINE    ;
 102:  LBL[5] ;
 103:   ;
 104:  PR[5:Zero Point]=P[40:Zero Point]    ;
 105:   ;
 106:  PR[10:Measured Position]=LPOS    ;
 107:   ;
 108:  WAIT    .25(sec) ;
 109:   ;
 110:  R[6:Measured Width]=PR[5,2:Zero Point]-PR[10,2:Measured Position]    ;
 111:   ;
 112:  SELECT R[5:Current Tool]=1,JMP LBL[7] ;
 113:         =2,JMP LBL[8] ;
 114:   ;
 115:  LBL[7] ;
 116:   ;
 117:  R[6:Measured Width]=R[6:Measured Width]+R[14:Tool 1 Prox Off]    ;
 118:   ;
 119:  JMP LBL[9] ;
 120:   ;
 121:  LBL[8] ;
 122:   ;
 123:  R[6:Measured Width]=R[6:Measured Width]+R[15:Tool 2 Prox Off]    ;
 124:   ;
 125:  LBL[9] ;
 126:   ;
 127:  WAIT    .25(sec) ;
 128:   ;
 129:  R[6:Measured Width]=R[6:Measured Width] DIV 1    ;
 130:   ;
 131:  R[16:Difference]=R[6:Measured Width]-R[7:Part Width]    ;
 132:   ;
 133:  R[16:Difference]=R[16:Difference] DIV 1    ;
 134:   ;
 135:  IF (R[16:Difference]>=(-50) AND R[16:Difference]<=50) THEN ;
 136:   ;
 137:  PR[10:Measured Position]=LPOS    ;
 138:   ;
 139:  WAIT    .25(sec) ;
 140:   ;
 141:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 142:   ;
 143:  CALL GO_HOME    ;
 144:   ;
 145:  UALM[3] ;
 146:   ;
 147:  ABORT ;
 148:  ELSE ;
 149:  PR[10:Measured Position]=LPOS    ;
 150:   ;
 151:  WAIT    .25(sec) ;
 152:   ;
 153:L PR[10:Measured Position] 1500mm/sec CNT50 Offset,PR[52:100_Z_OFFSET]    ;
 154:  ENDIF ;
 155:   ;
 156:  LBL[999] ;
 157:   ;
 158:  !Top of Main Program Loop ;
 159:  LBL[2:Loop Program] ;
 160:   ;
 161:  CALL START_PART    ;
 162:   ;
 163:  IF (F[1:First Part]=ON),JMP LBL[99] ;
 164:   ;
 165:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
 166:   ;
 167:  LBL[99] ;
 168:   ;
 169:  UFRAME_NUM=1 ;
 170:   ;
 171:  !Begin Infeed Pick ;
 172:J P[1:Approach/Exit] 50% FINE    ;
 173:   ;
 174:L P[97:above infeed] 1500mm/sec FINE    ;
 175:   ;
 176:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
 177:L P[2:On Part] 100mm/sec FINE SkipJump,LBL[1]    ;
 178:   ;
 179:  !Recovery if no parts found ;
 180:L P[1:Approach/Exit] 700mm/sec FINE    ;
 181:   ;
 182:  CALL GO_HOME    ;
 183:   ;
 184:  UALM[1] ;
 185:   ;
 186:  ABORT ;
 187:  !End Recovery ;
 188:   ;
 189:  LBL[1] ;
 190:   ;
 191:  PR[10:Measured Position]=LPOS    ;
 192:   ;
 193:L PR[10:Measured Position] 250mm/sec FINE Offset,PR[54:Z-20mm_Z_OFFSET]    ;
 194:   ;
 195:   ;
 196:  WAIT    .25(sec) ;
 197:   ;
 198:  CALL ALL_VAC_ON    ;
 199:   ;
 200:  WAIT    .25(sec) ;
 201:   ;
 202:L P[1:Approach/Exit] 700mm/sec FINE    ;
 203:   ;
 204:  CALL MAG_GRIP_ON    ;
 205:  !End Infeed Pick ;
 206:   ;
 207:  !Begin Zero ;
 208:  UFRAME_NUM=3 ;
 209:   ;
 210:J P[39:Rotate Torwards Zero] 100% CNT50    ;
 211:   ;
 212:J P[3:Approach/Exit] 50% CNT50    ;
 213:   ;
 214:L P[41:Above Zero] 1500mm/sec CNT100    ;
 215:   ;
 216:L P[4:Place in Zero] 700mm/sec FINE    ;
 217:   ;
 218:  WAIT    .25(sec) ;
 219:   ;
 220:  CALL ALL_VAC_OFF    ;
 221:   ;
 222:  CALL MAG_GRIP_OFF    ;
 223:   ;
 224:  WAIT    .25(sec) ;
 225:   ;
 226:L P[4:Place in Zero] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 227:   ;
 228:L P[16] 700mm/sec FINE Offset,PR[50:50MM_Z_OFFSET]    ;
 229:   ;
 230:L P[5:Pick from Zero] 700mm/sec FINE    ;
 231:   ;
 232:  WAIT    .25(sec) ;
 233:   ;
 234:  CALL ALL_VAC_ON    ;
 235:   ;
 236:  CALL MAG_GRIP_ON    ;
 237:   ;
 238:  WAIT    .25(sec) ;
 239:   ;
 240:L P[41:Above Zero] 1000mm/sec CNT50    ;
 241:   ;
 242:L P[3:Approach/Exit] 700mm/sec CNT50    ;
 243:  !End Zero ;
 244:   ;
 245:  !Begin Bend 1 ;
 246:  UFRAME_NUM=4 ;
 247:   ;
 248:J P[6:Transition to Press] 50% CNT25    ;
 249:   ;
 250:J P[7:Avoid Collision] 50% CNT50    ;
 251:   ;
 252:J P[8:Rotate to Press Orientation] 50% CNT50    ;
 253:   ;
 254:J P[55:ROTATE OFF ARM] 50% FINE    ;
 255:   ;
 256:L P[56:MOVE AWAY FROM ELBOW] 2000mm/sec CNT25    ;
 257:   ;
 258:L P[42:Keep Part Off Arm] 1000mm/sec CNT25    ;
 259:   ;
 260:L P[9:Approach Press] 2000mm/sec CNT25    ;
 261:   ;
 262:  CALL PRE_BG    ;
 263:   ;
 264:L P[10:In Press] 750mm/sec FINE    ;
 265:   ;
 266:L P[17:17:On Die] 750mm/sec FINE    ;
 267:   ;
 268:L P[43: 43:At Back Gauge] 50mm/sec FINE    ;
 269:   ;
 270:  CALL ADJ_BG    ;
 271:   ;
 272:  WAIT    .25(sec) ;
 273:   ;
 274:  CALL PINCH    ;
 275:   ;
 276:  WAIT    .25(sec) ;
 277:   ;
 278:  CALL ALL_VAC_OFF    ;
 279:   ;
 280:  CALL MAG_GRIP_OFF    ;
 281:   ;
 282:  WAIT   1.00(sec) ;
 283:   ;
 284:  CALL BEND    ;
 285:   ;
 286:  !Change time for wait and next ;
 287:  !Waypoint to adjust follow ;
 288:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 289:   ;
 290:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 291:L P[11:Bend 1 Pick] 0.2sec FINE SkipJump,LBL[100]    ;
 292:   ;
 293:  LBL[100] ;
 294:   ;
 295:  DO[27:RB_PEDALDN]=OFF ;
 296:   ;
 297:L P[11:Bend 1 Pick] 0.2sec FINE    ;
 298:   ;
 299:  WAIT    .25(sec) ;
 300:   ;
 301:  CALL ALL_VAC_ON    ;
 302:   ;
 303:  CALL MAG_GRIP_ON    ;
 304:   ;
 305:  WAIT   1.00(sec) ;
 306:   ;
 307:  CALL OPEN_PRESS    ;
 308:   ;
 309:  WAIT    .25(sec) ;
 310:   ;
 311:L P[12:Lift Part out of Die] 700mm/sec FINE    ;
 312:   ;
 313:L P[13:Pull Part out of Press] 1500mm/sec FINE    ;
 314:  !End Bend 1 ;
 315:   ;
 316:  !Bend 2 Sequence ;
 317:  UFRAME_NUM=4 ;
 318:   ;
 319:J P[57:MOVE ELBOW BACK] 100% CNT5    ;
 320:   ;
 321:  CALL PRE_BG    ;
 322:   ;
 323:L P[9:Approach Press] 2000mm/sec FINE    ;
 324:   ;
 325:L P[14:In Front of Press] 1500mm/sec CNT50    ;
 326:   ;
 327:L P[18:Part Insert in Press] 750mm/sec FINE    ;
 328:   ;
 329:L P[58:ON DIE] 750mm/sec FINE    ;
 330:   ;
 331:L P[19:In Press] 700mm/sec FINE    ;
 332:   ;
 333:  CALL ADJ_BG    ;
 334:   ;
 335:  WAIT    .25(sec) ;
 336:   ;
 337:  CALL PINCH    ;
 338:   ;
 339:  WAIT    .25(sec) ;
 340:   ;
 341:  CALL ALL_VAC_OFF    ;
 342:   ;
 343:  CALL MAG_GRIP_OFF    ;
 344:   ;
 345:  WAIT   1.00(sec) ;
 346:   ;
 347:  CALL BEND    ;
 348:   ;
 349:  !Change time for wait and next ;
 350:  !Waypoint to adjust follow ;
 351:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 352:   ;
 353:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 354:L P[20:Bend 2 Pick] 0.2sec FINE SkipJump,LBL[101]    ;
 355:   ;
 356:  LBL[101] ;
 357:   ;
 358:  DO[27:RB_PEDALDN]=OFF ;
 359:   ;
 360:L P[20:Bend 2 Pick] 0.2sec FINE    ;
 361:   ;
 362:  WAIT    .25(sec) ;
 363:   ;
 364:  CALL ALL_VAC_ON    ;
 365:   ;
 366:  CALL MAG_GRIP_ON    ;
 367:   ;
 368:  WAIT   1.00(sec) ;
 369:   ;
 370:  CALL OPEN_PRESS    ;
 371:   ;
 372:  WAIT    .25(sec) ;
 373:   ;
 374:L P[21:Lift Part out of Die] 700mm/sec CNT50    ;
 375:   ;
 376:L P[15:Rotate for Clearance] 750mm/sec CNT25    ;
 377:   ;
 378:L P[22:Pull Part out of Press] 700mm/sec CNT25    ;
 379:  !End Bend 2 ;
 380:   ;
 381:  !Bend 3 Sequence ;
 382:  UFRAME_NUM=4 ;
 383:   ;
 384:  CALL PRE_BG    ;
 385:   ;
 386:L P[53] 2000mm/sec FINE    ;
 387:   ;
 388:L P[54] 2000mm/sec FINE    ;
 389:   ;
 390:L P[44:Approach Press] 2000mm/sec FINE    ;
 391:   ;
 392:L P[45:In Front of Press] 2000mm/sec CNT25    ;
 393:   ;
 394:L P[46:Part Insert in Press] 750mm/sec FINE    ;
 395:   ;
 396:L P[59:ON DIE] 750mm/sec FINE    ;
 397:   ;
 398:L P[47:In Press] 700mm/sec FINE    ;
 399:   ;
 400:  CALL ADJ_BG    ;
 401:   ;
 402:  WAIT    .25(sec) ;
 403:   ;
 404:  CALL PINCH    ;
 405:   ;
 406:  WAIT    .25(sec) ;
 407:   ;
 408:  CALL ALL_VAC_OFF    ;
 409:   ;
 410:  CALL MAG_GRIP_OFF    ;
 411:   ;
 412:  WAIT   1.00(sec) ;
 413:   ;
 414:  CALL BEND    ;
 415:   ;
 416:  !Change time for wait and next ;
 417:  !Waypoint to adjust follow ;
 418:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 419:   ;
 420:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 421:L P[49:Bend 3 Pick] 0.5sec FINE SkipJump,LBL[102]    ;
 422:   ;
 423:  LBL[102] ;
 424:   ;
 425:  DO[27:RB_PEDALDN]=OFF ;
 426:   ;
 427:L P[49:Bend 3 Pick] 0.5sec FINE    ;
 428:   ;
 429:  WAIT    .25(sec) ;
 430:   ;
 431:  CALL ALL_VAC_ON    ;
 432:   ;
 433:  CALL MAG_GRIP_ON    ;
 434:   ;
 435:  WAIT   1.00(sec) ;
 436:   ;
 437:  CALL OPEN_PRESS    ;
 438:   ;
 439:  WAIT    .25(sec) ;
 440:   ;
 441:L P[50:Lift Part out of Die] 700mm/sec FINE    ;
 442:   ;
 443:L P[51:Rotate for Clearance] 750mm/sec CNT25    ;
 444:   ;
 445:L P[52:Pull Part out of Press] 700mm/sec CNT50    ;
 446:  !End Bend 3 ;
 447:   ;
 448:  !Bend 4 Sequence ;
 449:  UFRAME_NUM=4 ;
 450:   ;
 451:  CALL PRE_BG    ;
 452:   ;
 453:L P[23:Prep for Rotation] 2000mm/sec FINE    ;
 454:   ;
 455:J P[60:ROTATE AWAY FROM ARM] 50% CNT5    ;
 456:   ;
 457:J P[61:ROTATE UP] 50% CNT25    ;
 458:   ;
 459:J P[24:Rotate to Bend 4] 50% FINE    ;
 460:   ;
 461:L P[25:Move for Part Entry] 1500mm/sec CNT50    ;
 462:   ;
 463:L P[26:Lower Part for Press Entry] 1500mm/sec CNT50    ;
 464:   ;
 465:L P[88:Stretch arm] 1500mm/sec FINE    ;
 466:   ;
 467:L P[92:Stretch arm at press] 1500mm/sec FINE    ;
 468:   ;
 469:L P[74:In Front of Press] 1500mm/sec FINE    ;
 470:   ;
 471:L P[62:Insert in Press] 1500mm/sec FINE    ;
 472:   ;
 473:L P[63:On Die] 750mm/sec FINE    ;
 474:   ;
 475:L P[27:In Press] 50mm/sec FINE    ;
 476:  WAIT    .25(sec) ;
 477:   ;
 478:  CALL ADJ_BG    ;
 479:   ;
 480:  CALL PINCH    ;
 481:   ;
 482:  WAIT    .25(sec) ;
 483:   ;
 484:  CALL ALL_VAC_OFF    ;
 485:   ;
 486:  CALL MAG_GRIP_OFF    ;
 487:   ;
 488:  WAIT    .25(sec) ;
 489:   ;
 490:  CALL BEND    ;
 491:   ;
 492:  !Change time for wait and next ;
 493:  !Waypoint to adjust follow ;
 494:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 495:   ;
 496:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 497:L P[28:Bend 4 Pick] 1.0sec FINE SkipJump,LBL[103]    ;
 498:   ;
 499:  LBL[103] ;
 500:   ;
 501:  DO[27:RB_PEDALDN]=OFF ;
 502:   ;
 503:L P[28:Bend 4 Pick] 1.0sec FINE    ;
 504:   ;
 505:  WAIT    .25(sec) ;
 506:   ;
 507:  CALL ALL_VAC_ON    ;
 508:   ;
 509:  CALL MAG_GRIP_ON    ;
 510:   ;
 511:  WAIT   1.00(sec) ;
 512:   ;
 513:  CALL OPEN_PRESS    ;
 514:   ;
 515:  WAIT    .25(sec) ;
 516:   ;
 517:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 518:   ;
 519:L P[30:Pull Part out of Press] 1500mm/sec CNT25    ;
 520:   ;
 521:L P[75:MOVE AWAY FROM PRESS] 1500mm/sec FINE    ;
 522:  !End Bend 4 ;
 523:   ;
 524:  !Start Regrip/Flip ;
 525:  UFRAME_NUM=5 ;
 526:   ;
 527:J P[76:PREP FOR ROTATE] 50% CNT25    ;
 528:   ;
 529:J P[77:ROTATE FOR REGRIP] 50% CNT25    ;
 530:   ;
 531:L P[48:Transition to Regrip] 1500mm/sec CNT50    ;
 532:   ;
 533:L P[64:Over Regrip] 1500mm/sec CNT50    ;
 534:   ;
 535:L P[65:In Regrip] 700mm/sec FINE    ;
 536:   ;
 537:  WAIT    .75(sec) ;
 538:   ;
 539:  CALL ALL_VAC_OFF    ;
 540:   ;
 541:  CALL MAG_GRIP_OFF    ;
 542:   ;
 543:  WAIT    .25(sec) ;
 544:   ;
 545:L P[66:Pull Away From Part] 200mm/sec FINE    ;
 546:   ;
 547:L P[67:Clear Regrip Arms] 1500mm/sec CNT50    ;
 548:   ;
 549:L P[68:Prep for Rotating Wrist] 1500mm/sec CNT50    ;
 550:   ;
 551:J P[69:Rotate Wrist] 50% CNT50    ;
 552:   ;
 553:L P[70:Above regrip] 1500mm/sec CNT50    ;
 554:   ;
 555:L P[78:Above regrip pick] 1500mm/sec FINE    ;
 556:   ;
 557:L P[71:Regrip Pick] 700mm/sec FINE    ;
 558:   ;
 559:  WAIT    .25(sec) ;
 560:   ;
 561:  CALL ALL_VAC_ON    ;
 562:   ;
 563:  CALL MAG_GRIP_ON    ;
 564:   ;
 565:  WAIT    .25(sec) ;
 566:   ;
 567:L P[79:slide part] 750mm/sec FINE    ;
 568:   ;
 569:L P[72:Pull Part Off Regrip] 1500mm/sec CNT50    ;
 570:   ;
 571:L P[73:Exit Regrip] 1500mm/sec CNT50    ;
 572:  !End Regrip/Flip ;
 573:   ;
 574:  !Bend 5 Sequence ;
 575:  UFRAME_NUM=4 ;
 576:   ;
 577:  CALL PRE_BG    ;
 578:   ;
 579:L P[80] 2000mm/sec FINE    ;
 580:   ;
 581:L P[81] 2000mm/sec FINE    ;
 582:   ;
 583:L P[82:Approach Press] 1000mm/sec FINE    ;
 584:   ;
 585:L P[95:clear arm] 1500mm/sec FINE    ;
 586:   ;
 587:L P[83:In Front of Press] 500mm/sec CNT25    ;
 588:   ;
 589:L P[84:Part Insert in Press] 250mm/sec FINE    ;
 590:   ;
 591:L P[96:in press] 500mm/sec FINE    ;
 592:   ;
 593:L P[85:ON DIE] 300mm/sec FINE    ;
 594:   ;
 595:  CALL PINCH    ;
 596:   ;
 597:  WAIT   1.00(sec) ;
 598:   ;
 599:  CALL ALL_VAC_OFF    ;
 600:   ;
 601:  CALL MAG_GRIP_OFF    ;
 602:   ;
 603:  WAIT   1.00(sec) ;
 604:   ;
 605:L P[94:Reposition grip] 1000mm/sec FINE    ;
 606:   ;
 607:  WAIT    .25(sec) ;
 608:   ;
 609:  CALL ALL_VAC_ON    ;
 610:   ;
 611:  CALL MAG_GRIP_ON    ;
 612:   ;
 613:  WAIT    .25(sec) ;
 614:   ;
 615:  CALL BEND    ;
 616:   ;
 617:  !Change time for wait and next ;
 618:  !Waypoint to adjust follow ;
 619:  WAIT    .25(sec) ;
 620:   ;
 621:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 622:L P[94:Reposition grip] 0.5sec FINE SkipJump,LBL[105]    ;
 623:   ;
 624:  LBL[105] ;
 625:   ;
 626:  DO[27:RB_PEDALDN]=OFF ;
 627:   ;
 628:L P[94:Reposition grip] 0.5sec FINE    ;
 629:   ;
 630:  WAIT    .25(sec) ;
 631:   ;
 632:  CALL OPEN_PRESS    ;
 633:   ;
 634:  WAIT    .25(sec) ;
 635:   ;
 636:L P[86:In Press] 250mm/sec FINE    ;
 637:   ;
 638:  CALL ADJ_BG    ;
 639:   ;
 640:  WAIT    .25(sec) ;
 641:   ;
 642:  CALL PINCH    ;
 643:   ;
 644:  WAIT    .25(sec) ;
 645:   ;
 646:  CALL ALL_VAC_OFF    ;
 647:   ;
 648:  CALL MAG_GRIP_OFF    ;
 649:   ;
 650:  WAIT   1.00(sec) ;
 651:   ;
 652:  CALL BEND    ;
 653:   ;
 654:  !Change time for wait and next ;
 655:  !Waypoint to adjust follow ;
 656:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 657:   ;
 658:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 659:L P[87:Bend 5 Pick] 2.5sec FINE SkipJump,LBL[104]    ;
 660:   ;
 661:  LBL[104] ;
 662:   ;
 663:  DO[27:RB_PEDALDN]=OFF ;
 664:   ;
 665:L P[87:Bend 5 Pick] 1.0sec FINE    ;
 666:   ;
 667:  WAIT   1.00(sec) ;
 668:   ;
 669:  CALL ALL_VAC_ON    ;
 670:   ;
 671:  CALL MAG_GRIP_ON    ;
 672:   ;
 673:  WAIT   1.00(sec) ;
 674:   ;
 675:  CALL OPEN_PRESS    ;
 676:   ;
 677:  WAIT   1.00(sec) ;
 678:   ;
 679:L P[89:Lift Part out of Die] 700mm/sec CNT50    ;
 680:   ;
 681:L P[90:Rotate for Clearance] 400mm/sec CNT25    ;
 682:   ;
 683:L P[91:Pull Part out of Press] 400mm/sec CNT50    ;
 684:  !End Bend 5 ;
 685:   ;
 686:  UFRAME_NUM=4 ;
 687:   ;
 688:J P[31:Prep for Rotation] 50% FINE    ;
 689:   ;
 690:J P[32:Rotate to Outfeed Vertical Orien] 50% FINE    ;
 691:   ;
 692:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 693:   ;
 694:  !Outfeed Pallet Sequence ;
 695:  UFRAME_NUM=6 ;
 696:   ;
 697:  PR[15,1:Pallet Offset]=0    ;
 698:  PR[15,2:Pallet Offset]=0    ;
 699:  PR[15,3:Pallet Offset]=0    ;
 700:   ;
 701:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 702:   ;
 703:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 704:   ;
 705:  IF (R[1:Layer Count]>1 AND R[1:Layer Count]<=3) THEN ;
 706:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-R[12:Part Offset 2]) ;
 707:  ENDIF ;
 708:   ;
 709:  IF (R[1:Layer Count]>=4 AND R[1:Layer Count]<6) THEN ;
 710:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[12:Part Offset 2]*2)) ;
 711:  ENDIF ;
 712:   ;
 713:  IF (R[1:Layer Count]=1 OR R[1:Layer Count]=3 OR R[1:Layer Count]=5) THEN ;
 714:  PR[15,3:Pallet Offset]=(50) ;
 715:  ENDIF ;
 716:   ;
 717:J P[93:Transition to Outfeed] 50% CNT50    ;
 718:   ;
 719:  WAIT (DI[32:RB_OUTFEED_SET]=ON)    ;
 720:   ;
 721:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 722:   ;
 723:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 724:   ;
 725:L P[36:Place Part in Outfeed Pallet] 500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 726:   ;
 727:  WAIT   1.50(sec) ;
 728:   ;
 729:  CALL ALL_VAC_OFF    ;
 730:   ;
 731:  CALL MAG_GRIP_OFF    ;
 732:   ;
 733:  WAIT    .25(sec) ;
 734:   ;
 735:L P[37:Pull Away from Part] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 736:   ;
 737:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 738:   ;
 739:L P[34:Over Outfeed] 2000mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 740:   ;
 741:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 742:   ;
 743:  R[10:Current Part]=R[10:Current Part]+1    ;
 744:   ;
 745:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 746:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 747:  ENDIF ;
 748:   ;
 749:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 750:  R[1:Layer Count]=0    ;
 751:  R[2:Pallet Count]=0    ;
 752:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 753:  ENDIF ;
 754:   ;
 755:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
 756:  R[1:Layer Count]=0    ;
 757:  R[2:Pallet Count]=0    ;
 758:  R[10:Current Part]=1    ;
 759:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 760:  PAUSE ;
 761:  ENDIF ;
 762:   ;
 763:  F[1:First Part]=(OFF) ;
 764:   ;
 765:  CALL END_PART    ;
 766:   ;
 767:  JMP LBL[2] ;
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
	X =  1232.142  mm,	Y =   628.387  mm,	Z =    -2.000  mm,
	W =  -179.757 deg,	P =     -.046 deg,	R =    89.686 deg,
	E1=   300.000  mm
};
P[5:"Pick from Zero"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1143.295  mm,	Y =   778.781  mm,	Z =    -5.231  mm,
	W =   179.546 deg,	P =     -.033 deg,	R =    90.300 deg,
	E1=   300.017  mm
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
	X =  -206.345  mm,	Y = -1727.933  mm,	Z =  1117.722  mm,
	W =     4.268 deg,	P =    -4.240 deg,	R =   -84.566 deg,
	E1=  3961.895  mm
};
P[9:"Approach Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   196.942  mm,	Y = -1144.130  mm,	Z =   176.917  mm,
	W =      .898 deg,	P =    -2.265 deg,	R =   -88.951 deg,
	E1=  4042.800  mm
};
P[10:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    97.589  mm,	Y =  -774.380  mm,	Z =    87.528  mm,
	W =      .761 deg,	P =     -.691 deg,	R =   -90.085 deg,
	E1=  3813.969  mm
};
P[11:"Bend 1 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   110.029  mm,	Y =  -610.214  mm,	Z =   487.169  mm,
	W =     -.162 deg,	P =   -40.570 deg,	R =   -89.365 deg,
	E1=  3345.265  mm
};
P[12:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   109.943  mm,	Y =  -595.056  mm,	Z =   562.334  mm,
	W =     -.161 deg,	P =   -40.570 deg,	R =   -89.365 deg,
	E1=  3345.266  mm
};
P[13:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   106.897  mm,	Y =  -815.148  mm,	Z =   565.120  mm,
	W =     -.161 deg,	P =   -40.570 deg,	R =   -89.365 deg,
	E1=  3345.266  mm
};
P[14:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   122.910  mm,	Y =  -826.918  mm,	Z =    70.176  mm,
	W =     1.131 deg,	P =    -2.100 deg,	R =   -88.830 deg,
	E1=  3854.095  mm
};
P[15:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   141.023  mm,	Y = -1030.287  mm,	Z =   636.986  mm,
	W =     1.073 deg,	P =   -35.473 deg,	R =   -90.552 deg,
	E1=  3671.427  mm
};
P[16]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1189.627  mm,	Y =   763.096  mm,	Z =    55.776  mm,
	W =  -179.756 deg,	P =     -.043 deg,	R =    89.687 deg,
	E1=   300.004  mm
};
P[17:"17:On Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   101.067  mm,	Y =  -782.183  mm,	Z =    -4.466  mm,
	W =     -.517 deg,	P =    -1.054 deg,	R =   -90.105 deg,
	E1=  3840.466  mm
};
P[18:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   139.936  mm,	Y =  -780.027  mm,	Z =    54.295  mm,
	W =     1.191 deg,	P =    -2.056 deg,	R =   -89.619 deg,
	E1=  3785.961  mm
};
P[19:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   139.933  mm,	Y =  -757.557  mm,	Z =     2.506  mm,
	W =      .412 deg,	P =    -1.473 deg,	R =   -89.467 deg,
	E1=  3771.142  mm
};
P[20:"Bend 2 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   140.888  mm,	Y =  -744.751  mm,	Z =   513.932  mm,
	W =     1.073 deg,	P =   -35.473 deg,	R =   -90.552 deg,
	E1=  3671.427  mm
};
P[21:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   140.851  mm,	Y =  -743.239  mm,	Z =   633.351  mm,
	W =     1.073 deg,	P =   -35.473 deg,	R =   -90.552 deg,
	E1=  3671.427  mm
};
P[22:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    98.781  mm,	Y = -1128.320  mm,	Z =   641.542  mm,
	W =     -.192 deg,	P =   -38.590 deg,	R =   -89.556 deg,
	E1=  4064.411  mm
};
P[23:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   219.210  mm,	Y = -2537.932  mm,	Z =   900.760  mm,
	W =     -.005 deg,	P =    -1.106 deg,	R =   -87.958 deg,
	E1=  4328.852  mm
};
P[24:"Rotate to Bend 4"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    69.978  mm,	Y = -2556.615  mm,	Z =  1214.844  mm,
	W =     3.495 deg,	P =      .718 deg,	R =    92.094 deg,
	E1=  4328.852  mm
};
P[25:"Move for Part Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    69.671  mm,	Y = -1980.758  mm,	Z =  1075.755  mm,
	W =     3.495 deg,	P =      .718 deg,	R =    92.094 deg,
	E1=  4328.852  mm
};
P[26:"Lower Part for Press Entry"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    51.670  mm,	Y = -1453.439  mm,	Z =   495.095  mm,
	W =      .301 deg,	P =      .833 deg,	R =    92.092 deg,
	E1=  4300.771  mm
};
P[27:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =   -24.447  mm,	Y =  -525.966  mm,	Z =    -4.989  mm,
	W =     -.061 deg,	P =      .518 deg,	R =    89.381 deg,
	E1=  3620.862  mm
};
P[28:"Bend 4 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =    20.043  mm,	Y =  -644.173  mm,	Z =   126.008  mm,
	W =     -.088 deg,	P =    11.146 deg,	R =    90.090 deg,
	E1=  3682.925  mm
};
P[29:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =    20.011  mm,	Y =  -643.013  mm,	Z =   215.333  mm,
	W =     -.088 deg,	P =    11.147 deg,	R =    90.091 deg,
	E1=  3682.904  mm
};
P[30:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =    20.059  mm,	Y =  -791.148  mm,	Z =   346.647  mm,
	W =      .035 deg,	P =    32.852 deg,	R =    90.123 deg,
	E1=  3682.904  mm
};
P[31:"Prep for Rotation"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -829.228  mm,	Y = -2556.934  mm,	Z =   394.001  mm,
	W =      .631 deg,	P =    24.119 deg,	R =   116.191 deg,
	E1=    27.953  mm
};
P[32:"Rotate to Outfeed Vertical Orien"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -829.290  mm,	Y = -2554.407  mm,	Z =   593.557  mm,
	W =    -1.098 deg,	P =   -10.006 deg,	R =    -1.548 deg,
	E1=    27.953  mm
};
P[33:"Move Part to Left Side of Arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -829.290  mm,	Y = -2554.407  mm,	Z =   593.557  mm,
	W =    -6.579 deg,	P =   -75.495 deg,	R =     6.396 deg,
	E1=    27.953  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -424.157  mm,	Y =  2015.679  mm,	Z =  1954.166  mm,
	W =    -3.954 deg,	P =   -75.596 deg,	R =  -176.490 deg,
	E1=  6532.737  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, -1',
	X =   924.156  mm,	Y =  2002.537  mm,	Z =  1335.235  mm,
	W =   -33.920 deg,	P =   -88.130 deg,	R =  -146.423 deg,
	E1=  6804.534  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, 0',
	X =   923.372  mm,	Y =  2006.483  mm,	Z =   530.959  mm,
	W =   -33.918 deg,	P =   -88.130 deg,	R =  -146.425 deg,
	E1=  6542.755  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   900.339  mm,	Y =  2049.878  mm,	Z =   643.662  mm,
	W =   -12.793 deg,	P =   -86.439 deg,	R =  -167.502 deg,
	E1=  6773.146  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 1, -1',
	X =   603.105  mm,	Y =  1609.697  mm,	Z =  1840.170  mm,
	W =    -4.317 deg,	P =   -78.935 deg,	R =  -174.765 deg,
	E1=  6823.214  mm
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
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   276.990  mm,	Y = -1413.697  mm,	Z =   377.314  mm,
	W =     1.215 deg,	P =    -3.052 deg,	R =   -85.900 deg,
	E1=  4088.072  mm
};
P[43:" 43:At Back Gauge"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   101.049  mm,	Y =  -754.542  mm,	Z =    -4.816  mm,
	W =     -.517 deg,	P =    -1.054 deg,	R =   -90.105 deg,
	E1=  3805.396  mm
};
P[44:"Approach Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   196.942  mm,	Y = -1144.130  mm,	Z =   176.917  mm,
	W =      .898 deg,	P =    -2.265 deg,	R =   -88.951 deg,
	E1=  4042.800  mm
};
P[45:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.395  mm,	Y =  -958.959  mm,	Z =   165.060  mm,
	W =     1.163 deg,	P =    -2.099 deg,	R =   -91.381 deg,
	E1=  3965.172  mm
};
P[46:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    96.209  mm,	Y =  -818.515  mm,	Z =    86.489  mm,
	W =     1.163 deg,	P =    -2.099 deg,	R =   -91.382 deg,
	E1=  3839.431  mm
};
P[47:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    61.014  mm,	Y =  -732.577  mm,	Z =   -13.554  mm,
	W =      .211 deg,	P =      .054 deg,	R =   -90.268 deg,
	E1=  3789.337  mm
};
P[48:"Transition to Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1530.939  mm,	Y =   427.943  mm,	Z =  1597.312  mm,
	W =   155.677 deg,	P =   -77.691 deg,	R =   117.769 deg,
	E1=  1714.003  mm
};
P[49:"Bend 3 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   126.588  mm,	Y =  -584.606  mm,	Z =   457.680  mm,
	W =      .414 deg,	P =   -39.000 deg,	R =   -90.230 deg,
	E1=  3614.475  mm
};
P[50:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   126.545  mm,	Y =  -582.883  mm,	Z =   593.740  mm,
	W =      .414 deg,	P =   -39.000 deg,	R =   -90.230 deg,
	E1=  3614.475  mm
};
P[51:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   126.546  mm,	Y =  -618.391  mm,	Z =   661.053  mm,
	W =      .588 deg,	P =   -58.727 deg,	R =   -90.370 deg,
	E1=  3614.475  mm
};
P[52:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   126.718  mm,	Y = -1193.921  mm,	Z =   703.660  mm,
	W =     4.335 deg,	P =   -62.887 deg,	R =   -94.558 deg,
	E1=  3486.867  mm
};
P[53]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   131.686  mm,	Y = -1507.118  mm,	Z =   716.565  mm,
	W =     1.453 deg,	P =    -2.746 deg,	R =   -92.585 deg,
	E1=  4060.093  mm
};
P[54]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   132.484  mm,	Y = -1274.637  mm,	Z =   685.333  mm,
	W =     1.453 deg,	P =    -2.746 deg,	R =   -92.585 deg,
	E1=  4060.093  mm
};
P[55:"ROTATE OFF ARM"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -155.336  mm,	Y = -1694.771  mm,	Z =  1039.583  mm,
	W =    -3.378 deg,	P =    -3.408 deg,	R =   -84.316 deg,
	E1=  3975.211  mm
};
P[56:"MOVE AWAY FROM ELBOW"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   255.600  mm,	Y = -1704.879  mm,	Z =  1039.842  mm,
	W =    -3.378 deg,	P =    -3.408 deg,	R =   -84.316 deg,
	E1=  3975.211  mm
};
P[57:"MOVE ELBOW BACK"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   106.897  mm,	Y =  -815.148  mm,	Z =   565.120  mm,
	W =     -.161 deg,	P =   -40.571 deg,	R =   -89.365 deg,
	E1=  3887.542  mm
};
P[58:"ON DIE"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   139.937  mm,	Y =  -780.024  mm,	Z =     2.508  mm,
	W =      .413 deg,	P =    -1.473 deg,	R =   -89.599 deg,
	E1=  3785.961  mm
};
P[59:"ON DIE"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =    61.047  mm,	Y =  -793.384  mm,	Z =   -12.780  mm,
	W =      .225 deg,	P =      .054 deg,	R =   -91.359 deg,
	E1=  3874.636  mm
};
P[60:"ROTATE AWAY FROM ARM"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   752.837  mm,	Y = -2574.806  mm,	Z =   361.131  mm,
	W =  -145.765 deg,	P =   -89.256 deg,	R =   -37.089 deg,
	E1=  4328.852  mm
};
P[61:"ROTATE UP"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   491.121  mm,	Y = -2526.333  mm,	Z =   724.624  mm,
	W =    80.677 deg,	P =    -3.613 deg,	R =    95.673 deg,
	E1=  4328.852  mm
};
P[62:"Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =   -40.050  mm,	Y =  -582.731  mm,	Z =    37.978  mm,
	W =     -.081 deg,	P =     1.486 deg,	R =    89.753 deg,
	E1=  3745.250  mm
};
P[63:"On Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =   -24.458  mm,	Y =  -579.772  mm,	Z =    -4.446  mm,
	W =     -.057 deg,	P =      .517 deg,	R =    89.754 deg,
	E1=  3711.997  mm
};
P[64:"Over Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1315.368  mm,	Y =   454.303  mm,	Z =   817.300  mm,
	W =   167.404 deg,	P =   -79.247 deg,	R =   107.214 deg,
	E1=  1663.457  mm
};
P[65:"In Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1230.982  mm,	Y =    11.539  mm,	Z =   545.003  mm,
	W =   -19.698 deg,	P =   -89.260 deg,	R =   -70.097 deg,
	E1=  1580.837  mm
};
P[66:"Pull Away From Part"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1179.316  mm,	Y =   -88.080  mm,	Z =   602.827  mm,
	W =    25.238 deg,	P =   -89.477 deg,	R =  -115.385 deg,
	E1=  1524.149  mm
};
P[67:"Clear Regrip Arms"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1146.970  mm,	Y =  -478.420  mm,	Z =  1494.688  mm,
	W =  -108.146 deg,	P =   -89.311 deg,	R =    18.306 deg,
	E1=  2623.743  mm
};
P[68:"Prep for Rotating Wrist"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =  1636.428  mm,	Y =   141.917  mm,	Z =  2361.756  mm,
	W =  -167.824 deg,	P =   -66.021 deg,	R =    77.765 deg,
	E1=  2623.743  mm
};
P[69:"Rotate Wrist"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1688.250  mm,	Y =  -409.655  mm,	Z =  2538.831  mm,
	W =  -127.587 deg,	P =    62.878 deg,	R =   140.734 deg,
	E1=  2623.743  mm
};
P[70:"Above regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1205.052  mm,	Y =   299.949  mm,	Z =  1012.171  mm,
	W =  -155.772 deg,	P =    82.515 deg,	R =   116.798 deg,
	E1=   868.408  mm
};
P[71:"Regrip Pick"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1161.881  mm,	Y =   -10.702  mm,	Z =   718.981  mm,
	W =  -169.893 deg,	P =    88.047 deg,	R =    99.080 deg,
	E1=   327.721  mm
};
P[72:"Pull Part Off Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1268.057  mm,	Y =   106.076  mm,	Z =   827.850  mm,
	W =   169.576 deg,	P =    74.744 deg,	R =    78.448 deg,
	E1=   327.733  mm
};
P[73:"Exit Regrip"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2109.574  mm,	Y = -1015.750  mm,	Z =  3762.101  mm,
	W =  -179.460 deg,	P =    53.676 deg,	R =    79.589 deg,
	E1=  3874.156  mm
};
P[74:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =   103.778  mm,	Y =  -718.987  mm,	Z =   135.829  mm,
	W =     -.071 deg,	P =     1.486 deg,	R =    90.502 deg,
	E1=  3731.426  mm
};
P[75:"MOVE AWAY FROM PRESS"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =    20.300  mm,	Y = -1139.557  mm,	Z =   445.709  mm,
	W =      .243 deg,	P =    73.408 deg,	R =    90.284 deg,
	E1=  3682.892  mm
};
P[76:"PREP FOR ROTATE"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1117.029  mm,	Y =  -211.960  mm,	Z =  3436.589  mm,
	W =    99.404 deg,	P =    22.193 deg,	R =  -119.024 deg,
	E1=  3682.875  mm
};
P[77:"ROTATE FOR REGRIP"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  2310.021  mm,	Y =   -62.416  mm,	Z =  3242.933  mm,
	W =  -172.943 deg,	P =   -35.546 deg,	R =    76.473 deg,
	E1=  3682.875  mm
};
P[78:"Above regrip pick"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1161.885  mm,	Y =   251.441  mm,	Z =   752.199  mm,
	W =  -169.893 deg,	P =    88.047 deg,	R =    99.080 deg,
	E1=   327.721  mm
};
P[79:"slide part"]{
   GP1:
	UF : 5, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1196.915  mm,	Y =    68.223  mm,	Z =   783.724  mm,
	W =  -170.485 deg,	P =    88.050 deg,	R =    99.991 deg,
	E1=   327.721  mm
};
P[80]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -162.490  mm,	Y = -2494.061  mm,	Z =   993.128  mm,
	W =    93.041 deg,	P =    74.399 deg,	R =    93.028 deg,
	E1=  4208.896  mm
};
P[81]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -436.661  mm,	Y = -1188.384  mm,	Z =   374.316  mm,
	W =   156.085 deg,	P =    88.305 deg,	R =  -113.364 deg,
	E1=  2303.753  mm
};
P[82:"Approach Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -436.703  mm,	Y = -1120.176  mm,	Z =   373.452  mm,
	W =   156.220 deg,	P =    88.307 deg,	R =  -113.571 deg,
	E1=  2044.177  mm
};
P[83:"In Front of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -436.634  mm,	Y = -1122.757  mm,	Z =   169.859  mm,
	W =     -.216 deg,	P =    -1.268 deg,	R =    90.730 deg,
	E1=   212.828  mm
};
P[84:"Part Insert in Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -430.441  mm,	Y =  -684.170  mm,	Z =   185.678  mm,
	W =      .492 deg,	P =    -1.235 deg,	R =    89.881 deg,
	E1=   649.718  mm
};
P[85:"ON DIE"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -430.600  mm,	Y =  -328.998  mm,	Z =     -.622  mm,
	W =      .492 deg,	P =    -1.235 deg,	R =    89.880 deg,
	E1=  1157.970  mm
};
P[86:"In Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -429.922  mm,	Y =  -420.036  mm,	Z =   -14.833  mm,
	W =      .488 deg,	P =    -1.234 deg,	R =    89.588 deg,
	E1=  1050.172  mm
};
P[87:"Bend 5 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -429.986  mm,	Y =  -408.192  mm,	Z =    97.271  mm,
	W =      .343 deg,	P =    16.230 deg,	R =    90.171 deg,
	E1=  1055.235  mm
};
P[88:"Stretch arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   148.949  mm,	Y = -1113.605  mm,	Z =   339.300  mm,
	W =      .153 deg,	P =     1.150 deg,	R =    91.397 deg,
	E1=  4036.263  mm
};
P[89:"Lift Part out of Die"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -430.043  mm,	Y =  -405.921  mm,	Z =   276.613  mm,
	W =      .265 deg,	P =    16.230 deg,	R =    90.150 deg,
	E1=  1055.235  mm
};
P[90:"Rotate for Clearance"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -430.072  mm,	Y =  -404.779  mm,	Z =   366.891  mm,
	W =      .279 deg,	P =    22.503 deg,	R =    90.152 deg,
	E1=  1055.235  mm
};
P[91:"Pull Part out of Press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -429.458  mm,	Y = -1441.507  mm,	Z =   417.364  mm,
	W =      .281 deg,	P =    23.397 deg,	R =    90.153 deg,
	E1=    -2.299  mm
};
P[92:"Stretch arm at press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   126.900  mm,	Y =  -889.012  mm,	Z =   239.661  mm,
	W =      .045 deg,	P =     1.315 deg,	R =    90.961 deg,
	E1=  3887.596  mm
};
P[93:"Transition to Outfeed"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X = -2914.028  mm,	Y =  1906.274  mm,	Z =  1455.961  mm,
	W =    -4.453 deg,	P =   -75.732 deg,	R =   150.876 deg,
	E1=  4043.633  mm
};
P[94:"Reposition grip"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -429.807  mm,	Y =  -616.428  mm,	Z =     2.980  mm,
	W =      .492 deg,	P =    -1.234 deg,	R =    89.880 deg,
	E1=   739.873  mm
};
P[95:"clear arm"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -436.634  mm,	Y = -1122.750  mm,	Z =   170.523  mm,
	W =    19.899 deg,	P =    88.028 deg,	R =   110.130 deg,
	E1=     3.992  mm
};
P[96:"in press"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'F U T, 0, 0, 1',
	X =  -430.632  mm,	Y =  -369.194  mm,	Z =   181.688  mm,
	W =      .492 deg,	P =    -1.235 deg,	R =    89.880 deg,
	E1=  1109.608  mm
};
P[97:"above infeed"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   726.762  mm,	Y =  3668.615  mm,	Z =   157.922  mm,
	W =   180.000 deg,	P =      .000 deg,	R =      .000 deg,
	E1=  3749.993  mm
};
/END
