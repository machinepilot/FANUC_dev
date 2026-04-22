/PROG  M_07051
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "PN *07051 MANUAL T2";
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
   2:  !TEMPLATE: PART ***07051 ;
   3:  !TEACH: FULL PART NUMBER TBD ;
   4:  !****************************** ;
   5:  !* TEMPLATE. ALL POSITIONS    * ;
   6:  !* ARE PLACEHOLDERS -- LIVE   * ;
   7:  !* TEACH BEFORE RUNNING.      * ;
   8:  !****************************** ;
   9:  !PRESS NOT INTEGRATED ;
  10:  !T2 STEP, OPERATOR PACED ;
  11:  !DI[30:PART DETECT] = GRIP ;
  12:  !CONFIRM (NO VAC SWITCH) ;
  13:  !--- INITIALIZE --- ;
  14:  UFRAME_NUM=0 ;
  15:  UTOOL_NUM=1 ;
  16:  PAYLOAD[1] ;
  17:  R[10:PART INDEX]=0    ;
  18:   ;
  19:J PR[1:HOME] 100% CNT50    ;
  20:   ;
  21:  !--- CYCLE START --- ;
  22:  LBL[1] ;
  23:   ;
  24:  !--- PICK --- ;
  25:  UFRAME_NUM=1 ;
  26:  UTOOL_NUM=1 ;
  27:  TIMER[1]=RESET ;
  28:  TIMER[1]=START ;
  29:   ;
  30:  !TEACH: P[3] PICK INTMPT ;
  31:L P[3:INTMPT] 2000mm/sec CNT10    ;
  32:  !TEACH: P[1] IN FRONT OF IF ;
  33:L P[1:IN FRONT OF IF] 2000mm/sec CNT10    ;
  34:  !TEACH: P[2] ROTATE OVER PICK ;
  35:L P[2:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  36:   ;
  37:  !--- FIRST PART SEARCH --- ;
  38:  !ASSIGN INFEED PR BEFORE RUN ;
  39:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  40:  CALL SEARCH_R01    ;
  41:  PR[56,3:INFD TBD]=PR[10,3:infd search]    ;
  42:  JMP LBL[11] ;
  43:  LBL[10] ;
  44:  !--- DEPLETION CHECK --- ;
  45:  R[13:DEPLETED INFD]=PR[56,3:INFD TBD]    ;
  46:  IF R[13:DEPLETED INFD]<R[11:THRESHOLD],JMP LBL[99] ;
  47:  LBL[11] ;
  48:   ;
  49:  !INSERT PART PR ;
  50:  PR[2,3:OFFSET]=400    ;
  51:   ;
  52:L PR[56:INFD TBD] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  53:L PR[56:INFD TBD] 700mm/sec FINE    ;
  54:   ;
  55:  CALL ALL_VAC_ON_R01    ;
  56:  WAIT R[19:VAC SETTLE] ;
  57:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
  58:  PAYLOAD[2] ;
  59:   ;
  60:L PR[56:INFD TBD] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  61:   ;
  62:  !--- CLEAR INFEED --- ;
  63:  !TEACH: P[4..P[7] CLEAR INFD ;
  64:J P[4:INTMPT] 100% CNT100    ;
  65:J P[5:INTMPT] 100% CNT100    ;
  66:J P[6:INTMPT] 100% CNT100    ;
  67:L P[7:INTMPT] 1500mm/sec CNT100    ;
  68:   ;
  69:  !--- ZERO TABLE --- ;
  70:  UFRAME_NUM=2 ;
  71:   ;
  72:  !TEACH: P[8] ABOVE ZERO ;
  73:L P[8:ABOVE ZERO] 1500mm/sec FINE    ;
  74:  !TEACH: P[9] ON ZERO ;
  75:L P[9:ON ZERO] 1200mm/sec FINE    ;
  76:   ;
  77:  CALL ALL_VAC_OFF_R01    ;
  78:  PAYLOAD[1] ;
  79:   ;
  80:  !--- APPROACH PRESS --- ;
  81:  !TEACH: P[17] PRE-STAGE ;
  82:L P[17] 1500mm/sec CNT100    ;
  83:   ;
  84:  !--- INSERT --- ;
  85:  UFRAME_NUM=3 ;
  86:   ;
  87:  !TEACH: P[18] INSERT ;
  88:L P[18:INSERT] 500mm/sec FINE    ;
  89:   ;
  90:  !-- HOLD POSITION. OPERATOR: ;
  91:  !-- PINCH PART IN PRESS. ;
  92:  !-- RESUME TO RELEASE. -- ;
  93:  PAUSE ;
  94:   ;
  95:  !--- RELEASE & RETREAT --- ;
  96:  CALL ALL_VAC_OFF_R01    ;
  97:  PAYLOAD[1] ;
  98:   ;
  99:  !TEACH: P[23] STRAIGHT-UP RETRACT ;
 100:L P[23] 500mm/sec CNT100    ;
 101:   ;
 102:  UFRAME_NUM=0 ;
 103:  CALL GO_HOME_R01    ;
 104:   ;
 105:  !-- ROBOT CLEAR. OPERATOR: ;
 106:  !-- BEND PART MANUALLY. ;
 107:  !-- RESUME TO RETRIEVE. -- ;
 108:  PAUSE ;
 109:   ;
 110:  !--- RETRIEVE FINISHED --- ;
 111:  UFRAME_NUM=3 ;
 112:   ;
 113:  !TEACH: P[100] APPROACH ;
 114:L P[100:RETR APPROACH] 500mm/sec CNT100    ;
 115:  !TEACH: P[101] GRIP ;
 116:L P[101:RETR GRIP] 200mm/sec FINE    ;
 117:   ;
 118:  CALL ALL_VAC_ON_R01    ;
 119:  WAIT R[19:VAC SETTLE] ;
 120:  WAIT DI[30:PART DETECT]=ON TIMEOUT,LBL[90] ;
 121:  PAYLOAD[2] ;
 122:   ;
 123:  !TEACH: P[102] EXTRACT ;
 124:L P[102:RETR EXTRACT] 500mm/sec CNT100    ;
 125:   ;
 126:  !--- OUTFEED --- ;
 127:  UFRAME_NUM=4 ;
 128:  !OUTFEED POSITIONS NEED LIVE TEAC ;
 129:   ;
 130:  !TEACH: P[56] OUTFEED APPR ;
 131:L P[56] 1200mm/sec CNT100    ;
 132:  !TEACH: P[57] OUTFEED MID ;
 133:L P[57] 1200mm/sec CNT100    ;
 134:  !TEACH: P[58] OUTFEED OVER ;
 135:L P[58] 1500mm/sec CNT100    ;
 136:  !TEACH: P[59] OUTFEED DROP ;
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
 154:  PR[56,3:INFD TBD]=PR[56,3:INFD TBD]-R[12:THICKNESS]    ;
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
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[2:"ROTATE OVER PICK"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[3:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[4:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[5:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[6:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[7:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[8:"ABOVE ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[9:"ON ZERO"]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[17]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[18:"INSERT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[23]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
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
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[101:"RETR GRIP"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
P[102:"RETR EXTRACT"]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =     0.000  mm,	Y =     0.000  mm,	Z =   500.000  mm,
	W =   180.000 deg,	P =     0.000 deg,	R =     0.000 deg,
	E1=     0.000  mm
};
/END
