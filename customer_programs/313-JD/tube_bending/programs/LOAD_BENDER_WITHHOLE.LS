/PROG  LOAD_BENDER_WITHHOLE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 788;
CREATE		= DATE 25-09-05  TIME 13:55:10;
MODIFIED	= DATE 26-01-16  TIME 07:33:56;
FILE_NAME	= LOAD_BEN;
VERSION		= 0;
LINE_COUNT	= 22;
MEMORY_SIZE	= 1080;
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
   2:  UTOOL_NUM=2 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[2]=OFF ;
   5:   ;
   6:J PR[26] 50% FINE    ;
   7:   ;
   8:  WAIT    .75(sec) ;
   9:   ;
  10:L PR[25] 700mm/sec FINE    ;
  11:   ;
  12:  WAIT   1.00(sec) ;
  13:   ;
  14:  CALL CLAMP_TUBE    ;
  15:   ;
  16:  RO[2]=ON ;
  17:   ;
  18:  WAIT   1.00(sec) ;
  19:   ;
  20:L PR[29] 2000mm/sec CNT25    ;
  21:   ;
  22:L P[1] 2000mm/sec FINE    ;
/POS
P[1]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   852.997  mm,	Y =    -4.241  mm,	Z =  2462.750  mm,
	W =    85.832 deg,	P =   -88.986 deg,	R =   -86.392 deg,
	E1=   250.530  mm
};
/END
