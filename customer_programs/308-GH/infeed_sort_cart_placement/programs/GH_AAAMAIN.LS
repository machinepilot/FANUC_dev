/PROG  GH_AAAMAIN
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Main Executable";
PROG_SIZE	= 1085;
CREATE		= DATE 26-01-19  TIME 15:28:12;
MODIFIED	= DATE 26-02-24  TIME 05:35:12;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 71;
MEMORY_SIZE	= 1609;
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
LOCAL_REGISTERS	= 0,0,0;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:  !MAIN PROGRAM ;
   2:   ;
   3:   ;
   4:   ;
   5:  LBL[100] ;
   6:   ;
   7:  DO[29:IN WAIT]=ON ;
   8:  WAIT (DI[56:INFO READY])    ;
   9:  DO[29:IN WAIT]=OFF ;
  10:  DO[21:INFO REGISTERED]=PULSE,0.5sec ;
  11:  R[1:PART INDEX]=GI[2:PART INDEX]    ;
  12:  R[2:SORT CODE]=GI[1:SORT INDEX]    ;
  13:  CALL GH_PARSE    ;
  14:   ;
  15:   ;
  16:  !PROGRAM SELECTION ;
  17:  SELECT R[3:DEST_CLASS]=1,JMP LBL[1] ;
  18:         =2,JMP LBL[2] ;
  19:         =3,JMP LBL[3] ;
  20:         =4,JMP LBL[4] ;
  21:         =5,JMP LBL[5] ;
  22:   ;
  23:   ;
  24:  !EXTENDED SLOT ;
  25:  LBL[1] ;
  26:  F[1:L_SLOT]=(ON) ;
  27:  CALL GH_L_SLOT    ;
  28:  F[1:L_SLOT]=(OFF) ;
  29:   ;
  30:  !SHORT SLOT ;
  31:  LBL[2] ;
  32:  F[2:S_SLOT]=(ON) ;
  33:  CALL GH_S_SLOT    ;
  34:  F[2:S_SLOT]=(OFF) ;
  35:   ;
  36:  !BIN ;
  37:  LBL[*2] ;
  38:  F[3:BIN]=(ON) ;
  39:  CALL GH_BIN    ;
  40:  F[1:L_SLOT]=(OFF) ;
  41:   ;
  42:  !PANEL ;
  43:  LBL[*2] ;
  44:  F[4:PANEL]=(ON) ;
  45:  CALL GH_PANEL    ;
  46:  F[4:PANEL]=(OFF) ;
  47:   ;
  48:  !SHORT SLOT ;
  49:  LBL[*2] ;
  50:  F[5:FOAM]=(ON) ;
  51:  CALL GH_FOAM    ;
  52:  F[5:FOAM]=(OFF) ;
  53:   ;
  54:   ;
  55:   ;
  56:   ;
  57:   ;
  58:   ;
  59:   ;
  60:   ;
  61:   ;
  62:   ;
  63:   ;
  64:   ;
  65:   ;
  66:   ;
  67:   ;
  68:   ;
  69:   ;
  70:   ;
  71:   ;
/POS
/END
