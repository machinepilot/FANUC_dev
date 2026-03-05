/PROG  INFEED_PICK_1_R2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2512;
CREATE		= DATE 25-07-24  TIME 09:23:42;
MODIFIED	= DATE 26-01-21  TIME 13:41:48;
FILE_NAME	= INFEED_P;
VERSION		= 0;
LINE_COUNT	= 109;
MEMORY_SIZE	= 2980;
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
   1:  UFRAME_NUM=1 ;
   2:  UTOOL_NUM=1 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[2]=ON ;
   5:  WAIT   1.00(sec) ;
   6:   ;
   7:  IF (!DI[113] OR F[1]) THEN ;
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
  20:J P[2:Transition to Pallet] 50% CNT50    ;
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
  56:L P[4] 700mm/sec FINE Offset,PR[59]    ;
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
  68:L P[5] 2000mm/sec CNT50    ;
  69:  WAIT    .25(sec) ;
  70:   ;
  71:J P[6] 50% CNT50    ;
  72:   ;
  73:J P[7] 50% CNT50    ;
  74:   ;
  75:  F[5]=(ON) ;
  76:   ;
  77:  R[4]=R[4]+1    ;
  78:   ;
  79:  R[14]=R[18]-R[4]+1    ;
  80:   ;
  81:  IF R[4]>R[18],JMP LBL[2] ;
  82:   ;
  83:  IF (R[4]>R[1]*R[2]),JMP LBL[2] ;
  84:   ;
  85:  JMP LBL[1] ;
  86:   ;
  87:  LBL[2] ;
  88:   ;
  89:  R[4]=1    ;
  90:   ;
  91:  R[32]=1    ;
  92:   ;
  93:  R[33]=1    ;
  94:   ;
  95:  R[13]=R[13]+1    ;
  96:   ;
  97:  F[1]=(ON) ;
  98:   ;
  99:  IF (R[13]>R[11]),JMP LBL[3] ;
 100:   ;
 101:  JMP LBL[1] ;
 102:   ;
 103:  LBL[3] ;
 104:   ;
 105:  CALL RESET_PROGRAM    ;
 106:   ;
 107:  LBL[1] ;
/POS
P[1:"Initial Transition"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   338.288  mm,	Y = -1252.211  mm,	Z =  1099.760  mm,
	W =  -133.785 deg,	P =    -5.491 deg,	R =    -2.322 deg,
	E1=    28.368  mm
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
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    -3.686  mm,	Y =    -2.188  mm,	Z =   700.000  mm,
	W =  -179.829 deg,	P =      .239 deg,	R =   -90.697 deg,
	E1=   264.049  mm
};
P[4]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    -6.673  mm,	Y =    49.295  mm,	Z =   241.065  mm,
	W =  -179.831 deg,	P =      .237 deg,	R =   -90.348 deg,
	E1=   264.049  mm
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
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   181.882  mm,	Y =    47.599  mm,	Z =   446.390  mm,
	W =  -179.832 deg,	P =      .236 deg,	R =   -90.298 deg,
	E1=   264.049  mm
};
P[9:"Approach/Exit"]{
   GP1:
	UF : 1, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   191.307  mm,	Y =    -3.889  mm,	Z =   734.857  mm,
	W =  -179.829 deg,	P =      .239 deg,	R =   -90.522 deg,
	E1=   264.049  mm
};
/END
