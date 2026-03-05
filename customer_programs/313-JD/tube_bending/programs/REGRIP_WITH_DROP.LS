/PROG  REGRIP_WITH_DROP
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 591;
CREATE		= DATE 25-08-01  TIME 07:42:14;
MODIFIED	= DATE 25-09-10  TIME 07:54:12;
FILE_NAME	= REGRIP_Y;
VERSION		= 0;
LINE_COUNT	= 32;
MEMORY_SIZE	= 1095;
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
   2:  UTOOL_NUM=2 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[2]=OFF ;
   5:   ;
   6:  IF (DI[106]),JMP LBL[1] ;
   7:   ;
   8:L PR[23] 2000mm/sec FINE    ;
   9:   ;
  10:L PR[22] 700mm/sec FINE    ;
  11:   ;
  12:  WAIT    .50(sec) ;
  13:   ;
  14:  RO[2]=ON ;
  15:   ;
  16:  WAIT   3.00(sec) ;
  17:   ;
  18:  RO[2]=OFF ;
  19:   ;
  20:  WAIT   1.00(sec) ;
  21:   ;
  22:L PR[24] 700mm/sec FINE    ;
  23:   ;
  24:  JMP LBL[2] ;
  25:   ;
  26:  LBL[1] ;
  27:   ;
  28:  MESSAGE[Manual Override On] ;
  29:   ;
  30:  ABORT ;
  31:   ;
  32:  LBL[2] ;
/POS
/END
