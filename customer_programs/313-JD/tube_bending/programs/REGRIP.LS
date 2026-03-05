/PROG  REGRIP
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1202;
CREATE		= DATE 25-07-23  TIME 10:39:28;
MODIFIED	= DATE 25-07-23  TIME 20:29:42;
FILE_NAME	= LOAD_BEN;
VERSION		= 0;
LINE_COUNT	= 50;
MEMORY_SIZE	= 1634;
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
   1:  UFRAME_NUM=7 ;
   2:  UTOOL_NUM=1 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[1]=OFF ;
   5:   ;
   6:  IF (DI[106]),JMP LBL[1] ;
   7:   ;
   8:L PR[27] 2000mm/sec FINE    ;
   9:   ;
  10:L PR[21] 700mm/sec FINE    ;
  11:   ;
  12:  WAIT    .50(sec) ;
  13:   ;
  14:  RO[1]=ON ;
  15:   ;
  16:  WAIT   1.00(sec) ;
  17:   ;
  18:L PR[28] 700mm/sec FINE    ;
  19:   ;
  20:L P[1] 2000mm/sec CNT25    ;
  21:   ;
  22:J P[2] 50% CNT25    ;
  23:   ;
  24:  UTOOL_NUM=2 ;
  25:   ;
  26:  RO[2]=ON ;
  27:   ;
  28:J PR[23] 50% FINE    ;
  29:   ;
  30:L PR[22] 700mm/sec FINE    ;
  31:   ;
  32:  WAIT    .50(sec) ;
  33:   ;
  34:  RO[2]=OFF ;
  35:   ;
  36:  WAIT    .50(sec) ;
  37:   ;
  38:L PR[24] 700mm/sec FINE    ;
  39:   ;
  40:L P[3] 2000mm/sec FINE    ;
  41:   ;
  42:  JMP LBL[2] ;
  43:   ;
  44:  LBL[1] ;
  45:   ;
  46:  MESSAGE[Manual Override On] ;
  47:   ;
  48:  ABORT ;
  49:   ;
  50:  LBL[2] ;
/POS
P[1]{
   GP1:
	UF : 7, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   -60.226  mm,	Y =  1099.828  mm,	Z =  -252.988  mm,
	W =   -89.456 deg,	P =    29.351 deg,	R =   -89.979 deg,
	E1=    -2.984  mm
};
P[2]{
   GP1:
	UF : 7, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  -321.578  mm,	Y =  1360.647  mm,	Z =  -623.293  mm,
	W =  -142.704 deg,	P =   -11.350 deg,	R =    23.649 deg,
	E1=    -2.984  mm
};
P[3]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   846.198  mm,	Y =  1698.316  mm,	Z =   -45.160  mm,
	W =    88.913 deg,	P =     -.116 deg,	R =     -.199 deg,
	E1=    -2.983  mm
};
/END
