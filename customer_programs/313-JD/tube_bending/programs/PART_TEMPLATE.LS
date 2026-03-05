/PROG  PART_TEMPLATE
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 3467;
CREATE		= DATE 25-01-24  TIME 16:30:20;
MODIFIED	= DATE 25-04-10  TIME 10:49:26;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 149;
MEMORY_SIZE	= 3951;
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
   5:  IF (DI[106]),JMP LBL[2] ;
   6:   ;
   7:  !ONLY CHANGE IF CART GRID CHANGES ;
   8:  R[1]=6    ;
   9:  R[2]=6    ;
  10:  R[7]=188    ;
  11:  R[8]=189.5    ;
  12:  R[23]=0    ;
  13:  R[24]=0    ;
  14:  R[25]=0    ;
  15:  R[26]=0    ;
  16:  R[27]=0    ;
  17:  R[28]=0    ;
  18:  R[29]=0    ;
  19:  R[30]=0    ;
  20:  !TUBE LENGTH SET ON PLC ;
  21:  !SET LENGTH BELOW TO MINIMUM ;
  22:  IF R[9]<300,JMP LBL[3] ;
  23:   ;
  24:   ;
  25:  IF DO[21]=OFF,CALL GO_HOME ;
  26:   ;
  27:  LBL[1] ;
  28:   ;
  29:  SELECT R[13]=1,CALL INFEED_PICK_1 ;
  30:         =2,CALL INFEED_PICK_2 ;
  31:         =3,CALL INFEED_PICK_3 ;
  32:         =4,CALL INFEED_PICK_4 ;
  33:         =0,JMP LBL[1] ;
  34:   ;
  35:  IF (R[13]=0),JMP LBL[1] ;
  36:   ;
  37:  IF (F[5]) THEN ;
  38:  F[5]=(OFF) ;
  39:  ELSE ;
  40:  JMP LBL[1] ;
  41:  ENDIF ;
  42:   ;
  43:  !DO NOT CHANGE P1 - P5 ;
  44:L P[1:Transition1] 1500mm/sec CNT50    ;
  45:   ;
  46:J P[2:Transition2] 50% CNT50    ;
  47:   ;
  48:J P[3:Transition3] 50% CNT50    ;
  49:   ;
  50:J P[4:Transition4] 50% CNT50    ;
  51:   ;
  52:J P[5:Transition5] 50% CNT100    ;
  53:   ;
  54:  DO[25]=ON ;
  55:   ;
  56:  WAIT (DI[120])    ;
  57:   ;
  58:  DO[25]=OFF ;
  59:   ;
  60:  CALL LOAD_BENDER    ;
  61:   ;
  62:  DO[27]=ON ;
  63:   ;
  64:  WAIT (DI[121])    ;
  65:   ;
  66:  DO[27]=OFF ;
  67:   ;
  68:  UFRAME_NUM=6 ;
  69:   ;
  70:  !CHANGE P6 - P13 TO PICK ;
  71:  !BENT PART AND PLACE ON TABLE ;
  72:  !USE USER FRAME 6 AND ;
  73:  !AND TOOL FRAME 1 FOR P6 ;
  74:J P[6:Change grip] 50% CNT25    ;
  75:   ;
  76:  UTOOL_NUM=2 ;
  77:   ;
  78:  !USE TOOL FRAME 2 FOR P7 - P13 ;
  79:J P[7:Approach Part] 25% FINE    ;
  80:   ;
  81:  RO[2]=ON ;
  82:   ;
  83:  WAIT   1.00(sec) ;
  84:   ;
  85:L P[8:Pick Position] 700mm/sec FINE    ;
  86:   ;
  87:  RO[2]=OFF ;
  88:   ;
  89:  WAIT   2.00(sec) ;
  90:   ;
  91:  CALL UNLOAD_BENDER    ;
  92:   ;
  93:  UTOOL_NUM=2 ;
  94:   ;
  95:L P[9:Part out of Bender] 700mm/sec FINE    ;
  96:   ;
  97:L P[10:Clear Bender] 1500mm/sec FINE    ;
  98:   ;
  99:  UFRAME_NUM=5 ;
 100:   ;
 101:J P[14:WAIT ON CURTAIN MUTE] 50% FINE    ;
 102:   ;
 103:  DO[29]=ON ;
 104:   ;
 105:  WAIT (DI[120])    ;
 106:   ;
 107:  DO[29]=OFF ;
 108:   ;
 109:  CALL MUTE_LIGHT_CURTAIN    ;
 110:   ;
 111:  WAIT (!DI[122] AND DI[123])    ;
 112:   ;
 113:  DO[31]=ON ;
 114:   ;
 115:  UFRAME_NUM=5 ;
 116:  UTOOL_NUM=2 ;
 117:   ;
 118:  !USE USER FRAME 5 FOR P11 - P13 ;
 119:L P[15:OVER OUTFEED] 700mm/sec FINE    ;
 120:   ;
 121:L P[12:Place Part] 700mm/sec FINE    ;
 122:   ;
 123:  RO[2]=ON ;
 124:   ;
 125:  WAIT (RI[2])    ;
 126:   ;
 127:L P[15:OVER OUTFEED] 700mm/sec FINE    ;
 128:   ;
 129:L P[13:Clear Outfeed] 700mm/sec FINE    ;
 130:   ;
 131:  DO[31]=OFF ;
 132:   ;
 133:  WAIT   1.00(sec) ;
 134:   ;
 135:  DO[29]=OFF ;
 136:   ;
 137:  JMP LBL[1] ;
 138:   ;
 139:  LBL[2] ;
 140:   ;
 141:  MESSAGE[Manual Override On] ;
 142:   ;
 143:  ABORT ;
 144:   ;
 145:  LBL[3] ;
 146:   ;
 147:  MESSAGE[VERIFY TUBE LENGTH] ;
 148:   ;
 149:  ABORT ;
/POS
P[1:"Transition1"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1326.121  mm,	Y =   117.095  mm,	Z =  1974.840  mm,
	W =    94.137 deg,	P =    29.118 deg,	R =    92.010 deg,
	E1=    -2.984  mm
};
P[2:"Transition2"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1375.600  mm,	Y =   -99.896  mm,	Z =  1971.195  mm,
	W =  -118.252 deg,	P =   -89.743 deg,	R =   -61.346 deg,
	E1=    -2.983  mm
};
P[3:"Transition3"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2032.386  mm,	Y = -1578.467  mm,	Z =  1666.909  mm,
	W =  -118.253 deg,	P =   -89.743 deg,	R =   -61.345 deg,
	E1=    -2.983  mm
};
P[4:"Transition4"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -279.042  mm,	Y = -1887.038  mm,	Z =  1281.195  mm,
	W =  -118.255 deg,	P =   -89.743 deg,	R =   -61.344 deg,
	E1=    -2.983  mm
};
P[5:"Transition5"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -279.042  mm,	Y = -1887.037  mm,	Z =   830.481  mm,
	W =  -118.257 deg,	P =   -89.743 deg,	R =   -61.342 deg,
	E1=    -2.983  mm
};
P[6:"Change grip"]{
   GP1:
	UF : 6, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1344.755  mm,	Y =  -309.965  mm,	Z =  1637.786  mm,
	W =   -89.528 deg,	P =      .585 deg,	R =   178.574 deg,
	E1=    -2.983  mm
};
P[7:"Approach Part"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =   365.755  mm,	Y =  -214.675  mm,	Z =   833.001  mm,
	W =    89.673 deg,	P =   -29.709 deg,	R =   -89.168 deg,
	E1=   205.337  mm
};
P[8:"Pick Position"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =    34.205  mm,	Y =  -218.569  mm,	Z =   834.622  mm,
	W =    89.675 deg,	P =   -29.409 deg,	R =   -89.170 deg,
	E1=   205.337  mm
};
P[9:"Part out of Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =    34.200  mm,	Y =  -218.566  mm,	Z =  1872.051  mm,
	W =    89.675 deg,	P =   -29.409 deg,	R =   -89.170 deg,
	E1=   205.337  mm
};
P[10:"Clear Bender"]{
   GP1:
	UF : 6, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =   890.629  mm,	Y =  -218.559  mm,	Z =  1872.029  mm,
	W =    89.675 deg,	P =   -29.409 deg,	R =   -89.170 deg,
	E1=   205.337  mm
};
P[12:"Place Part"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =   474.091  mm,	Y =  1160.971  mm,	Z =    21.130  mm,
	W =  -179.834 deg,	P =      .792 deg,	R =   -52.109 deg,
	E1=  1009.816  mm
};
P[13:"Clear Outfeed"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =  -363.897  mm,	Y =   771.061  mm,	Z =   609.378  mm,
	W =   164.653 deg,	P =    31.881 deg,	R =  -134.432 deg,
	E1=   504.371  mm
};
P[14:"WAIT ON CURTAIN MUTE"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X = -1019.722  mm,	Y =   258.053  mm,	Z =  1598.469  mm,
	W =    71.248 deg,	P =    88.060 deg,	R =    70.103 deg,
	E1=   621.977  mm
};
P[15:"OVER OUTFEED"]{
   GP1:
	UF : 5, UT : 2,		CONFIG : 'N U T, 0, 0, 1',
	X =   477.748  mm,	Y =  1153.460  mm,	Z =   613.208  mm,
	W =  -179.832 deg,	P =      .791 deg,	R =   -52.109 deg,
	E1=  1009.816  mm
};
/END
