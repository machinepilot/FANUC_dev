/PROG  YT889_LOAD
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1088;
CREATE		= DATE 25-05-23  TIME 11:57:54;
MODIFIED	= DATE 25-05-27  TIME 18:35:08;
FILE_NAME	= AT889_LO;
VERSION		= 0;
LINE_COUNT	= 46;
MEMORY_SIZE	= 1544;
PROTECT		= READ_WRITE;
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
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  UFRAME_NUM=6 ;
   2:  UTOOL_NUM=1 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[1]=OFF ;
   5:   ;
   6:  IF (DI[106]),JMP LBL[1] ;
   7:   ;
   8:  PR[16,3]=R[9]    ;
   9:   ;
  10:  PR[17]=PR[15]+PR[16]+PR[53]    ;
  11:   ;
  12:  PR[18]=PR[15]+PR[16]-PR[20]    ;
  13:   ;
  14:L PR[17] 2000mm/sec FINE    ;
  15:   ;
  16:   ;
  17:   ;
  18:  WAIT    .75(sec) ;
  19:   ;
  20:L P[1] 700mm/sec FINE    ;
  21:   ;
  22:L PR[18] 700mm/sec FINE    ;
  23:   ;
  24:  WAIT   1.00(sec) ;
  25:   ;
  26:  CALL CLAMP_TUBE    ;
  27:   ;
  28:  RO[1]=ON ;
  29:   ;
  30:  WAIT   1.00(sec) ;
  31:   ;
  32:  PR[49]=LPOS    ;
  33:   ;
  34:L PR[49] 700mm/sec CNT15 Offset,PR[53]    ;
  35:   ;
  36:L PR[19] 2000mm/sec FINE    ;
  37:   ;
  38:  JMP LBL[2] ;
  39:   ;
  40:  LBL[1] ;
  41:   ;
  42:  MESSAGE[Manual Override On] ;
  43:   ;
  44:  ABORT ;
  45:   ;
  46:  LBL[2] ;
/POS
P[1]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     9.338  mm,	Y =   -25.916  mm,	Z =  1375.992  mm,
	W =  -179.812 deg,	P =     -.284 deg,	R =     -.910 deg,
	E1=    -2.986  mm
};
/END
