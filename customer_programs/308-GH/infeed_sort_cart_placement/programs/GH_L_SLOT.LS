/PROG  GH_L_SLOT
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Extended Slot Po";
PROG_SIZE	= 3000;
CREATE		= DATE 26-01-27  TIME 14:23:00;
MODIFIED	= DATE 26-02-24  TIME 03:48:18;
FILE_NAME	= GH_L_SLO;
VERSION		= 0;
LINE_COUNT	= 139;
MEMORY_SIZE	= 3468;
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
LOCAL_REGISTERS	= 0,0,0;
/APPL
/MN
   1:  !L_SLOT ;
   2:  UFRAME_NUM=2 ;
   3:  UTOOL_NUM=4 ;
   4:  CALL GO_ZERO    ;
   5:  RO[1:spread eagle ]=OFF ;
   6:  RO[2:ALL MAGNETS]=OFF ;
   7:  RO[3:CLAMSHELL]=OFF ;
   8:  RO[4:VACUUM EXHAUST]=OFF ;
   9:  RO[5:VACUUM]=OFF ;
  10:  RO[6:SPREAD EAGLE VAC]=OFF ;
  11:   ;
  12:  PR[10:LINEAR OFFSET]=PR[300:L_ZERO]    ;
  13:   ;
  14:  CALL GO_ZERO    ;
  15:   ;
  16:  !OVERFLOW CHECK ;
  17:  IF (R[100:L_SLOT_COUNT]>=R[31:MAX L_SLOT]) THEN ;
  18:  GO[1:ERROR CODE]=101 ;
  19:  JMP LBL[100] ;
  20:  ENDIF ;
  21:   ;
  22:  !PICK_OFFSET--------------------- ;
  23:  PR[10:LINEAR OFFSET]=PR[300:L_ZERO]    ;
  24:   ;
  25:  IF (R[4:LENGTH_CLASS]=1) THEN ;
  26:  PR[10,1:LINEAR OFFSET]=0    ;
  27:  ENDIF ;
  28:   ;
  29:  IF (R[4:LENGTH_CLASS]=2) THEN ;
  30:  PR[10,1:LINEAR OFFSET]=298.45    ;
  31:  ENDIF ;
  32:   ;
  33:  IF (R[4:LENGTH_CLASS]=3) THEN ;
  34:  PR[10,1:LINEAR OFFSET]=605    ;
  35:  ENDIF ;
  36:   ;
  37:  IF (R[4:LENGTH_CLASS]=4) THEN ;
  38:  PR[10,2:LINEAR OFFSET]=895.349    ;
  39:  ENDIF ;
  40:   ;
  41:  !PICK SECTION-------------------- ;
  42:  UFRAME_NUM=2 ;
  43:  UTOOL_NUM=4 ;
  44:   ;
  45:   ;
  46:J P[2:APPROACH PICK] 100% FINE Offset,PR[10:LINEAR OFFSET]    ;
  47:   ;
  48:L PR[R[98]] 700mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  49:   ;
  50:  RO[3:CLAMSHELL]=ON ;
  51:   ;
  52:L P[4:LIFT] 700mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  53:   ;
  54:   ;
  55:J P[5:CENTER AND ORIENT] 100% FINE    ;
  56:   ;
  57:   ;
  58:  !PLACE OFFSET-------------------- ;
  59:  !HEIGHT OFFSET ;
  60:  PR[10:LINEAR OFFSET]=PR[300:L_ZERO]    ;
  61:   ;
  62:  IF (R[4:LENGTH_CLASS]=1) THEN ;
  63:  PR[10,3:LINEAR OFFSET]=0    ;
  64:  ENDIF ;
  65:   ;
  66:  IF (R[4:LENGTH_CLASS]=2) THEN ;
  67:  PR[10,3:LINEAR OFFSET]=200    ;
  68:  ENDIF ;
  69:   ;
  70:  IF (R[4:LENGTH_CLASS]=3) THEN ;
  71:  PR[10,3:LINEAR OFFSET]=400    ;
  72:  ENDIF ;
  73:   ;
  74:  IF (R[4:LENGTH_CLASS]=4) THEN ;
  75:  PR[10,3:LINEAR OFFSET]=600    ;
  76:  ENDIF ;
  77:   ;
  78:  !CART OFFSET ;
  79:  PR[10,7:LINEAR OFFSET]=(R[61:CART OFFSET]*(R[2:SORT CODE]-1)) ;
  80:   ;
  81:   ;
  82:  !PLACE SECTION------------------- ;
  83:  UFRAME_NUM=19 ;
  84:  UFRAME[19:UF 13 HOLD]=PR[R[99]] ;
  85:   ;
  86:J P[1:IN FRONT OF CART] 100% FINE Offset,PR[10:LINEAR OFFSET]    ;
  87:   ;
  88:  !SAFETY CHECK CART ;
  89:  IF (DI[R[96]]) THEN ;
  90:  GO[1:ERROR CODE]=102 ;
  91:  WAIT    .25(sec) ;
  92:  GO[1:ERROR CODE]=0 ;
  93:  WAIT DI[R[96]]=ON    ;
  94:  ENDIF ;
  95:   ;
  96:  !SLOT OFFSET ;
  97:  PR[10,1:LINEAR OFFSET]=R[100:L_SLOT_COUNT]*R[60:SLOT_OFFSET]    ;
  98:   ;
  99:L P[8:APPROACH SLOT] 1000mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
 100:   ;
 101:  PR[10,3:LINEAR OFFSET]=0    ;
 102:   ;
 103:L P[9:PLACE] 350mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
 104:   ;
 105:  RO[3:CLAMSHELL]=OFF ;
 106:   ;
 107:  R[R[90]]=R[R[90]]+1    ;
 108:   ;
 109:   ;
 110:  !OUT OF CART--------------------- ;
 111:L P[8:APPROACH SLOT] 350mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
 112:L P[10:OFF OF PART] 3000mm/sec CNT100 Offset,PR[10:LINEAR OFFSET]    ;
 113:  !ZERO SLOT OFFSET ;
 114:  PR[10,1:LINEAR OFFSET]=0    ;
 115:   ;
 116:L P[7:IN FRONT OF CART] 1000mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
 117:   ;
 118:  !CALL GO_ZERO ;
 119:  CALL GO_ZERO    ;
 120:   ;
 121:   ;
 122:   ;
 123:   ;
 124:   ;
 125:  LBL[100] ;
 126:   ;
 127:   ;
 128:   ;
 129:   ;
 130:   ;
 131:   ;
 132:   ;
 133:   ;
 134:   ;
 135:   ;
 136:   ;
 137:   ;
 138:   ;
 139:   ;
/POS
P[1:"IN FRONT OF CART"]{
   GP1:
	UF : 19, UT : 4,		CONFIG : 'F U T, 0, 0, -1',
	X =  -559.651  mm,	Y =    76.859  mm,	Z =   945.898  mm,
	W =   -88.550 deg,	P =    -8.712 deg,	R =     2.422 deg,
	E1= -1745.997  mm
};
P[2:"APPROACH PICK"]{
   GP1:
	UF : 2, UT : 4,		CONFIG : 'F U T, 0, 0, 0',
	X =   303.918  mm,	Y =   -94.915  mm,	Z =   474.953  mm,
	W =   179.875 deg,	P =     1.691 deg,	R =   -90.627 deg,
	E1=     1.928  mm
};
P[4:"LIFT"]{
   GP1:
	UF : 2, UT : 4,		CONFIG : 'F U T, 0, 0, 0',
	X =   301.163  mm,	Y =   -82.806  mm,	Z =   477.879  mm,
	W =  -179.743 deg,	P =   -30.092 deg,	R =   -90.722 deg,
	E1=      .949  mm
};
P[5:"CENTER AND ORIENT"]{
   GP1:
	UF : 2, UT : 4,		CONFIG : 'F U T, 0, 0, -1',
	X =  1047.771  mm,	Y =  1786.090  mm,	Z =  1841.010  mm,
	W =   -94.103 deg,	P =    18.176 deg,	R =    -1.870 deg,
	E1= -1234.032  mm
};
P[7:"IN FRONT OF CART"]{
   GP1:
	UF : 19, UT : 4,		CONFIG : 'F U T, 0, 0, -1',
	X =  -513.220  mm,	Y =   -84.572  mm,	Z =   418.749  mm,
	W =   -88.186 deg,	P =     -.066 deg,	R =     2.394 deg,
	E1= -1546.251  mm
};
P[8:"APPROACH SLOT"]{
   GP1:
	UF : 19, UT : 4,		CONFIG : 'F U T, 0, 0, 0',
	X =  1330.353  mm,	Y =    44.002  mm,	Z =   418.757  mm,
	W =   -88.186 deg,	P =     -.066 deg,	R =     2.394 deg,
	E1= -1124.719  mm
};
P[9:"PLACE"]{
   GP1:
	UF : 19, UT : 4,		CONFIG : 'F U T, 0, 0, 0',
	X =  1330.354  mm,	Y =    44.002  mm,	Z =   147.328  mm,
	W =   -88.186 deg,	P =     -.066 deg,	R =     2.394 deg,
	E1= -1124.719  mm
};
P[10:"OFF OF PART"]{
   GP1:
	UF : 19, UT : 4,		CONFIG : 'F U T, 0, 0, -1',
	X =  1330.351  mm,	Y =  -117.189  mm,	Z =   418.756  mm,
	W =   -88.186 deg,	P =     -.066 deg,	R =     2.394 deg,
	E1= -1124.719  mm
};
/END
