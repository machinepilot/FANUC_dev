/PROG  PNS0014
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "5353311_SPM671-S";
PROG_SIZE	= 23188;
CREATE		= DATE 25-12-19  TIME 12:31:02;
MODIFIED	= DATE 26-02-09  TIME 17:03:22;
FILE_NAME	= P_535302;
VERSION		= 0;
LINE_COUNT	= 1025;
MEMORY_SIZE	= 24064;
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
 199:L P[1:Approach/Exit] 250mm/sec FINE    ;
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
 243:J P[6:Transition to Press] 50% CNT50    ;
 244:   ;
 245:J P[7:Avoid Collision] 100% CNT50    ;
 246:   ;
 247:J P[8:Rotate to Press Orientation] 100% CNT50    ;
 248:   ;
 249:L P[42:Keep Part Off Arm] 1500mm/sec CNT25    ;
 250:   ;
 251:L P[114:In Front of Press] 2000mm/sec CNT25    ;
 252:   ;
 253:L P[3:Stretch Arm] 1500mm/sec CNT25    ;
 254:   ;
 255:L P[39:Approach Press] 1500mm/sec CNT25    ;
 256:   ;
 257:L P[41:In Press] 1500mm/sec CNT25    ;
 258:   ;
 259:  CALL PINCH    ;
 260:   ;
 261:  WAIT   1.00(sec) ;
 262:   ;
 263:  CALL BEND    ;
 264:   ;
 265:  CALL ALL_VAC_OFF    ;
 266:   ;
 267:  CALL MAG_GRIP_OFF    ;
 268:   ;
 269:L P[31:regrip part] 700mm/sec FINE    ;
 270:   ;
 271:  CALL ALL_VAC_ON    ;
 272:   ;
 273:  CALL MAG_GRIP_ON    ;
 274:   ;
 275:  WAIT    .25(sec) ;
 276:   ;
 277:  CALL OPEN_PRESS    ;
 278:   ;
 279:  WAIT    .25(sec) ;
 280:   ;
 281:  CALL PRE_BG    ;
 282:   ;
 283:  WAIT    .25(sec) ;
 284:   ;
 285:L P[123:raise for BG] 250mm/sec FINE    ;
 286:   ;
 287:L P[10:In Press] 150mm/sec FINE    ;
 288:   ;
 289:  CALL ADJ_BG    ;
 290:   ;
 291:  WAIT    .25(sec) ;
 292:   ;
 293:  CALL PINCH    ;
 294:   ;
 295:  WAIT    .25(sec) ;
 296:   ;
 297:  CALL ALL_VAC_OFF    ;
 298:   ;
 299:  CALL MAG_GRIP_OFF    ;
 300:   ;
 301:  WAIT   1.00(sec) ;
 302:   ;
 303:  CALL BEND    ;
 304:   ;
 305:  !Change time for next ;
 306:  !Waypoint to adjust follow ;
 307:  UFRAME_NUM=2 ;
 308:   ;
 309:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 310:   ;
 311:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 312:L P[49:Bend 1 Pick] 1.0sec FINE SkipJump,LBL[100]    ;
 313:   ;
 314:  LBL[100] ;
 315:   ;
 316:  DO[27:RB_PEDALDN]=OFF ;
 317:   ;
 318:L P[111:Bend 1 Pick] 1.0sec FINE    ;
 319:   ;
 320:  WAIT    .25(sec) ;
 321:   ;
 322:  CALL ALL_VAC_ON    ;
 323:   ;
 324:  CALL MAG_GRIP_ON    ;
 325:   ;
 326:  WAIT   1.00(sec) ;
 327:   ;
 328:  CALL OPEN_PRESS    ;
 329:   ;
 330:  WAIT    .25(sec) ;
 331:   ;
 332:L P[11:Lift Part out of Die] 700mm/sec FINE    ;
 333:   ;
 334:L P[122:rotate for clearance] 100mm/sec FINE    ;
 335:   ;
 336:L P[12:Pull Part out of Press] 1480mm/sec FINE    ;
 337:   ;
 338:J P[112:clear arm for rotate] 100% FINE    ;
 339:   ;
 340:L P[13:rotate for bend 2] 700mm/sec FINE    ;
 341:   ;
 342:   ;
 343:  !End Bend 1 ;
 344:   ;
 345:  !Bend 2 Sequence ;
 346:  UFRAME_NUM=2 ;
 347:   ;
 348:L P[59:Clear Press] 1500mm/sec CNT50    ;
 349:   ;
 350:L P[60: Rotate] 2000mm/sec CNT25    ;
 351:   ;
 352:   ;
 353:J P[62:Approach Press] 50% CNT25    ;
 354:   ;
 355:  CALL PRE_BG    ;
 356:   ;
 357:L P[9:In Front of Press] 2000mm/sec FINE    ;
 358:   ;
 359:L P[14:Insert in Press] 1500mm/sec CNT25    ;
 360:   ;
 361:L P[18:Part on Die] 700mm/sec FINE    ;
 362:   ;
 363:L P[19:In Press] 250mm/sec FINE    ;
 364:   ;
 365:  CALL ADJ_BG    ;
 366:   ;
 367:  WAIT    .25(sec) ;
 368:   ;
 369:  CALL PINCH    ;
 370:   ;
 371:  WAIT    .25(sec) ;
 372:   ;
 373:  CALL ALL_VAC_OFF    ;
 374:   ;
 375:  CALL MAG_GRIP_OFF    ;
 376:   ;
 377:  UFRAME_NUM=2 ;
 378:   ;
 379:  WAIT   1.00(sec) ;
 380:L P[61:Wait for Bend 2] 1500mm/sec FINE    ;
 381:   ;
 382:  CALL BEND    ;
 383:   ;
 384:  !Change time for next ;
 385:  !Waypoint to adjust follow ;
 386:  WAIT   1.50(sec) ;
 387:   ;
 388:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 389:L P[115:Bend 2 Pick] 1.0sec FINE SkipJump,LBL[101]    ;
 390:   ;
 391:  LBL[101] ;
 392:   ;
 393:  DO[27:RB_PEDALDN]=OFF ;
 394:   ;
 395:L P[116:Bend 2 Pick] 1.0sec FINE    ;
 396:   ;
 397:  WAIT    .25(sec) ;
 398:   ;
 399:  CALL ALL_VAC_ON    ;
 400:   ;
 401:  CALL MAG_GRIP_ON    ;
 402:   ;
 403:  WAIT   1.00(sec) ;
 404:   ;
 405:  CALL OPEN_PRESS    ;
 406:   ;
 407:  WAIT    .25(sec) ;
 408:   ;
 409:L P[117:Lift Part out of Die] 700mm/sec CNT50    ;
 410:   ;
 411:L P[118:rotate for clearance] 100mm/sec FINE    ;
 412:   ;
 413:L P[119:exit press] 720mm/sec CNT25    ;
 414:   ;
 415:   ;
 416:  !End Bend 2 ;
 417:   ;
 418:  !Bend 3 Sequence ;
 419:  UFRAME_NUM=2 ;
 420:   ;
 421:  CALL PRE_BG    ;
 422:   ;
 423:L P[22:On Die] 700mm/sec FINE    ;
 424:   ;
 425:  WAIT    .25(sec) ;
 426:   ;
 427:  CALL PINCH    ;
 428:   ;
 429:  WAIT    .25(sec) ;
 430:   ;
 431:  CALL ALL_VAC_OFF    ;
 432:   ;
 433:  CALL MAG_GRIP_OFF    ;
 434:   ;
 435:  WAIT   1.00(sec) ;
 436:   ;
 437:  CALL BEND    ;
 438:   ;
 439:  !Change time for next ;
 440:  !Waypoint to adjust follow ;
 441:  WAIT (RI[1:PART PRESENT]=ON)    ;
 442:   ;
 443:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 444:L P[23:Adjust Grip] 1.0sec FINE SkipJump,LBL[103]    ;
 445:   ;
 446:  LBL[103] ;
 447:   ;
 448:  DO[27:RB_PEDALDN]=OFF ;
 449:   ;
 450:L P[23:Adjust Grip] 1.0sec FINE    ;
 451:   ;
 452:  WAIT    .25(sec) ;
 453:   ;
 454:  CALL ALL_VAC_ON    ;
 455:   ;
 456:  CALL MAG_GRIP_ON    ;
 457:   ;
 458:  WAIT   1.00(sec) ;
 459:   ;
 460:  CALL OPEN_PRESS    ;
 461:   ;
 462:  WAIT    .25(sec) ;
 463:   ;
 464:L P[127:approach backgauge] 250mm/sec FINE    ;
 465:   ;
 466:L P[27:In Press] 250mm/sec FINE    ;
 467:   ;
 468:  CALL ADJ_BG    ;
 469:   ;
 470:  WAIT    .25(sec) ;
 471:   ;
 472:  CALL PINCH    ;
 473:   ;
 474:  WAIT    .25(sec) ;
 475:   ;
 476:  CALL ALL_VAC_OFF    ;
 477:   ;
 478:  CALL MAG_GRIP_OFF    ;
 479:   ;
 480:  WAIT   1.00(sec) ;
 481:   ;
 482:  UFRAME_NUM=2 ;
 483:   ;
 484:L P[24:Clear Part for Bend] 1500mm/sec FINE    ;
 485:   ;
 486:  CALL BEND    ;
 487:   ;
 488:  !Change time for next ;
 489:  !Waypoint to adjust follow ;
 490:  WAIT   1.50(sec) ;
 491:   ;
 492:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 493:L P[28:Prep for Rotate for Bend 3 Pick] 1.0sec FINE SkipJump,LBL[102]    ;
 494:   ;
 495:  LBL[102] ;
 496:   ;
 497:  DO[27:RB_PEDALDN]=OFF ;
 498:   ;
 499:L P[28:Prep for Rotate for Bend 3 Pick] 1.0sec FINE    ;
 500:   ;
 501:   ;
 502:L P[26:Lower to Bend 3 Pick] 1500mm/sec CNT25    ;
 503:   ;
 504:L P[64:Approach Bend 3 Pick] 1500mm/sec CNT25    ;
 505:   ;
 506:L P[65:Bend 3 Pick] 1000mm/sec FINE    ;
 507:   ;
 508:  WAIT    .25(sec) ;
 509:   ;
 510:  CALL ALL_VAC_ON    ;
 511:   ;
 512:  CALL MAG_GRIP_ON    ;
 513:   ;
 514:  WAIT   1.00(sec) ;
 515:   ;
 516:  CALL OPEN_PRESS    ;
 517:   ;
 518:  WAIT    .25(sec) ;
 519:   ;
 520:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 521:   ;
 522:L P[66:Rotate for Clearance] 100mm/sec FINE    ;
 523:   ;
 524:L P[30:Pull Part out of Press] 1500mm/sec CNT50    ;
 525:   ;
 526:L P[15:prep for rotate] 700mm/sec FINE    ;
 527:   ;
 528:L P[20:clear arm for rotate] 250mm/sec FINE    ;
 529:   ;
 530:L P[67:Rotate] 2000mm/sec CNT25    ;
 531:   ;
 532:  !End Bend 3 ;
 533:   ;
 534:  !Bend 4 Sequence ;
 535:  UFRAME_NUM=2 ;
 536:   ;
 537:L P[128:clear arm ] 1500mm/sec FINE    ;
 538:   ;
 539:L P[69:Approach Press] 1500mm/sec CNT50    ;
 540:   ;
 541:  CALL PRE_BG    ;
 542:   ;
 543:L P[21:lower to press] 700mm/sec FINE    ;
 544:   ;
 545:L P[74:Insert in Press] 700mm/sec FINE    ;
 546:   ;
 547:L P[75:Part on Die] 250mm/sec FINE    ;
 548:   ;
 549:L P[76:In Press] 250mm/sec FINE    ;
 550:   ;
 551:  CALL ADJ_BG    ;
 552:   ;
 553:  WAIT    .25(sec) ;
 554:   ;
 555:  CALL PINCH    ;
 556:   ;
 557:  WAIT    .25(sec) ;
 558:   ;
 559:  CALL ALL_VAC_OFF    ;
 560:   ;
 561:  CALL MAG_GRIP_OFF    ;
 562:   ;
 563:  WAIT   1.00(sec) ;
 564:   ;
 565:  UFRAME_NUM=2 ;
 566:   ;
 567:L P[77:Wait for Bend 4] 1500mm/sec FINE    ;
 568:   ;
 569:  CALL BEND    ;
 570:   ;
 571:  !Change time for next ;
 572:  !Waypoint to adjust follow ;
 573:  WAIT   1.50(sec) ;
 574:   ;
 575:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 576:L P[78:Bend 4 Pick] 1.0sec FINE SkipJump,LBL[104]    ;
 577:   ;
 578:  LBL[104] ;
 579:   ;
 580:  DO[27:RB_PEDALDN]=OFF ;
 581:   ;
 582:L P[78:Bend 4 Pick] 1.0sec FINE    ;
 583:   ;
 584:  WAIT    .25(sec) ;
 585:   ;
 586:  CALL ALL_VAC_ON    ;
 587:   ;
 588:  CALL MAG_GRIP_ON    ;
 589:   ;
 590:  WAIT   1.00(sec) ;
 591:   ;
 592:  CALL OPEN_PRESS    ;
 593:   ;
 594:  WAIT    .25(sec) ;
 595:   ;
 596:L P[80:Lift Part out of Die] 700mm/sec CNT50    ;
 597:   ;
 598:L P[81:Rotate for Clearance] 750mm/sec CNT25    ;
 599:   ;
 600:L P[70:Pull Part out of Press] 1500mm/sec FINE    ;
 601:  !End Bend 4 ;
 602:   ;
 603:  !Bend 5 Sequence ;
 604:  UFRAME_NUM=2 ;
 605:   ;
 606:L P[73:Insert in Press] 700mm/sec CNT25    ;
 607:   ;
 608:L P[79:On Die] 250mm/sec CNT25    ;
 609:   ;
 610:  CALL PRE_BG    ;
 611:   ;
 612:L P[71:In Press] 250mm/sec FINE    ;
 613:   ;
 614:  CALL ADJ_BG    ;
 615:   ;
 616:  WAIT    .25(sec) ;
 617:   ;
 618:  CALL PINCH    ;
 619:   ;
 620:  WAIT    .25(sec) ;
 621:   ;
 622:  CALL ALL_VAC_OFF    ;
 623:   ;
 624:  CALL MAG_GRIP_OFF    ;
 625:   ;
 626:  WAIT   1.00(sec) ;
 627:   ;
 628:  UFRAME_NUM=2 ;
 629:   ;
 630:L P[86:Pull Off Part] 1500mm/sec FINE    ;
 631:   ;
 632:L P[25:rotate for pick 5] 100mm/sec FINE    ;
 633:   ;
 634:   ;
 635:L P[72:Wait for Bend 5] 2000mm/sec FINE    ;
 636:   ;
 637:   ;
 638:  CALL BEND    ;
 639:   ;
 640:  !Change time for next ;
 641:  !Waypoint to adjust follow ;
 642:  WAIT   1.50(sec) ;
 643:   ;
 644:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 645:L P[87:Bend 5 Pick Approach] 1.0sec FINE SkipJump,LBL[105]    ;
 646:   ;
 647:  LBL[105] ;
 648:   ;
 649:  DO[27:RB_PEDALDN]=OFF ;
 650:   ;
 651:   ;
 652:   ;
 653:L P[87:Bend 5 Pick Approach] 1000mm/sec FINE    ;
 654:   ;
 655:L P[82:Bend 5 Pick] 1000mm/sec FINE    ;
 656:   ;
 657:  WAIT    .25(sec) ;
 658:   ;
 659:  CALL ALL_VAC_ON    ;
 660:   ;
 661:  CALL MAG_GRIP_ON    ;
 662:   ;
 663:  WAIT   1.00(sec) ;
 664:   ;
 665:  CALL OPEN_PRESS    ;
 666:   ;
 667:  WAIT    .25(sec) ;
 668:   ;
 669:L P[89:Lift Part out of Die] 700mm/sec CNT50    ;
 670:   ;
 671:L P[90:Rotate for Clearance] 750mm/sec CNT25    ;
 672:   ;
 673:L P[83:Pull Part out of Press] 1500mm/sec FINE    ;
 674:  !End Bend 5 ;
 675:   ;
 676:  !Bend 6 Sequence ;
 677:  UFRAME_NUM=2 ;
 678:   ;
 679:L P[124:pull away from press] 1000mm/sec FINE    ;
 680:   ;
 681:L P[63:clear arm for rotate] 750mm/sec FINE    ;
 682:   ;
 683:L P[88:Rotate] 2000mm/sec CNT25    ;
 684:   ;
 685:L P[91:Approach Press] 2000mm/sec CNT25    ;
 686:   ;
 687:  CALL PRE_BG    ;
 688:   ;
 689:L P[92:Insert in Press] 700mm/sec FINE    ;
 690:   ;
 691:L P[93:On Die] 250mm/sec CNT25    ;
 692:   ;
 693:L P[95:In Press] 100mm/sec FINE    ;
 694:   ;
 695:  CALL ADJ_BG    ;
 696:   ;
 697:  WAIT    .25(sec) ;
 698:   ;
 699:  CALL PINCH    ;
 700:   ;
 701:  WAIT    .25(sec) ;
 702:   ;
 703:  CALL ALL_VAC_OFF    ;
 704:   ;
 705:  CALL MAG_GRIP_OFF    ;
 706:   ;
 707:  WAIT   1.00(sec) ;
 708:   ;
 709:  UFRAME_NUM=2 ;
 710:   ;
 711:L P[96:Wait for Bend 6] 1500mm/sec FINE    ;
 712:   ;
 713:  CALL BEND    ;
 714:   ;
 715:  !Change time for next ;
 716:  !Waypoint to adjust follow ;
 717:  WAIT   1.50(sec) ;
 718:   ;
 719:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 720:L P[97:Bend 6 Pick] 1.0sec FINE SkipJump,LBL[106]    ;
 721:   ;
 722:  LBL[106] ;
 723:   ;
 724:  DO[27:RB_PEDALDN]=OFF ;
 725:   ;
 726:L P[97:Bend 6 Pick] 1.0sec FINE    ;
 727:   ;
 728:  WAIT    .25(sec) ;
 729:   ;
 730:  CALL ALL_VAC_ON    ;
 731:   ;
 732:  CALL MAG_GRIP_ON    ;
 733:   ;
 734:  WAIT   1.00(sec) ;
 735:   ;
 736:  CALL OPEN_PRESS    ;
 737:   ;
 738:  WAIT    .25(sec) ;
 739:   ;
 740:L P[99:Lift Part out of Die] 700mm/sec CNT50    ;
 741:   ;
 742:L P[100:Rotate for Clearance] 750mm/sec CNT25    ;
 743:  !End Bend 6 ;
 744:   ;
 745:  !Bend 7 Sequence ;
 746:  UFRAME_NUM=2 ;
 747:   ;
 748:L P[84:On Die] 100mm/sec FINE    ;
 749:   ;
 750:  CALL PRE_BG    ;
 751:   ;
 752:L P[101:In Press] 100mm/sec FINE    ;
 753:   ;
 754:  CALL ADJ_BG    ;
 755:   ;
 756:  WAIT    .25(sec) ;
 757:   ;
 758:  CALL PINCH    ;
 759:   ;
 760:  WAIT    .25(sec) ;
 761:   ;
 762:  CALL ALL_VAC_OFF    ;
 763:   ;
 764:  CALL MAG_GRIP_OFF    ;
 765:   ;
 766:  WAIT   1.00(sec) ;
 767:   ;
 768:  UFRAME_NUM=2 ;
 769:   ;
 770:L P[102:Pull Away from Part] 1500mm/sec FINE    ;
 771:   ;
 772:   ;
 773:  !Change time for next ;
 774:  !Waypoint to adjust follow ;
 775:  WAIT   1.50(sec) ;
 776:   ;
 777:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 778:   ;
 779:L P[68:rotate for pick] 2000mm/sec FINE    ;
 780:   ;
 781:L P[113:lower to pick] 2000mm/sec FINE    ;
 782:   ;
 783:  CALL BEND    ;
 784:   ;
 785:   ;
 786:L P[103:Bend 7 Pick] 1.0sec FINE SkipJump,LBL[107]    ;
 787:   ;
 788:  LBL[107] ;
 789:   ;
 790:  DO[27:RB_PEDALDN]=OFF ;
 791:   ;
 792:L P[103:Bend 7 Pick] 1.0sec FINE    ;
 793:   ;
 794:  WAIT    .25(sec) ;
 795:   ;
 796:  CALL ALL_VAC_ON    ;
 797:   ;
 798:  CALL MAG_GRIP_ON    ;
 799:   ;
 800:  WAIT   1.00(sec) ;
 801:   ;
 802:  CALL OPEN_PRESS    ;
 803:   ;
 804:  WAIT    .25(sec) ;
 805:   ;
 806:L P[105:Lift Part out of Die] 700mm/sec CNT50    ;
 807:   ;
 808:L P[106:Rotate for Clearance] 750mm/sec CNT25    ;
 809:  !End Bend 7 ;
 810:   ;
 811:  !Bend 8 Sequence ;
 812:  UFRAME_NUM=2 ;
 813:   ;
 814:L P[85:On Die] 1000mm/sec FINE    ;
 815:   ;
 816:  CALL PRE_BG    ;
 817:   ;
 818:L P[94:In Press] 700mm/sec FINE    ;
 819:   ;
 820:  CALL ADJ_BG    ;
 821:   ;
 822:  WAIT    .25(sec) ;
 823:   ;
 824:  CALL PINCH    ;
 825:   ;
 826:  WAIT    .25(sec) ;
 827:   ;
 828:  CALL ALL_VAC_OFF    ;
 829:   ;
 830:  CALL MAG_GRIP_OFF    ;
 831:   ;
 832:  WAIT   1.00(sec) ;
 833:   ;
 834:   ;
 835:  !Change time for next ;
 836:  !Waypoint to adjust follow ;
 837:  WAIT (RI[1:PART PRESENT]=ON)    ;
 838:   ;
 839:  UFRAME_NUM=2 ;
 840:   ;
 841:  CALL BEND    ;
 842:   ;
 843:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 844:   ;
 845:L P[120:rotate to clear] 1000mm/sec FINE SkipJump,LBL[108]    ;
 846:   ;
 847:  LBL[108] ;
 848:   ;
 849:  WAIT (DI[23:RB_LDP])    ;
 850:   ;
 851:  DO[27:RB_PEDALDN]=OFF ;
 852:   ;
 853:L P[121:prep to rotate] 1000mm/sec FINE    ;
 854:   ;
 855:L P[125:rotate] 1000mm/sec FINE    ;
 856:L P[126:approach bend] 700mm/sec FINE    ;
 857:   ;
 858:   ;
 859:L P[104:Bend 8 Pick] 1.0sec FINE    ;
 860:   ;
 861:  WAIT    .25(sec) ;
 862:   ;
 863:  !Make Sure Next RO is Correct ;
 864:  PAUSE ;
 865:  RO[7:Extend Bar]=(ON) ;
 866:   ;
 867:  WAIT   1.00(sec) ;
 868:   ;
 869:  CALL ALL_VAC_ON    ;
 870:   ;
 871:  CALL MAG_GRIP_ON    ;
 872:   ;
 873:  WAIT   1.00(sec) ;
 874:   ;
 875:  CALL OPEN_PRESS    ;
 876:   ;
 877:  WAIT    .25(sec) ;
 878:   ;
 879:L P[108:Lift Part out of Die] 700mm/sec CNT50    ;
 880:   ;
 881:L P[16:Pull Part from Press] 1500mm/sec FINE    ;
 882:  !End Bend 8 ;
 883:   ;
 884:  !Bend 9 Sequence ;
 885:  UFRAME_NUM=2 ;
 886:   ;
 887:J P[17:Prep to Rotate] 50% CNT25    ;
 888:   ;
 889:J P[43:clear arm] 50% CNT25    ;
 890:   ;
 891:J P[98:rotate] 50% CNT25    ;
 892:   ;
 893:L P[109:clear arm] 1500mm/sec FINE    ;
 894:   ;
 895:L P[107:Approach Press] 1500mm/sec CNT25    ;
 896:   ;
 897:L P[110:In Front of Press] 700mm/sec FINE    ;
 898:   ;
 899:  CALL PRE_BG    ;
 900:   ;
 901:L P[44:Insert in Press] 2000mm/sec FINE    ;
 902:   ;
 903:L P[45:On Die] 1500mm/sec CNT25    ;
 904:   ;
 905:L P[46:In Press] 700mm/sec FINE    ;
 906:   ;
 907:  CALL ADJ_BG    ;
 908:   ;
 909:  WAIT    .25(sec) ;
 910:   ;
 911:  CALL PINCH    ;
 912:   ;
 913:  WAIT    .25(sec) ;
 914:   ;
 915:  CALL ALL_VAC_OFF    ;
 916:   ;
 917:  CALL MAG_GRIP_OFF    ;
 918:   ;
 919:  WAIT   1.00(sec) ;
 920:   ;
 921:  CALL BEND    ;
 922:   ;
 923:  UFRAME_NUM=2 ;
 924:   ;
 925:  !Change time for next ;
 926:  !Waypoint to adjust follow ;
 927:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 928:   ;
 929:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 930:L P[48:Bend 9 Pick] 1.0sec FINE SkipJump,LBL[109]    ;
 931:   ;
 932:  LBL[109] ;
 933:   ;
 934:  DO[27:RB_PEDALDN]=OFF ;
 935:   ;
 936:L P[129:clear part] 100mm/sec FINE    ;
 937:   ;
 938:L P[130:approach pick] 700mm/sec FINE    ;
 939:   ;
 940:L P[48:Bend 9 Pick] 1.0sec FINE    ;
 941:   ;
 942:  WAIT    .25(sec) ;
 943:   ;
 944:  CALL ALL_VAC_ON    ;
 945:   ;
 946:  CALL MAG_GRIP_ON    ;
 947:   ;
 948:  WAIT   1.00(sec) ;
 949:   ;
 950:  CALL OPEN_PRESS    ;
 951:   ;
 952:  WAIT    .25(sec) ;
 953:   ;
 954:L P[50:Lift Part out of Die] 700mm/sec CNT50    ;
 955:   ;
 956:L P[51:Rotate for Clearance] 750mm/sec CNT25    ;
 957:   ;
 958:L P[47:Pull Part from Press] 1500mm/sec CNT25    ;
 959:  !End Bend 9 ;
 960:   ;
 961:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 962:   ;
 963:  !Outfeed Pallet Sequence ;
 964:  UFRAME_NUM=6 ;
 965:   ;
 966:  PR[15,1:Pallet Offset]=0    ;
 967:  PR[15,2:Pallet Offset]=0    ;
 968:  PR[15,3:Pallet Offset]=0    ;
 969:   ;
 970:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 971:   ;
 972:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 973:   ;
 974:J P[32:Transition To Outfeed] 50% CNT50    ;
 975:   ;
 976:J P[52:Rotate Part] 100% CNT50    ;
 977:   ;
 978:  WAIT DI[32:RB_OUTFEED_SET]=ON    ;
 979:   ;
 980:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 981:   ;
 982:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 983:   ;
 984:L P[36:Place Part in Outfeed Pallet] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 985:   ;
 986:  WAIT    .25(sec) ;
 987:   ;
 988:  CALL ALL_VAC_OFF    ;
 989:   ;
 990:  CALL MAG_GRIP_OFF    ;
 991:   ;
 992:  WAIT    .25(sec) ;
 993:   ;
 994:J P[37:Pull Away from Part] 17% FINE Offset,PR[15:Pallet Offset]    ;
 995:   ;
 996:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 997:   ;
 998:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 999:   ;
1000:  R[1:Layer Count]=R[1:Layer Count]+1    ;
1001:   ;
1002:  R[10:Current Part]=R[10:Current Part]+1    ;
1003:   ;
1004:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
1005:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
1006:  ENDIF ;
1007:   ;
1008:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
1009:  R[1:Layer Count]=0    ;
1010:  R[2:Pallet Count]=0    ;
1011:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
1012:  ENDIF ;
1013:   ;
1014:  IF ((R[10:Current Part]-1)>=R[3:Run QTY]) THEN ;
1015:  R[1:Layer Count]=0    ;
1016:  R[2:Pallet Count]=0    ;
1017:  R[10:Current Part]=1    ;
1018:  DO[38:OUTFEED_TEND_REQUEST]=PULSE,0.7sec ;
1019:  ENDIF ;
1020:   ;
1021:  F[1:First Part]=(OFF) ;
1022:   ;
1023:  CALL END_PART    ;
1024:   ;
1025:  JMP LBL[2] ;
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
P[3:"Stretch Arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2028.239  mm,	Y =  -730.701  mm,	Z =    83.795  mm,
	W =     -.586 deg,	P =     2.189 deg,	R =    90.033 deg,
	E1=  5611.989  mm
};
P[4:"approach exit pick"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2078.195  mm,	Y =   310.450  mm,	Z =   171.980  mm,
	W =  -179.790 deg,	P =    -1.201 deg,	R =    90.101 deg,
	E1=   787.949  mm
};
P[5:"Pick from Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2087.500  mm,	Y =   243.789  mm,	Z =    41.108  mm,
	W =  -179.845 deg,	P =     -.932 deg,	R =    89.824 deg,
	E1=   789.314  mm
};
P[6:"Transition to Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2678.629  mm,	Y = -3048.530  mm,	Z =  1213.706  mm,
	W =   120.082 deg,	P =   -77.489 deg,	R =    63.908 deg,
	E1=  5330.027  mm
};
P[7:"Avoid Collision"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2678.704  mm,	Y = -3047.645  mm,	Z =  1192.391  mm,
	W =      .097 deg,	P =     3.405 deg,	R =    90.478 deg,
	E1=  5573.896  mm
};
P[8:"Rotate to Press Orientation"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2678.300  mm,	Y = -1882.579  mm,	Z =   455.659  mm,
	W =      .565 deg,	P =     2.641 deg,	R =    90.188 deg,
	E1=  5791.809  mm
};
P[9:"In Front of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2013.639  mm,	Y =  -860.431  mm,	Z =   -53.088  mm,
	W =   179.407 deg,	P =   -54.555 deg,	R =    90.110 deg,
	E1=  5881.811  mm
};
P[10:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.781  mm,	Y =  -384.783  mm,	Z =   -62.381  mm,
	W =     -.581 deg,	P =     2.455 deg,	R =    90.256 deg,
	E1=  5165.354  mm
};
P[11:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.078  mm,	Y =  -243.094  mm,	Z =   105.543  mm,
	W =     -.014 deg,	P =    28.484 deg,	R =    90.227 deg,
	E1=  5239.121  mm
};
P[12:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2028.342  mm,	Y =  -828.241  mm,	Z =   202.360  mm,
	W =      .002 deg,	P =    47.062 deg,	R =    90.172 deg,
	E1=  5875.125  mm
};
P[13:"rotate for bend 2"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2048.859  mm,	Y = -2617.813  mm,	Z =  1016.571  mm,
	W =    -1.730 deg,	P =    -2.683 deg,	R =   -93.784 deg,
	E1=  6341.360  mm
};
P[14:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1910.550  mm,	Y =  -352.286  mm,	Z =   -67.337  mm,
	W =   179.432 deg,	P =   -54.539 deg,	R =    90.088 deg,
	E1=  4027.904  mm
};
P[15:"prep for rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  1816.209  mm,	Y = -1519.223  mm,	Z =   508.261  mm,
	W =      .387 deg,	P =   -40.171 deg,	R =   -89.964 deg,
	E1=  6453.760  mm
};
P[16:"Pull Part from Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2012.799  mm,	Y =  -677.463  mm,	Z =   221.316  mm,
	W =     -.000 deg,	P =    60.000 deg,	R =    90.000 deg,
	E1=  5667.426  mm
};
P[17:"Prep to Rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1962.812  mm,	Y =  -929.674  mm,	Z =   985.287  mm,
	W =     -.465 deg,	P =    10.204 deg,	R =    89.881 deg,
	E1=  5629.387  mm
};
P[18:"Part on Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1910.704  mm,	Y =  -327.066  mm,	Z =  -125.253  mm,
	W =   179.850 deg,	P =   -53.576 deg,	R =    89.957 deg,
	E1=  4027.912  mm
};
P[19:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1910.563  mm,	Y =  -273.698  mm,	Z =  -126.615  mm,
	W =   179.867 deg,	P =   -53.574 deg,	R =    90.332 deg,
	E1=  4027.912  mm
};
P[20:"clear arm for rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1842.362  mm,	Y = -2724.930  mm,	Z =   653.231  mm,
	W =     2.607 deg,	P =    -3.938 deg,	R =  -175.256 deg,
	E1=  6769.949  mm
};
P[21:"lower to press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1984.627  mm,	Y =  -694.617  mm,	Z =  -119.717  mm,
	W =  -179.870 deg,	P =    51.012 deg,	R =   -90.149 deg,
	E1=  5773.136  mm
};
P[22:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  1909.860  mm,	Y =  -384.444  mm,	Z =   145.835  mm,
	W =   179.601 deg,	P =    -1.003 deg,	R =    89.477 deg,
	E1=  4027.888  mm
};
P[23:"Adjust Grip"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  1910.344  mm,	Y =  -512.032  mm,	Z =   122.812  mm,
	W =   179.620 deg,	P =    -2.624 deg,	R =    89.481 deg,
	E1=  4027.885  mm
};
P[24:"Clear Part for Bend"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 1',
	X =  2011.500  mm,	Y = -1341.764  mm,	Z =   166.364  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =    90.000 deg,
	E1=  3880.234  mm
};
P[25:"rotate for pick 5"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  1887.877  mm,	Y = -1292.526  mm,	Z =   924.526  mm,
	W =   141.066 deg,	P =   -82.771 deg,	R =   129.765 deg,
	E1=  5602.158  mm
};
P[26:"Lower to Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1853.995  mm,	Y =  -591.103  mm,	Z =    51.917  mm,
	W =      .375 deg,	P =   -26.101 deg,	R =   -89.685 deg,
	E1=  4970.353  mm
};
P[27:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  1910.066  mm,	Y =  -442.615  mm,	Z =   149.831  mm,
	W =   179.715 deg,	P =     -.444 deg,	R =    90.224 deg,
	E1=  4027.884  mm
};
P[28:"Prep for Rotate for Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1854.860  mm,	Y = -1042.216  mm,	Z =   158.140  mm,
	W =      .339 deg,	P =   -48.391 deg,	R =   -89.737 deg,
	E1=  4033.248  mm
};
P[29:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1852.571  mm,	Y =  -319.671  mm,	Z =   244.660  mm,
	W =      .375 deg,	P =   -26.101 deg,	R =   -89.685 deg,
	E1=  4033.248  mm
};
P[30:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1853.594  mm,	Y =  -781.634  mm,	Z =   313.611  mm,
	W =      .316 deg,	P =   -45.582 deg,	R =   -89.719 deg,
	E1=  5664.445  mm
};
P[31:"regrip part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2028.070  mm,	Y =  -493.356  mm,	Z =   -59.608  mm,
	W =     -.587 deg,	P =     2.454 deg,	R =    89.997 deg,
	E1=  5239.136  mm
};
P[32:"Transition To Outfeed"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X = -2658.707  mm,	Y =  2377.936  mm,	Z =  1181.399  mm,
	W =    -1.054 deg,	P =   -62.599 deg,	R =   179.149 deg,
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
	X =   700.671  mm,	Y =  2643.702  mm,	Z =  1527.686  mm,
	W =      .995 deg,	P =   -88.223 deg,	R =   179.130 deg,
	E1=  7043.638  mm
};
P[36:"Place Part in Outfeed Pallet"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   708.226  mm,	Y =  2648.430  mm,	Z =   562.846  mm,
	W =    -8.430 deg,	P =   -88.201 deg,	R =  -171.563 deg,
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
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.673  mm,	Y =  -451.614  mm,	Z =    21.931  mm,
	W =     -.581 deg,	P =      .101 deg,	R =    90.006 deg,
	E1=  5193.538  mm
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
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.617  mm,	Y =  -322.198  mm,	Z =   -63.976  mm,
	W =     -.587 deg,	P =     2.454 deg,	R =    89.997 deg,
	E1=  4968.684  mm
};
P[42:"Keep Part Off Arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2362.903  mm,	Y = -1171.714  mm,	Z =   249.039  mm,
	W =      .273 deg,	P =     2.795 deg,	R =    90.570 deg,
	E1=  5765.052  mm
};
P[43:"clear arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2786.518  mm,	Y = -2787.948  mm,	Z =  1035.657  mm,
	W =    -1.476 deg,	P =     9.593 deg,	R =    43.066 deg,
	E1=  5629.387  mm
};
P[44:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2191.050  mm,	Y =  -458.776  mm,	Z =  -118.843  mm,
	W =      .646 deg,	P =     -.698 deg,	R =   -90.317 deg,
	E1=  5141.463  mm
};
P[45:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2191.050  mm,	Y =  -458.776  mm,	Z =  -118.842  mm,
	W =      .646 deg,	P =     -.698 deg,	R =   -90.317 deg,
	E1=  5017.282  mm
};
P[46:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2190.303  mm,	Y =  -385.120  mm,	Z =  -120.870  mm,
	W =      .636 deg,	P =     -.708 deg,	R =   -90.126 deg,
	E1=  4968.500  mm
};
P[47:"Pull Part from Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2060.051  mm,	Y =  -947.472  mm,	Z =   267.589  mm,
	W =     1.469 deg,	P =   -51.104 deg,	R =   -91.043 deg,
	E1=  5327.551  mm
};
P[48:"Bend 9 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2022.000  mm,	Y =  -349.993  mm,	Z =   182.390  mm,
	W =      .652 deg,	P =   -47.619 deg,	R =   -90.306 deg,
	E1=  5430.749  mm
};
P[49:"Bend 1 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.282  mm,	Y =  -244.541  mm,	Z =    48.848  mm,
	W =     -.014 deg,	P =    28.484 deg,	R =    90.227 deg,
	E1=  5239.121  mm
};
P[50:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2058.505  mm,	Y =  -364.450  mm,	Z =   252.710  mm,
	W =     1.239 deg,	P =   -42.980 deg,	R =   -90.846 deg,
	E1=  5327.551  mm
};
P[51:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2058.505  mm,	Y =  -364.449  mm,	Z =   252.710  mm,
	W =     1.469 deg,	P =   -51.104 deg,	R =   -91.043 deg,
	E1=  5327.551  mm
};
P[52:"Rotate Part"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X = -1157.117  mm,	Y =  2610.499  mm,	Z =  1959.547  mm,
	W =    -4.996 deg,	P =   -86.621 deg,	R =  -173.175 deg,
	E1=  5896.240  mm
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
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2595.664  mm,	Y =    41.208  mm,	Z =  2286.882  mm,
	W =  -178.538 deg,	P =   -12.308 deg,	R =    81.641 deg,
	E1=  2708.975  mm
};
P[57:"Above Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2421.788  mm,	Y =   641.920  mm,	Z =  1185.220  mm,
	W =  -179.949 deg,	P =    -8.059 deg,	R =    90.266 deg,
	E1=  1215.428  mm
};
P[58:"Place in Zero"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  2213.697  mm,	Y =   457.845  mm,	Z =    75.356  mm,
	W =  -179.488 deg,	P =    -3.869 deg,	R =    89.640 deg,
	E1=   828.949  mm
};
P[59:"Clear Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2011.274  mm,	Y = -1330.927  mm,	Z =   983.604  mm,
	W =    -1.884 deg,	P =    -2.706 deg,	R =   -87.747 deg,
	E1=  5881.811  mm
};
P[60:" Rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2013.977  mm,	Y = -1350.103  mm,	Z =   231.996  mm,
	W =   179.407 deg,	P =   -54.555 deg,	R =    90.110 deg,
	E1=  5881.811  mm
};
P[61:"Wait for Bend 2"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1910.061  mm,	Y =  -300.146  mm,	Z =    37.234  mm,
	W =   179.619 deg,	P =   -25.616 deg,	R =    90.196 deg,
	E1=  4027.882  mm
};
P[62:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2014.099  mm,	Y = -1147.088  mm,	Z =    39.612  mm,
	W =   179.407 deg,	P =   -54.555 deg,	R =    90.110 deg,
	E1=  5881.811  mm
};
P[63:"clear arm for rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2375.760  mm,	Y = -3187.066  mm,	Z =  1070.946  mm,
	W =     3.284 deg,	P =    -2.754 deg,	R =  -177.822 deg,
	E1=  5940.168  mm
};
P[64:"Approach Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1853.289  mm,	Y =  -324.762  mm,	Z =    45.120  mm,
	W =      .374 deg,	P =   -26.101 deg,	R =   -89.685 deg,
	E1=  4033.248  mm
};
P[65:"Bend 3 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1852.973  mm,	Y =  -322.522  mm,	Z =   132.912  mm,
	W =      .365 deg,	P =   -29.059 deg,	R =   -89.691 deg,
	E1=  4033.248  mm
};
P[66:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1852.365  mm,	Y =  -318.215  mm,	Z =   301.784  mm,
	W =      .316 deg,	P =   -45.582 deg,	R =   -89.719 deg,
	E1=  4033.248  mm
};
P[67:"Rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1863.201  mm,	Y = -2724.747  mm,	Z =   652.946  mm,
	W =     4.347 deg,	P =     2.773 deg,	R =    92.315 deg,
	E1=  6754.011  mm
};
P[68:"rotate for pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  1988.188  mm,	Y = -1225.652  mm,	Z =  1367.513  mm,
	W =   118.475 deg,	P =   -81.566 deg,	R =   151.727 deg,
	E1=  4887.655  mm
};
P[69:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1860.838  mm,	Y = -1547.701  mm,	Z =   523.232  mm,
	W =    -1.204 deg,	P =     2.949 deg,	R =    91.912 deg,
	E1=  6419.847  mm
};
P[70:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1887.168  mm,	Y =  -500.623  mm,	Z =    44.576  mm,
	W =  -179.709 deg,	P =    11.923 deg,	R =   -90.030 deg,
	E1=  4517.508  mm
};
P[71:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1888.562  mm,	Y =  -425.659  mm,	Z =    90.982  mm,
	W =  -179.718 deg,	P =     -.308 deg,	R =   -90.156 deg,
	E1=  4432.942  mm
};
P[72:"Wait for Bend 5"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1910.195  mm,	Y =  -945.183  mm,	Z =  -256.421  mm,
	W =     3.466 deg,	P =   -54.629 deg,	R =   -93.625 deg,
	E1=  5541.435  mm
};
P[73:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1888.508  mm,	Y =  -496.327  mm,	Z =   141.652  mm,
	W =  -179.709 deg,	P =     -.218 deg,	R =   -89.879 deg,
	E1=  4133.097  mm
};
P[74:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1984.385  mm,	Y =  -468.032  mm,	Z =  -192.608  mm,
	W =  -179.910 deg,	P =    55.516 deg,	R =   -90.168 deg,
	E1=  5098.852  mm
};
P[75:"Part on Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2035.327  mm,	Y =  -334.232  mm,	Z =  -256.212  mm,
	W =  -179.929 deg,	P =    55.472 deg,	R =   -89.648 deg,
	E1=  5458.972  mm
};
P[76:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2035.205  mm,	Y =  -287.925  mm,	Z =  -257.395  mm,
	W =  -179.929 deg,	P =    55.472 deg,	R =   -89.648 deg,
	E1=  5458.972  mm
};
P[77:"Wait for Bend 4"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1886.765  mm,	Y =  -404.648  mm,	Z =    84.462  mm,
	W =   179.795 deg,	P =    27.979 deg,	R =   -90.210 deg,
	E1=  4517.508  mm
};
P[78:"Bend 4 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1887.337  mm,	Y =  -359.763  mm,	Z =  -110.959  mm,
	W =  -178.806 deg,	P =    27.412 deg,	R =   -89.652 deg,
	E1=  4517.509  mm
};
P[79:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1888.653  mm,	Y =  -460.826  mm,	Z =    91.879  mm,
	W =  -179.729 deg,	P =     -.310 deg,	R =   -89.718 deg,
	E1=  4432.942  mm
};
P[80:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1886.885  mm,	Y =  -356.556  mm,	Z =    14.748  mm,
	W =  -178.794 deg,	P =    30.339 deg,	R =   -89.636 deg,
	E1=  4517.509  mm
};
P[81:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1886.544  mm,	Y =  -362.499  mm,	Z =   114.268  mm,
	W =  -179.698 deg,	P =    12.189 deg,	R =   -90.027 deg,
	E1=  4517.508  mm
};
P[82:"Bend 5 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1876.946  mm,	Y =  -431.183  mm,	Z =   134.774  mm,
	W =      .888 deg,	P =   -27.831 deg,	R =   -90.197 deg,
	E1=  4001.812  mm
};
P[83:"Pull Part out of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1878.949  mm,	Y = -1281.119  mm,	Z =   240.258  mm,
	W =      .394 deg,	P =   -34.922 deg,	R =   -90.005 deg,
	E1=  5940.168  mm
};
P[84:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1964.062  mm,	Y =  -605.928  mm,	Z =   171.223  mm,
	W =  -179.906 deg,	P =     -.997 deg,	R =   -89.544 deg,
	E1=  4277.464  mm
};
P[85:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1965.306  mm,	Y =  -586.969  mm,	Z =   -17.581  mm,
	W =      .306 deg,	P =     -.595 deg,	R =   -90.149 deg,
	E1=  5414.792  mm
};
P[86:"Pull Off Part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1888.623  mm,	Y = -1297.817  mm,	Z =   717.096  mm,
	W =   -52.574 deg,	P =    87.536 deg,	R =    37.712 deg,
	E1=  5602.158  mm
};
P[87:"Bend 5 Pick Approach"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1877.754  mm,	Y =  -604.643  mm,	Z =    40.508  mm,
	W =      .856 deg,	P =   -36.343 deg,	R =   -90.108 deg,
	E1=  4001.812  mm
};
P[88:"Rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  2377.650  mm,	Y = -1655.818  mm,	Z =   666.726  mm,
	W =     1.688 deg,	P =    77.419 deg,	R =    92.713 deg,
	E1=  5753.896  mm
};
P[89:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1876.710  mm,	Y =  -436.932  mm,	Z =   218.713  mm,
	W =      .373 deg,	P =   -27.833 deg,	R =   -89.969 deg,
	E1=  4001.816  mm
};
P[90:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1876.710  mm,	Y =  -436.932  mm,	Z =   218.713  mm,
	W =      .394 deg,	P =   -34.922 deg,	R =   -90.005 deg,
	E1=  4001.816  mm
};
P[91:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1991.973  mm,	Y =  -649.619  mm,	Z =  -127.218  mm,
	W =  -179.261 deg,	P =    52.622 deg,	R =   -89.074 deg,
	E1=  5332.823  mm
};
P[92:"Insert in Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1991.836  mm,	Y =  -441.971  mm,	Z =  -250.055  mm,
	W =  -179.261 deg,	P =    52.622 deg,	R =   -89.074 deg,
	E1=  5332.823  mm
};
P[93:"On Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1991.984  mm,	Y =  -418.552  mm,	Z =  -298.139  mm,
	W =  -179.187 deg,	P =    53.287 deg,	R =   -88.918 deg,
	E1=  5332.866  mm
};
P[94:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  1965.226  mm,	Y =  -556.766  mm,	Z =   -18.352  mm,
	W =      .306 deg,	P =     -.595 deg,	R =   -90.149 deg,
	E1=  5414.792  mm
};
P[95:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1991.959  mm,	Y =  -395.172  mm,	Z =  -298.773  mm,
	W =  -179.187 deg,	P =    53.286 deg,	R =   -88.920 deg,
	E1=  5332.869  mm
};
P[96:"Wait for Bend 6"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1991.635  mm,	Y = -1004.746  mm,	Z =   252.884  mm,
	W =  -179.756 deg,	P =     6.349 deg,	R =   -89.461 deg,
	E1=  5332.888  mm
};
P[97:"Bend 6 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1991.475  mm,	Y =  -481.647  mm,	Z =  -108.328  mm,
	W =  -178.885 deg,	P =    29.171 deg,	R =   -89.170 deg,
	E1=  5332.888  mm
};
P[98:"rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2786.518  mm,	Y = -2787.948  mm,	Z =  1035.657  mm,
	W =    -6.302 deg,	P =    -7.395 deg,	R =   -87.513 deg,
	E1=  5629.387  mm
};
P[99:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1991.242  mm,	Y =  -488.296  mm,	Z =   -37.099  mm,
	W =  -179.391 deg,	P =    28.189 deg,	R =   -89.431 deg,
	E1=  5332.888  mm
};
P[100:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  1991.096  mm,	Y =  -715.665  mm,	Z =   180.914  mm,
	W =  -179.554 deg,	P =     1.534 deg,	R =   -89.570 deg,
	E1=  4887.647  mm
};
P[101:"In Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1964.084  mm,	Y =  -602.154  mm,	Z =   162.303  mm,
	W =  -179.906 deg,	P =     -.997 deg,	R =   -89.544 deg,
	E1=  4277.464  mm
};
P[102:"Pull Away from Part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1988.479  mm,	Y = -1225.035  mm,	Z =  1379.122  mm,
	W =   -16.367 deg,	P =    88.910 deg,	R =    73.547 deg,
	E1=  4887.655  mm
};
P[103:"Bend 7 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1954.646  mm,	Y =  -460.294  mm,	Z =   389.840  mm,
	W =      .563 deg,	P =   -43.803 deg,	R =   -90.449 deg,
	E1=  4887.655  mm
};
P[104:"Bend 8 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1964.752  mm,	Y =  -214.958  mm,	Z =    86.042  mm,
	W =     -.897 deg,	P =    47.623 deg,	R =    89.337 deg,
	E1=  5414.791  mm
};
P[105:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1959.459  mm,	Y =  -590.552  mm,	Z =   260.978  mm,
	W =      .334 deg,	P =   -22.065 deg,	R =   -90.239 deg,
	E1=  5203.961  mm
};
P[106:"Rotate for Clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, -1, 1',
	X =  1964.727  mm,	Y =  -591.706  mm,	Z =    63.786  mm,
	W =      .198 deg,	P =      .431 deg,	R =   -90.139 deg,
	E1=  5571.273  mm
};
P[107:"Approach Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2785.837  mm,	Y = -1581.190  mm,	Z =   282.841  mm,
	W =      .717 deg,	P =    -6.644 deg,	R =   -91.165 deg,
	E1=  5569.793  mm
};
P[108:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1963.776  mm,	Y =  -224.327  mm,	Z =   152.312  mm,
	W =     -.847 deg,	P =    45.247 deg,	R =    89.545 deg,
	E1=  5110.285  mm
};
P[109:"clear arm"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  2785.526  mm,	Y = -1998.409  mm,	Z =   702.629  mm,
	W =    -6.302 deg,	P =    -7.395 deg,	R =   -87.513 deg,
	E1=  5629.387  mm
};
P[110:"In Front of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2191.204  mm,	Y =  -725.047  mm,	Z =    44.790  mm,
	W =      .696 deg,	P =    -6.648 deg,	R =   -90.341 deg,
	E1=  5484.988  mm
};
P[111:"Bend 1 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.287  mm,	Y =  -245.381  mm,	Z =    37.527  mm,
	W =     -.330 deg,	P =    29.385 deg,	R =    90.069 deg,
	E1=  5238.672  mm
};
P[112:"clear arm for rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2054.989  mm,	Y = -2617.369  mm,	Z =  1016.311  mm,
	W =     2.669 deg,	P =     2.502 deg,	R =    92.410 deg,
	E1=  6341.360  mm
};
P[113:"lower to pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1965.057  mm,	Y = -1024.882  mm,	Z =  -293.621  mm,
	W =    44.068 deg,	P =   -88.703 deg,	R =  -133.248 deg,
	E1=  4887.655  mm
};
P[114:"In Front of Press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2029.321  mm,	Y = -1138.780  mm,	Z =    94.211  mm,
	W =     -.572 deg,	P =     2.190 deg,	R =    90.557 deg,
	E1=  6077.117  mm
};
P[115:"Bend 2 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1910.139  mm,	Y =  -301.065  mm,	Z =     1.340  mm,
	W =   179.619 deg,	P =   -25.616 deg,	R =    90.197 deg,
	E1=  4027.888  mm
};
P[116:"Bend 2 Pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1910.164  mm,	Y =  -299.894  mm,	Z =    -2.389  mm,
	W =   179.619 deg,	P =   -25.980 deg,	R =    90.198 deg,
	E1=  4027.886  mm
};
P[117:"Lift Part out of Die"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1909.689  mm,	Y =  -292.302  mm,	Z =   122.226  mm,
	W =   179.618 deg,	P =   -27.248 deg,	R =    90.203 deg,
	E1=  4027.888  mm
};
P[118:"rotate for clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1909.689  mm,	Y =  -292.302  mm,	Z =   122.226  mm,
	W =   179.622 deg,	P =    -9.840 deg,	R =    90.140 deg,
	E1=  4027.888  mm
};
P[119:"exit press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1911.039  mm,	Y =  -801.062  mm,	Z =   135.211  mm,
	W =   179.622 deg,	P =    -9.840 deg,	R =    90.140 deg,
	E1=  4027.888  mm
};
P[120:"rotate to clear"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1965.379  mm,	Y =  -595.877  mm,	Z =   -23.999  mm,
	W =   153.749 deg,	P =   -87.675 deg,	R =   116.522 deg,
	E1=  5414.789  mm
};
P[121:"prep to rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  1962.603  mm,	Y = -1070.060  mm,	Z =  1132.567  mm,
	W =   153.749 deg,	P =   -87.675 deg,	R =   116.522 deg,
	E1=  5414.789  mm
};
P[122:"rotate for clearance"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2026.784  mm,	Y =  -241.006  mm,	Z =   187.373  mm,
	W =      .002 deg,	P =    47.062 deg,	R =    90.172 deg,
	E1=  5239.121  mm
};
P[123:"raise for BG"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 1',
	X =  2027.829  mm,	Y =  -402.743  mm,	Z =   -61.921  mm,
	W =     -.580 deg,	P =     2.455 deg,	R =    90.272 deg,
	E1=  5239.136  mm
};
P[124:"pull away from press"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, -1',
	X =  1879.716  mm,	Y = -1647.486  mm,	Z =   468.729  mm,
	W =      .641 deg,	P =   -54.709 deg,	R =   -90.324 deg,
	E1=  6348.593  mm
};
P[125:"rotate"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1962.733  mm,	Y = -1042.646  mm,	Z =  1074.537  mm,
	W =   108.278 deg,	P =    84.740 deg,	R =  -162.391 deg,
	E1=  5414.789  mm
};
P[126:"approach bend"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  1965.281  mm,	Y =  -630.352  mm,	Z =    30.564  mm,
	W =     -.595 deg,	P =    46.692 deg,	R =    89.383 deg,
	E1=  5414.789  mm
};
P[127:"approach backgauge"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 1, 0',
	X =  1910.128  mm,	Y =  -466.885  mm,	Z =   150.450  mm,
	W =   179.716 deg,	P =     -.443 deg,	R =    90.271 deg,
	E1=  4027.884  mm
};
P[128:"clear arm "]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  1861.451  mm,	Y = -1917.807  mm,	Z =   582.648  mm,
	W =    13.138 deg,	P =     2.449 deg,	R =    92.359 deg,
	E1=  6587.461  mm
};
P[129:"clear part"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2109.222  mm,	Y =  -349.488  mm,	Z =  -274.855  mm,
	W =      .779 deg,	P =   -47.427 deg,	R =   -90.549 deg,
	E1=  5198.537  mm
};
P[130:"approach pick"]{
   GP1:
	UF : 2, UT : 2,		CONFIG : 'N U T, 0, 1, 0',
	X =  2021.602  mm,	Y =  -383.905  mm,	Z =    55.787  mm,
	W =     -.014 deg,	P =   -45.223 deg,	R =   -90.021 deg,
	E1=  5430.739  mm
};
/END
