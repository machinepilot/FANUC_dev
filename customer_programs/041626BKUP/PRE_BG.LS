/PROG  PRE_BG
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Pre-Position BG";
PROG_SIZE	= 394;
CREATE		= DATE 25-09-17  TIME 17:06:30;
MODIFIED	= DATE 25-09-17  TIME 17:27:06;
FILE_NAME	= ;
VERSION		= 1;
LINE_COUNT	= 16;
MEMORY_SIZE	= 866;
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
   1:  ! DESCRIPTION: Pre-positions pres ;
   2:  ! PARAMETERS: ;
   3:  $WAITTMOUT=3000 ;
   4:   ;
   5:  ! -- Verify Readiness -- ;
   6:  WAIT (DI[24] AND DI[21]) TIMEOUT,LBL[1] ;
   7:   ;
   8:  JMP LBL[2] ;
   9:   ;
  10:  LBL[1] ;
  11:   ;
  12:  UALM[6] ;
  13:   ;
  14:  PAUSE ;
  15:   ;
  16:  LBL[2] ;
/POS
/END
