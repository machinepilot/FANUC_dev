/PROG  PART_PROGAM_TEMPLATE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 9966;
CREATE		= DATE 25-08-23  TIME 22:27:32;
MODIFIED	= DATE 25-10-08  TIME 10:26:52;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 474;
MEMORY_SIZE	= 10478;
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
   1:  !PART #: TEMPLATE ;
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
  14:  R[4:Pallet Limit]=4    ;
  15:  R[7:Part Width]=2216    ;
  16:  R[8:Num of Pallets]=1    ;
  17:  R[9]=0    ;
  18:  R[11:Part Offset Pal]=265    ;
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
 267:  !Change time for next ;
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
 326:  !Change time for next ;
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
 358:  !Bend 3 Sequence ;
 359:  UFRAME_NUM=4 ;
 360:   ;
 361:  CALL PRE_BG    ;
 362:   ;
 363:L P[23:Prep for Rotation] 2000mm/sec FINE    ;
 364:   ;
 365:J P[24:Rotate to Bend 3] 50% FINE    ;
 366:   ;
 367:L P[25:Rotate for Part Entry] 1500mm/sec CNT50    ;
 368:   ;
 369:L P[26:Lower Part for Press Entry] 1500mm/sec CNT50    ;
 370:   ;
 371:L P[27:In Press] 700mm/sec FINE    ;
 372:   ;
 373:  CALL PINCH    ;
 374:   ;
 375:  WAIT    .25(sec) ;
 376:   ;
 377:  CALL ALL_VAC_OFF    ;
 378:   ;
 379:  CALL MAG_GRIP_OFF    ;
 380:   ;
 381:  WAIT   1.00(sec) ;
 382:   ;
 383:  CALL BEND    ;
 384:   ;
 385:  !Change time for next ;
 386:  !Waypoint to adjust follow ;
 387:  WAIT (RI[1:PART PRESENT]=OFF)    ;
 388:   ;
 389:  SKIP CONDITION DI[23:RB_LDP]=ON    ;
 390:L P[28:Bend 3 Pick] 1.0sec FINE SkipJump,LBL[102]    ;
 391:   ;
 392:  DO[27:RB_PEDALDN]=OFF ;
 393:   ;
 394:L P[28:Bend 3 Pick] 1.0sec FINE    ;
 395:   ;
 396:  WAIT    .25(sec) ;
 397:   ;
 398:  CALL ALL_VAC_ON    ;
 399:   ;
 400:  CALL MAG_GRIP_ON    ;
 401:   ;
 402:  WAIT   1.00(sec) ;
 403:   ;
 404:  CALL OPEN_PRESS    ;
 405:   ;
 406:  WAIT    .25(sec) ;
 407:   ;
 408:L P[29:Lift Part out of Die] 700mm/sec FINE    ;
 409:   ;
 410:L P[30:Pull Part out of Press] 1500mm/sec CNT50    ;
 411:  !End Bend 3 ;
 412:   ;
 413:J P[31:Prep for Rotation] 50% FINE    ;
 414:   ;
 415:J P[32:Rotate to Outfeed Vertical Orien] 50% FINE    ;
 416:   ;
 417:L P[33:Move Part to Left Side of Arm] 1500mm/sec CNT50    ;
 418:   ;
 419:  !Outfeed Pallet Sequence ;
 420:  UFRAME_NUM=6 ;
 421:   ;
 422:  PR[15,1:Pallet Offset]=0    ;
 423:  PR[15,2:Pallet Offset]=0    ;
 424:   ;
 425:  PR[15,1:Pallet Offset]=(PR[15,1:Pallet Offset]-(R[11:Part Offset Pal]*R[1:Layer Count])) ;
 426:   ;
 427:  PR[15,2:Pallet Offset]=(PR[15,2:Pallet Offset]-(R[12:Part Offset 2]*R[2:Pallet Count])) ;
 428:   ;
 429:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 430:   ;
 431:L P[35:Approach] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 432:   ;
 433:L P[36:Place Part in Outfeed Pallet] 1500mm/sec CNT50 Offset,PR[15:Pallet Offset]    ;
 434:   ;
 435:  WAIT    .25(sec) ;
 436:   ;
 437:  CALL ALL_VAC_OFF    ;
 438:   ;
 439:  CALL MAG_GRIP_OFF    ;
 440:   ;
 441:  WAIT    .25(sec) ;
 442:   ;
 443:L P[37:Pull Away from Part] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 444:   ;
 445:L P[38:Exit Pallet] 700mm/sec FINE Offset,PR[15:Pallet Offset]    ;
 446:   ;
 447:J P[34:Over Outfeed] 50% CNT50 Offset,PR[15:Pallet Offset]    ;
 448:   ;
 449:  R[1:Layer Count]=R[1:Layer Count]+1    ;
 450:   ;
 451:  R[10:Current Part]=R[10:Current Part]+1    ;
 452:   ;
 453:  IF (R[1:Layer Count]>=R[4:Pallet Limit]) THEN ;
 454:  R[2:Pallet Count]=R[2:Pallet Count]+1    ;
 455:  ENDIF ;
 456:   ;
 457:  IF (R[2:Pallet Count]>=R[8:Num of Pallets]) THEN ;
 458:  R[1:Layer Count]=0    ;
 459:  R[2:Pallet Count]=0    ;
 460:  DO[33:RB_TEND]=ON ;
 461:  ENDIF ;
 462:   ;
 463:  IF (R[10:Current Part]>=R[3:Run QTY]) THEN ;
 464:  R[1:Layer Count]=0    ;
 465:  R[2:Pallet Count]=0    ;
 466:  R[10:Current Part]=1    ;
 467:  DO[33:RB_TEND]=ON ;
 468:  ENDIF ;
 469:   ;
 470:  CALL END_PART    ;
 471:   ;
 472:  F[1:First Part]=(OFF) ;
 473:   ;
 474:  JMP LBL[2] ;
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
	X =    99.764  mm,	Y =  -270.454  mm,	Z =   238.564  mm,
	W =     -.137 deg,	P =   -36.252 deg,	R =   -89.505 deg,
	E1=  3059.733  mm
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
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   101.053  mm,	Y =  -281.824  mm,	Z =   -10.817  mm,
	W =      .185 deg,	P =     -.630 deg,	R =   -89.489 deg,
	E1=  3059.726  mm
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
	X =    95.575  mm,	Y =  -385.270  mm,	Z =    -8.422  mm,
	W =     -.177 deg,	P =     -.168 deg,	R =    90.470 deg,
	E1=  3255.052  mm
};
P[28:"Bend 3 Pick"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    95.764  mm,	Y =  -409.640  mm,	Z =    56.537  mm,
	W =     -.078 deg,	P =    11.745 deg,	R =    90.480 deg,
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
/END
