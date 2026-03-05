/PROG  CHANGE_TOOLS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2605;
CREATE		= DATE 25-09-11  TIME 14:17:26;
MODIFIED	= DATE 25-11-11  TIME 15:07:22;
FILE_NAME	= GO_ZERO;
VERSION		= 0;
LINE_COUNT	= 125;
MEMORY_SIZE	= 3017;
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
LOCAL_REGISTERS	= 0,0,0;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;

LINE_TRACK;
  LINE_TRACK_SCHEDULE_NUMBER      : 0;
  LINE_TRACK_BOUNDARY_NUMBER      : 0;
  CONTINUE_TRACK_AT_PROG_END      : TRUE;

/MN
   1:  UTOOL_NUM=R[5:Current Tool] ;
   2:  UFRAME_NUM=7 ;
   3:  OVERRIDE=R[50:Speed Override] ;
   4:   ;
   5:  IF (R[5:Current Tool]<1 OR R[5:Current Tool]>2 OR R[13:Tool Required]<1 OR R[13:Tool Required]>2),JMP LBL[4] ;
   6:   ;
   7:   ;
   8:  IF DO[26:AT HOME]=OFF,CALL GO_HOME ;
   9:   ;
  10:  UFRAME_NUM=7 ;
  11:   ;
  12:  IF (R[5:Current Tool]=1) THEN ;
  13:J P[1:Transition to Rack] 50% CNT50    ;
  14:  ELSE ;
  15:J P[6:Tool 2 Transition to Rack] 50% CNT50    ;
  16:  ENDIF ;
  17:   ;
  18:  SELECT R[13:Tool Required]=1,JMP LBL[1] ;
  19:         =2,JMP LBL[2] ;
  20:   ;
  21:  !Change to Tool 1 ;
  22:  LBL[1] ;
  23:  UTOOL_NUM=2 ;
  24:   ;
  25:  IF R[5:Current Tool]=R[13:Tool Required],JMP LBL[3] ;
  26:   ;
  27:L P[7:Move Away from Rack] 2000mm/sec CNT25    ;
  28:   ;
  29:L P[4:Approach/Exit 2] 1500mm/sec CNT50    ;
  30:   ;
  31:L P[5:Tool 2 Position] 700mm/sec FINE    ;
  32:   ;
  33:  DO[120:Authorize Tool Unlock]=ON ;
  34:   ;
  35:  WAIT   1.00(sec) ;
  36:   ;
  37:  CALL TOOL_UNLOCK    ;
  38:   ;
  39:  WAIT   1.00(sec) ;
  40:   ;
  41:L P[4:Approach/Exit 2] 500mm/sec FINE    ;
  42:   ;
  43:  UTOOL_NUM=1 ;
  44:   ;
  45:L P[2:Approach/Exit 1] 1500mm/sec FINE    ;
  46:   ;
  47:L P[3:Tool 1 Position] 500mm/sec FINE    ;
  48:   ;
  49:  WAIT   1.00(sec) ;
  50:   ;
  51:  CALL TOOL_LOCK    ;
  52:   ;
  53:  WAIT   1.00(sec) ;
  54:   ;
  55:  DO[120:Authorize Tool Unlock]=OFF ;
  56:   ;
  57:L P[2:Approach/Exit 1] 700mm/sec FINE    ;
  58:   ;
  59:J P[1:Transition to Rack] 50% CNT50    ;
  60:   ;
  61:  R[5:Current Tool]=1    ;
  62:   ;
  63:  !End of Change to Tool 1 ;
  64:  JMP LBL[3] ;
  65:   ;
  66:  !Change to Tool 2 Sequence ;
  67:  LBL[2] ;
  68:   ;
  69:  UTOOL_NUM=1 ;
  70:   ;
  71:  IF R[5:Current Tool]=R[13:Tool Required],JMP LBL[3] ;
  72:   ;
  73:L P[2:Approach/Exit 1] 1500mm/sec CNT50    ;
  74:   ;
  75:L P[3:Tool 1 Position] 700mm/sec FINE    ;
  76:   ;
  77:  DO[120:Authorize Tool Unlock]=ON ;
  78:   ;
  79:  WAIT   1.00(sec) ;
  80:   ;
  81:  CALL TOOL_UNLOCK    ;
  82:   ;
  83:  WAIT   1.00(sec) ;
  84:   ;
  85:L P[2:Approach/Exit 1] 500mm/sec FINE    ;
  86:   ;
  87:  UTOOL_NUM=2 ;
  88:   ;
  89:L P[4:Approach/Exit 2] 1500mm/sec FINE    ;
  90:   ;
  91:L P[5:Tool 2 Position] 500mm/sec FINE    ;
  92:   ;
  93:  WAIT   1.00(sec) ;
  94:   ;
  95:  CALL TOOL_LOCK    ;
  96:   ;
  97:  WAIT   1.00(sec) ;
  98:   ;
  99:  DO[120:Authorize Tool Unlock]=OFF ;
 100:   ;
 101:L P[4:Approach/Exit 2] 700mm/sec FINE    ;
 102:   ;
 103:L P[7:Move Away from Rack] 2000mm/sec CNT25    ;
 104:   ;
 105:J P[6:Tool 2 Transition to Rack] 50% CNT50    ;
 106:   ;
 107:  R[5:Current Tool]=2    ;
 108:   ;
 109:  !End of Change to Tool 2 ;
 110:  JMP LBL[3] ;
 111:   ;
 112:  LBL[4] ;
 113:   ;
 114:  UALM[4] ;
 115:   ;
 116:  ABORT ;
 117:   ;
 118:  LBL[3] ;
 119:   ;
 120:  IF (R[5:Current Tool]=1) THEN ;
 121:J P[1:Transition to Rack] 50% CNT50    ;
 122:  ELSE ;
 123:J P[6:Tool 2 Transition to Rack] 50% CNT50    ;
 124:  ENDIF ;
 125:   ;
/POS
P[1:"Transition to Rack"]{
   GP1:
	UF : 7, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   216.860  mm,	Y = -1383.094  mm,	Z =  2512.141  mm,
	W =  -108.939 deg,	P =    -3.711 deg,	R =    91.216 deg,
	E1=  2054.447  mm
};
P[2:"Approach/Exit 1"]{
   GP1:
	UF : 7, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   494.313  mm,	Y =    18.540  mm,	Z =   230.332  mm,
	W =  -180.000 deg,	P =     -.162 deg,	R =      .050 deg,
	E1=   527.900  mm
};
P[3:"Tool 1 Position"]{
   GP1:
	UF : 7, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   494.332  mm,	Y =    18.522  mm,	Z =    26.830  mm,
	W =  -180.000 deg,	P =     -.164 deg,	R =      .050 deg,
	E1=   527.900  mm
};
P[4:"Approach/Exit 2"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    39.278  mm,	Y =    19.419  mm,	Z =   279.139  mm,
	W =  -179.998 deg,	P =      .285 deg,	R =      .050 deg,
	E1=   527.897  mm
};
P[5:"Tool 2 Position"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =    39.298  mm,	Y =    19.431  mm,	Z =  -126.490  mm,
	W =  -179.998 deg,	P =      .283 deg,	R =      .050 deg,
	E1=   527.897  mm
};
P[6:"Tool 2 Transition to Rack"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   217.268  mm,	Y = -2092.600  mm,	Z =  2508.913  mm,
	W =  -108.939 deg,	P =    -3.711 deg,	R =    91.216 deg,
	E1=  2763.962  mm
};
P[7:"Move Away from Rack"]{
   GP1:
	UF : 7, UT : 2,		CONFIG : 'N U T, 0, 0, 0',
	X =   107.167  mm,	Y =  -868.334  mm,	Z =   376.007  mm,
	W =  -179.998 deg,	P =      .285 deg,	R =      .050 deg,
	E1=  1415.238  mm
};
/END
