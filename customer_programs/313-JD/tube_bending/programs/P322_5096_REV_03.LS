/PROG  P322_5096_REV_03
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2951;
CREATE		= DATE 25-07-25  TIME 02:50:26;
MODIFIED	= DATE 25-11-05  TIME 15:47:36;
FILE_NAME	= TBGM1109;
VERSION		= 0;
LINE_COUNT	= 130;
MEMORY_SIZE	= 3519;
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
   1:  UFRAME_NUM=0 ;
   2:  UTOOL_NUM=1 ;
   3:  OVERRIDE=R[51] ;
   4:   ;
   5:  R[1]=2    ;
   6:  R[2]=3    ;
   7:  R[3]=R[1]*R[2]    ;
   8:   ;
   9:  IF (DI[106]),JMP LBL[2] ;
  10:   ;
  11:  IF R[9]<300,JMP LBL[3] ;
  12:   ;
  13:   ;
  14:  IF DO[21]=OFF,CALL GO_HOME ;
  15:   ;
  16:  LBL[1] ;
  17:   ;
  18:  SELECT R[13]=1,CALL INFEED_PICK_1_R2 ;
  19:         =2,CALL INFEED_PICK_2_R2 ;
  20:         =3,CALL INFEED_PICK_3_R2 ;
  21:         =4,CALL INFEED_PICK_4_R2 ;
  22:         =0,JMP LBL[1] ;
  23:   ;
  24:  IF (R[13]=0),JMP LBL[1] ;
  25:   ;
  26:  IF (F[5]) THEN ;
  27:  F[5]=(OFF) ;
  28:  ELSE ;
  29:  JMP LBL[1] ;
  30:  ENDIF ;
  31:   ;
  32:  CALL REGRIP_R2    ;
  33:   ;
  34:  DO[25]=ON ;
  35:   ;
  36:  WAIT (DI[120])    ;
  37:   ;
  38:  DO[25]=OFF ;
  39:   ;
  40:  CALL LOAD_BENDER_R2    ;
  41:   ;
  42:  DO[27]=ON ;
  43:   ;
  44:  WAIT (DI[121])    ;
  45:   ;
  46:  DO[27]=OFF ;
  47:   ;
  48:  UFRAME_NUM=6 ;
  49:  UTOOL_NUM=2 ;
  50:   ;
  51:  !CHANGE P6 - P13 TO PICK ;
  52:  !BENT PART AND PLACE ON TABLE ;
  53:  !USE USER FRAME 6 AND ;
  54:  !AND TOOL FRAME 1 FOR P6 ;
  55:J P[6:Position for Pick] 50% CNT25    ;
  56:   ;
  57:  !USE TOOL FRAME 2 FOR P7 - P13 ;
  58:J P[7:Approach Part] 25% FINE    ;
  59:   ;
  60:  RO[2]=ON ;
  61:   ;
  62:  WAIT   1.00(sec) ;
  63:   ;
  64:L P[8:Pick Position] 700mm/sec FINE    ;
  65:   ;
  66:  RO[2]=OFF ;
  67:   ;
  68:  WAIT   2.00(sec) ;
  69:   ;
  70:  CALL UNLOAD_BENDER    ;
  71:   ;
  72:  UTOOL_NUM=2 ;
  73:   ;
  74:L P[9:Part out of Bender] 700mm/sec FINE    ;
  75:   ;
  76:L P[10:Clear Bender] 1500mm/sec FINE    ;
  77:   ;
  78:  UFRAME_NUM=5 ;
  79:   ;
  80:J P[14:Transition to Table] 50% CNT50    ;
  81:   ;
  82:J P[1:Wait on Light Curtain] 50% FINE    ;
  83:   ;
  84:  DO[29]=ON ;
  85:   ;
  86:  WAIT (DI[120])    ;
  87:   ;
  88:  DO[29]=OFF ;
  89:   ;
  90:  CALL MUTE_LIGHT_CURTAIN    ;
  91:   ;
  92:  WAIT (!DI[122] AND DI[123])    ;
  93:   ;
  94:  DO[31]=ON ;
  95:   ;
  96:  UFRAME_NUM=5 ;
  97:  UTOOL_NUM=2 ;
  98:   ;
  99:  !USE USER FRAME 5 FOR P11 - P13 ;
 100:L P[15:OVER OUTFEED] 700mm/sec FINE    ;
 101:   ;
 102:L P[12:Place Part] 700mm/sec FINE    ;
 103:   ;
 104:  RO[2]=ON ;
 105:   ;
 106:  WAIT (RI[2])    ;
 107:   ;
 108:L P[15:OVER OUTFEED] 700mm/sec FINE    ;
 109:   ;
 110:L P[13:Clear Outfeed] 700mm/sec FINE    ;
 111:   ;
 112:  DO[31]=OFF ;
 113:   ;
 114:  WAIT   1.00(sec) ;
 115:   ;
 116:  DO[29]=OFF ;
 117:   ;
 118:  JMP LBL[1] ;
 119:   ;
 120:  LBL[2] ;
 121:   ;
 122:  MESSAGE[Manual Override On] ;
 123:   ;
 124:  ABORT ;
 125:   ;
 126:  LBL[3] ;
 127:   ;
 128:  MESSAGE[VERIFY TUBE LENGTH] ;
 129:   ;
 130:  ABORT ;
/POS
P[1:"Wait on Light Curtain"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -747.197  mm,	Y =  1336.305  mm,	Z =   877.968  mm,
	W =   179.574 deg,	P =      .365 deg,	R =   -96.467 deg,
	E1=   741.656  mm
};
P[6:"Position for Pick"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   513.014  mm,	Y =    -7.045  mm,	Z =  1080.820  mm,
	W =    90.334 deg,	P =   -88.634 deg,	R =   -90.386 deg,
	E1=   291.943  mm
};
P[7:"Approach Part"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   284.470  mm,	Y =  -208.856  mm,	Z =   757.188  mm,
	W =    90.071 deg,	P =   -42.974 deg,	R =   -90.180 deg,
	E1=   291.943  mm
};
P[8:"Pick Position"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    48.748  mm,	Y =  -208.840  mm,	Z =   757.119  mm,
	W =    90.071 deg,	P =   -42.974 deg,	R =   -90.181 deg,
	E1=   291.943  mm
};
P[9:"Part out of Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    48.442  mm,	Y =  -208.820  mm,	Z =  1603.201  mm,
	W =    90.071 deg,	P =   -42.975 deg,	R =   -90.181 deg,
	E1=   291.944  mm
};
P[10:"Clear Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   767.551  mm,	Y =  -262.395  mm,	Z =  1438.077  mm,
	W =    90.121 deg,	P =      .190 deg,	R =   -89.943 deg,
	E1=   291.944  mm
};
P[12:"Place Part"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   474.081  mm,	Y =  1517.627  mm,	Z =    37.279  mm,
	W =  -178.946 deg,	P =      .228 deg,	R =   -77.100 deg,
	E1=  1021.443  mm
};
P[13:"Clear Outfeed"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -363.896  mm,	Y =   771.062  mm,	Z =   609.377  mm,
	W =  -179.823 deg,	P =      .678 deg,	R =   -90.205 deg,
	E1=   504.371  mm
};
P[14:"Transition to Table"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -942.899  mm,	Y =   372.003  mm,	Z =  1243.913  mm,
	W =   179.814 deg,	P =      .316 deg,	R =  -121.236 deg,
	E1=   291.932  mm
};
P[15:"OVER OUTFEED"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   473.381  mm,	Y =  1513.972  mm,	Z =   555.266  mm,
	W =  -178.993 deg,	P =      .034 deg,	R =   -77.101 deg,
	E1=  1021.443  mm
};
/END
