/PROG  M_6410818389
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410818389 MANUAL T2";
PROG_SIZE	= 0;
CREATE		= DATE 26-04-20  TIME 18:00:00;
MODIFIED	= DATE 26-04-20  TIME 18:00:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 175;
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
   2:  !6410818389 MANUAL T2 ;
   3:  !****************************** ;
   4:  !* WIP: OUTFEED + RETRIEVE    * ;
   5:  !* POSITIONS NOT YET TAUGHT - * ;
   6:  !* LIVE TEACH BEFORE RUNNING. * ;
   7:  !****************************** ;
   8:  !PRESS NOT INTEGRATED ;
   9:  !T2 STEP, OPERATOR PACED ;
  10:  !DI[30:PART DETECT] = GRIP ;
  11:  !CONFIRM (NO VAC SWITCH) ;
  12:  !--- INITIALIZE --- ;
  13:  UFRAME_NUM=0 ;
  14:  UTOOL_NUM=1 ;
  15:  PAYLOAD[1] ;
  16:  R[10:PART INDEX]=0    ;
  17:   ;
  18:J PR[1:HOME] 100% CNT50    ;
  19:   ;
  20:  !--- CYCLE START --- ;
  21:  LBL[1] ;
  22:   ;
  23:  !--- PICK --- ;
  24:  UFRAME_NUM=1 ;
  25:  UTOOL_NUM=1 ;
  26:  TIMER[1]=RESET ;
  27:  TIMER[1]=START ;
  28:   ;
  29:L P[1:INTMPT] 2000mm/sec CNT10    ;
  30:L P[2:IN FRONT OF IF] 2000mm/sec CNT10    ;
  31:L P[3:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  32:   ;
  33:  !--- FIRST PART SEARCH --- ;
  34:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  35:  CALL SEARCH_R01    ;
  36:  PR[53,3]=PR[10,3:infd search]    ;
  37:  JMP LBL[11] ;
  38:  LBL[10] ;
  39:  !--- DEPLETION CHECK --- ;
  40:  R[13:DEPLETED INFD]=PR[53,3]    ;
  41:  IF R[13:DEPLETED INFD]<R[11:THRESHOLD],JMP LBL[99] ;
  42:  LBL[11] ;
  43:   ;
  44:  !INSERT PART PR ;
  45:  PR[2,3:OFFSET]=400    ;
  46:   ;
  47:L PR[53:INFD4 Z TRACK] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  48:L PR[53:INFD4 Z TRACK] 700mm/sec FINE    ;
  49:   ;
  50:  CALL ALL_VAC_ON_R01    ;
  51:  WAIT R[19:VAC SETTLE] ;
  52:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  53:  PAYLOAD[2] ;
  54:   ;
  55:L PR[53:INFD4 Z TRACK] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  56:   ;
  57:J P[4:INTMPT] 100% CNT100    ;
  58:J P[5:INTMPT] 100% CNT100    ;
  59:J P[6:INTMPT] 100% CNT100    ;
  60:L P[7:INTMPT] 2000mm/sec CNT100    ;
  61:   ;
  62:  !--- ZERO TABLE --- ;
  63:  UFRAME_NUM=2 ;
  64:   ;
  65:L P[8:ABOVE ZERO] 1500mm/sec FINE    ;
  66:L P[9:ON ZERO] 1200mm/sec FINE    ;
  67:   ;
  68:  CALL ALL_VAC_OFF_R01    ;
  69:  PAYLOAD[1] ;
  70:   ;
  71:  !--- RE-PICK (REORIENT) --- ;
  72:L P[10] 1500mm/sec FINE    ;
  73:L P[11] 1500mm/sec CNT100    ;
  74:J P[12:ROTATE 1] 75% CNT100    ;
  75:J P[13:ROTATE 2] 75% CNT100    ;
  76:J P[14] 75% CNT100    ;
  77:L P[15] 100mm/sec FINE    ;
  78:   ;
  79:  CALL ALL_VAC_ON_R01    ;
  80:  WAIT R[19:VAC SETTLE] ;
  81:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  82:  PAYLOAD[2] ;
  83:   ;
  84:L P[16] 155mm/sec FINE    ;
  85:   ;
  86:  !--- APPROACH PRESS --- ;
  87:L P[17] 2000mm/sec CNT100    ;
  88:L P[18] 1500mm/sec CNT100    ;
  89:L P[19] 1500mm/sec CNT100    ;
  90:L P[20] 1500mm/sec CNT100    ;
  91:L P[21] 1500mm/sec CNT100    ;
  92:   ;
  93:L P[22:STAGED FOR BEND] 500mm/sec FINE    ;
  94:   ;
  95:  !--- INSERT --- ;
  96:  UFRAME_NUM=3 ;
  97:   ;
  98:L P[23:INSERT] 500mm/sec FINE    ;
  99:   ;
 100:  !-- HOLD POSITION. OPERATOR: ;
 101:  !-- PINCH PART IN PRESS. ;
 102:  !-- RESUME TO RELEASE. -- ;
 103:  PAUSE ;
 104:   ;
 105:  !--- RELEASE & RETREAT --- ;
 106:  CALL ALL_VAC_OFF_R01    ;
 107:  PAYLOAD[1] ;
 108:   ;
 109:L P[24] 500mm/sec CNT100    ;
 110:   ;
 111:  UFRAME_NUM=0 ;
 112:  CALL GO_HOME_R01    ;
 113:   ;
 114:  !-- ROBOT CLEAR. OPERATOR: ;
 115:  !-- BEND PART MANUALLY. ;
 116:  !-- RESUME TO RETRIEVE. -- ;
 117:  PAUSE ;
 118:   ;
 119:  !--- RETRIEVE FINISHED --- ;
 120:  UFRAME_NUM=3 ;
 121:   ;
 122:  !TEACH: P[200] APPROACH ;
 123:L P[200:RETR APPROACH] 500mm/sec CNT100    ;
 124:  !TEACH: P[201] GRIP ;
 125:L P[201:RETR GRIP] 200mm/sec FINE    ;
 126:   ;
 127:  CALL ALL_VAC_ON_R01    ;
 128:  WAIT R[19:VAC SETTLE] ;
 129:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 130:  PAYLOAD[2] ;
 131:   ;
 132:  !TEACH: P[202] EXTRACT ;
 133:L P[202:RETR EXTRACT] 500mm/sec CNT100    ;
 134:   ;
 135:  !--- OUTFEED --- ;
 136:  UFRAME_NUM=4 ;
 137:  !OUTFEED POSITIONS NEED LIVE TEAC ;
 138:   ;
 139:  !TEACH: P[56] OUTFEED APPR ;
 140:L P[56] 1200mm/sec CNT100    ;
 141:  !TEACH: P[57] OUTFEED MID ;
 142:L P[57] 1200mm/sec CNT100    ;
 143:  !TEACH: P[58] OUTFEED OVER ;
 144:L P[58] 1500mm/sec CNT100    ;
 145:  !TEACH: P[59] OUTFEED DROP ;
 146:L P[59] 500mm/sec FINE Offset,PR[2:OFFSET]    ;
 147:L P[59] 500mm/sec FINE    ;
 148:   ;
 149:  CALL ALL_VAC_OFF_R01    ;
 150:  PAYLOAD[1] ;
 151:   ;
 152:L P[59] 1200mm/sec FINE Offset,PR[2:OFFSET]    ;
 153:   ;
 154:  !--- HOME --- ;
 155:  UFRAME_NUM=0 ;
 156:  CALL GO_HOME_R01    ;
 157:   ;
 158:  TIMER[1]=STOP ;
 159:  R[20]=(TIMER[1]) ;
 160:   ;
 161:  !--- HOUSEKEEPING --- ;
 162:  R[10:PART INDEX]=R[10:PART INDEX]+1    ;
 163:  PR[53,3]=PR[53,3]-R[12:THICKNESS]    ;
 164:   ;
 165:  !-- PART DONE. RESUME FOR ;
 166:  !-- NEXT PART OR ABORT. -- ;
 167:  PAUSE ;
 168:  JMP LBL[1] ;
 169:   ;
 170:  !--- GRIP VERIFY FAIL --- ;
 171:  LBL[90] ;
 172:  UALM[3] ;
 173:  PAUSE ;
 174:   ;
 175:  !--- OUT OF PARTS --- ;
 176:  LBL[99] ;
 177:  UALM[8] ;
 178:  PAUSE ;
/POS
P[1:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   295.983  mm,	Y = -1001.060  mm,	Z =   641.268  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=   633.339  mm
};
P[2:"IN FRONT OF IF"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =     0.000  mm,	Z =  -312.592  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=  1548.896  mm
};
P[3:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =  -312.592  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
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
	W =  -179.999 deg,	P =      .001 deg,	R =     0.000 deg,
	E1=  2140.441  mm
};
P[9:"ON ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, -1, 1',
	X =   635.140  mm,	Y =  1320.804  mm,	Z =    85.507  mm,
	W =  -179.998 deg,	P =      .003 deg,	R =     0.000 deg,
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
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1115.243  mm,	Y =  1490.483  mm,	Z =  1081.681  mm,
	W =  -179.996 deg,	P =      .005 deg,	R =     0.000 deg,
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
P[14]{
   GP1:
	UF : 2, UT : 1,	
	J1=      .174 deg,	J2=     3.299 deg,	J3=   -16.472 deg,
	J4=     3.305 deg,	J5=    -9.200 deg,	J6=   334.283 deg,
	E1=  2580.816  mm
};
P[15]{
   GP1:
	UF : 2, UT : 1,	
	J1=     5.270 deg,	J2=    17.770 deg,	J3=   -17.044 deg,
	J4=    34.397 deg,	J5=    -9.411 deg,	J6=   286.305 deg,
	E1=  2580.816  mm
};
P[16]{
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
	W =  -179.997 deg,	P =      .004 deg,	R =     0.000 deg,
	E1=  2580.816  mm
};
P[18]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   702.534  mm,	Y =   920.780  mm,	Z =  1327.631  mm,
	W =  -179.997 deg,	P =      .004 deg,	R =     0.000 deg,
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
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  1531.414  mm
};
P[56]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[57]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[58]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[59]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[200:"RETR APPROACH"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1020.714  mm,	Y =  -416.803  mm,	Z =   500.000  mm,
	W =  -179.612 deg,	P =    -1.230 deg,	R =    89.858 deg,
	E1=  1531.414  mm
};
P[201:"RETR GRIP"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1020.714  mm,	Y =  -416.803  mm,	Z =   240.717  mm,
	W =  -179.612 deg,	P =    -1.230 deg,	R =    89.858 deg,
	E1=  1531.414  mm
};
P[202:"RETR EXTRACT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 1',
	X =  1016.087  mm,	Y =  -434.622  mm,	Z =   328.284  mm,
	W =  -180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  1531.414  mm
};
/END
