/PROG  TBGM110933_REVA
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2955;
CREATE		= DATE 25-07-24  TIME 23:30:08;
MODIFIED	= DATE 25-07-24  TIME 23:57:20;
FILE_NAME	= R3_PART_;
VERSION		= 0;
LINE_COUNT	= 130;
MEMORY_SIZE	= 3523;
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
	X =  -747.195  mm,	Y =  1336.312  mm,	Z =   878.041  mm,
	W =   179.399 deg,	P =      .341 deg,	R =  -121.510 deg,
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
	X =   321.059  mm,	Y =     1.362  mm,	Z =   629.848  mm,
	W =   104.076 deg,	P =   -89.030 deg,	R =  -103.887 deg,
	E1=   291.944  mm
};
P[8:"Pick Position"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    49.576  mm,	Y =     1.281  mm,	Z =   629.667  mm,
	W =   136.649 deg,	P =   -88.651 deg,	R =  -135.959 deg,
	E1=   291.944  mm
};
P[9:"Part out of Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    49.143  mm,	Y =     1.303  mm,	Z =  1396.842  mm,
	W =   136.588 deg,	P =   -88.653 deg,	R =  -135.902 deg,
	E1=   291.944  mm
};
P[10:"Clear Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   639.713  mm,	Y =     1.249  mm,	Z =  1396.985  mm,
	W =   136.510 deg,	P =   -88.654 deg,	R =  -135.828 deg,
	E1=   291.944  mm
};
P[12:"Place Part"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   308.409  mm,	Y =  1519.668  mm,	Z =    20.093  mm,
	W =  -179.182 deg,	P =      .068 deg,	R =  -104.139 deg,
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
	X =   307.678  mm,	Y =  1515.895  mm,	Z =   555.055  mm,
	W =  -179.182 deg,	P =      .068 deg,	R =  -104.140 deg,
	E1=  1021.443  mm
};
/END
