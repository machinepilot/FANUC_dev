/PROG  INFEED_PICK_3_R2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2546;
CREATE		= DATE 25-07-24  TIME 16:12:42;
MODIFIED	= DATE 26-01-21  TIME 14:44:52;
FILE_NAME	= INFEED_P;
VERSION		= 0;
LINE_COUNT	= 111;
MEMORY_SIZE	= 3006;
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
   1:  UFRAME_NUM=3 ;
   2:  UTOOL_NUM=1 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[2]=ON ;
   5:  WAIT   1.00(sec) ;
   6:   ;
   7:  IF (!DI[115] OR F[3]) THEN ;
   8:  JMP LBL[2] ;
   9:  ENDIF ;
  10:   ;
  11:  IF (R[32]>3) THEN ;
  12:  R[32]=1    ;
  13:  R[33]=2    ;
  14:  ENDIF ;
  15:   ;
  16:  PR[59,1]=(R[31]*(R[32]-1)) ;
  17:   ;
  18:J P[1:Initial Transition] 50% CNT50    ;
  19:   ;
  20:  //J P[2:Transition to Pallet] 50% CNT50    ;
  21:   ;
  22:  UTOOL_NUM=2 ;
  23:   ;
  24:  !Top layer pick ;
  25:  IF (R[33]=1) THEN ;
  26:L P[9:Approach/Exit] 1500mm/sec FINE Offset,PR[59]    ;
  27:   ;
  28:  IF (!RI[2]) THEN ;
  29:  RO[2]=ON ;
  30:  WAIT (RI[2])    ;
  31:  ENDIF ;
  32:   ;
  33:  WAIT   1.00(sec) ;
  34:   ;
  35:L P[8:Pick] 700mm/sec FINE Offset,PR[59]    ;
  36:   ;
  37:  RO[2]=OFF ;
  38:  WAIT   1.00(sec) ;
  39:   ;
  40:  IF (RI[2]),CALL ERROR_HANDLER(102) ;
  41:   ;
  42:L P[9:Approach/Exit] 700mm/sec FINE Offset,PR[59]    ;
  43:  ENDIF ;
  44:   ;
  45:  !Bottom layer pick ;
  46:  IF (R[33]=2) THEN ;
  47:L P[3:Approach_P1] 750mm/sec FINE Offset,PR[59]    ;
  48:   ;
  49:  IF (!RI[2]) THEN ;
  50:  RO[2]=ON ;
  51:  WAIT (RI[2])    ;
  52:  ENDIF ;
  53:   ;
  54:  WAIT   1.00(sec) ;
  55:   ;
  56:L P[4:Pick] 700mm/sec FINE Offset,PR[59]    ;
  57:   ;
  58:  RO[2]=OFF ;
  59:  WAIT   1.00(sec) ;
  60:   ;
  61:  IF (RI[2]),CALL ERROR_HANDLER(102) ;
  62:   ;
  63:L P[3:Approach_P1] 700mm/sec FINE Offset,PR[59]    ;
  64:  ENDIF ;
  65:   ;
  66:  R[32]=R[32]+1    ;
  67:   ;
  68:  UFRAME_NUM=1 ;
  69:   ;
  70:  //L P[5] 2000mm/sec CNT50    ;
  71:  WAIT    .25(sec) ;
  72:   ;
  73:J P[6] 50% CNT50    ;
  74:   ;
  75:J P[7] 50% CNT50    ;
  76:   ;
  77:  F[5]=(ON) ;
  78:   ;
  79:  R[4]=R[4]+1    ;
  80:   ;
  81:  R[14]=R[20]-R[4]+1    ;
  82:   ;
  83:  IF R[4]>R[20],JMP LBL[2] ;
  84:   ;
  85:  IF (R[4]>R[1]*R[2]),JMP LBL[2] ;
  86:   ;
  87:  JMP LBL[1] ;
  88:   ;
  89:  LBL[2] ;
  90:   ;
  91:  R[4]=1    ;
  92:   ;
  93:  R[32]=1    ;
  94:   ;
  95:  R[33]=1    ;
  96:   ;
  97:  R[13]=R[13]+1    ;
  98:   ;
  99:  F[3]=(ON) ;
 100:   ;
 101:  IF (R[13]>R[11]),JMP LBL[3] ;
 102:   ;
 103:  JMP LBL[1] ;
 104:   ;
 105:  LBL[3] ;
 106:   ;
 107:  CALL RESET_PROGRAM    ;
 108:   ;
 109:  LBL[1] ;
/POS
P[1:"Initial Transition"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   356.265  mm,	Y =   957.984  mm,	Z =  1107.479  mm,
	W =  -133.543 deg,	P =    -4.841 deg,	R =    -2.331 deg,
	E1=   268.272  mm
};
P[2:"Transition to Pallet"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   343.535  mm,	Y =  -652.203  mm,	Z =  1078.277  mm,
	W =  -133.906 deg,	P =    -1.663 deg,	R =    -2.314 deg,
	E1=   264.048  mm
};
P[3:"Approach_P1"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    -6.587  mm,	Y =   350.172  mm,	Z =   859.743  mm,
	W =   179.398 deg,	P =      .374 deg,	R =   -89.813 deg,
	E1=   268.272  mm
};
P[4:"Pick"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   -13.100  mm,	Y =   428.544  mm,	Z =   244.607  mm,
	W =   179.394 deg,	P =      .370 deg,	R =   -90.335 deg,
	E1=   268.272  mm
};
P[5]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   343.846  mm,	Y =  -693.135  mm,	Z =   885.330  mm,
	W =  -179.829 deg,	P =      .239 deg,	R =   -90.697 deg,
	E1=   264.049  mm
};
P[6]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   153.619  mm,	Y = -2058.150  mm,	Z =  1442.044  mm,
	W =  -179.829 deg,	P =      .239 deg,	R =  -105.570 deg,
	E1=   119.089  mm
};
P[7]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X = -2015.792  mm,	Y = -2454.018  mm,	Z =  1442.044  mm,
	W =  -179.829 deg,	P =      .239 deg,	R =   163.750 deg,
	E1=   119.089  mm
};
P[8:"Pick"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   176.223  mm,	Y =   427.132  mm,	Z =   447.891  mm,
	W =   179.395 deg,	P =      .373 deg,	R =   -90.133 deg,
	E1=   268.272  mm
};
P[9:"Approach/Exit"]{
   GP1:
	UF : 3, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   181.812  mm,	Y =   349.494  mm,	Z =   804.639  mm,
	W =   179.399 deg,	P =      .373 deg,	R =   -89.813 deg,
	E1=   268.272  mm
};
/END
