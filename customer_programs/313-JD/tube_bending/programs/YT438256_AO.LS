/PROG  YT438256_AO
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2993;
CREATE		= DATE 26-01-21  TIME 07:41:26;
MODIFIED	= DATE 26-01-21  TIME 08:18:54;
FILE_NAME	= YT447838;
VERSION		= 0;
LINE_COUNT	= 131;
MEMORY_SIZE	= 3565;
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
   3:  CALL RESET_BEND    ;
   4:  OVERRIDE=R[51] ;
   5:   ;
   6:  R[1]=2    ;
   7:  R[2]=3    ;
   8:  R[3]=R[1]*R[2]    ;
   9:   ;
  10:  IF (DI[106]),JMP LBL[2] ;
  11:   ;
  12:  IF R[9]<300,JMP LBL[3] ;
  13:   ;
  14:   ;
  15:  IF DO[21]=OFF,CALL GO_HOME ;
  16:   ;
  17:  LBL[1] ;
  18:   ;
  19:  SELECT R[13]=1,CALL INFEED_PICK_1_R2 ;
  20:         =2,CALL INFEED_PICK_2_R2 ;
  21:         =3,CALL INFEED_PICK_3_R2 ;
  22:         =4,CALL INFEED_PICK_4_R2 ;
  23:         =0,JMP LBL[1] ;
  24:   ;
  25:  IF (R[13]=0),JMP LBL[1] ;
  26:   ;
  27:  IF (F[5]) THEN ;
  28:  F[5]=(OFF) ;
  29:  ELSE ;
  30:  JMP LBL[1] ;
  31:  ENDIF ;
  32:   ;
  33:  CALL REGRIP_WITH_DROP    ;
  34:   ;
  35:  DO[25]=ON ;
  36:   ;
  37:  WAIT (DI[120])    ;
  38:   ;
  39:  DO[25]=OFF ;
  40:   ;
  41:  CALL LOAD_BENDER_YT435891    ;
  42:   ;
  43:  DO[27]=ON ;
  44:   ;
  45:  WAIT (DI[121])    ;
  46:   ;
  47:  DO[27]=OFF ;
  48:   ;
  49:  UFRAME_NUM=6 ;
  50:  UTOOL_NUM=2 ;
  51:   ;
  52:  !CHANGE P6 - P13 TO PICK ;
  53:  !BENT PART AND PLACE ON TABLE ;
  54:  !USE USER FRAME 6 AND ;
  55:  !AND TOOL FRAME 1 FOR P6 ;
  56:J P[6:Position for Pick] 50% CNT25    ;
  57:   ;
  58:  !USE TOOL FRAME 2 FOR P7 - P13 ;
  59:J P[7:Approach Part] 25% FINE    ;
  60:   ;
  61:  RO[2]=ON ;
  62:   ;
  63:  WAIT   1.00(sec) ;
  64:   ;
  65:L P[8:Pick Position] 700mm/sec FINE    ;
  66:   ;
  67:  RO[2]=OFF ;
  68:   ;
  69:  WAIT   2.00(sec) ;
  70:   ;
  71:  CALL UNLOAD_BENDER    ;
  72:   ;
  73:  UTOOL_NUM=2 ;
  74:   ;
  75:L P[9:Part out of Bender] 700mm/sec FINE    ;
  76:   ;
  77:L P[10:Clear Bender] 1500mm/sec FINE    ;
  78:   ;
  79:  UFRAME_NUM=5 ;
  80:   ;
  81:J P[14:Transition to Table] 50% CNT50    ;
  82:   ;
  83:J P[1:Wait on Light Curtain] 50% FINE    ;
  84:   ;
  85:  DO[29]=ON ;
  86:   ;
  87:  WAIT (DI[120])    ;
  88:   ;
  89:  DO[29]=OFF ;
  90:   ;
  91:  CALL MUTE_LIGHT_CURTAIN    ;
  92:   ;
  93:  WAIT (!DI[122] AND DI[123])    ;
  94:   ;
  95:  DO[31]=ON ;
  96:   ;
  97:  UFRAME_NUM=5 ;
  98:  UTOOL_NUM=2 ;
  99:   ;
 100:  !USE USER FRAME 5 FOR P11 - P13 ;
 101:L P[15:OVER OUTFEED] 700mm/sec FINE    ;
 102:   ;
 103:L P[12:Place Part] 700mm/sec FINE    ;
 104:   ;
 105:  RO[2]=ON ;
 106:   ;
 107:  WAIT (RI[2])    ;
 108:   ;
 109:L P[15:OVER OUTFEED] 700mm/sec FINE    ;
 110:   ;
 111:L P[13:Clear Outfeed] 700mm/sec FINE    ;
 112:   ;
 113:  DO[31]=OFF ;
 114:   ;
 115:  WAIT   1.00(sec) ;
 116:   ;
 117:  DO[29]=OFF ;
 118:   ;
 119:  JMP LBL[1] ;
 120:   ;
 121:  LBL[2] ;
 122:   ;
 123:  MESSAGE[Manual Override On] ;
 124:   ;
 125:  ABORT ;
 126:   ;
 127:  LBL[3] ;
 128:   ;
 129:  MESSAGE[VERIFY TUBE LENGTH] ;
 130:   ;
 131:  ABORT ;
/POS
P[1:"Wait on Light Curtain"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =  -454.474  mm,	Y =   591.325  mm,	Z =  1091.200  mm,
	W =   178.750 deg,	P =     2.290 deg,	R =  -172.143 deg,
	E1=   493.577  mm
};
P[6:"Position for Pick"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   483.837  mm,	Y =    24.983  mm,	Z =  1507.357  mm,
	W =    47.152 deg,	P =   -89.672 deg,	R =   -50.398 deg,
	E1=   451.688  mm
};
P[7:"Approach Part"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =   442.810  mm,	Y =   342.422  mm,	Z =  1344.716  mm,
	W =   -90.699 deg,	P =     -.451 deg,	R =    89.878 deg,
	E1=   451.688  mm
};
P[8:"Pick Position"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =    54.953  mm,	Y =   342.418  mm,	Z =  1344.584  mm,
	W =   -90.699 deg,	P =     -.451 deg,	R =    89.878 deg,
	E1=   451.688  mm
};
P[9:"Part out of Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =    54.502  mm,	Y =   342.421  mm,	Z =  2666.099  mm,
	W =   -90.699 deg,	P =     -.451 deg,	R =    89.878 deg,
	E1=   451.688  mm
};
P[10:"Clear Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   830.899  mm,	Y =  -269.714  mm,	Z =  2617.094  mm,
	W =   -90.082 deg,	P =   -44.712 deg,	R =    89.839 deg,
	E1=   466.088  mm
};
P[12:"Place Part"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, -1',
	X =   340.113  mm,	Y =   682.139  mm,	Z =    33.604  mm,
	W =   178.271 deg,	P =      .134 deg,	R =  -171.253 deg,
	E1=  1025.347  mm
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
	X =  -429.110  mm,	Y =   323.009  mm,	Z =  1092.763  mm,
	W =   179.358 deg,	P =     2.675 deg,	R =  -131.091 deg,
	E1=   460.230  mm
};
P[15:"OVER OUTFEED"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   339.140  mm,	Y =   677.036  mm,	Z =   756.801  mm,
	W =   178.782 deg,	P =     2.301 deg,	R =  -171.257 deg,
	E1=  1025.347  mm
};
/END
