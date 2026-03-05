/PROG  GH_BIN
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Bin Prgm";
PROG_SIZE	= 2513;
CREATE		= DATE 26-01-19  TIME 15:30:32;
MODIFIED	= DATE 26-02-24  TIME 01:26:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 157;
MEMORY_SIZE	= 2909;
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
/MN
   1:  !BIN ;
   2:  UFRAME_NUM=1 ;
   3:  UTOOL_NUM=1 ;
   4:   ;
   5:  RO[1:spread eagle ]=OFF ;
   6:  RO[2:ALL MAGNETS]=OFF ;
   7:  RO[3:CLAMSHELL]=OFF ;
   8:  RO[4:VACUUM EXHAUST]=OFF ;
   9:  RO[5:VACUUM]=OFF ;
  10:  RO[6:SPREAD EAGLE VAC]=OFF ;
  11:   ;
  12:   ;
  13:  PR[10:LINEAR OFFSET]=PR[300:L_ZERO]    ;
  14:   ;
  15:   ;
  16:  !OVERFLOW CHECK ;
  17:  IF (R[103:BIN1_COUNT]>=R[15:BIN MAX]) THEN ;
  18:   ;
  19:  IF (R[104:BIN2_COUNT]>=R[15:BIN MAX]) THEN ;
  20:  GO[1:ERROR CODE]=101 ;
  21:  JMP LBL[100] ;
  22:   ;
  23:  ENDIF ;
  24:  ENDIF ;
  25:   ;
  26:  !PICK ;
  27:L P[1:APPROACH PART] 1500mm/sec FINE    ;
  28:   ;
  29:L PR[R[98]] 300mm/sec FINE    ;
  30:  RO[2:ALL MAGNETS]=ON ;
  31:   ;
  32:  WAIT   1.00(sec) ;
  33:   ;
  34:J P[1:APPROACH PART] 100% CNT100    ;
  35:   ;
  36:  !PLACE BIN 1 ;
  37:  UFRAME_NUM=20 ;
  38:  UFRAME[20:UF 7 HOLD]=PR[R[99]] ;
  39:   ;
  40:  PR[10,7:LINEAR OFFSET]=((R[2:SORT CODE]-1)*R[61:CART OFFSET]) ;
  41:   ;
  42:J P[2:INTMTN] 100% CNT100    ;
  43:   ;
  44:J P[3:IN FRONT OF CART] 100% FINE Offset,PR[10:LINEAR OFFSET]    ;
  45:   ;
  46:  !SAFETY CHECK CART ;
  47:  IF (DI[R[96]]) THEN ;
  48:  GO[1:ERROR CODE]=102 ;
  49:  WAIT    .25(sec) ;
  50:  GO[1:ERROR CODE]=0 ;
  51:  WAIT DI[R[96]]=ON    ;
  52:  ENDIF ;
  53:   ;
  54:L PR[94:BIN 1 PLACE] 1000mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  55:   ;
  56:L P[3:IN FRONT OF CART] 1000mm/sec FINE    ;
  57:   ;
  58:  CALL GO_ZERO    ;
  59:  JMP LBL[100] ;
  60:   ;
  61:  !BIN 2-------------------- ;
  62:   ;
  63:  LBL[1] ;
  64:  !PICK ;
  65:L P[1:APPROACH PART] 1500mm/sec FINE    ;
  66:   ;
  67:L PR[R[98]] 300mm/sec FINE    ;
  68:  RO[2:ALL MAGNETS]=ON ;
  69:   ;
  70:  WAIT   1.00(sec) ;
  71:   ;
  72:J P[1:APPROACH PART] 100% CNT100    ;
  73:   ;
  74:   ;
  75:  !PLACE BIN 2 ;
  76:  UFRAME_NUM=20 ;
  77:  UFRAME[20:UF 7 HOLD]=PR[R[99]] ;
  78:   ;
  79:  PR[10,7:LINEAR OFFSET]=((R[2:SORT CODE]-1)*R[61:CART OFFSET]) ;
  80:   ;
  81:J P[3:IN FRONT OF CART] 100% FINE Offset,PR[10:LINEAR OFFSET]    ;
  82:   ;
  83:  !SAFETY CHECK CART ;
  84:  IF (DI[R[96]]) THEN ;
  85:  GO[1:ERROR CODE]=102 ;
  86:  WAIT    .25(sec) ;
  87:  GO[1:ERROR CODE]=0 ;
  88:  WAIT DI[R[96]]=ON    ;
  89:  ENDIF ;
  90:   ;
  91:L PR[95:BIN 2 PLACE] 1000mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  92:   ;
  93:L P[5:IN FRONT OF CART] 1000mm/sec FINE    ;
  94:   ;
  95:  CALL GO_ZERO    ;
  96:   ;
  97:   ;
  98:   ;
  99:   ;
 100:   ;
 101:   ;
 102:   ;
 103:   ;
 104:   ;
 105:   ;
 106:   ;
 107:   ;
 108:   ;
 109:   ;
 110:   ;
 111:   ;
 112:   ;
 113:   ;
 114:   ;
 115:   ;
 116:   ;
 117:   ;
 118:   ;
 119:   ;
 120:   ;
 121:   ;
 122:   ;
 123:   ;
 124:   ;
 125:   ;
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
 140:   ;
 141:   ;
 142:   ;
 143:   ;
 144:   ;
 145:   ;
 146:   ;
 147:   ;
 148:   ;
 149:   ;
 150:   ;
 151:   ;
 152:   ;
 153:   ;
 154:  LBL[100] ;
 155:   ;
 156:   ;
 157:   ;
/POS
P[1:"APPROACH PART"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   281.615  mm,	Y =  1444.176  mm,	Z =   302.577  mm,
	W =    -1.116 deg,	P =    -1.721 deg,	R =    -5.442 deg,
	E1=   -41.988  mm
};
P[2:"INTMTN"]{
   GP1:
	UF : 20, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -253.134  mm,	Y =  1132.019  mm,	Z =   796.107  mm,
	W =     -.260 deg,	P =     1.414 deg,	R =  -114.053 deg,
	E1= -1316.533  mm
};
P[3:"IN FRONT OF CART"]{
   GP1:
	UF : 20, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   173.569  mm,	Y =   589.156  mm,	Z =   787.875  mm,
	W =    19.632 deg,	P =     4.251 deg,	R =   -93.248 deg,
	E1= -1219.674  mm
};
P[5:"IN FRONT OF CART"]{
   GP1:
	UF : 13, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2067.718  mm,	Y = -1676.182  mm,	Z = -1907.991  mm,
	W =  -147.194 deg,	P =    82.686 deg,	R =  -137.223 deg,
	E1=    -6.572  mm
};
/END
