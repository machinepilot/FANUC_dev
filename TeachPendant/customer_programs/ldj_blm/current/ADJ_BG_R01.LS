/PROG  ADJ_BG_R01
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Smart BG Adjust";
PROG_SIZE	= 1450;
CREATE		= DATE 25-09-17  TIME 17:06:12;
MODIFIED	= DATE 26-04-20  TIME 12:00:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 55;
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
   2:  !DI[26..29] = FNGR1..FNGR4 ;
   3:  !R[18:ADJ LOOP CNT] ;
   4:  UFRAME_NUM=4 ;
   5:  UTOOL_NUM=R[5:CURRENT TOOL] ;
   6:   ;
   7:  ! -- Record Start Position -- ;
   8:  PR[10]=LPOS    ;
   9:   ;
  10:  ! -- Check Initial Contact -- ;
  11:  IF ((DI[26:FNGR1]=ON AND DI[27:FNGR2]=ON) OR (DI[28:FNGR3]=ON AND DI[29:FNGR4]=ON) OR (DI[27:FNGR2]=ON AND DI[28:FNGR3]=ON)) THEN ;
  10:  JMP LBL[1] ;
  11:  ENDIF ;
  12:   ;
  13:  ! -- Smart Adjustment Loop -- ;
  14:  FOR R[18:ADJ LOOP CNT]=1 TO 30 ;
  15:   ;
  16:  ! Calculate adjustment factors ;
  17:  ! No contact - move in Y ;
  18:  IF ((DI[26:FNGR1]=OFF AND DI[27:FNGR2]=OFF) OR (DI[28:FNGR3]=OFF AND DI[29:FNGR4]=OFF) OR (DI[27:FNGR2]=OFF AND DI[28:FNGR3]=OFF)) THEN ;
  19:  PR[10]=LPOS    ;
  20:  PR[10,2]=PR[10,2]+.5    ;
  21:  ELSE ;
  22:  ! Partial contact - calculate rot ;
  23:  PR[10]=LPOS    ;
  24:  ! Left side needs contact ;
  25:  IF ((DI[26:FNGR1]=OFF AND DI[27:FNGR2]=ON) OR (DI[28:FNGR3]=OFF AND DI[29:FNGR4]=ON) OR (DI[27:FNGR2]=OFF AND DI[28:FNGR3]=ON)) THEN ;
  26:  PR[10,6]=PR[10,6]+.25    ;
  27:  PR[10,2]=PR[10,2]+.2    ;
  28:  ENDIF ;
  29:  ! Right side needs contact ;
  30:  IF ((DI[26:FNGR1]=ON AND DI[27:FNGR2]=OFF) OR (DI[28:FNGR3]=ON AND DI[29:FNGR4]=OFF) OR (DI[27:FNGR2]=ON AND DI[28:FNGR3]=OFF)) THEN ;
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
  41:  IF (((DI[26:FNGR1]=ON OR DI[27:FNGR2]=ON) AND (DI[28:FNGR3]=ON OR DI[29:FNGR4]=ON)) OR (DI[26:FNGR1]=ON AND DI[27:FNGR2]=ON) OR (DI[28:FNGR3]=ON AND DI[29:FNGR4]=ON)) THEN ;
  42:  JMP LBL[1] ;
  43:  ENDIF ;
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
