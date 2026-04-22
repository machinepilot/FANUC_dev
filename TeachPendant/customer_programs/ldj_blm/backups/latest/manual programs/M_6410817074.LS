/PROG  M_6410817074
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410817074 MANUAL T2";
PROG_SIZE	= 0;
CREATE		= DATE 26-04-20  TIME 18:00:00;
MODIFIED	= DATE 26-04-20  TIME 18:00:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 166;
MEMORY_SIZE	= 0;
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
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;

LINE_TRACK;
  LINE_TRACK_SCHEDULE_NUMBER      : 0;
  LINE_TRACK_BOUNDARY_NUMBER      : 0;
  CONTINUE_TRACK_AT_PROG_END      : TRUE;

/MN
   1:  $WAITTMOUT=3000 ;
   2:  !6410817074 MANUAL T2 ;
   3:  !PRESS NOT INTEGRATED ;
   4:  !T2 STEP, OPERATOR PACED ;
   5:  !DI[30:PART DETECT] = GRIP ;
   6:  !CONFIRM (NO VAC SWITCH) ;
   7:  !--- INITIALIZE --- ;
   8:  UFRAME_NUM=0 ;
   9:  UTOOL_NUM=1 ;
  10:  PAYLOAD[1] ;
  11:  R[10:PART INDEX]=0    ;
  12:   ;
  13:J PR[1:HOME] 100% CNT50    ;
  14:   ;
  15:  !--- CYCLE START --- ;
  16:  LBL[1] ;
  17:   ;
  18:  !--- PICK --- ;
  19:  UFRAME_NUM=1 ;
  20:  UTOOL_NUM=1 ;
  21:  TIMER[1]=RESET ;
  22:  TIMER[1]=START ;
  23:   ;
  24:J P[3:INTMPT] 100% CNT10    ;
  25:L P[1:IN FRONT OF IF] 2000mm/sec CNT10    ;
  26:L P[2:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  27:   ;
  28:  !--- FIRST PART SEARCH --- ;
  29:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  30:  CALL SEARCH_R01    ;
  31:  PR[51,3]=PR[10,3:infd search]    ;
  32:  JMP LBL[11] ;
  33:  LBL[10] ;
  34:  !--- DEPLETION CHECK --- ;
  35:  R[13:DEPLETED INFD]=PR[51,3]    ;
  36:  IF R[13:DEPLETED INFD]<R[11:THRESHOLD],JMP LBL[99] ;
  37:  LBL[11] ;
  38:   ;
  39:  !INSERT PART PR ;
  40:  PR[2,3:OFFSET]=400    ;
  41:   ;
  42:L PR[51:INFD2 Z TRACK] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  43:L PR[51:INFD2 Z TRACK] 700mm/sec FINE    ;
  44:   ;
  45:  CALL ALL_VAC_ON_R01    ;
  46:  WAIT R[19:VAC SETTLE] ;
  47:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  48:  PAYLOAD[2] ;
  49:   ;
  50:L PR[51:INFD2 Z TRACK] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  51:   ;
  52:J P[4:INTMPT] 100% CNT100    ;
  53:J P[5:INTMPT] 100% CNT100    ;
  54:J P[6:INTMPT] 100% CNT100    ;
  55:L P[7:INTMPT] 2000mm/sec CNT100    ;
  56:   ;
  57:  !--- ZERO TABLE --- ;
  58:  UFRAME_NUM=2 ;
  59:   ;
  60:L P[8:ABOVE ZERO] 1500mm/sec FINE    ;
  61:L P[9:ON ZERO] 1200mm/sec FINE    ;
  62:   ;
  63:  CALL ALL_VAC_OFF_R01    ;
  64:  PAYLOAD[1] ;
  65:   ;
  66:  !--- RE-PICK (REORIENT) --- ;
  67:L P[10] 1500mm/sec FINE    ;
  68:L P[20] 1500mm/sec CNT100    ;
  69:J P[21:ROTATE 1] 75% CNT100    ;
  70:J P[22:ROTATE 2] 75% CNT100    ;
  71:J P[11] 75% CNT100    ;
  72:L P[12] 100mm/sec FINE    ;
  73:   ;
  74:  CALL ALL_VAC_ON_R01    ;
  75:  WAIT R[19:VAC SETTLE] ;
  76:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  77:  PAYLOAD[2] ;
  78:   ;
  79:L P[11] 155mm/sec FINE    ;
  80:   ;
  81:  !--- APPROACH PRESS --- ;
  82:L P[13] 2000mm/sec CNT100    ;
  83:L P[14] 1500mm/sec CNT100    ;
  84:L P[15] 1500mm/sec CNT100    ;
  85:L P[16] 1500mm/sec CNT100    ;
  86:L P[17] 1500mm/sec CNT100    ;
  87:   ;
  88:L P[19:STAGED FOR BEND] 500mm/sec FINE    ;
  89:   ;
  90:  !--- INSERT --- ;
  91:  UFRAME_NUM=3 ;
  92:   ;
  93:L P[18:INSERT] 500mm/sec FINE    ;
  94:   ;
  95:  !-- HOLD POSITION. OPERATOR: ;
  96:  !-- PINCH PART IN PRESS. ;
  97:  !-- RESUME TO RELEASE. -- ;
  98:  PAUSE ;
  99:   ;
 100:  !--- RELEASE & RETREAT --- ;
 101:  CALL ALL_VAC_OFF_R01    ;
 102:  PAYLOAD[1] ;
 103:   ;
 104:L P[28] 700mm/sec FINE    ;
 105:   ;
 106:  UFRAME_NUM=0 ;
 107:  CALL GO_HOME_R01    ;
 108:   ;
 109:  !-- ROBOT CLEAR. OPERATOR: ;
 110:  !-- BEND PART MANUALLY. ;
 111:  !-- RESUME TO RETRIEVE. -- ;
 112:  PAUSE ;
 113:   ;
 114:  !--- RETRIEVE FINISHED --- ;
 115:  UFRAME_NUM=3 ;
 116:   ;
 117:  !TEACH: P[100] APPROACH ;
 118:L P[100:RETR APPROACH] 500mm/sec CNT100    ;
 119:  !TEACH: P[101] GRIP ;
 120:L P[101:RETR GRIP] 200mm/sec FINE    ;
 121:   ;
 122:  CALL ALL_VAC_ON_R01    ;
 123:  WAIT R[19:VAC SETTLE] ;
 124:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 125:  PAYLOAD[2] ;
 126:   ;
 127:  !TEACH: P[102] EXTRACT ;
 128:L P[102:RETR EXTRACT] 500mm/sec CNT100    ;
 129:   ;
 130:  !--- OUTFEED --- ;
 131:  UFRAME_NUM=4 ;
 132:   ;
 133:L P[56] 1200mm/sec CNT100    ;
 134:L P[57] 1200mm/sec CNT100    ;
 135:L P[58] 1500mm/sec CNT100    ;
 136:L P[59] 1500mm/sec FINE Offset,PR[2:OFFSET]    ;
 137:L P[59] 500mm/sec FINE    ;
 138:   ;
 139:  CALL ALL_VAC_OFF_R01    ;
 140:  PAYLOAD[1] ;
 141:   ;
 142:L P[59] 1200mm/sec FINE Offset,PR[2:OFFSET]    ;
 143:   ;
 144:  !--- HOME --- ;
 145:  UFRAME_NUM=0 ;
 146:  CALL GO_HOME_R01    ;
 147:   ;
 148:  TIMER[1]=STOP ;
 149:  R[20]=(TIMER[1]) ;
 150:   ;
 151:  !--- HOUSEKEEPING --- ;
 152:  R[10:PART INDEX]=R[10:PART INDEX]+1    ;
 153:  PR[51,3]=PR[51,3]-R[12:THICKNESS]    ;
 154:   ;
 155:  !-- PART DONE. RESUME FOR ;
 156:  !-- NEXT PART OR ABORT. -- ;
 157:  PAUSE ;
 158:  JMP LBL[1] ;
 159:   ;
 160:  !--- GRIP VERIFY FAIL --- ;
 161:  LBL[90] ;
 162:  UALM[3] ;
 163:  PAUSE ;
 164:   ;
 165:  !--- OUT OF PARTS --- ;
 166:  LBL[99] ;
 167:  UALM[8] ;
 168:  PAUSE ;
/POS
P[1:"IN FRONT OF IF"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =     0.000  mm,	Z =  -312.592  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=  1548.896  mm
};
P[2:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =  -312.592  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  2600.652  mm
};
P[3:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   295.983  mm,	Y = -1001.060  mm,	Z =   641.268  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=   633.339  mm
};
P[4:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1823.555  mm,	Y =  1139.742  mm,	Z =  1107.202  mm,
	W =   180.000 deg,	P =   -40.393 deg,	R =    90.000 deg,
	E1=  2600.652  mm
};
P[5:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1211.540  mm,	Y =  1387.428  mm,	Z =  2078.739  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  2600.652  mm
};
P[6:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   405.131  mm,	Y =  1387.428  mm,	Z =  2078.739  mm,
	W =  -111.305 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1672.415  mm
};
P[7:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   405.131  mm,	Y =  -265.705  mm,	Z =  2078.738  mm,
	W =  -162.943 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1243.168  mm
};
P[8:"ABOVE ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   970.105  mm,	Y =  1320.827  mm,	Z =  1850.509  mm,
	W =  -179.999 deg,	P =      .001 deg,	R =     0.000 deg,
	E1=  2140.441  mm
};
P[9:"ON ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   769.156  mm,	Y =  1111.796  mm,	Z =    85.489  mm,
	W =  -179.997 deg,	P =      .005 deg,	R =     -.999 deg,
	E1=  2580.816  mm
};
P[10]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   635.159  mm,	Y =  1320.793  mm,	Z =   303.508  mm,
	W =  -179.998 deg,	P =      .003 deg,	R =     0.000 deg,
	E1=  2580.816  mm
};
P[11]{
   GP1:
	UF : 2, UT : 1,	
	J1=    18.263 deg,	J2=     6.836 deg,	J3=    -5.826 deg,
	J4=    40.003 deg,	J5=   -26.642 deg,	J6=   234.609 deg,
	E1=  2580.816  mm
};
P[12]{
   GP1:
	UF : 2, UT : 1,	
	J1=    15.187 deg,	J2=    25.137 deg,	J3=    -9.019 deg,
	J4=    39.754 deg,	J5=   -22.236 deg,	J6=   235.320 deg,
	E1=  2580.816  mm
};
P[13]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   702.535  mm,	Y =   920.780  mm,	Z =   812.300  mm,
	W =  -179.997 deg,	P =      .004 deg,	R =     0.000 deg,
	E1=  2580.816  mm
};
P[14]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   702.534  mm,	Y =   920.780  mm,	Z =  1327.631  mm,
	W =  -179.997 deg,	P =      .004 deg,	R =     0.000 deg,
	E1=  2221.229  mm
};
P[15]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   684.474  mm,	Y =   823.810  mm,	Z =  1816.677  mm,
	W =   151.491 deg,	P =      .004 deg,	R =     -.001 deg,
	E1=  2195.893  mm
};
P[16]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   225.090  mm,	Y =   296.601  mm,	Z =  2273.432  mm,
	W =   117.226 deg,	P =    -8.632 deg,	R =   -56.480 deg,
	E1=  1531.414  mm
};
P[17]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -544.627  mm,	Y =     -.012  mm,	Z =  1887.026  mm,
	W =   115.203 deg,	P =    -5.023 deg,	R =   -71.293 deg,
	E1=  1531.414  mm
};
P[18:"INSERT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.989  mm,	Y =  -429.838  mm,	Z =   281.553  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=  1531.414  mm
};
P[19:"STAGED FOR BEND"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -735.183  mm,	Y =  -630.306  mm,	Z =  2165.855  mm,
	W =   115.200 deg,	P =    -5.019 deg,	R =   -71.293 deg,
	E1=  1531.414  mm
};
P[20]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1115.243  mm,	Y =  1490.483  mm,	Z =  1081.681  mm,
	W =  -179.996 deg,	P =      .005 deg,	R =     0.000 deg,
	E1=  2580.816  mm
};
P[21:"ROTATE 1"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1489.475  mm,	Y =  1640.859  mm,	Z =  1690.573  mm,
	W =    62.575 deg,	P =    32.103 deg,	R =    96.480 deg,
	E1=  2580.816  mm
};
P[22:"ROTATE 2"]{
   GP1:
	UF : 2, UT : 1,	
	J1=    15.173 deg,	J2=      .968 deg,	J3=    30.164 deg,
	J4=     9.908 deg,	J5=   -57.573 deg,	J6=   321.680 deg,
	E1=  2580.816  mm
};
P[28]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.987  mm,	Y =  -429.847  mm,	Z =   336.553  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=  1531.414  mm
};
P[56]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2909.047  mm,	Y = -1041.823  mm,	Z =   935.614  mm,
	W =   166.201 deg,	P =   -50.073 deg,	R =   -13.412 deg,
	E1=    91.875  mm
};
P[57]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2832.047  mm,	Y =  -301.823  mm,	Z =   935.614  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =   -43.000 deg,
	E1=    91.875  mm
};
P[58]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2061.047  mm,	Y =   979.177  mm,	Z =   359.614  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =   -43.000 deg,
	E1=    91.875  mm
};
P[59]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1570.047  mm,	Y =   944.177  mm,	Z =     9.614  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =   -43.000 deg,
	E1=    91.875  mm
};
P[100:"RETR APPROACH"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.989  mm,	Y =  -429.838  mm,	Z =   500.000  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=  1531.414  mm
};
P[101:"RETR GRIP"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.989  mm,	Y =  -429.838  mm,	Z =   281.553  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=  1531.414  mm
};
P[102:"RETR EXTRACT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.987  mm,	Y =  -429.847  mm,	Z =   336.553  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=  1531.414  mm
};
/END
