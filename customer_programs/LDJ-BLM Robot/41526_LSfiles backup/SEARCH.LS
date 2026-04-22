/PROG  SEARCH
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 426;
CREATE		= DATE 08-10-16  TIME 19:55:50;
MODIFIED	= DATE 08-10-16  TIME 20:02:34;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 26;
MEMORY_SIZE	= 826;
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
/MN
   1:  !FIND FIRST PART ;
   2:   ;
   3:   ;
   4:   ;
   5:   ;
   6:  LBL[1] ;
   7:   ;
   8:  PR[10]=LPOS    ;
   9:  PR[10,3]=PR[10,3]+30    ;
  10:   ;
  11:L PR[10] 100mm/sec FINE    ;
  12:   ;
  13:  !CHECK PROX ;
  14:  IF (DI[30]=OFF) THEN ;
  15:  JMP LBL[1] ;
  16:   ;
  17:   ;
  18:   ;
  19:   ;
  20:   ;
  21:   ;
  22:   ;
  23:   ;
  24:   ;
  25:   ;
  26:   ;
/POS
/END
