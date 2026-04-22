/PROG  M_6410820756
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410820756 MANUAL T2";
PROG_SIZE	= 0;
CREATE		= DATE 26-04-20  TIME 18:00:00;
MODIFIED	= DATE 26-04-20  TIME 18:00:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 174;
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
   2:  !6410820756 MANUAL T2 ;
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
  29:J P[1:INTMPT] 100% CNT10    ;
  30:L P[2:IN FRONT OF IF] 2000mm/sec CNT10    ;
  31:L P[3:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  32:   ;
  33:  !--- FIRST PART SEARCH --- ;
  34:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  35:  CALL SEARCH_R01    ;
  36:  PR[54,3]=PR[10,3:infd search]    ;
  37:  JMP LBL[11] ;
  38:  LBL[10] ;
  39:  !--- DEPLETION CHECK --- ;
  40:  R[13:DEPLETED INFD]=PR[54,3]    ;
  41:  IF R[13:DEPLETED INFD]<R[11:THRESHOLD],JMP LBL[99] ;
  42:  LBL[11] ;
  43:   ;
  44:  !INSERT PART PR ;
  45:  PR[2,3:OFFSET]=400    ;
  46:   ;
  47:L PR[54:INFD5 Z TRACK] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  48:L PR[54:INFD5 Z TRACK] 700mm/sec FINE    ;
  49:   ;
  50:  CALL ALL_VAC_ON_R01    ;
  51:  WAIT R[19:VAC SETTLE] ;
  52:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  53:  PAYLOAD[2] ;
  54:   ;
  55:L PR[54:INFD5 Z TRACK] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  56:   ;
  57:J P[4:INTMPT] 100% CNT100    ;
  58:J P[5:INTMPT] 100% CNT100    ;
  59:J P[6:INTMPT] 100% CNT100    ;
  60:L P[7:INTMPT] 1500mm/sec CNT100    ;
  61:   ;
  62:  !--- ZERO TABLE --- ;
  63:  UFRAME_NUM=2 ;
  64:   ;
  65:L P[8] 1500mm/sec FINE    ;
  66:L P[9] 500mm/sec FINE    ;
  67:   ;
  68:  CALL ALL_VAC_OFF_R01    ;
  69:  PAYLOAD[1] ;
  70:   ;
  71:  !--- RE-PICK (REORIENT) --- ;
  72:L P[10] 1500mm/sec FINE    ;
  73:L P[11] 1200mm/sec CNT100    ;
  74:L P[12] 300mm/sec CNT100    ;
  75:   ;
  76:  CALL ALL_VAC_ON_R01    ;
  77:  WAIT R[19:VAC SETTLE] ;
  78:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  79:  PAYLOAD[2] ;
  80:   ;
  81:L P[13] 300mm/sec FINE    ;
  82:L P[14] 600mm/sec CNT100    ;
  83:   ;
  84:  !--- APPROACH PRESS --- ;
  85:L P[15] 1200mm/sec CNT100    ;
  86:L P[16] 1200mm/sec CNT100    ;
  87:L P[17] 1200mm/sec CNT100    ;
  88:L P[18] 800mm/sec CNT100    ;
  89:L P[19] 600mm/sec CNT100    ;
  90:   ;
  91:  !--- INSERT --- ;
  92:  UFRAME_NUM=3 ;
  93:   ;
  94:L P[20] 300mm/sec CNT100    ;
  95:L P[21] 300mm/sec FINE    ;
  96:   ;
  97:  !-- HOLD POSITION. OPERATOR: ;
  98:  !-- PINCH PART IN PRESS. ;
  99:  !-- RESUME TO RELEASE. -- ;
 100:  PAUSE ;
 101:   ;
 102:  !--- RELEASE & RETREAT --- ;
 103:  CALL ALL_VAC_OFF_R01    ;
 104:  PAYLOAD[1] ;
 105:   ;
 106:L P[22] 300mm/sec FINE    ;
 107:   ;
 108:  UFRAME_NUM=0 ;
 109:  CALL GO_HOME_R01    ;
 110:   ;
 111:  !-- ROBOT CLEAR. OPERATOR: ;
 112:  !-- BEND PART MANUALLY. ;
 113:  !-- RESUME TO RETRIEVE. -- ;
 114:  PAUSE ;
 115:   ;
 116:  !--- RETRIEVE FINISHED --- ;
 117:  UFRAME_NUM=3 ;
 118:   ;
 119:  !TEACH: P[100] APPROACH ;
 120:L P[100:RETR APPROACH] 500mm/sec CNT100    ;
 121:  !TEACH: P[101] GRIP ;
 122:L P[101:RETR GRIP] 200mm/sec FINE    ;
 123:   ;
 124:  CALL ALL_VAC_ON_R01    ;
 125:  WAIT R[19:VAC SETTLE] ;
 126:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 127:  PAYLOAD[2] ;
 128:   ;
 129:  !TEACH: P[102] EXTRACT ;
 130:L P[102:RETR EXTRACT] 500mm/sec CNT100    ;
 131:   ;
 132:  !--- OUTFEED --- ;
 133:  UFRAME_NUM=4 ;
 134:  !OUTFEED POSITIONS NEED LIVE TEAC ;
 135:   ;
 136:  !TEACH: P[56] OUTFEED APPR ;
 137:L P[56] 1200mm/sec CNT100    ;
 138:  !TEACH: P[57] OUTFEED MID ;
 139:L P[57] 1200mm/sec CNT100    ;
 140:  !TEACH: P[58] OUTFEED OVER ;
 141:L P[58] 1500mm/sec CNT100    ;
 142:  !TEACH: P[59] OUTFEED DROP ;
 143:L P[59] 500mm/sec FINE Offset,PR[2:OFFSET]    ;
 144:L P[59] 500mm/sec FINE    ;
 145:   ;
 146:  CALL ALL_VAC_OFF_R01    ;
 147:  PAYLOAD[1] ;
 148:   ;
 149:L P[59] 1200mm/sec FINE Offset,PR[2:OFFSET]    ;
 150:   ;
 151:  !--- HOME --- ;
 152:  UFRAME_NUM=0 ;
 153:  CALL GO_HOME_R01    ;
 154:   ;
 155:  TIMER[1]=STOP ;
 156:  R[20]=(TIMER[1]) ;
 157:   ;
 158:  !--- HOUSEKEEPING --- ;
 159:  R[10:PART INDEX]=R[10:PART INDEX]+1    ;
 160:  PR[54,3]=PR[54,3]-R[12:THICKNESS]    ;
 161:   ;
 162:  !-- PART DONE. RESUME FOR ;
 163:  !-- NEXT PART OR ABORT. -- ;
 164:  PAUSE ;
 165:  JMP LBL[1] ;
 166:   ;
 167:  !--- GRIP VERIFY FAIL --- ;
 168:  LBL[90] ;
 169:  UALM[3] ;
 170:  PAUSE ;
 171:   ;
 172:  !--- OUT OF PARTS --- ;
 173:  LBL[99] ;
 174:  UALM[8] ;
 175:  PAUSE ;
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
	X =  3074.267  mm,	Y =     0.000  mm,	Z =  -250.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=  1548.896  mm
};
P[3:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =  -250.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =    90.000 deg,
	E1=  2600.652  mm
};
P[4:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1565.474  mm,	Y =   779.079  mm,	Z =   927.535  mm,
	W =  -176.068 deg,	P =   -40.563 deg,	R =    88.652 deg,
	E1=  2600.656  mm
};
P[5:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1450.000  mm,	Y =   774.759  mm,	Z =  2476.163  mm,
	W =  -175.665 deg,	P =   -86.267 deg,	R =    87.929 deg,
	E1=  2600.656  mm
};
P[6:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1565.473  mm,	Y =  -696.446  mm,	Z =  2651.365  mm,
	W =  -147.168 deg,	P =   -65.974 deg,	R =   -35.346 deg,
	E1=  1923.842  mm
};
P[7:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2392.055  mm,	Y =  -696.432  mm,	Z =  2210.666  mm,
	W =  -147.173 deg,	P =   -65.972 deg,	R =   -35.342 deg,
	E1=  2132.484  mm
};
P[8]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   641.875  mm,	Y =  1231.109  mm,	Z =   349.573  mm,
	W =  -177.426 deg,	P =    -4.623 deg,	R =     7.974 deg,
	E1=  2132.484  mm
};
P[9]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   615.987  mm,	Y =  1192.749  mm,	Z =   126.188  mm,
	W =  -177.416 deg,	P =     -.281 deg,	R =     9.641 deg,
	E1=  2136.804  mm
};
P[10]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   745.594  mm,	Y =  1106.352  mm,	Z =   558.544  mm,
	W =  -177.417 deg,	P =     -.281 deg,	R =    45.994 deg,
	E1=  2136.804  mm
};
P[11]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.998  mm,	Y =   582.811  mm,	Z =   431.329  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[12]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.993  mm,	Y =   582.809  mm,	Z =    90.540  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[13]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   655.194  mm,	Y =   630.809  mm,	Z =   222.537  mm,
	W =  -178.590 deg,	P =     -.094 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[14]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   735.557  mm,	Y =   630.815  mm,	Z =  1103.073  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[15]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.517  mm,	Y =   209.375  mm,	Z =  1339.233  mm,
	W =  -159.819 deg,	P =    17.343 deg,	R =    27.842 deg,
	E1=  2068.407  mm
};
P[16]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   281.259  mm,	Y =  -188.972  mm,	Z =  1409.437  mm,
	W =  -174.754 deg,	P =    31.964 deg,	R =     3.139 deg,
	E1=  2068.407  mm
};
P[17]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   260.972  mm,	Y =  -560.465  mm,	Z =  1734.928  mm,
	W =   146.801 deg,	P =    25.778 deg,	R =   -35.910 deg,
	E1=  2068.407  mm
};
P[18]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -397.105  mm,	Y = -1014.563  mm,	Z =  2738.057  mm,
	W =   134.532 deg,	P =    31.888 deg,	R =   -41.527 deg,
	E1=  2068.407  mm
};
P[19]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -833.094  mm,	Y = -1201.160  mm,	Z =  3178.352  mm,
	W =   127.631 deg,	P =    33.378 deg,	R =   -42.525 deg,
	E1=  2068.407  mm
};
P[20]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   260.131  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
};
P[21]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.586  mm,	Y =  -747.635  mm,	Z =   260.094  mm,
	W =  -179.118 deg,	P =    -4.954 deg,	R =    93.964 deg,
	E1=  2061.958  mm
};
P[22]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   260.131  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
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
P[100:"RETR APPROACH"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   500.000  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
};
P[101:"RETR GRIP"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.586  mm,	Y =  -747.635  mm,	Z =   260.094  mm,
	W =  -179.118 deg,	P =    -4.954 deg,	R =    93.964 deg,
	E1=  2061.958  mm
};
P[102:"RETR EXTRACT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   500.000  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
};
/END
