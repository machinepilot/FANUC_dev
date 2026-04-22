/PROG  PNS0002_R01
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410817074";
PROG_SIZE	= 5557;
CREATE		= DATE 26-03-31  TIME 11:21:30;
MODIFIED	= DATE 26-04-20  TIME 12:00:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 208;
MEMORY_SIZE	= 5981;
PROTECT		= READ_WRITE;
STORAGE		= CMOS;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !6410817074 ;
   2:  !DI[30:PART DETECT] USED AS GRIP ;
   3:  !CONFIRM (NO VAC SWITCH) ;
   4:  !--- INITIALIZE --- ;
   5:  UFRAME_NUM=0 ;
   6:  UTOOL_NUM=1 ;
   7:  PAYLOAD[1] ;
   8:  R[10:PART INDEX]=0    ;
   6:   ;
   7:J PR[1:HOME] 100% CNT50    ;
   8:   ;
   9:  !--- CYCLE START --- ;
  10:  LBL[1] ;
  11:   ;
  12:  !--- PICK --- ;
  13:  UFRAME_NUM=1 ;
  14:  UTOOL_NUM=1 ;
  15:  TIMER[1]=RESET ;
  16:  TIMER[1]=START ;
  17:   ;
  18:J P[3:INTMPT] 100% CNT10    ;
  19:L P[1:IN FRONT OF IF] 2000mm/sec CNT10    ;
  20:L P[2:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  21:   ;
  22:  !--- FIRST PART SEARCH --- ;
  23:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  24:  CALL SEARCH_R01    ;
  25:  PR[51,3]=PR[10,3:infd search]    ;
  26:  JMP LBL[11] ;
  27:  LBL[10] ;
  28:  !--- DEPLETION CHECK --- ;
  29:  R[13:DEPLETED INFD]=PR[51,3]    ;
  30:  IF R[13:DEPLETED INFD]<R[11:THRESHOLD],JMP LBL[99] ;
  31:  LBL[11] ;
  32:   ;
  33:  !INSERT PART PR ;
  34:  PR[2,3:OFFSET]=400    ;
  35:   ;
  36:L PR[51:INFD2 Z TRACK] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  37:L PR[51:INFD2 Z TRACK] 700mm/sec FINE    ;
  38:   ;
  39:  CALL ALL_VAC_ON_R01    ;
  40:  WAIT R[19:VAC SETTLE] ;
  41:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  42:  PAYLOAD[2] ;
  43:   ;
  44:L PR[51:INFD2 Z TRACK] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  44:   ;
  45:J P[4:INTMPT] 100% CNT100    ;
  46:J P[5:INTMPT] 100% CNT100    ;
  47:J P[6:INTMPT] 100% CNT100    ;
  48:L P[7:INTMPT] 2000mm/sec CNT100    ;
  49:   ;
  50:  !--- ZERO TABLE --- ;
  51:  UFRAME_NUM=2 ;
  52:   ;
  53:L P[8:ABOVE ZERO] 1500mm/sec FINE    ;
  54:L P[9:ON ZERO] 1200mm/sec FINE    ;
  55:   ;
  56:  CALL ALL_VAC_OFF_R01    ;
  57:  PAYLOAD[1] ;
  58:   ;
  59:  !RE-PICK ;
  59:L P[10] 1500mm/sec FINE    ;
  60:L P[20] 1500mm/sec CNT100    ;
  61:J P[21:ROTATE 1] 75% CNT100    ;
  62:J P[22:ROTATE 2] 75% CNT100    ;
  63:J P[11] 75% CNT100    ;
  64:L P[12] 100mm/sec FINE    ;
  65:   ;
  66:  CALL ALL_VAC_ON_R01    ;
  67:  WAIT R[19:VAC SETTLE] ;
  68:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  69:  PAYLOAD[2] ;
  70:   ;
  71:L P[11] 155mm/sec FINE    ;
  71:   ;
  72:  !MOVE TO PRESS BREAK ;
  73:L P[13] 2000mm/sec CNT100    ;
  74:L P[14] 1500mm/sec CNT100    ;
  75:L P[15] 1500mm/sec CNT100    ;
  76:L P[16] 1500mm/sec CNT100    ;
  77:L P[17] 1500mm/sec CNT100    ;
  78:   ;
  79:L P[19:STAGED FOR BEND] 500mm/sec FINE    ;
  80:   ;
  81:  !--- BEND 1 --- ;
  82:  UFRAME_NUM=3 ;
  83:   ;
  84:L P[18:INSERT] 500mm/sec FINE    ;
  85:   ;
  86:  CALL PINCH_R01    ;
  87:   ;
  88:  WAIT R[22:BEND SETTLE] ;
  89:   ;
  90:  CALL ALL_VAC_OFF_R01    ;
  91:  PAYLOAD[1] ;
  92:   ;
  93:  WAIT R[22:BEND SETTLE] ;
  94:   ;
  95:  CALL BEND_R01    ;
  96:   ;
  97:  WAIT R[22:BEND SETTLE] ;
  98:   ;
  99:  CALL ALL_VAC_ON_R01    ;
 100:  WAIT R[19:VAC SETTLE] ;
 101:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 102:  PAYLOAD[2] ;
 103:   ;
 104:  !OUT OF PRESS BREAK ;
 103:L P[28] 700mm/sec FINE    ;
 104:L P[29] 1200mm/sec CNT100    ;
 105:   ;
 106:  !--- ZERO TABLE --- ;
 107:  UFRAME_NUM=2 ;
 108:   ;
 109:  !MOVE TO ZERO ;
 110:L P[31] 1500mm/sec CNT100    ;
 111:L P[32] 1500mm/sec CNT100    ;
 112:L P[30] 1500mm/sec CNT100    ;
 113:L P[33] 500mm/sec FINE    ;
 114:   ;
 115:  CALL ALL_VAC_OFF_R01    ;
 116:  PAYLOAD[1] ;
 117:   ;
 118:  !REPOS FOR BEND 2 ;
 118:J P[23] 100% CNT100    ;
 119:   ;
 120:J P[24:ZERO J6] 100% CNT100    ;
 121:   ;
 122:J P[26] 100% CNT100    ;
 123:L P[25] 500mm/sec FINE    ;
 124:   ;
 125:L P[27] 1500mm/sec FINE    ;
 126:   ;
 127:  CALL ALL_VAC_ON_R01    ;
 128:  WAIT R[19:VAC SETTLE] ;
 129:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 130:  PAYLOAD[2] ;
 131:   ;
 132:  !MOVE TO PRESS BREAK ;
 132:L P[41] 500mm/sec CNT100    ;
 133:L P[42] 1200mm/sec CNT100    ;
 134:L P[43] 1200mm/sec CNT100    ;
 135:L P[44] 1200mm/sec CNT100    ;
 136:L P[45] 1500mm/sec CNT100    ;
 137:   ;
 138:  !--- BEND 2 --- ;
 139:  UFRAME_NUM=3 ;
 140:   ;
 141:L P[48] 500mm/sec FINE    ;
 142:   ;
 143:  CALL PINCH_R01    ;
 144:   ;
 145:  WAIT R[22:BEND SETTLE] ;
 146:   ;
 147:  CALL ALL_VAC_OFF_R01    ;
 148:  PAYLOAD[1] ;
 149:   ;
 150:  WAIT R[22:BEND SETTLE] ;
 151:   ;
 152:  CALL BEND_R01    ;
 153:   ;
 154:  WAIT R[22:BEND SETTLE] ;
 155:   ;
 156:  CALL ALL_VAC_ON_R01    ;
 157:  WAIT R[19:VAC SETTLE] ;
 158:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 159:  PAYLOAD[2] ;
 160:   ;
 161:  !OUT OF INFEED ;
 160:L P[54] 500mm/sec CNT100    ;
 161:L P[55] 1200mm/sec CNT100    ;
 162:   ;
 163:  !--- OUTFEED --- ;
 164:  UFRAME_NUM=4 ;
 165:   ;
 166:L P[56] 1200mm/sec CNT100    ;
 167:L P[57] 1200mm/sec CNT100    ;
 168:L P[58] 1500mm/sec CNT100    ;
 169:L P[59] 1500mm/sec FINE Offset,PR[2:OFFSET]    ;
 170:L P[59] 500mm/sec FINE    ;
 171:   ;
 172:  CALL ALL_VAC_OFF_R01    ;
 173:  PAYLOAD[1] ;
 174:   ;
 175:L P[59] 1200mm/sec FINE Offset,PR[2:OFFSET]    ;
 175:   ;
 176:  !--- HOME --- ;
 177:J PR[1:HOME] 100% CNT100    ;
 178:   ;
 179:  TIMER[1]=STOP ;
 180:  R[20]=(TIMER[1]) ;
 181:   ;
 182:  !--- CYCLE HOUSEKEEPING --- ;
 183:  R[10:PART INDEX]=R[10:PART INDEX]+1    ;
 184:  PR[51,3]=PR[51,3]-R[12:THICKNESS]    ;
 185:  JMP LBL[1] ;
 186:   ;
 187:  !--- GRIP VERIFY FAIL --- ;
 188:  LBL[90] ;
 189:  UALM[3] ;
 190:  PAUSE ;
 191:   ;
 192:  !--- OUT OF PARTS --- ;
 193:  LBL[99] ;
 189:  UALM[8] ;
 190:  PAUSE ;
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
P[23]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   564.202  mm,	Y =   995.409  mm,	Z =   629.737  mm,
	W =   179.952 deg,	P =     1.208 deg,	R =    -2.213 deg,
	E1=  2610.155  mm
};
P[24:"ZERO J6"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   564.210  mm,	Y =   995.404  mm,	Z =   629.737  mm,
	W =   179.930 deg,	P =     1.207 deg,	R =    46.747 deg,
	E1=  2610.155  mm
};
P[25]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   535.405  mm,	Y =   508.764  mm,	Z =    59.990  mm,
	W =  -176.805 deg,	P =      .463 deg,	R =    46.253 deg,
	E1=  2610.155  mm
};
P[26]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   535.407  mm,	Y =   508.762  mm,	Z =   518.988  mm,
	W =  -176.805 deg,	P =      .463 deg,	R =    46.252 deg,
	E1=  2610.155  mm
};
P[27]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   694.414  mm,	Y =   508.757  mm,	Z =   650.986  mm,
	W =  -176.803 deg,	P =      .462 deg,	R =    46.252 deg,
	E1=  2610.155  mm
};
P[28]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.987  mm,	Y =  -429.847  mm,	Z =   336.553  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=  1531.414  mm
};
P[29]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   768.987  mm,	Y = -1689.847  mm,	Z =   336.553  mm,
	W =   179.997 deg,	P =      .001 deg,	R =    82.792 deg,
	E1=   885.138  mm
};
P[30]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   564.157  mm,	Y =  1630.434  mm,	Z =   719.716  mm,
	W =   179.951 deg,	P =     1.205 deg,	R =   -43.213 deg,
	E1=  2610.155  mm
};
P[31]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -756.542  mm,	Y =   661.571  mm,	Z =  2176.748  mm,
	W =   153.444 deg,	P =    26.651 deg,	R =   -28.332 deg,
	E1=   650.447  mm
};
P[32]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   615.016  mm,	Y =  1223.310  mm,	Z =  1677.627  mm,
	W =  -179.363 deg,	P =      .470 deg,	R =   -43.202 deg,
	E1=  1757.984  mm
};
P[33]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   564.153  mm,	Y =  1630.436  mm,	Z =    43.712  mm,
	W =   179.952 deg,	P =     1.204 deg,	R =   -43.213 deg,
	E1=  2610.155  mm
};
P[41]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   694.433  mm,	Y =   508.743  mm,	Z =  1655.979  mm,
	W =  -176.803 deg,	P =      .462 deg,	R =    46.253 deg,
	E1=  2049.709  mm
};
P[42]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   694.503  mm,	Y =   508.695  mm,	Z =  2068.966  mm,
	W =   159.538 deg,	P =    37.933 deg,	R =     -.769 deg,
	E1=  2049.709  mm
};
P[43]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    56.692  mm,	Y =  -481.063  mm,	Z =  2229.808  mm,
	W =   124.382 deg,	P =    41.784 deg,	R =   -28.741 deg,
	E1=  1111.976  mm
};
P[44]{
   GP1:
	UF : 2, UT : 1,	
	J1=   -22.722 deg,	J2=   -12.962 deg,	J3=    -6.975 deg,
	J4=     0.000 deg,	J5=   -83.025 deg,	J6=   -62.136 deg,
	E1=   801.510  mm
};
P[45]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -816.862  mm,	Y =  -951.537  mm,	Z =  2634.093  mm,
	W =   115.571 deg,	P =    10.679 deg,	R =   -63.868 deg,
	E1=   801.510  mm
};
P[48]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1293.952  mm,	Y =  -448.177  mm,	Z =   306.614  mm,
	W =   179.998 deg,	P =      .002 deg,	R =   100.145 deg,
	E1=   801.510  mm
};
P[54]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1293.952  mm,	Y =  -448.177  mm,	Z =   354.614  mm,
	W =   179.998 deg,	P =      .002 deg,	R =   100.145 deg,
	E1=   795.174  mm
};
P[55]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1293.952  mm,	Y = -2351.177  mm,	Z =   354.614  mm,
	W =   179.998 deg,	P =      .002 deg,	R =   100.145 deg,
	E1=    91.875  mm
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
/END
