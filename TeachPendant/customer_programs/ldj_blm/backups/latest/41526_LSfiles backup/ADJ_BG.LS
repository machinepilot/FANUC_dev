/PROG  ADJ_BG
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Smart BG Adjust";
PROG_SIZE	= 1450;
CREATE		= DATE 25-09-17  TIME 17:06:12;
MODIFIED	= DATE 25-12-16  TIME 18:22:48;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 54;
MEMORY_SIZE	= 1866;
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
   1:  ! DESCRIPTION: Smart back gauge a ;
   2:  UFRAME_NUM=4 ;
   3:  UTOOL_NUM=R[5] ;
   4:   ;
   5:  ! -- Record Start Position -- ;
   6:  PR[10]=LPOS    ;
   7:   ;
   8:  ! -- Check Initial Contact -- ;
   9:  IF ((DI[26]=ON AND DI[27]=ON) OR (DI[28]=ON AND DI[29]=ON) OR (DI[27]=ON AND DI[28]=ON)) THEN ;
  10:  JMP LBL[1] ;
  11:  ENDIF ;
  12:   ;
  13:  ! -- Smart Adjustment Loop -- ;
  14:  FOR R[18]=1 TO 30 ;
  15:   ;
  16:  ! Calculate adjustment factors ;
  17:  ! No contact - move in Y ;
  18:  IF ((DI[26]=OFF AND DI[27]=OFF) OR (DI[28]=OFF AND DI[29]=OFF) OR (DI[27]=OFF AND DI[28]=OFF)) THEN ;
  19:  PR[10]=LPOS    ;
  20:  PR[10,2]=PR[10,2]+.5    ;
  21:  ELSE ;
  22:  ! Partial contact - calculate rot ;
  23:  PR[10]=LPOS    ;
  24:  ! Left side needs contact ;
  25:  IF ((DI[26]=OFF AND DI[27]=ON) OR (DI[28]=OFF AND DI[29]=ON) OR (DI[27]=OFF AND DI[28]=ON)) THEN ;
  26:  PR[10,6]=PR[10,6]+.25    ;
  27:  PR[10,2]=PR[10,2]+.2    ;
  28:  ENDIF ;
  29:  ! Right side needs contact ;
  30:  IF ((DI[26]=ON AND DI[27]=OFF) OR (DI[28]=ON AND DI[29]=OFF) OR (DI[27]=ON AND DI[28]=OFF)) THEN ;
  31:  PR[10,6]=PR[10,6]-.25    ;
  32:  PR[10,2]=PR[10,2]+.2    ;
  33:  ENDIF ;
  34:  ENDIF ;
  35:   ;
  36:  ! Execute movement ;
  37:L PR[10] 50mm/sec FINE    ;
  38:   ;
  39:  ! Check if aligned ;
  40:  WAIT    .20(sec) ;
  41:  IF (((DI[26]=ON OR DI[27]=ON) AND (DI[28]=ON OR DI[29]=ON)) OR (DI[26]=ON AND DI[27]=ON) OR (DI[28]=ON AND DI[29]=ON)) THEN ;
  42:  R[18]=1    ;
  43:  JMP LBL[1] ;
  44:  ENDIF ;
  45:   ;
  46:  ENDFOR ;
  47:   ;
  48:  ! -- Handle Timeout -- ;
  49:  UALM[7] ;
  50:   ;
  51:  ABORT ;
  52:   ;
  53:  ! -- Success Exit -- ;
  54:  LBL[1] ;
/POS
/END
