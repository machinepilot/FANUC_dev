/PROG  PNS0004
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 9470;
CREATE		= DATE 26-04-06  TIME 18:45:46;
MODIFIED	= DATE 26-04-09  TIME 10:18:38;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 248;
MEMORY_SIZE	= 9778;
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
   1:  !--- INITIALIZE --- ;
   2:  UFRAME_NUM=0 ;
   3:  UTOOL_NUM=1 ;
   4:   ;
   5:J PR[1:HOME] 100% CNT50    ;
   6:   ;
   7:   ;
   8:  !--- PICK --- ;
   9:  UFRAME_NUM=1 ;
  10:  UTOOL_NUM=1 ;
  11:  TIMER[1]=RESET ;
  12:  TIMER[1]=START ;
  13:   ;
  14:L P[1:INTMPT] 2000mm/sec CNT10    ;
  15:L P[2:IN FRONT OF IF] 2000mm/sec CNT10    ;
  16:L P[3:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  17:   ;
  18:  !INSERT PART PR ;
  19:  PR[2,3:OFFSET]=400    ;
  20:   ;
  21:L PR[50] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  22:L PR[50] 700mm/sec FINE    ;
  23:  !GRIPPER ON ;
  24:   ;
  25:L PR[50] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  26:   ;
  27:J P[4:INTMPT] 100% CNT100    ;
  28:J P[5:INTMPT] 100% CNT100    ;
  29:J P[6:INTMPT] 100% CNT100    ;
  30:L P[7:INTMPT] 2000mm/sec CNT100    ;
  31:   ;
  32:  !--- ZERO TABLE --- ;
  33:  UFRAME_NUM=2 ;
  34:   ;
  35:L P[8:ABOVE ZERO] 1500mm/sec FINE    ;
  36:L P[9:ON ZERO] 1200mm/sec FINE    ;
  37:   ;
  38:  !GRIP OFF ;
  39:   ;
  40:  !RE-PICK ;
  41:L P[10] 1500mm/sec FINE    ;
  42:L P[11] 1500mm/sec CNT100    ;
  43:J P[12:ROTATE 1] 75% CNT100    ;
  44:J P[13:ROTATE 2] 75% CNT100    ;
  45:J P[14] 75% CNT100    ;
  46:L P[15] 100mm/sec FINE    ;
  47:   ;
  48:  !GRIP ON ;
  49:   ;
  50:L P[16] 155mm/sec FINE    ;
  51:   ;
  52:  !MOVE TO PRESS BREAK ;
  53:L P[17] 2000mm/sec CNT100    ;
  54:L P[18] 1500mm/sec CNT100    ;
  55:L P[19] 1500mm/sec CNT100    ;
  56:L P[20] 1500mm/sec CNT100    ;
  57:L P[21] 1500mm/sec CNT100    ;
  58:   ;
  59:L P[22:STAGED FOR BEND] 500mm/sec FINE    ;
  60:   ;
  61:  !--- BEND 1 --- ;
  62:  UFRAME_NUM=3 ;
  63:   ;
  64:L P[23:INSERT] 500mm/sec FINE    ;
  65:   ;
  66:  !CALL PINCH ;
  67:   ;
  68:L P[24] 500mm/sec CNT100    ;
  69:L P[25] 1500mm/sec CNT100    ;
  70:   ;
  71:  !CALL BEND ;
  72:   ;
  73:  !FOLLOW BEND ;
  74:L P[26] 1500mm/sec CNT100    ;
  75:L P[27] 1200mm/sec CNT100    ;
  76:L P[28] 2.0sec FINE    ;
  77:   ;
  78:  !GRIP ON ;
  79:   ;
  80:  !OUT OF PRESS BREAK ;
  81:L P[29] 700mm/sec FINE    ;
  82:L P[30] 1200mm/sec CNT100    ;
  83:   ;
  84:  !--- ZERO TABLE --- ;
  85:  UFRAME_NUM=2 ;
  86:   ;
  87:  !MOVE TO ZERO ;
  88:L P[31] 1500mm/sec CNT100    ;
  89:L P[32] 1500mm/sec CNT100    ;
  90:L P[33] 1500mm/sec CNT100    ;
  91:L P[34] 500mm/sec FINE    ;
  92:   ;
  93:  !GRIP OFF ;
  94:   ;
  95:  !REPOS FOR BEND 2 ;
  96:L P[35] 1500msec CNT100    ;
  97:L P[36] 1500mm/sec CNT100    ;
  98:L P[37] 1500mm/sec CNT100    ;
  99:L P[38] 1500mm/sec CNT100    ;
 100:   ;
 101:J P[39:ZERO J6] 100% CNT100    ;
 102:   ;
 103:L P[40] 1500mm/sec CNT100    ;
 104:L P[41] 100mm/sec FINE    ;
 105:   ;
 106:  CALL SIM_PZ_2_0001    ;
 107:   ;
 108:  !MOVE TO PRESS BREAK ;
 109:L P[42] 500mm/sec CNT100    ;
 110:L P[43] 1200mm/sec CNT100    ;
 111:L P[44] 1200mm/sec CNT100    ;
 112:J P[45] 100% CNT100    ;
 113:L P[46] 1500mm/sec CNT100    ;
 114:L P[47] 1500mm/sec CNT100    ;
 115:L P[48] 1500mm/sec CNT100    ;
 116:   ;
 117:  !--- BEND 2 --- ;
 118:  UFRAME_NUM=3 ;
 119:   ;
 120:L P[49] 500mm/sec FINE    ;
 121:   ;
 122:  CALL SIM_DPB_2_0001    ;
 123:   ;
 124:L P[50] 500mm/sec FINE    ;
 125:L P[51] 1500mm/sec FINE    ;
 126:   ;
 127:  CALL SIM_BEND_2_0001    ;
 128:   ;
 129:  !FOLLOW BEND ;
 130:L P[52] 1500mm/sec CNT100    ;
 131:L P[53] 1200mm/sec CNT100    ;
 132:L P[54] 2.0sec FINE    ;
 133:   ;
 134:  CALL SIM_PPB_2_0001    ;
 135:   ;
 136:L P[55] 500mm/sec CNT100    ;
 137:L P[56] 1200mm/sec CNT100    ;
 138:   ;
 139:   ;
 140:   ;
 141:  !--- ZERO TABLE --- ;
 142:  UFRAME_NUM=2 ;
 143:   ;
 144:  !MOVE TO ZERO ;
 145:L P[57] 1500mm/sec CNT100    ;
 146:L P[58] 1500mm/sec CNT100    ;
 147:L P[59] 1500mm/sec CNT100    ;
 148:L P[60] 500mm/sec FINE    ;
 149:   ;
 150:  !GRIP OFF ;
 151:   ;
 152:  !REPOS FOR BEND 3 ;
 153:L P[61] 1500msec CNT100    ;
 154:L P[62] 1500mm/sec CNT100    ;
 155:L P[63] 1500mm/sec CNT100    ;
 156:L P[64] 1500mm/sec CNT100    ;
 157:   ;
 158:J P[65:ZERO J6] 100% CNT100    ;
 159:   ;
 160:L P[66] 1500mm/sec CNT100    ;
 161:L P[67] 100mm/sec FINE    ;
 162:   ;
 163:  CALL SIM_PZ_2_0001    ;
 164:   ;
 165:  !MOVE TO PRESS BREAK ;
 166:L P[68] 500mm/sec CNT100    ;
 167:L P[69] 1200mm/sec CNT100    ;
 168:L P[70] 1200mm/sec CNT100    ;
 169:J P[71] 100% CNT100    ;
 170:L P[72] 1500mm/sec CNT100    ;
 171:L P[73] 1500mm/sec CNT100    ;
 172:L P[74] 1500mm/sec CNT100    ;
 173:   ;
 174:  !--- BEND 3 --- ;
 175:  UFRAME_NUM=3 ;
 176:   ;
 177:L P[75] 500mm/sec FINE    ;
 178:   ;
 179:  CALL SIM_DPB_2_0001    ;
 180:   ;
 181:L P[76] 500mm/sec FINE    ;
 182:L P[77] 1500mm/sec FINE    ;
 183:   ;
 184:  CALL SIM_BEND_2_0001    ;
 185:   ;
 186:  !FOLLOW BEND ;
 187:L P[78] 1500mm/sec CNT100    ;
 188:L P[79] 1200mm/sec CNT100    ;
 189:L P[80] 2.0sec FINE    ;
 190:   ;
 191:  CALL SIM_PPB_2_0001    ;
 192:   ;
 193:L P[81] 500mm/sec CNT100    ;
 194:L P[82] 1200mm/sec CNT100    ;
 195:  !--- ZERO TABLE --- ;
 196:  UFRAME_NUM=2 ;
 197:   ;
 198:  !MOVE TO ZERO ;
 199:L P[83] 1500mm/sec CNT100    ;
 200:L P[84] 1500mm/sec CNT100    ;
 201:L P[85] 1500mm/sec CNT100    ;
 202:L P[86] 500mm/sec FINE    ;
 203:   ;
 204:  !GRIP OFF ;
 205:   ;
 206:  !REPOS FOR BEND 4 ;
 207:L P[87] 1500msec CNT100    ;
 208:L P[88] 1500mm/sec CNT100    ;
 209:L P[89] 1500mm/sec CNT100    ;
 210:L P[90] 1500mm/sec CNT100    ;
 211:   ;
 212:J P[91:ZERO J6] 100% CNT100    ;
 213:   ;
 214:L P[92] 1500mm/sec CNT100    ;
 215:L P[93] 100mm/sec FINE    ;
 216:   ;
 217:  CALL SIM_PZ_2_0001    ;
 218:   ;
 219:  !MOVE TO PRESS BREAK ;
 220:L P[94] 500mm/sec CNT100    ;
 221:L P[95] 1200mm/sec CNT100    ;
 222:L P[96] 1200mm/sec CNT100    ;
 223:J P[97] 100% CNT100    ;
 224:L P[98] 1500mm/sec CNT100    ;
 225:L P[99] 1500mm/sec CNT100    ;
 226:L P[100] 1500mm/sec CNT100    ;
 227:   ;
 228:  !--- BEND 4 --- ;
 229:  UFRAME_NUM=3 ;
 230:   ;
 231:L P[101] 500mm/sec FINE    ;
 232:   ;
 233:  CALL SIM_DPB_2_0001    ;
 234:   ;
 235:L P[102] 500mm/sec FINE    ;
 236:L P[103] 1500mm/sec FINE    ;
 237:   ;
 238:  CALL SIM_BEND_2_0001    ;
 239:   ;
 240:  !FOLLOW BEND ;
 241:L P[104] 1500mm/sec CNT100    ;
 242:L P[105] 1200mm/sec CNT100    ;
 243:L P[106] 2.0sec FINE    ;
 244:   ;
 245:  CALL SIM_PPB_2_0001    ;
 246:   ;
 247:L P[107] 500mm/sec CNT100    ;
 248:L P[108] 1200mm/sec CNT100    ;
/POS
P[1:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   295.983  mm,	Y = -1001.060  mm,	Z =   641.268  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
	E1=   633.339  mm
};
P[2:"IN FRONT OF IF"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =      .000  mm,	Z =  -312.592  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
	E1=  1548.896  mm
};
P[3:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =  -312.592  mm,
	W =   180.000 deg,	P =      .000 deg,	R =    90.000 deg,
	E1=  2600.652  mm
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
	W =  -179.999 deg,	P =      .001 deg,	R =      .000 deg,
	E1=  2140.441  mm
};
P[9:"ON ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   635.140  mm,	Y =  1320.804  mm,	Z =    85.507  mm,
	W =  -179.998 deg,	P =      .003 deg,	R =      .000 deg,
	E1=  2580.816  mm
};
P[10:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   635.159  mm,	Y =  1320.793  mm,	Z =   303.508  mm,
	W =  -179.998 deg,	P =      .003 deg,	R =      .000 deg,
	E1=  2580.816  mm
};
P[11:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1115.243  mm,	Y =  1490.483  mm,	Z =  1081.681  mm,
	W =  -179.996 deg,	P =      .005 deg,	R =      .000 deg,
	E1=  2580.816  mm
};
P[12:"ROTATE 1"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1489.475  mm,	Y =  1640.859  mm,	Z =  1690.573  mm,
	W =    62.575 deg,	P =    32.103 deg,	R =    96.480 deg,
	E1=  2580.816  mm
};
P[13:"ROTATE 2"]{
   GP1:
	UF : 2, UT : 1,	
	J1=    15.173 deg,	J2=      .968 deg,	J3=    30.164 deg,
	J4=     9.908 deg,	J5=   -57.573 deg,	J6=   321.680 deg,
	E1=  2580.816  mm
};
P[14:""]{
   GP1:
	UF : 2, UT : 1,	
	J1=      .174 deg,	J2=     3.299 deg,	J3=   -16.472 deg,
	J4=     3.305 deg,	J5=    -9.200 deg,	J6=   334.283 deg,
	E1=  2580.816  mm
};
P[15:""]{
   GP1:
	UF : 2, UT : 1,	
	J1=     5.270 deg,	J2=    17.770 deg,	J3=   -17.044 deg,
	J4=    34.397 deg,	J5=    -9.411 deg,	J6=   286.305 deg,
	E1=  2580.816  mm
};
P[16:""]{
   GP1:
	UF : 2, UT : 1,	
	J1=      .172 deg,	J2=     3.299 deg,	J3=   -16.471 deg,
	J4=     3.285 deg,	J5=    -9.203 deg,	J6=   318.302 deg,
	E1=  2580.816  mm
};
P[17]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   702.535  mm,	Y =   920.780  mm,	Z =   812.300  mm,
	W =  -179.997 deg,	P =      .004 deg,	R =      .000 deg,
	E1=  2580.816  mm
};
P[18]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   702.534  mm,	Y =   920.780  mm,	Z =  1327.631  mm,
	W =  -179.997 deg,	P =      .004 deg,	R =      .000 deg,
	E1=  2221.229  mm
};
P[19]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   684.474  mm,	Y =   823.810  mm,	Z =  1816.677  mm,
	W =   151.491 deg,	P =      .004 deg,	R =     -.001 deg,
	E1=  2195.893  mm
};
P[20]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   848.044  mm,	Y =   414.374  mm,	Z =  1805.078  mm,
	W =   108.059 deg,	P =   -24.271 deg,	R =   -14.605 deg,
	E1=  2195.893  mm
};
P[21]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   225.071  mm,	Y =  -443.385  mm,	Z =  2273.437  mm,
	W =   117.226 deg,	P =    -8.633 deg,	R =   -56.480 deg,
	E1=  1531.414  mm
};
P[22:"STAGED FOR BEND"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -631.598  mm,	Y = -1277.389  mm,	Z =  2359.730  mm,
	W =   115.517 deg,	P =      .854 deg,	R =   -67.174 deg,
	E1=  1531.414  mm
};
P[23:"INSERT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1020.714  mm,	Y =  -416.803  mm,	Z =   240.717  mm,
	W =  -179.612 deg,	P =    -1.230 deg,	R =    89.858 deg,
	E1=  1531.414  mm
};
P[24]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1016.087  mm,	Y =  -434.622  mm,	Z =   328.284  mm,
	W =  -180.000 deg,	P =     -.000 deg,	R =    90.000 deg,
	E1=  1531.414  mm
};
P[25]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1016.088  mm,	Y = -1237.622  mm,	Z =   921.262  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1531.414  mm
};
P[26]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1016.088  mm,	Y = -1237.621  mm,	Z =  -162.738  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1531.414  mm
};
P[27]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1016.088  mm,	Y =  -884.621  mm,	Z =  -162.738  mm,
	W =   -90.000 deg,	P =   -90.000 deg,	R =     0.000 deg,
	E1=  1531.414  mm
};
P[28]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1002.088  mm,	Y =  -432.622  mm,	Z =   694.262  mm,
	W =      .000 deg,	P =   -46.000 deg,	R =   -90.000 deg,
	E1=  1531.414  mm
};
P[29:""]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.087  mm,	Y =  -432.620  mm,	Z =   781.429  mm,
	W =      .000 deg,	P =   -46.000 deg,	R =   -90.000 deg,
	E1=  1531.414  mm
};
P[30:""]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   986.175  mm,	Y =  -849.387  mm,	Z =   721.260  mm,
	W =      .000 deg,	P =   -45.000 deg,	R =   -90.000 deg,
	E1=  1531.414  mm
};
P[31]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -100.798  mm,	Y =  -398.386  mm,	Z =  2617.838  mm,
	W =    74.411 deg,	P =   -19.989 deg,	R =    64.201 deg,
	E1=   631.069  mm
};
P[32]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   472.419  mm,	Y =   543.482  mm,	Z =  2617.856  mm,
	W =  -138.470 deg,	P =   -83.498 deg,	R =   -43.495 deg,
	E1=   631.069  mm
};
P[33]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   121.490  mm,	Y =  1076.439  mm,	Z =   755.874  mm,
	W =  -164.622 deg,	P =   -85.055 deg,	R =   -17.467 deg,
	E1=  2310.106  mm
};
P[34:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    52.562  mm,	Y =  1076.403  mm,	Z =   755.920  mm,
	W =  -153.428 deg,	P =   -86.900 deg,	R =   -27.636 deg,
	E1=  2310.106  mm
};
P[35]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   -52.315  mm,	Y =  1076.399  mm,	Z =   755.920  mm,
	W =  -153.433 deg,	P =   -86.898 deg,	R =   -27.631 deg,
	E1=  1924.896  mm
};
P[36]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -167.288  mm,	Y =  1076.386  mm,	Z =   755.940  mm,
	W =  -177.429 deg,	P =   -68.205 deg,	R =    -3.878 deg,
	E1=  1924.896  mm
};
P[37]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -314.238  mm,	Y =  1076.364  mm,	Z =   962.982  mm,
	W =  -175.488 deg,	P =   -31.035 deg,	R =    -4.099 deg,
	E1=  1924.896  mm
};
P[38]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.009  mm,
	W =  -178.279 deg,	P =    10.882 deg,	R =    -3.577 deg,
	E1=  1924.896  mm
};
P[39:"ZERO J6"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.008  mm,
	W =  -178.805 deg,	P =    10.951 deg,	R =    -6.350 deg,
	E1=  1924.896  mm
};
P[40]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   223.123  mm,	Y =  1096.129  mm,	Z =   628.221  mm,
	W =   -20.614 deg,	P =    89.014 deg,	R =   155.693 deg,
	E1=  2257.529  mm
};
P[41]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    58.594  mm,	Y =  1107.510  mm,	Z =   631.736  mm,
	W =    -6.114 deg,	P =    87.070 deg,	R =   172.199 deg,
	E1=  2257.529  mm
};
P[42]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   165.441  mm,	Y =  1107.510  mm,	Z =   728.506  mm,
	W =    -6.113 deg,	P =    87.070 deg,	R =   172.200 deg,
	E1=  2257.529  mm
};
P[43]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   454.485  mm,	Y =  1107.485  mm,	Z =  1246.519  mm,
	W =  -177.832 deg,	P =    50.903 deg,	R =      .632 deg,
	E1=  2257.529  mm
};
P[44]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.559  mm,	Y =  1107.439  mm,	Z =  1784.526  mm,
	W =  -178.428 deg,	P =   -15.092 deg,	R =      .412 deg,
	E1=  2257.529  mm
};
P[45]{
   GP1:
	UF : 2, UT : 1,	
	J1=     9.531 deg,	J2=   -29.286 deg,	J3=    30.088 deg,
	J4=    22.003 deg,	J5=   -42.977 deg,	J6=   142.000 deg,
	E1=  2257.529  mm
};
P[46]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.620  mm,	Y =   759.398  mm,	Z =  2179.522  mm,
	W =  -143.559 deg,	P =    11.456 deg,	R =  -170.047 deg,
	E1=  1860.572  mm
};
P[47]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.197  mm,	Y =   104.097  mm,	Z =  2621.562  mm,
	W =   -99.784 deg,	P =    23.209 deg,	R =  -177.716 deg,
	E1=  1592.257  mm
};
P[48]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -726.082  mm,	Y = -1276.504  mm,	Z =  2636.429  mm,
	W =  -115.109 deg,	P =    -1.506 deg,	R =   111.772 deg,
	E1=  1592.257  mm
};
P[49]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.421  mm,	Y =  -447.896  mm,	Z =   278.535  mm,
	W =  -180.000 deg,	P =     -.000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[50]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.420  mm,	Y =  -447.896  mm,	Z =   443.656  mm,
	W =   180.000 deg,	P =      .000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[51]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=   -38.061 deg,	J3=   -22.147 deg,
	J4=   127.843 deg,	J5=   -33.562 deg,	J6=    47.000 deg,
	E1=  1531.414  mm
};
P[52]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=    43.382 deg,	J3=  -105.743 deg,
	J4=   153.244 deg,	J5=  -104.129 deg,	J6=    -7.000 deg,
	E1=  1531.414  mm
};
P[53]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -71.215 deg,	J2=    43.939 deg,	J3=   -91.614 deg,
	J4=   161.208 deg,	J5=   -91.528 deg,	J6=     0.000 deg,
	E1=  1531.414  mm
};
P[54]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -76.683 deg,	J2=    30.289 deg,	J3=   -53.025 deg,
	J4=   170.375 deg,	J5=   -97.697 deg,	J6=     8.000 deg,
	E1=  1531.414  mm
};
P[55]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y =  -436.130  mm,	Z =   761.051  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
P[56]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y = -1068.573  mm,	Z =   761.050  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
P[57]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -100.798  mm,	Y =  -398.386  mm,	Z =  2617.838  mm,
	W =    74.411 deg,	P =   -19.989 deg,	R =    64.201 deg,
	E1=   631.069  mm
};
P[58]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   472.419  mm,	Y =   543.482  mm,	Z =  2617.856  mm,
	W =  -138.470 deg,	P =   -83.498 deg,	R =   -43.495 deg,
	E1=   631.069  mm
};
P[59]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   121.490  mm,	Y =  1076.439  mm,	Z =   755.874  mm,
	W =  -164.622 deg,	P =   -85.055 deg,	R =   -17.467 deg,
	E1=  2310.106  mm
};
P[60:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    52.562  mm,	Y =  1076.403  mm,	Z =   755.920  mm,
	W =  -153.428 deg,	P =   -86.900 deg,	R =   -27.636 deg,
	E1=  2310.106  mm
};
P[61]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   -52.315  mm,	Y =  1076.399  mm,	Z =   755.920  mm,
	W =  -153.433 deg,	P =   -86.898 deg,	R =   -27.631 deg,
	E1=  1924.896  mm
};
P[62]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -167.288  mm,	Y =  1076.386  mm,	Z =   755.940  mm,
	W =  -177.429 deg,	P =   -68.205 deg,	R =    -3.878 deg,
	E1=  1924.896  mm
};
P[63]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -314.238  mm,	Y =  1076.364  mm,	Z =   962.982  mm,
	W =  -175.488 deg,	P =   -31.035 deg,	R =    -4.099 deg,
	E1=  1924.896  mm
};
P[64]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.009  mm,
	W =  -178.279 deg,	P =    10.882 deg,	R =    -3.577 deg,
	E1=  1924.896  mm
};
P[65:"ZERO J6"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.008  mm,
	W =  -178.805 deg,	P =    10.951 deg,	R =    -6.350 deg,
	E1=  1924.896  mm
};
P[66]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   223.123  mm,	Y =  1096.129  mm,	Z =   628.221  mm,
	W =   -20.614 deg,	P =    89.014 deg,	R =   155.693 deg,
	E1=  2257.529  mm
};
P[67]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    58.594  mm,	Y =  1107.510  mm,	Z =   631.736  mm,
	W =    -6.114 deg,	P =    87.070 deg,	R =   172.199 deg,
	E1=  2257.529  mm
};
P[68]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   165.441  mm,	Y =  1107.510  mm,	Z =   728.506  mm,
	W =    -6.113 deg,	P =    87.070 deg,	R =   172.200 deg,
	E1=  2257.529  mm
};
P[69]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   454.485  mm,	Y =  1107.485  mm,	Z =  1246.519  mm,
	W =  -177.832 deg,	P =    50.903 deg,	R =      .632 deg,
	E1=  2257.529  mm
};
P[70]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.559  mm,	Y =  1107.439  mm,	Z =  1784.526  mm,
	W =  -178.428 deg,	P =   -15.092 deg,	R =      .412 deg,
	E1=  2257.529  mm
};
P[71]{
   GP1:
	UF : 2, UT : 1,	
	J1=     9.531 deg,	J2=   -29.286 deg,	J3=    30.088 deg,
	J4=    22.003 deg,	J5=   -42.977 deg,	J6=   142.000 deg,
	E1=  2257.529  mm
};
P[72]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.620  mm,	Y =   759.398  mm,	Z =  2179.522  mm,
	W =  -143.559 deg,	P =    11.456 deg,	R =  -170.047 deg,
	E1=  1860.572  mm
};
P[73]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.197  mm,	Y =   104.097  mm,	Z =  2621.562  mm,
	W =   -99.784 deg,	P =    23.209 deg,	R =  -177.716 deg,
	E1=  1592.257  mm
};
P[74]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -726.082  mm,	Y = -1276.504  mm,	Z =  2636.429  mm,
	W =  -115.109 deg,	P =    -1.506 deg,	R =   111.772 deg,
	E1=  1592.257  mm
};
P[75]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.421  mm,	Y =  -447.896  mm,	Z =   278.535  mm,
	W =  -180.000 deg,	P =     -.000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[76]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.420  mm,	Y =  -447.896  mm,	Z =   443.656  mm,
	W =   180.000 deg,	P =      .000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[77]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=   -38.061 deg,	J3=   -22.147 deg,
	J4=   127.843 deg,	J5=   -33.562 deg,	J6=    47.000 deg,
	E1=  1531.414  mm
};
P[78]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=    43.382 deg,	J3=  -105.743 deg,
	J4=   153.244 deg,	J5=  -104.129 deg,	J6=    -7.000 deg,
	E1=  1531.414  mm
};
P[79]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -71.215 deg,	J2=    43.939 deg,	J3=   -91.614 deg,
	J4=   161.208 deg,	J5=   -91.528 deg,	J6=     0.000 deg,
	E1=  1531.414  mm
};
P[80]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -76.683 deg,	J2=    30.289 deg,	J3=   -53.025 deg,
	J4=   170.375 deg,	J5=   -97.697 deg,	J6=     8.000 deg,
	E1=  1531.414  mm
};
P[81]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y =  -436.130  mm,	Z =   761.051  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
P[82]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y = -1068.573  mm,	Z =   761.050  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
P[83]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -100.798  mm,	Y =  -398.386  mm,	Z =  2617.838  mm,
	W =    74.411 deg,	P =   -19.989 deg,	R =    64.201 deg,
	E1=   631.069  mm
};
P[84]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   472.419  mm,	Y =   543.482  mm,	Z =  2617.856  mm,
	W =  -138.470 deg,	P =   -83.498 deg,	R =   -43.495 deg,
	E1=   631.069  mm
};
P[85]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   121.490  mm,	Y =  1076.439  mm,	Z =   755.874  mm,
	W =  -164.622 deg,	P =   -85.055 deg,	R =   -17.467 deg,
	E1=  2310.106  mm
};
P[86:""]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =    52.562  mm,	Y =  1076.403  mm,	Z =   755.920  mm,
	W =  -153.428 deg,	P =   -86.900 deg,	R =   -27.636 deg,
	E1=  2310.106  mm
};
P[87]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   -52.315  mm,	Y =  1076.399  mm,	Z =   755.920  mm,
	W =  -153.433 deg,	P =   -86.898 deg,	R =   -27.631 deg,
	E1=  1924.896  mm
};
P[88]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -167.288  mm,	Y =  1076.386  mm,	Z =   755.940  mm,
	W =  -177.429 deg,	P =   -68.205 deg,	R =    -3.878 deg,
	E1=  1924.896  mm
};
P[89]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  -314.238  mm,	Y =  1076.364  mm,	Z =   962.982  mm,
	W =  -175.488 deg,	P =   -31.035 deg,	R =    -4.099 deg,
	E1=  1924.896  mm
};
P[90]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.009  mm,
	W =  -178.279 deg,	P =    10.882 deg,	R =    -3.577 deg,
	E1=  1924.896  mm
};
P[91:"ZERO J6"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   171.814  mm,	Y =  1076.337  mm,	Z =  1376.008  mm,
	W =  -178.805 deg,	P =    10.951 deg,	R =    -6.350 deg,
	E1=  1924.896  mm
};
P[92]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   223.123  mm,	Y =  1096.129  mm,	Z =   628.221  mm,
	W =   -20.614 deg,	P =    89.014 deg,	R =   155.693 deg,
	E1=  2257.529  mm
};
P[93]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =    58.594  mm,	Y =  1107.510  mm,	Z =   631.736  mm,
	W =    -6.114 deg,	P =    87.070 deg,	R =   172.199 deg,
	E1=  2257.529  mm
};
P[94]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   165.441  mm,	Y =  1107.510  mm,	Z =   728.506  mm,
	W =    -6.113 deg,	P =    87.070 deg,	R =   172.200 deg,
	E1=  2257.529  mm
};
P[95]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   454.485  mm,	Y =  1107.485  mm,	Z =  1246.519  mm,
	W =  -177.832 deg,	P =    50.903 deg,	R =      .632 deg,
	E1=  2257.529  mm
};
P[96]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.559  mm,	Y =  1107.439  mm,	Z =  1784.526  mm,
	W =  -178.428 deg,	P =   -15.092 deg,	R =      .412 deg,
	E1=  2257.529  mm
};
P[97]{
   GP1:
	UF : 2, UT : 1,	
	J1=     9.531 deg,	J2=   -29.286 deg,	J3=    30.088 deg,
	J4=    22.003 deg,	J5=   -42.977 deg,	J6=   142.000 deg,
	E1=  2257.529  mm
};
P[98]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   872.620  mm,	Y =   759.398  mm,	Z =  2179.522  mm,
	W =  -143.559 deg,	P =    11.456 deg,	R =  -170.047 deg,
	E1=  1860.572  mm
};
P[99]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   903.197  mm,	Y =   104.097  mm,	Z =  2621.562  mm,
	W =   -99.784 deg,	P =    23.209 deg,	R =  -177.716 deg,
	E1=  1592.257  mm
};
P[100]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -726.082  mm,	Y = -1276.504  mm,	Z =  2636.429  mm,
	W =  -115.109 deg,	P =    -1.506 deg,	R =   111.772 deg,
	E1=  1592.257  mm
};
P[101]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.421  mm,	Y =  -447.896  mm,	Z =   278.535  mm,
	W =  -180.000 deg,	P =     -.000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[102]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1307.420  mm,	Y =  -447.896  mm,	Z =   443.656  mm,
	W =   180.000 deg,	P =      .000 deg,	R =   -90.000 deg,
	E1=  1592.257  mm
};
P[103]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=   -38.061 deg,	J3=   -22.147 deg,
	J4=   127.843 deg,	J5=   -33.562 deg,	J6=    47.000 deg,
	E1=  1531.414  mm
};
P[104]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -64.114 deg,	J2=    43.382 deg,	J3=  -105.743 deg,
	J4=   153.244 deg,	J5=  -104.129 deg,	J6=    -7.000 deg,
	E1=  1531.414  mm
};
P[105]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -71.215 deg,	J2=    43.939 deg,	J3=   -91.614 deg,
	J4=   161.208 deg,	J5=   -91.528 deg,	J6=     0.000 deg,
	E1=  1531.414  mm
};
P[106]{
   GP1:
	UF : 3, UT : 1,	
	J1=   -76.683 deg,	J2=    30.289 deg,	J3=   -53.025 deg,
	J4=   170.375 deg,	J5=   -97.697 deg,	J6=     8.000 deg,
	E1=  1531.414  mm
};
P[107]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y =  -436.130  mm,	Z =   761.051  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
P[108]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1002.918  mm,	Y = -1068.573  mm,	Z =   761.050  mm,
	W =     -.079 deg,	P =    46.343 deg,	R =    89.968 deg,
	E1=  1531.414  mm
};
/END
