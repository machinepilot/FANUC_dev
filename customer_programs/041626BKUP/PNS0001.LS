/PROG  PNS0001
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410808783";
PROG_SIZE	= 6096;
CREATE		= DATE 08-10-08  TIME 00:39:52;
MODIFIED	= DATE 08-10-21  TIME 03:30:04;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 190;
MEMORY_SIZE	= 6380;
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
   1:  !6410808783 ;
   2:  !--- INITIALIZE --- ;
   3:  UFRAME_NUM=0 ;
   4:  UTOOL_NUM=1 ;
   5:   ;
   6:J PR[1:HOME] 100% CNT50    ;
   7:   ;
   8:   ;
   9:   ;
  10:  !--- PICK --- ;
  11:  UFRAME_NUM=1 ;
  12:  UTOOL_NUM=1 ;
  13:  TIMER[1]=RESET ;
  14:  TIMER[1]=START ;
  15:   ;
  16:L P[3:INTMPT] 2000mm/sec CNT10    ;
  17:L P[1:IN FRONT OF IF] 2000mm/sec CNT100    ;
  18:L P[2:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  19:   ;
  20:  !INSERT PART PR ;
  21:  PR[2,3:OFFSET]=400    ;
  22:   ;
  23:L PR[50] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  24:L PR[50] 200mm/sec FINE    ;
  25:   ;
  26:  CALL ALL_VAC_ON    ;
  27:   ;
  28:  WAIT   2.00(sec) ;
  29:   ;
  30:L PR[50] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  31:   ;
  32:J P[4:INTMPT] 100% CNT100    ;
  33:J P[5:INTMPT] 100% CNT100    ;
  34:J P[6:INTMPT] 100% CNT100    ;
  35:L P[7:INTMPT] 2000mm/sec CNT100    ;
  36:   ;
  37:  !--- ZERO TABLE --- ;
  38:  UFRAME_NUM=2 ;
  39:   ;
  40:L P[8:ABOVE ZERO] 1500mm/sec FINE    ;
  41:L P[9:ON ZERO] 1200mm/sec FINE    ;
  42:   ;
  43:  CALL ALL_VAC_OFF    ;
  44:   ;
  45:  !RE-PICK ;
  46:L P[10] 700mm/sec FINE    ;
  47:L P[20] 1500mm/sec CNT100    ;
  48:J P[21:ROTATE 1] 75% CNT100    ;
  49:J P[22:ROTATE 2] 75% CNT100    ;
  50:J P[11] 75% CNT100    ;
  51:L P[12] 100mm/sec FINE    ;
  52:   ;
  53:  CALL ALL_VAC_ON    ;
  54:   ;
  55:  WAIT   1.00(sec) ;
  56:   ;
  57:L P[11] 155mm/sec FINE    ;
  58:L P[60] 1200mm/sec FINE    ;
  59:   ;
  60:   ;
  61:   ;
  62:  !MOVE TO PRESS BREAK ;
  63:L P[13] 2000mm/sec CNT100    ;
  64:L P[14] 1500mm/sec CNT100    ;
  65:L P[15] 1500mm/sec CNT100    ;
  66:L P[16] 1500mm/sec CNT100    ;
  67:L P[17] 1500mm/sec CNT100    ;
  68:   ;
  69:L P[19:STAGED FOR BEND] 1220mm/sec FINE    ;
  70:   ;
  71:  !--- BEND 1 --- ;
  72:  UFRAME_NUM=3 ;
  73:   ;
  74:L P[18:INSERT] 500mm/sec FINE    ;
  75:   ;
  76:  CALL PINCH    ;
  77:   ;
  78:  WAIT    .75(sec) ;
  79:   ;
  80:  CALL ALL_VAC_OFF    ;
  81:   ;
  82:L P[23] 500mm/sec CNT100    ;
  83:L P[24] 1500mm/sec CNT100    ;
  84:   ;
  85:  CALL BEND    ;
  86:   ;
  87:  WAIT    .75(sec) ;
  88:   ;
  89:  !FOLLOW BEND ;
  90:L P[25] 1500mm/sec CNT100    ;
  91:L P[26] 1200mm/sec CNT100    ;
  92:L P[27] 2.0sec FINE    ;
  93:   ;
  94:  CALL ALL_VAC_ON    ;
  95:   ;
  96:  WAIT   1.00(sec) ;
  97:   ;
  98:  !OUT OF PRESS BREAK ;
  99:L P[28] 700mm/sec FINE    ;
 100:L P[29] 1200mm/sec CNT100    ;
 101:   ;
 102:  !--- ZERO TABLE --- ;
 103:  UFRAME_NUM=2 ;
 104:   ;
 105:  !MOVE TO ZERO ;
 106:L P[31] 1500mm/sec CNT100    ;
 107:L P[32] 1500mm/sec CNT100    ;
 108:L P[30] 1500mm/sec CNT100    ;
 109:L P[33] 500mm/sec FINE    ;
 110:   ;
 111:  CALL ALL_VAC_OFF    ;
 112:   ;
 113:  !REPOS FOR BEND 2 ;
 114:L P[34] 1500msec CNT100    ;
 115:L P[35] 1500mm/sec CNT100    ;
 116:L P[36] 1500mm/sec CNT100    ;
 117:L P[37] 1500mm/sec CNT100    ;
 118:   ;
 119:J P[38:ZERO J6] 100% CNT100    ;
 120:   ;
 121:L P[39] 1500mm/sec CNT100    ;
 122:L P[40] 100mm/sec FINE    ;
 123:   ;
 124:  CALL ALL_VAC_ON    ;
 125:   ;
 126:  WAIT   1.00(sec) ;
 127:   ;
 128:  !MOVE TO PRESS BREAK ;
 129:L P[41] 500mm/sec CNT100    ;
 130:L P[42] 1200mm/sec CNT100    ;
 131:L P[43] 1200mm/sec CNT100    ;
 132:J P[44] 100% CNT100    ;
 133:L P[45] 1500mm/sec CNT100    ;
 134:L P[46] 1500mm/sec CNT100    ;
 135:L P[47] 1500mm/sec CNT100    ;
 136:   ;
 137:  !--- BEND 2 --- ;
 138:  UFRAME_NUM=3 ;
 139:   ;
 140:L P[48] 500mm/sec FINE    ;
 141:   ;
 142:  CALL PINCH    ;
 143:   ;
 144:  WAIT    .75(sec) ;
 145:   ;
 146:  CALL ALL_VAC_OFF    ;
 147:   ;
 148:L P[52] 500mm/sec FINE    ;
 149:L P[53] 1500mm/sec FINE    ;
 150:   ;
 151:  CALL BEND    ;
 152:   ;
 153:  WAIT    .75(sec) ;
 154:   ;
 155:  !FOLLOW BEND ;
 156:L P[49] 1500mm/sec CNT100    ;
 157:L P[50] 1200mm/sec CNT100    ;
 158:L P[51] 2.0sec FINE    ;
 159:   ;
 160:  CALL ALL_VAC_ON    ;
 161:   ;
 162:  WAIT   1.00(sec) ;
 163:   ;
 164:L P[54] 500mm/sec CNT100    ;
 165:L P[55] 1200mm/sec CNT100    ;
 166:   ;
 167:  !--- OUTFEED --- ;
 168:  UFRAME_NUM=4 ;
 169:   ;
 170:L P[56] 1200mm/sec CNT100    ;
 171:J P[57] 100% CNT100    ;
 172:L P[58] 1500mm/sec CNT100    ;
 173:L P[59] 500mm/sec FINE Offset,PR[2:OFFSET]    ;
 174:L P[59] 500mm/sec FINE    ;
 175:   ;
 176:  CALL ALL_VAC_OFF    ;
 177:   ;
 178:L P[59] 1200mm/sec FINE Offset,PR[2:OFFSET]    ;
 179:   ;
 180:J PR[1:HOME] 100% CNT100    ;
 181:   ;
 182:  TIMER[1]=STOP ;
 183:  TIMER[1]=(R[20]) ;
 184:  !MOVE TO ZERO TABLE ;
 185:  !RE-PICK ;
 186:  !MOVE TO BREAK ;
 187:  !BREAK 1 ;
 188:  !BREAK 2 ;
 189:  !OUTFEED DROP ;
 190:  !HOME ;
/POS
P[1:"IN FRONT OF IF"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   855.422  mm,	Y = -1001.060  mm,	Z =   700.000  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
	E1=  1192.777  mm
};
P[2:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =     0.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =    90.000 deg,
	E1=  2600.652  mm
};
P[3:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   295.983  mm,	Y = -1001.060  mm,	Z =   700.000  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
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
P[10:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   342.816  mm,	Y =  1980.635  mm,	Z =   338.516  mm,
	W =  -178.111 deg,	P =     -.220 deg,	R =     7.886 deg,
	E1=  2559.422  mm
};
P[11:""]{
   GP1:
	UF : 2, UT : 1,	
	J1=    24.666 deg,	J2=    26.401 deg,	J3=    -6.820 deg,
	J4=    47.340 deg,	J5=   -29.886 deg,	J6=   292.891 deg,
	E1=  2580.889  mm
};
P[12:""]{
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
	W =  -179.997 deg,	P =      .004 deg,	R =      .000 deg,
	E1=  2580.816  mm
};
P[14]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   702.534  mm,	Y =   920.780  mm,	Z =  1327.631  mm,
	W =  -179.997 deg,	P =      .004 deg,	R =      .000 deg,
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
P[20:""]{
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
	W =  -180.000 deg,	P =     -.000 deg,	R =    90.000 deg,
	E1=  1531.414  mm
};
P[24]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1016.088  mm,	Y = -1237.622  mm,	Z =   921.262  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1531.414  mm
};
P[25]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1016.088  mm,	Y = -1237.621  mm,	Z =  -162.738  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1531.414  mm
};
P[26]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1016.088  mm,	Y =  -884.621  mm,	Z =  -162.738  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1531.414  mm
};
P[27]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1002.088  mm,	Y =  -432.622  mm,	Z =   694.262  mm,
	W =      .000 deg,	P =   -46.000 deg,	R =   -90.000 deg,
	E1=  1531.414  mm
};
P[28:""]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   986.174  mm,	Y =  -428.925  mm,	Z =   721.260  mm,
	W =     6.609 deg,	P =   -46.415 deg,	R =   -96.229 deg,
	E1=  1531.414  mm
};
P[29:""]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   986.175  mm,	Y =  -849.387  mm,	Z =   721.260  mm,
	W =      .000 deg,	P =   -45.000 deg,	R =   -90.000 deg,
	E1=  1531.414  mm
};
P[30]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   121.490  mm,	Y =  1076.439  mm,	Z =   755.874  mm,
	W =  -164.622 deg,	P =   -85.055 deg,	R =   -17.467 deg,
	E1=  2310.106  mm
};
P[31]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -100.842  mm,	Y =  -398.357  mm,	Z =  2617.840  mm,
	W =    98.826 deg,	P =   -56.213 deg,	R =    61.287 deg,
	E1=   631.069  mm
};
P[32]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   472.419  mm,	Y =   543.482  mm,	Z =  2617.856  mm,
	W =  -138.470 deg,	P =   -83.498 deg,	R =   -43.495 deg,
	E1=   631.069  mm
};
P[33:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    52.562  mm,	Y =  1076.403  mm,	Z =   755.920  mm,
	W =  -153.428 deg,	P =   -86.900 deg,	R =   -27.636 deg,
	E1=  2310.106  mm
};
P[34]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   -52.315  mm,	Y =  1076.399  mm,	Z =   755.920  mm,
	W =  -153.433 deg,	P =   -86.898 deg,	R =   -27.631 deg,
	E1=  1924.896  mm
};
P[35]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -167.288  mm,	Y =  1076.386  mm,	Z =   755.940  mm,
	W =  -177.429 deg,	P =   -68.205 deg,	R =    -3.878 deg,
	E1=  1924.896  mm
};
P[36]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -314.238  mm,	Y =  1076.364  mm,	Z =   962.982  mm,
	W =  -175.488 deg,	P =   -31.035 deg,	R =    -4.099 deg,
	E1=  1924.896  mm
};
P[37]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.009  mm,
	W =  -178.279 deg,	P =    10.882 deg,	R =    -3.577 deg,
	E1=  1924.896  mm
};
P[38:"ZERO J6"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.008  mm,
	W =  -178.805 deg,	P =    10.951 deg,	R =    -6.350 deg,
	E1=  1924.896  mm
};
P[39]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   223.123  mm,	Y =  1096.129  mm,	Z =   628.221  mm,
	W =   -20.614 deg,	P =    89.014 deg,	R =   155.693 deg,
	E1=  2257.529  mm
};
P[40]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    58.594  mm,	Y =  1107.510  mm,	Z =   631.736  mm,
	W =    -6.114 deg,	P =    87.070 deg,	R =   172.199 deg,
	E1=  2257.529  mm
};
P[41]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   165.441  mm,	Y =  1107.510  mm,	Z =   728.506  mm,
	W =    -6.113 deg,	P =    87.070 deg,	R =   172.200 deg,
	E1=  2257.529  mm
};
P[42]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   454.485  mm,	Y =  1107.485  mm,	Z =  1246.519  mm,
	W =  -177.832 deg,	P =    50.903 deg,	R =      .632 deg,
	E1=  2257.529  mm
};
P[43]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.559  mm,	Y =  1107.439  mm,	Z =  1784.526  mm,
	W =  -178.428 deg,	P =   -15.092 deg,	R =      .412 deg,
	E1=  2257.529  mm
};
P[44]{
   GP1:
	UF : 2, UT : 1,	
	J1=     9.531 deg,	J2=   -29.286 deg,	J3=    30.088 deg,
	J4=    22.003 deg,	J5=   -42.977 deg,	J6=   142.000 deg,
	E1=  2257.529  mm
};
P[45]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.620  mm,	Y =   759.398  mm,	Z =  2179.522  mm,
	W =  -143.559 deg,	P =    11.456 deg,	R =  -170.047 deg,
	E1=  1860.572  mm
};
P[46]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.197  mm,	Y =   104.097  mm,	Z =  2621.562  mm,
	W =   -99.784 deg,	P =    23.209 deg,	R =  -177.716 deg,
	E1=  1592.257  mm
};
P[47]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -726.082  mm,	Y = -1276.504  mm,	Z =  2636.429  mm,
	W =  -115.109 deg,	P =    -1.506 deg,	R =   111.772 deg,
	E1=  1592.257  mm
};
P[48]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.421  mm,	Y =  -447.896  mm,	Z =   278.535  mm,
	W =  -180.000 deg,	P =     -.000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[49]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=    43.382 deg,	J3=  -105.743 deg,
	J4=   153.244 deg,	J5=  -104.129 deg,	J6=    -7.000 deg,
	E1=  1531.414  mm
};
P[50]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -71.215 deg,	J2=    43.939 deg,	J3=   -91.614 deg,
	J4=   161.208 deg,	J5=   -91.528 deg,	J6=     0.000 deg,
	E1=  1531.414  mm
};
P[51]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -76.683 deg,	J2=    30.289 deg,	J3=   -53.025 deg,
	J4=   170.375 deg,	J5=   -97.697 deg,	J6=     8.000 deg,
	E1=  1531.414  mm
};
P[52]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.420  mm,	Y =  -447.896  mm,	Z =   443.656  mm,
	W =   180.000 deg,	P =      .000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[53]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=   -38.061 deg,	J3=   -22.147 deg,
	J4=   127.843 deg,	J5=   -33.562 deg,	J6=    47.000 deg,
	E1=  1531.414  mm
};
P[54]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y =  -436.130  mm,	Z =   761.051  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
P[55]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y = -1068.573  mm,	Z =   761.050  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
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
	W =   180.000 deg,	P =      .000 deg,	R =   -90.000 deg,
	E1=   575.729  mm
};
P[59]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1096.634  mm,	Y =   530.468  mm,	Z =    37.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =   -90.000 deg,
	E1=   575.729  mm
};
P[60]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   405.160  mm,	Y =  1814.991  mm,	Z =  1450.185  mm,
	W =  -178.188 deg,	P =     1.306 deg,	R =     9.284 deg,
	E1=  2206.491  mm
};
/END
