/PROG  SEARCH_R01
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "FIND FIRST PART";
PROG_SIZE	= 632;
CREATE		= DATE 08-10-16  TIME 19:55:50;
MODIFIED	= DATE 08-10-24  TIME 01:16:58;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 34;
MEMORY_SIZE	= 1128;
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
   2:  R[14:SEARCH CNT]=0    ;
   3:   ;
   4:  LBL[1] ;
   5:   ;
   6:   ;
   7:  SKIP CONDITION DI[30]=ON    ;
   8:L PR[11:infd threshold] 100mm/sec FINE Skip,LBL[2]    ;
   9:   ;
  10:   ;
  11:   ;
  12:   ;
  13:   ;
  14:   ;
  15:  //PR[10:infd search]=LPOS    ;
  16:  //PR[10,3:infd search]=PR[10,3:infd search]-30    ;
  17:  //L PR[10:infd search] 100mm/sec FINE    ;
  18:  //    ;
  19:  //R[14:SEARCH CNT]=R[14:SEARCH CNT]+1    ;
  20:   ;
  21:  IF (DI[30]=ON),JMP LBL[2] ;
  22:   ;
  23:  !MAX ITERATIONS GUARD ;
  24:  IF R[14:SEARCH CNT]>=50,JMP LBL[3] ;
  25:  JMP LBL[1] ;
  26:   ;
  27:  !--- SEARCH TIMEOUT --- ;
  28:  LBL[3] ;
  29:  UALM[9] ;
  30:  PAUSE ;
  31:   ;
  32:  !--- PART FOUND --- ;
  33:  LBL[2] ;
  34:  PR[10:infd search]=LPOS    ;
/POS
/END
