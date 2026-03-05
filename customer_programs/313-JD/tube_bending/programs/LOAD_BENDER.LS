/PROG  LOAD_BENDER
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 697;
CREATE		= DATE 25-01-24  TIME 17:13:20;
MODIFIED	= DATE 25-05-23  TIME 11:20:36;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 42;
MEMORY_SIZE	= 1169;
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
  16:  WAIT    .75(sec) ;
  17:   ;
  18:L PR[18] 700mm/sec FINE    ;
  19:   ;
  20:  WAIT   1.00(sec) ;
  21:   ;
  22:  CALL CLAMP_TUBE    ;
  23:   ;
  24:  RO[1]=ON ;
  25:   ;
  26:  WAIT   1.00(sec) ;
  27:   ;
  28:  PR[49]=LPOS    ;
  29:   ;
  30:L PR[49] 700mm/sec CNT15 Offset,PR[53]    ;
  31:   ;
  32:L PR[19] 2000mm/sec FINE    ;
  33:   ;
  34:  JMP LBL[2] ;
  35:   ;
  36:  LBL[1] ;
  37:   ;
  38:  MESSAGE[Manual Override On] ;
  39:   ;
  40:  ABORT ;
  41:   ;
  42:  LBL[2] ;
/POS
/END
