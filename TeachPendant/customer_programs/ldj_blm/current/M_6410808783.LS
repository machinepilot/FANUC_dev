/PROG  M_6410808783
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410808783 MANUAL T2";
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
   2:  !6410808783 MANUAL T2 ;
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
  24:L P[3:INTMPT] 2000mm/sec CNT10    ;
  25:L P[1:IN FRONT OF IF] 2000mm/sec CNT100    ;
  26:L P[2:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  27:   ;
  28:  !--- FIRST PART SEARCH --- ;
  29:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  30:  CALL SEARCH_R01    ;
  31:  PR[50,3]=PR[10,3:infd search]    ;
  32:  JMP LBL[11] ;
  33:  LBL[10] ;
  34:  !--- DEPLETION CHECK --- ;
  35:  R[13:DEPLETED INFD]=PR[50,3]    ;
  36:  IF R[13:DEPLETED INFD]<R[11:THRESHOLD],JMP LBL[99] ;
  37:  LBL[11] ;
  38:   ;
  39:  !INSERT PART PR ;
  40:  PR[2,3:OFFSET]=400    ;
  41:   ;
  42:L PR[50:INFD1 Z TRACK] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  43:L PR[50:INFD1 Z TRACK] 200mm/sec FINE    ;
  44:   ;
  45:  CALL ALL_VAC_ON_R01    ;
  46:  WAIT R[19:VAC SETTLE] ;
  47:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  48:  PAYLOAD[2] ;
  49:   ;
  50:L PR[50:INFD1 Z TRACK] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
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
  67:L P[10] 700mm/sec FINE    ;
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
  80:L P[60] 1200mm/sec FINE    ;
  81:   ;
  82:  !--- APPROACH PRESS --- ;
  83:L P[13] 2000mm/sec CNT100    ;
  84:L P[14] 1500mm/sec CNT100    ;
  85:L P[15] 1500mm/sec CNT100    ;
  86:L P[16] 1500mm/sec CNT100    ;
  87:L P[17] 1500mm/sec CNT100    ;
  88:   ;
  89:L P[19:STAGED FOR BEND] 1220mm/sec FINE    ;
  90:   ;
  91:  !--- INSERT --- ;
  92:  UFRAME_NUM=3 ;
  93:   ;
  94:L P[18:INSERT] 500mm/sec FINE    ;
  95:   ;
  96:  !-- HOLD POSITION. OPERATOR: ;
  97:  !-- PINCH PART IN PRESS. ;
  98:  !-- RESUME TO RELEASE. -- ;
  99:  PAUSE ;
 100:   ;
 101:  !--- RELEASE & RETREAT --- ;
 102:  CALL ALL_VAC_OFF_R01    ;
 103:  PAYLOAD[1] ;
 104:   ;
 105:L P[23] 500mm/sec CNT100    ;
 106:   ;
 107:  UFRAME_NUM=0 ;
 108:  CALL GO_HOME_R01    ;
 109:   ;
 110:  !-- ROBOT CLEAR. OPERATOR: ;
 111:  !-- BEND PART MANUALLY. ;
 112:  !-- RESUME TO RETRIEVE. -- ;
 113:  PAUSE ;
 114:   ;
 115:  !--- RETRIEVE FINISHED --- ;
 116:  UFRAME_NUM=3 ;
 117:   ;
 118:  !TEACH: P[100] APPROACH ;
 119:L P[100:RETR APPROACH] 500mm/sec CNT100    ;
 120:  !TEACH: P[101] GRIP ;
 121:L P[101:RETR GRIP] 200mm/sec FINE    ;
 122:   ;
 123:  CALL ALL_VAC_ON_R01    ;
 124:  WAIT R[19:VAC SETTLE] ;
 125:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 126:  PAYLOAD[2] ;
 127:   ;
 128:  !TEACH: P[102] EXTRACT ;
 129:L P[102:RETR EXTRACT] 500mm/sec CNT100    ;
 130:   ;
 131:  !--- OUTFEED --- ;
 132:  UFRAME_NUM=4 ;
 133:   ;
 134:L P[56] 1200mm/sec CNT100    ;
 135:J P[57] 100% CNT100    ;
 136:L P[58] 1500mm/sec CNT100    ;
 137:L P[59] 500mm/sec FINE Offset,PR[2:OFFSET]    ;
 138:L P[59] 500mm/sec FINE    ;
 139:   ;
 140:  CALL ALL_VAC_OFF_R01    ;
 141:  PAYLOAD[1] ;
 142:   ;
 143:L P[59] 1200mm/sec FINE Offset,PR[2:OFFSET]    ;
 144:   ;
 145:  !--- HOME --- ;
 146:  UFRAME_NUM=0 ;
 147:  CALL GO_HOME_R01    ;
 148:   ;
 149:  TIMER[1]=STOP ;
 150:  R[20]=(TIMER[1]) ;
 151:   ;
 152:  !--- HOUSEKEEPING --- ;
 153:  R[10:PART INDEX]=R[10:PART INDEX]+1    ;
 154:  PR[50,3]=PR[50,3]-R[12:THICKNESS]    ;
 155:   ;
 156:  !-- PART DONE. RESUME FOR ;
 157:  !-- NEXT PART OR ABORT. -- ;
 158:  PAUSE ;
 159:  JMP LBL[1] ;
 160:   ;
 161:  !--- GRIP VERIFY FAIL --- ;
 162:  LBL[90] ;
 163:  UALM[3] ;
 164:  PAUSE ;
 165:   ;
 166:  !--- OUT OF PARTS --- ;
 167:  LBL[99] ;
 168:  UALM[8] ;
 169:  PAUSE ;
/POS
P[1:"IN FRONT OF IF"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   855.422  mm,	Y = -1001.060  mm,	Z =   700.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=  1192.777  mm
};
P[2:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =     0.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  2600.652  mm
};
P[3:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   295.983  mm,	Y = -1001.060  mm,	Z =   700.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=   633.339  mm
};
P[4:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1211.540  mm,	Y =  1139.745  mm,	Z =  1107.219  mm,
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
	X =   405.131  mm,	Y =  1387.428  mm,	Z =  2300.000  mm,
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
	X =   534.826  mm,	Y =  1992.644  mm,	Z =  1410.609  mm,
	W =  -179.999 deg,	P =      .002 deg,	R =     6.701 deg,
	E1=  2341.256  mm
};
P[9:"ON ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   360.000  mm,	Y =  1980.633  mm,	Z =   180.121  mm,
	W =  -178.111 deg,	P =     -.220 deg,	R =     7.886 deg,
	E1=  2559.422  mm
};
P[10]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   342.816  mm,	Y =  1980.635  mm,	Z =   338.516  mm,
	W =  -178.111 deg,	P =     -.220 deg,	R =     7.886 deg,
	E1=  2559.422  mm
};
P[11]{
   GP1:
	UF : 2, UT : 1,	
	J1=    24.666 deg,	J2=    26.401 deg,	J3=    -6.820 deg,
	J4=    47.340 deg,	J5=   -29.886 deg,	J6=   292.891 deg,
	E1=  2580.889  mm
};
P[12]{
   GP1:
	UF : 2, UT : 1,	
	J1=    23.467 deg,	J2=    26.815 deg,	J3=    -9.744 deg,
	J4=    49.760 deg,	J5=   -27.043 deg,	J6=   290.656 deg,
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
	X =   779.817  mm,	Y =   149.824  mm,	Z =  1809.920  mm,
	W =   115.570 deg,	P =   -18.400 deg,	R =   -16.280 deg,
	E1=  2189.413  mm
};
P[17]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   225.071  mm,	Y =  -443.385  mm,	Z =  2273.437  mm,
	W =   117.226 deg,	P =    -8.633 deg,	R =   -56.480 deg,
	E1=  1531.414  mm
};
P[18:"INSERT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1195.119  mm,	Y =  -441.824  mm,	Z =   224.145  mm,
	W =  -179.953 deg,	P =     -.062 deg,	R =    89.584 deg,
	E1=  1531.419  mm
};
P[19:"STAGED FOR BEND"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -626.787  mm,	Y = -1529.412  mm,	Z =  2504.478  mm,
	W =   115.153 deg,	P =     1.101 deg,	R =   -68.348 deg,
	E1=  1531.419  mm
};
P[20]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   342.799  mm,	Y =  1510.231  mm,	Z =  1204.853  mm,
	W =  -177.721 deg,	P =     -.273 deg,	R =     7.885 deg,
	E1=  2559.430  mm
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
	J1=    12.745 deg,	J2=    -3.204 deg,	J3=    23.240 deg,
	J4=    10.117 deg,	J5=   -44.041 deg,	J6=   328.561 deg,
	E1=  2580.816  mm
};
P[23]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1016.087  mm,	Y =  -434.622  mm,	Z =   328.284  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  1531.414  mm
};
P[56]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3200.948  mm,	Y = -2465.070  mm,	Z =  1906.603  mm,
	W =      .002 deg,	P =     6.001 deg,	R =   -89.963 deg,
	E1=  1531.414  mm
};
P[57]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2071.785  mm,	Y =   720.877  mm,	Z =  1906.603  mm,
	W =      .002 deg,	P =     6.001 deg,	R =    66.713 deg,
	E1=   575.729  mm
};
P[58]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1232.635  mm,	Y =   742.468  mm,	Z =   499.845  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =   -90.000 deg,
	E1=   575.729  mm
};
P[59]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1096.634  mm,	Y =   530.468  mm,	Z =    37.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =   -90.000 deg,
	E1=   575.729  mm
};
P[60]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   405.160  mm,	Y =  1814.991  mm,	Z =  1450.185  mm,
	W =  -178.188 deg,	P =     1.306 deg,	R =     9.284 deg,
	E1=  2206.491  mm
};
P[100:"RETR APPROACH"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1195.119  mm,	Y =  -441.824  mm,	Z =   500.000  mm,
	W =  -179.953 deg,	P =     -.062 deg,	R =    89.584 deg,
	E1=  1531.419  mm
};
P[101:"RETR GRIP"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1195.119  mm,	Y =  -441.824  mm,	Z =   224.145  mm,
	W =  -179.953 deg,	P =     -.062 deg,	R =    89.584 deg,
	E1=  1531.419  mm
};
P[102:"RETR EXTRACT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1016.087  mm,	Y =  -434.622  mm,	Z =   328.284  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  1531.414  mm
};
/END
