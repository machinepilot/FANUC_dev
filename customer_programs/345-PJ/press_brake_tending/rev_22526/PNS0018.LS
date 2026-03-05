/PROG  PNS0018
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5354990";
PROG_SIZE	= 18191;
CREATE		= DATE 26-02-05  TIME 14:20:06;
MODIFIED	= DATE 26-02-06  TIME 15:20:02;
FILE_NAME	= PNS0014;
VERSION		= 0;
LINE_COUNT	= 803;
MEMORY_SIZE	= 18927;
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
   1:  !PART #: 5353311 ;
   2:  !SIDE PANEL ;
   3:  UTOOL_NUM=2 ;
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
  16:  R[4:Pallet Limit]=4    ;
  17:  R[7:Part Width]=2216    ;
  18:  R[8:Num of Pallets]=1    ;
  19:  R[9]=0    ;
  20:  R[11:Part Offset Pal]=370    ;
  21:  R[12:Part Offset 2]=0    ;
  22:  R[13:Tool Required]=2    ;
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
  47:J P[54:Approach Measure] 50% FINE    ;
  48:   ;
  49:  SKIP CONDITION RI[1:PART PRESENT]=ON    ;
  50:L P[53:On Part] 700mm/sec FINE SkipJump,LBL[3]    ;
  51:   ;
  52:  !Recovery if no parts found ;
  53:L P[54:Approach Measure] 700mm/sec FINE    ;
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
 133:  IF (R[16:Difference]>=(-100) AND R[16:Difference]<=100) THEN ;
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
 191:  WAIT    .25(sec) ;
 192:   ;
 193:  CALL ALL_VAC_ON    ;
 194:   ;
 195:  CALL MAG_GRIP_ON    ;
 196:   ;
 197:  WAIT    .25(sec) ;
 198:   ;
 199:L P[1:Approach/Exit] 700mm/sec FINE    ;
 200:   ;
 201:  !End Infeed Pick ;
 202:   ;
 203:  !Begin Zero ;
 204:  UFRAME_NUM=3 ;
 205:   ;
 206:L P[55:Rotate Torwards Zero] 4000mm/sec CNT50    ;
 207:   ;
 208:L P[56:Approach/Exit] 2000mm/sec CNT50    ;
 209:   ;
 210:L P[57:Above Zero] 1500mm/sec CNT100    ;
 211:   ;
 212:L P[58:Place in Zero] 700mm/sec FINE    ;
 213:   ;
 214:  WAIT    .25(sec) ;
 215:   ;
 216:  CALL ALL_VAC_OFF    ;
 217:   ;
 218:  CALL MAG_GRIP_OFF    ;
 219:   ;
 220:  WAIT    .25(sec) ;
 221:   ;
 222:L P[4:approach exit pick] 700mm/sec FINE    ;
 223:   ;
 224:   ;
 225:L P[5:Pick from Zero] 250mm/sec FINE    ;
 226:   ;
 227:  WAIT    .25(sec) ;
 228:   ;
 229:  CALL ALL_VAC_ON    ;
 230:   ;
 231:  CALL MAG_GRIP_ON    ;
 232:   ;
 233:  WAIT    .25(sec) ;
 234:   ;
 235:L P[57:Above Zero] 700mm/sec CNT50    ;
 236:   ;
 237:L P[56:Approach/Exit] 700mm/sec CNT50    ;
 238:  !End Zero ;
 239:   ;
 240:  !Begin Bend 1 ;
 241:  UFRAME_NUM=2 ;
 242:   ;
 243:J P[6:Transition to Press] 25% CNT25    ;
 244:   ;
 245:   ;
 246:L P[114:In Front of Press] 2000mm/sec CNT25    ;
 247:   ;
 248:  CALL PRE_BG    ;
 249:   ;
 250:L P[39:Approach Press] 1000mm/sec CNT25    ;
 251:   ;
 252:L P[41:In Press] 500mm/sec CNT25    ;
 253:   ;
 254:  WAIT    .25(sec) ;
 255:   ;
 256:  CALL ADJ_BG    ;
 257:   ;
 258:  WAIT    .25(sec) ;
 259:   ;
 260:  CALL PINCH    ;
 261:   ;
 262:  WAIT    .25(sec) ;
 263:   ;
 264:  CALL ALL_VAC_OFF    ;
 265:   ;
 266:  CALL MAG_GRIP_OFF    ;
 267:   ;
 268:  WAIT   1.00(sec) ;
 269:   ;
 270:  CALL BEND    ;
 271:   ;
 272:  !Change time for next ;
 273:  !Waypoint to adjust follow ;
 274:  UFRAME_NUM=2 ;
 275:   ;
 276:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 277:   ;
 278:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 279:L P[49:Bend 1 Pick] 1.0sec FINE SkipJump,LBL[100]    ;
 280:   ;
 281:  LBL[100] ;
 282:   ;
 283:  DO[27:RB_PEDALDN]=OFF ;
 284:   ;
 285:L P[111:Bend 1 Pick] 1.0sec FINE    ;
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
 299:L P[11:Lift Part out of Die] 700mm/sec FINE    ;
 300:   ;
 301:   ;
 302:L P[12:Pull Part out of Press] 1480mm/sec FINE    ;
 303:   ;
 304:L P[13:rotate for bend 2] 700mm/sec FINE    ;
 305:   ;
 306:   ;
 307:  !End Bend 1 ;
 308:   ;
 309:  !Bend 2 Sequence ;
 310:  UFRAME_NUM=2 ;
 311:   ;
 312:J P[62:Approach Press] 50% CNT25    ;
 313:   ;
 314:  CALL PRE_BG    ;
 315:   ;
 316:L P[18:Part on Die] 700mm/sec FINE    ;
 317:   ;
 318:L P[19:In Press] 700mm/sec FINE    ;
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
 332:  UFRAME_NUM=2 ;
 333:   ;
 334:  WAIT   1.00(sec) ;
 335:   ;
 336:  CALL BEND    ;
 337:   ;
 338:  !Change time for next ;
 339:  !Waypoint to adjust follow ;
 340:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 341:   ;
 342:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 343:L P[115:Bend 2 Pick] 1.0sec FINE SkipJump,LBL[101]    ;
 344:   ;
 345:  LBL[101] ;
 346:   ;
 347:  DO[27:RB_PEDALDN]=OFF ;
 348:   ;
 349:L P[116:Bend 2 Pick] 1.0sec FINE    ;
 350:   ;
 351:  WAIT    .25(sec) ;
 352:   ;
 353:  CALL ALL_VAC_ON    ;
 354:   ;
 355:  CALL MAG_GRIP_ON    ;
 356:   ;
 357:  WAIT   1.00(sec) ;
 358:   ;
 359:  CALL OPEN_PRESS    ;
 360:   ;
 361:  WAIT    .25(sec) ;
 362:   ;
 363:L P[117:Lift Part out of Die] 700mm/sec CNT50    ;
 364:   ;
 365:L P[119:exit press] 720mm/sec CNT25    ;
 366:   ;
 367:L P[3:clear arm] 1500mm/sec FINE    ;
 368:   ;
 369:J P[7:rotate arm] 37% FINE    ;
 370:   ;
 371:L P[8:rotate part] 1500mm/sec FINE    ;
 372:   ;
 373:  !End Bend 2 ;
 374:   ;
 375:  !Bend 3 Sequence ;
 376:  UFRAME_NUM=2 ;
 377:   ;
 378:J P[9:approach press] 50% FINE    ;
 379:   ;
 380:L P[10:rotate towards press] 1500mm/sec FINE    ;
 381:   ;
 382:L P[14:in front of press] 1000mm/sec FINE    ;
 383:   ;
 384:L P[31:in press] 700mm/sec FINE    ;
 385:   ;
 386:  CALL PRE_BG    ;
 387:   ;
 388:L P[22:On Die] 700mm/sec FINE    ;
 389:   ;
 390:  WAIT    .25(sec) ;
 391:   ;
 392:  CALL PINCH    ;
 393:   ;
 394:  WAIT    .25(sec) ;
 395:   ;
 396:  CALL ALL_VAC_OFF    ;
 397:   ;
 398:  CALL MAG_GRIP_OFF    ;
 399:   ;
 400:  WAIT   1.00(sec) ;
 401:   ;
 402:  CALL BEND    ;
 403:   ;
 404:  !Change time for next ;
 405:  !Waypoint to adjust follow ;
 406:  WAIT (RI[1:PART PRESENT]=ON)    ;
 407:   ;
 408:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 409:L P[23:Adjust Grip] 1.0sec FINE SkipJump,LBL[103]    ;
 410:   ;
 411:  LBL[103] ;
 412:   ;
 413:  DO[27:RB_PEDALDN]=OFF ;
 414:   ;
 415:L P[23:Adjust Grip] 1.0sec FINE    ;
 416:   ;
 417:  WAIT    .25(sec) ;
 418:   ;
 419:  CALL ALL_VAC_ON    ;
 420:   ;
 421:  CALL MAG_GRIP_ON    ;
 422:   ;
 423:  WAIT   1.00(sec) ;
 424:   ;
 425:  CALL OPEN_PRESS    ;
 426:   ;
 427:  WAIT    .25(sec) ;
 428:   ;
 429:L P[127:approach backgauge] 250mm/sec FINE    ;
 430:   ;
 431:L P[27:In Press] 250mm/sec FINE    ;
 432:   ;
 433:  CALL ADJ_BG    ;
 434:   ;
 435:  WAIT    .25(sec) ;
 436:   ;
 437:  CALL PINCH    ;
 438:   ;
 439:  WAIT    .25(sec) ;
 440:   ;
 441:  CALL ALL_VAC_OFF    ;
 442:   ;
 443:  CALL MAG_GRIP_OFF    ;
 444:   ;
 445:  WAIT   1.00(sec) ;
 446:   ;
 447:  UFRAME_NUM=2 ;
 448:   ;
 449:L P[24:Clear Part for Bend] 1500mm/sec FINE    ;
 450:   ;
 451:  CALL BEND    ;
 452:   ;
 453:  !Change time for next ;
 454:  !Waypoint to adjust follow ;
 455:  WAIT   1.50(sec) ;
 456:   ;
 457:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 458:L P[28:Prep for Rotate for Bend 3 Pick] 1.0sec FINE SkipJump,LBL[102]    ;
 459:   ;
 460:  LBL[102] ;
 461:   ;
 462:  DO[27:RB_PEDALDN]=OFF ;
 463:   ;
 464:L P[28:Prep for Rotate for Bend 3 Pick] 1.0sec FINE    ;
 465:   ;
 466:   ;
 467:L P[26:Lower to Bend 3 Pick] 1500mm/sec CNT25    ;
 468:   ;
 469:L P[64:Approach Bend 3 Pick] 1500mm/sec CNT25    ;
 470:   ;
 471:L P[65:Bend 3 Pick] 1000mm/sec FINE    ;
 472:   ;
 473:  WAIT    .25(sec) ;
 474:   ;
 475:  CALL ALL_VAC_ON    ;
 476:   ;
 477:  CALL MAG_GRIP_ON    ;
 478:   ;
 479:  WAIT   1.00(sec) ;
 480:   ;
 481:  CALL OPEN_PRESS    ;
 482:   ;
 483:  WAIT    .25(sec) ;
 484:   ;
 485:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 486:   ;
 487:L P[66:Rotate for Clearance] 100mm/sec FINE    ;
 488:   ;
 489:L P[30:Pull Part out of Press] 1500mm/sec CNT50    ;
 490:   ;
 491:J P[15:prep for rotate] 17% FINE    ;
 492:   ;
 493:J P[20:rotate arm] 25% FINE    ;
 494:   ;
 495:L P[67:Rotate] 2000mm/sec CNT25    ;
 496:   ;
 497:  !End Bend 3 ;
 498:   ;
 499:  !Bend 4 Sequence ;
 500:  UFRAME_NUM=2 ;
 501:   ;
 502:L P[128:clear arm ] 1500mm/sec FINE    ;
 503:   ;
 504:L P[69:Approach Press] 1480mm/sec CNT50    ;
 505:   ;
 506:  CALL PRE_BG    ;
 507:   ;
 508:L P[21:lower to press] 700mm/sec FINE    ;
 509:   ;
 510:L P[74:Insert in Press] 700mm/sec FINE    ;
 511:   ;
 512:L P[76:In Press] 250mm/sec FINE    ;
 513:   ;
 514:  CALL ADJ_BG    ;
 515:   ;
 516:  WAIT    .25(sec) ;
 517:   ;
 518:  CALL PINCH    ;
 519:   ;
 520:  WAIT    .25(sec) ;
 521:   ;
 522:  CALL ALL_VAC_OFF    ;
 523:   ;
 524:  CALL MAG_GRIP_OFF    ;
 525:   ;
 526:  WAIT   1.00(sec) ;
 527:   ;
 528:  UFRAME_NUM=2 ;
 529:   ;
 530:L P[77:Wait for Bend 4] 1500mm/sec FINE    ;
 531:   ;
 532:  CALL BEND    ;
 533:   ;
 534:  !Change time for next ;
 535:  !Waypoint to adjust follow ;
 536:  WAIT   1.50(sec) ;
 537:   ;
 538:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 539:L P[78:Bend 4 Pick] 1.0sec FINE SkipJump,LBL[104]    ;
 540:   ;
 541:  LBL[104] ;
 542:   ;
 543:  DO[27:RB_PEDALDN]=OFF ;
 544:   ;
 545:L P[78:Bend 4 Pick] 1.0sec FINE    ;
 546:   ;
 547:  WAIT    .25(sec) ;
 548:   ;
 549:  CALL ALL_VAC_ON    ;
 550:   ;
 551:  CALL MAG_GRIP_ON    ;
 552:   ;
 553:  WAIT   1.00(sec) ;
 554:   ;
 555:  CALL OPEN_PRESS    ;
 556:   ;
 557:  WAIT    .25(sec) ;
 558:   ;
 559:L P[80:Lift Part out of Die] 700mm/sec CNT50    ;
 560:   ;
 561:L P[81:Rotate for Clearance] 750mm/sec CNT25    ;
 562:   ;
 563:L P[70:Pull Part out of Press] 1500mm/sec FINE    ;
 564:  !End Bend 4 ;
 565:   ;
 566:J P[16:rotate arm] 50% FINE    ;
 567:   ;
 568:J P[42:rotate for re grip] 37% FINE    ;
 569:   ;
 570:   ;
 571:J P[61:approach zero table] 37% FINE    ;
 572:   ;
 573:L P[59:over zero table] 1000mm/sec FINE    ;
 574:   ;
 575:L P[60:place in zero] 500mm/sec FINE    ;
 576:   ;
 577:  WAIT    .25(sec) ;
 578:   ;
 579:  CALL ALL_VAC_OFF    ;
 580:   ;
 581:  CALL MAG_GRIP_OFF    ;
 582:   ;
 583:  WAIT    .25(sec) ;
 584:   ;
 585:L P[112:clear part] 700mm/sec FINE    ;
 586:   ;
 587:L P[118:prep to rotate] 1500mm/sec FINE    ;
 588:   ;
 589:L P[122:rotate part] 1500mm/sec FINE    ;
 590:   ;
 591:L P[123:approach regrip] 1000mm/sec FINE    ;
 592:   ;
 593:L P[17:above zero] 1000mm/sec FINE    ;
 594:   ;
 595:L P[130:pick off zero table] 250mm/sec FINE    ;
 596:   ;
 597:  WAIT   1.50(sec) ;
 598:   ;
 599:  RO[7:Extend Bar]=ON ;
 600:   ;
 601:  CALL ALL_VAC_ON    ;
 602:   ;
 603:  CALL MAG_GRIP_ON    ;
 604:   ;
 605:  WAIT   1.50(sec) ;
 606:   ;
 607:L P[131:above regrip] 100mm/sec FINE    ;
 608:   ;
 609:L P[132:pull away from zero table] 1500mm/sec FINE    ;
 610:   ;
 611:  !Bend 5 Sequence ;
 612:  UFRAME_NUM=2 ;
 613:   ;
 614:L P[133:clear arm ] 1000mm/sec FINE    ;
 615:   ;
 616:L P[134:rotate] 700mm/sec FINE    ;
 617:   ;
 618:L P[135:approach press] 1000mm/sec FINE    ;
 619:   ;
 620:L P[136:in front of press] 1500mm/sec FINE    ;
 621:   ;
 622:L P[73:Insert in Press] 700mm/sec CNT25    ;
 623:   ;
 624:  WAIT   1.00(sec) ;
 625:   ;
 626:  CALL PINCH    ;
 627:   ;
 628:  CALL BEND    ;
 629:   ;
 630:  WAIT (DI[23:RB_LDP])    ;
 631:   ;
 632:  DO[27:RB_PEDALDN]=OFF ;
 633:   ;
 634:  WAIT    .25(sec) ;
 635:   ;
 636:  CALL ALL_VAC_OFF    ;
 637:   ;
 638:  CALL MAG_GRIP_OFF    ;
 639:   ;
 640:  RO[7:Extend Bar]=OFF ;
 641:   ;
 642:  WAIT   1.00(sec) ;
 643:   ;
 644:L P[137:move for regrip] 680mm/sec FINE    ;
 645:   ;
 646:L P[138:lower to part] 700mm/sec FINE    ;
 647:   ;
 648:L P[139:pick part] 700mm/sec FINE    ;
 649:   ;
 650:  WAIT    .25(sec) ;
 651:   ;
 652:  CALL ALL_VAC_ON    ;
 653:   ;
 654:  CALL MAG_GRIP_ON    ;
 655:   ;
 656:  WAIT    .25(sec) ;
 657:   ;
 658:  CALL OPEN_PRESS    ;
 659:   ;
 660:  WAIT   1.00(sec) ;
 661:   ;
 662:  CALL PRE_BG    ;
 663:   ;
 664:L P[43:approach bg] 250mm/sec FINE    ;
 665:   ;
 666:L P[71:In Press] 250mm/sec FINE    ;
 667:   ;
 668:  CALL ADJ_BG    ;
 669:   ;
 670:  WAIT    .25(sec) ;
 671:   ;
 672:  CALL PINCH    ;
 673:   ;
 674:  WAIT    .25(sec) ;
 675:   ;
 676:  CALL ALL_VAC_OFF    ;
 677:   ;
 678:  CALL MAG_GRIP_OFF    ;
 679:   ;
 680:  WAIT   1.00(sec) ;
 681:   ;
 682:  UFRAME_NUM=2 ;
 683:   ;
 684:   ;
 685:  CALL BEND    ;
 686:   ;
 687:  !Change time for next ;
 688:  !Waypoint to adjust follow ;
 689:  WAIT   1.50(sec) ;
 690:   ;
 691:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 692:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 693:   ;
 694:L P[44:rotate arm] 1500mm/sec FINE    ;
 695:   ;
 696:L P[45:clear arm] 1500mm/sec FINE    ;
 697:   ;
 698:L P[46:rotate tool] 1000mm/sec FINE    ;
 699:   ;
 700:J P[47:move to pick] 50% FINE    ;
 701:   ;
 702:   ;
 703:   ;
 704:L P[87:Bend 5 Pick Approach] 1.0sec FINE SkipJump,LBL[105]    ;
 705:   ;
 706:   ;
 707:  LBL[105] ;
 708:   ;
 709:  DO[27:RB_PEDALDN]=OFF ;
 710:   ;
 711:   ;
 712:   ;
 713:L P[87:Bend 5 Pick Approach] 1000mm/sec FINE    ;
 714:   ;
 715:L P[82:Bend 5 Pick] 1000mm/sec FINE    ;
 716:   ;
 717:  WAIT    .25(sec) ;
 718:   ;
 719:  CALL ALL_VAC_ON    ;
 720:   ;
 721:  CALL MAG_GRIP_ON    ;
 722:   ;
 723:  RO[7:Extend Bar]=ON ;
 724:   ;
 725:  WAIT   1.00(sec) ;
 726:   ;
 727:  CALL OPEN_PRESS    ;
 728:   ;
 729:  WAIT    .25(sec) ;
 730:   ;
 731:L P[89:Lift Part out of Die] 250mm/sec CNT50    ;
 732:   ;
 733:L P[25:rotate for clearance] 700mm/sec FINE    ;
 734:   ;
 735:L P[83:Pull Part out of Press] 700mm/sec FINE    ;
 736:  !End Bend 5 ;
 737:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 738:   ;
 739:  !Outfeed Pallet Sequence ;
 740:  UFRAME_NUM=6 ;
 741:   ;
 742:  PR[15,1:Pallet Offset]=0    ;
 743:  PR[15,2:Pallet Offset]=0    ;
 744:  PR[15,3:Pallet Offset]=0    ;
 745:   ;
 746:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 747:   ;
 748:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 749:   ;
 750:J P[32:Transition To Outfeed] 50% CNT50    ;
 751:   ;
 752:J P[52:Rotate Part] 100% CNT50    ;
 753:   ;
 754:  WAIT DI[32:RB_OUTFEED_SET]=ON    ;
 755:   ;
 756:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 757:   ;
 758:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 759:   ;
 760:L P[36:Place Part in Outfeed Pallet] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 761:   ;
 762:  WAIT    .25(sec) ;
 763:   ;
 764:  CALL ALL_VAC_OFF    ;
 765:   ;
 766:  CALL MAG_GRIP_OFF    ;
 767:   ;
 768:  WAIT    .25(sec) ;
 769:   ;
 770:J P[37:Pull Away from Part] 17% FINE Offset,PR[15:Pallet Offset]    ;
 771:   ;
 772:  RO[7:Extend Bar]=OFF ;
 773:   ;
 774:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 775:   ;
 776:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 777:   ;
 778:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 779:   ;
 780:  R[10:Current Part]=R[10:Current Part]+1    ;
 781:   ;
 782:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 783:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 784:  ENDIF ;
 785:   ;
 786:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 787:  R[1:Layer Count]=0    ;
 788:  R[2:Pallet Count]=0    ;
 789:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 790:  ENDIF ;
 791:   ;
 792:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
 793:  R[1:Layer Count]=0    ;
 794:  R[2:Pallet Count]=0    ;
 795:  R[10:Current Part]=1    ;
 796:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
 797:  ENDIF ;
 798:   ;
 799:  F[1:First Part]=(OFF) ;
 800:   ;
 801:  CALL END_PART    ;
 802:   ;
 803:  JMP LBL[2] ;
/POS
P[1:"Approach/Exit"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.175  mm,	Y =  2708.915  mm,	Z =   287.821  mm,
	W =   179.876 deg,	P =     -.630 deg,	R =      .002 deg,
	E1=  5077.159  mm
};
P[2:"On Part"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   613.957  mm,	Y =  2708.197  mm,	Z =    98.752  mm,
	W =   179.916 deg,	P =     -.210 deg,	R =      .000 deg,
	E1=  5077.154  mm
};
P[3:"clear arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1925.816  mm,	Y = -1327.785  mm,	Z =   412.007  mm,
	W =     -.008 deg,	P =    -2.475 deg,	R =   -89.996 deg,
	E1=  6271.648  mm
};
P[4:"approach exit pick"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2138.787  mm,	Y =   642.810  mm,	Z =   131.313  mm,
	W =  -179.790 deg,	P =    -1.201 deg,	R =    90.101 deg,
	E1=   787.949  mm
};
P[5:"Pick from Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2079.113  mm,	Y =   674.933  mm,	Z =    34.056  mm,
	W =  -179.795 deg,	P =    -1.174 deg,	R =    90.074 deg,
	E1=   788.084  mm
};
P[6:"Transition to Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2520.688  mm,	Y = -1443.291  mm,	Z =  1168.860  mm,
	W =   168.800 deg,	P =   -83.484 deg,	R =   101.084 deg,
	E1=  4659.826  mm
};
P[7:"rotate arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2353.303  mm,	Y = -2566.465  mm,	Z =   445.143  mm,
	W =      .636 deg,	P =    -2.220 deg,	R =  -117.220 deg,
	E1=  6271.641  mm
};
P[8:"rotate part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2353.303  mm,	Y = -2566.465  mm,	Z =   445.143  mm,
	W =      .489 deg,	P =     2.257 deg,	R =    91.026 deg,
	E1=  6271.641  mm
};
P[9:"approach press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2198.248  mm,	Y = -1365.530  mm,	Z =   413.947  mm,
	W =      .004 deg,	P =     2.471 deg,	R =    89.416 deg,
	E1=  6024.527  mm
};
P[10:"rotate towards press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2196.501  mm,	Y = -1366.602  mm,	Z =   413.989  mm,
	W =  -179.725 deg,	P =     1.718 deg,	R =   -89.104 deg,
	E1=  4216.731  mm
};
P[11:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1770.373  mm,	Y =  -535.663  mm,	Z =   473.429  mm,
	W =      .173 deg,	P =   -41.287 deg,	R =   -89.805 deg,
	E1=  5726.060  mm
};
P[12:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1770.803  mm,	Y =  -697.752  mm,	Z =   477.566  mm,
	W =      .171 deg,	P =   -43.735 deg,	R =   -89.812 deg,
	E1=  5726.060  mm
};
P[13:"rotate for bend 2"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1772.326  mm,	Y =  -708.563  mm,	Z =    53.857  mm,
	W =      .244 deg,	P =    -1.655 deg,	R =   -89.687 deg,
	E1=  5726.060  mm
};
P[14:"in front of press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2195.483  mm,	Y =  -729.874  mm,	Z =   207.678  mm,
	W =  -179.725 deg,	P =     1.718 deg,	R =   -89.104 deg,
	E1=  4216.731  mm
};
P[15:"prep for rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2742.700  mm,	Y = -2297.275  mm,	Z =   846.769  mm,
	W =    -1.385 deg,	P =    31.527 deg,	R =    61.862 deg,
	E1=  5807.252  mm
};
P[16:"rotate arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2720.887  mm,	Y = -2662.054  mm,	Z =   270.358  mm,
	W =   178.517 deg,	P =      .215 deg,	R =    32.104 deg,
	E1=  4826.669  mm
};
P[17:"above zero"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, -1',
	X =  7307.483  mm,	Y = -2833.845  mm,	Z =   333.019  mm,
	W =  -167.593 deg,	P =    -9.974 deg,	R =   179.905 deg,
	E1=    53.426  mm
};
P[18:"Part on Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1772.385  mm,	Y =  -597.554  mm,	Z =   -48.321  mm,
	W =      .243 deg,	P =    -1.655 deg,	R =   -89.687 deg,
	E1=  5726.060  mm
};
P[19:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1772.391  mm,	Y =  -584.658  mm,	Z =   -48.659  mm,
	W =      .243 deg,	P =    -1.656 deg,	R =   -89.681 deg,
	E1=  5726.060  mm
};
P[20:"rotate arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2772.258  mm,	Y = -2484.960  mm,	Z =   851.664  mm,
	W =     -.726 deg,	P =   -31.488 deg,	R =  -117.922 deg,
	E1=  5807.252  mm
};
P[21:"lower to press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2030.925  mm,	Y =  -699.719  mm,	Z =   -32.765  mm,
	W =   179.973 deg,	P =   -39.402 deg,	R =    89.848 deg,
	E1=  4229.554  mm
};
P[22:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2195.021  mm,	Y =  -420.442  mm,	Z =    96.216  mm,
	W =  -179.699 deg,	P =     1.720 deg,	R =   -90.134 deg,
	E1=  3910.904  mm
};
P[23:"Adjust Grip"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2195.629  mm,	Y =  -644.019  mm,	Z =    87.254  mm,
	W =  -179.509 deg,	P =     1.159 deg,	R =   -90.124 deg,
	E1=  3910.917  mm
};
P[24:"Clear Part for Bend"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2195.235  mm,	Y = -1005.203  mm,	Z =   265.979  mm,
	W =  -179.530 deg,	P =     1.159 deg,	R =   -89.859 deg,
	E1=  3911.247  mm
};
P[25:"rotate for clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2400.366  mm,	Y =  -425.044  mm,	Z =   294.495  mm,
	W =     1.319 deg,	P =   -54.427 deg,	R =   -90.884 deg,
	E1=  4893.173  mm
};
P[26:"Lower to Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2195.767  mm,	Y =  -702.461  mm,	Z =  -120.440  mm,
	W =     -.166 deg,	P =    65.042 deg,	R =    89.771 deg,
	E1=  3911.247  mm
};
P[27:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2179.153  mm,	Y =  -434.925  mm,	Z =    99.769  mm,
	W =  -179.984 deg,	P =      .244 deg,	R =   -90.225 deg,
	E1=  3917.682  mm
};
P[28:"Prep for Rotate for Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2194.677  mm,	Y =  -694.728  mm,	Z =   182.674  mm,
	W =    -2.673 deg,	P =    86.458 deg,	R =    87.222 deg,
	E1=  3911.247  mm
};
P[29:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2193.580  mm,	Y =  -249.762  mm,	Z =   147.701  mm,
	W =     -.569 deg,	P =    22.375 deg,	R =    89.920 deg,
	E1=  4924.037  mm
};
P[30:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2195.575  mm,	Y = -1002.014  mm,	Z =   166.900  mm,
	W =     -.618 deg,	P =    31.793 deg,	R =    89.864 deg,
	E1=  5807.252  mm
};
P[31:"in press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2194.655  mm,	Y =  -417.805  mm,	Z =   199.709  mm,
	W =  -179.681 deg,	P =     1.724 deg,	R =   -90.816 deg,
	E1=  3910.898  mm
};
P[32:"Transition To Outfeed"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X = -1931.436  mm,	Y =  2486.509  mm,	Z =  1187.284  mm,
	W =     -.308 deg,	P =   -61.488 deg,	R =   177.459 deg,
	E1=  4633.971  mm
};
P[33:"Move Part to Left Side of Arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, -1, 1',
	X =  -100.201  mm,	Y = -1253.828  mm,	Z =   583.902  mm,
	W =      .000 deg,	P =   -64.000 deg,	R =   -90.000 deg,
	E1=  4633.971  mm
};
P[34:"Over Outfeed"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -699.213  mm,	Y =  2643.828  mm,	Z =  1783.396  mm,
	W =    12.398 deg,	P =   -87.819 deg,	R =   168.404 deg,
	E1=  5605.892  mm
};
P[35:"Approach"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   734.317  mm,	Y =  2643.854  mm,	Z =  1493.995  mm,
	W =    -3.195 deg,	P =   -88.216 deg,	R =  -176.009 deg,
	E1=  7043.638  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   733.456  mm,	Y =  2648.189  mm,	Z =   609.762  mm,
	W =    15.815 deg,	P =   -88.157 deg,	R =   164.991 deg,
	E1=  7043.638  mm
};
P[37:"Pull Away from Part"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   354.606  mm,	Y =  2648.710  mm,	Z =   535.377  mm,
	W =    16.836 deg,	P =   -88.148 deg,	R =   163.971 deg,
	E1=  6664.859  mm
};
P[38:"Exit Pallet"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   359.754  mm,	Y =  2643.400  mm,	Z =  1782.364  mm,
	W =    12.398 deg,	P =   -87.819 deg,	R =   168.404 deg,
	E1=  6664.859  mm
};
P[39:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1772.419  mm,	Y =  -661.585  mm,	Z =   -25.686  mm,
	W =      .386 deg,	P =    -1.665 deg,	R =   -89.740 deg,
	E1=  5818.919  mm
};
P[40:"Zero Point"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.135  mm,	Y =  4668.521  mm,	Z =   167.504  mm,
	W =  -179.989 deg,	P =     -.061 deg,	R =      .000 deg,
	E1=  2807.345  mm
};
P[41:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1772.406  mm,	Y =  -625.588  mm,	Z =   -50.006  mm,
	W =      .386 deg,	P =    -1.664 deg,	R =   -89.740 deg,
	E1=  5725.999  mm
};
P[42:"rotate for re grip"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  2929.512  mm,	Y = -2846.353  mm,	Z =   287.619  mm,
	W =   178.288 deg,	P =     1.062 deg,	R =    -1.901 deg,
	E1=  4661.252  mm
};
P[43:"approach bg"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2402.586  mm,	Y =  -713.707  mm,	Z =  -126.303  mm,
	W =      .204 deg,	P =     -.134 deg,	R =   -89.756 deg,
	E1=  5211.315  mm
};
P[44:"rotate arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  3402.274  mm,	Y = -2318.519  mm,	Z =   -81.722  mm,
	W =     1.111 deg,	P =      .365 deg,	R =  -131.353 deg,
	E1=  5160.309  mm
};
P[45:"clear arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  3400.212  mm,	Y = -2303.882  mm,	Z =   492.016  mm,
	W =     1.111 deg,	P =      .365 deg,	R =  -131.353 deg,
	E1=  5160.309  mm
};
P[46:"rotate tool"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  3400.211  mm,	Y = -2303.882  mm,	Z =   492.016  mm,
	W =      .136 deg,	P =     -.138 deg,	R =   -89.590 deg,
	E1=  5160.309  mm
};
P[47:"move to pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2865.270  mm,	Y = -1119.279  mm,	Z =   458.130  mm,
	W =     -.364 deg,	P =     -.584 deg,	R =   -89.627 deg,
	E1=  5156.632  mm
};
P[49:"Bend 1 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1770.690  mm,	Y =  -538.300  mm,	Z =   368.957  mm,
	W =      .174 deg,	P =   -41.286 deg,	R =   -89.804 deg,
	E1=  5726.060  mm
};
P[52:"Rotate Part"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X = -1798.363  mm,	Y =  2627.495  mm,	Z =  1771.246  mm,
	W =    -1.036 deg,	P =   -83.282 deg,	R =   179.130 deg,
	E1=  4633.971  mm
};
P[53:"On Part"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   597.000  mm,	Y =  1870.561  mm,	Z =     4.000  mm,
	W =  -180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  5914.613  mm
};
P[54:"Approach Measure"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   597.000  mm,	Y =  1870.561  mm,	Z =   604.000  mm,
	W =  -180.000 deg,	P =      .000 deg,	R =     -.000 deg,
	E1=  5914.613  mm
};
P[55:"Rotate Torwards Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2077.350  mm,	Y = -1515.153  mm,	Z =  3943.385  mm,
	W =  -174.434 deg,	P =    69.882 deg,	R =    84.386 deg,
	E1=  5049.687  mm
};
P[56:"Approach/Exit"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2109.657  mm,	Y =   566.367  mm,	Z =  1573.502  mm,
	W =  -179.800 deg,	P =    -1.453 deg,	R =    90.081 deg,
	E1=   805.395  mm
};
P[57:"Above Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2118.309  mm,	Y =   778.111  mm,	Z =   323.718  mm,
	W =  -179.800 deg,	P =    -1.453 deg,	R =    90.081 deg,
	E1=   805.395  mm
};
P[58:"Place in Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2213.698  mm,	Y =   457.850  mm,	Z =    49.355  mm,
	W =  -179.508 deg,	P =     -.608 deg,	R =    89.641 deg,
	E1=   828.949  mm
};
P[59:"over zero table"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  7139.551  mm,	Y = -2824.515  mm,	Z =   705.331  mm,
	W =   165.740 deg,	P =     8.623 deg,	R =      .657 deg,
	E1=    29.765  mm
};
P[60:"place in zero"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  7173.649  mm,	Y = -2868.216  mm,	Z =   397.987  mm,
	W =   168.360 deg,	P =    15.089 deg,	R =    -1.127 deg,
	E1=    29.765  mm
};
P[61:"approach zero table"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  5774.174  mm,	Y = -2824.567  mm,	Z =   845.615  mm,
	W =   165.311 deg,	P =     7.847 deg,	R =    -2.336 deg,
	E1=  1297.900  mm
};
P[62:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1772.328  mm,	Y =  -634.279  mm,	Z =    -3.441  mm,
	W =      .243 deg,	P =    -1.655 deg,	R =   -89.687 deg,
	E1=  5726.060  mm
};
P[64:"Approach Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2194.754  mm,	Y =  -321.954  mm,	Z =  -129.187  mm,
	W =      .057 deg,	P =    23.209 deg,	R =    90.092 deg,
	E1=  4924.037  mm
};
P[65:"Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2194.088  mm,	Y =  -253.368  mm,	Z =     6.319  mm,
	W =     -.567 deg,	P =    22.375 deg,	R =    90.020 deg,
	E1=  4924.037  mm
};
P[66:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2193.580  mm,	Y =  -249.762  mm,	Z =   147.701  mm,
	W =     -.618 deg,	P =    31.793 deg,	R =    89.864 deg,
	E1=  4924.037  mm
};
P[67:"Rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2772.258  mm,	Y = -2484.960  mm,	Z =   851.664  mm,
	W =   -18.956 deg,	P =   -25.633 deg,	R =   -80.866 deg,
	E1=  5807.252  mm
};
P[69:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2329.963  mm,	Y = -1366.881  mm,	Z =    21.641  mm,
	W =   179.414 deg,	P =   -38.442 deg,	R =    90.559 deg,
	E1=  5497.576  mm
};
P[70:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2031.390  mm,	Y = -1455.806  mm,	Z =   237.106  mm,
	W =   179.601 deg,	P =     1.106 deg,	R =    90.317 deg,
	E1=  4826.669  mm
};
P[71:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2402.483  mm,	Y =  -675.207  mm,	Z =  -127.242  mm,
	W =      .210 deg,	P =     -.133 deg,	R =   -90.564 deg,
	E1=  5160.309  mm
};
P[73:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  2400.820  mm,	Y =  -363.261  mm,	Z =    96.966  mm,
	W =   179.781 deg,	P =      .215 deg,	R =    89.852 deg,
	E1=  3469.405  mm
};
P[74:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2030.180  mm,	Y =  -406.829  mm,	Z =   -49.630  mm,
	W =   179.973 deg,	P =   -39.402 deg,	R =    89.848 deg,
	E1=  4229.555  mm
};
P[76:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2030.082  mm,	Y =  -353.280  mm,	Z =   -61.856  mm,
	W =   179.987 deg,	P =   -39.401 deg,	R =    90.274 deg,
	E1=  4229.553  mm
};
P[77:"Wait for Bend 4"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2029.711  mm,	Y =  -487.567  mm,	Z =   146.988  mm,
	W =   179.256 deg,	P =   -20.427 deg,	R =    90.494 deg,
	E1=  4229.554  mm
};
P[78:"Bend 4 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2029.690  mm,	Y =  -346.597  mm,	Z =    43.181  mm,
	W =   179.276 deg,	P =   -17.129 deg,	R =    90.476 deg,
	E1=  4229.554  mm
};
P[80:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2029.393  mm,	Y =  -344.394  mm,	Z =   129.485  mm,
	W =   179.765 deg,	P =   -17.003 deg,	R =    90.320 deg,
	E1=  4229.557  mm
};
P[81:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2029.337  mm,	Y =  -344.087  mm,	Z =   141.541  mm,
	W =   179.819 deg,	P =    -8.972 deg,	R =    90.334 deg,
	E1=  4229.554  mm
};
P[82:"Bend 5 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2401.961  mm,	Y =  -386.808  mm,	Z =   192.636  mm,
	W =      .390 deg,	P =   -49.498 deg,	R =   -90.222 deg,
	E1=  4893.173  mm
};
P[83:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2401.789  mm,	Y =  -961.554  mm,	Z =   308.189  mm,
	W =     1.069 deg,	P =   -44.381 deg,	R =   -90.658 deg,
	E1=  4893.173  mm
};
P[87:"Bend 5 Pick Approach"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2686.977  mm,	Y =  -703.048  mm,	Z =   221.489  mm,
	W =    -1.246 deg,	P =    37.666 deg,	R =    89.545 deg,
	E1=  5121.307  mm
};
P[89:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2400.316  mm,	Y =  -406.022  mm,	Z =   294.010  mm,
	W =     1.069 deg,	P =   -44.381 deg,	R =   -90.658 deg,
	E1=  4893.173  mm
};
P[111:"Bend 1 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1770.690  mm,	Y =  -538.300  mm,	Z =   368.957  mm,
	W =      .174 deg,	P =   -41.286 deg,	R =   -89.804 deg,
	E1=  5726.060  mm
};
P[112:"clear part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  5948.374  mm,	Y = -2830.511  mm,	Z =   576.709  mm,
	W =   167.990 deg,	P =    16.969 deg,	R =    -1.148 deg,
	E1=  1233.654  mm
};
P[114:"In Front of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1873.619  mm,	Y =  -973.324  mm,	Z =    80.972  mm,
	W =      .060 deg,	P =    -1.574 deg,	R =   -89.260 deg,
	E1=  6091.916  mm
};
P[115:"Bend 2 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1923.844  mm,	Y =  -485.764  mm,	Z =   316.602  mm,
	W =      .167 deg,	P =   -41.701 deg,	R =   -89.799 deg,
	E1=  5573.053  mm
};
P[116:"Bend 2 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1923.835  mm,	Y =  -483.452  mm,	Z =   317.579  mm,
	W =      .167 deg,	P =   -41.701 deg,	R =   -89.799 deg,
	E1=  5573.053  mm
};
P[117:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1923.573  mm,	Y =  -481.594  mm,	Z =   390.411  mm,
	W =      .167 deg,	P =   -41.701 deg,	R =   -89.799 deg,
	E1=  5573.053  mm
};
P[118:"prep to rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  5999.354  mm,	Y = -2812.180  mm,	Z =  1318.103  mm,
	W =    98.999 deg,	P =   -87.386 deg,	R =    76.853 deg,
	E1=  1233.654  mm
};
P[119:"exit press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1924.952  mm,	Y = -1001.423  mm,	Z =   403.678  mm,
	W =      .181 deg,	P =   -41.699 deg,	R =   -90.216 deg,
	E1=  6185.220  mm
};
P[122:"rotate part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, -1',
	X =  5999.354  mm,	Y = -2812.180  mm,	Z =  1318.103  mm,
	W =   -84.612 deg,	P =    79.597 deg,	R =   -87.788 deg,
	E1=  1233.654  mm
};
P[123:"approach regrip"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, -1',
	X =  6001.510  mm,	Y = -2827.483  mm,	Z =   718.303  mm,
	W =  -170.836 deg,	P =     -.913 deg,	R =  -176.924 deg,
	E1=  1233.654  mm
};
P[127:"approach backgauge"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2179.136  mm,	Y =  -428.964  mm,	Z =    99.616  mm,
	W =  -179.989 deg,	P =      .243 deg,	R =   -90.049 deg,
	E1=  3917.682  mm
};
P[128:"clear arm "]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2772.720  mm,	Y = -1371.310  mm,	Z =   722.505  mm,
	W =     1.312 deg,	P =   -26.614 deg,	R =   -88.901 deg,
	E1=  5279.507  mm
};
P[130:"pick off zero table"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, -1',
	X =  7307.655  mm,	Y = -2835.066  mm,	Z =   285.178  mm,
	W =  -167.593 deg,	P =    -9.974 deg,	R =   179.905 deg,
	E1=    53.426  mm
};
P[131:"above regrip"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, -1',
	X =  7320.409  mm,	Y = -2827.442  mm,	Z =   582.772  mm,
	W =  -167.631 deg,	P =    -9.115 deg,	R =  -179.350 deg,
	E1=    53.426  mm
};
P[132:"pull away from zero table"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, -1',
	X =  2778.538  mm,	Y = -2839.898  mm,	Z =   566.762  mm,
	W =  -167.631 deg,	P =    -9.115 deg,	R =  -179.350 deg,
	E1=  4595.342  mm
};
P[133:"clear arm "]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2405.986  mm,	Y = -2625.905  mm,	Z =  1424.034  mm,
	W =   -15.228 deg,	P =    20.017 deg,	R =     6.146 deg,
	E1=  5864.293  mm
};
P[134:"rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2406.060  mm,	Y = -2769.426  mm,	Z =  1179.979  mm,
	W =    -3.193 deg,	P =    -2.052 deg,	R =   -87.406 deg,
	E1=  5864.293  mm
};
P[135:"approach press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2400.963  mm,	Y = -1235.578  mm,	Z =   735.829  mm,
	W =     8.529 deg,	P =   -84.065 deg,	R =   -98.834 deg,
	E1=  5368.195  mm
};
P[136:"in front of press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2401.418  mm,	Y =  -677.281  mm,	Z =   171.502  mm,
	W =   179.795 deg,	P =      .217 deg,	R =    90.396 deg,
	E1=  3469.405  mm
};
P[137:"move for regrip"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2402.322  mm,	Y = -1063.499  mm,	Z =   221.190  mm,
	W =   179.781 deg,	P =      .216 deg,	R =    89.851 deg,
	E1=  4467.226  mm
};
P[138:"lower to part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2403.788  mm,	Y = -1052.193  mm,	Z =  -203.837  mm,
	W =     -.126 deg,	P =   -58.384 deg,	R =   -89.589 deg,
	E1=  5470.032  mm
};
P[139:"pick part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2402.937  mm,	Y =  -845.212  mm,	Z =  -123.093  mm,
	W =      .181 deg,	P =     -.136 deg,	R =   -89.382 deg,
	E1=  5385.539  mm
};
/END
