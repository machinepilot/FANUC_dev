/PROG  LOAD_BENDER_571_9815
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 800;
CREATE		= DATE 25-09-12  TIME 01:18:02;
MODIFIED	= DATE 25-12-12  TIME 09:44:04;
FILE_NAME	= LOAD_BEN;
VERSION		= 0;
LINE_COUNT	= 22;
MEMORY_SIZE	= 1092;
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
	X =   674.041  mm,	Y =    -2.040  mm,	Z =  1862.281  mm,
	W =    79.716 deg,	P =   -89.251 deg,	R =   -80.659 deg,
	E1=   439.925  mm
};
/END
