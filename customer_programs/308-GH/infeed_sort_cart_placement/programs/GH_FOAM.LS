/PROG  GH_FOAM
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Foam Prgm";
PROG_SIZE	= 1949;
CREATE		= DATE 26-01-19  TIME 15:33:20;
MODIFIED	= DATE 26-02-24  TIME 05:20:20;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 124;
MEMORY_SIZE	= 2349;
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
   1:  !L_SLOT ;
   2:  UFRAME_NUM=1 ;
   3:  UTOOL_NUM=5 ;
   4:  CALL GO_ZERO    ;
   5:  RO[1:spread eagle ]=OFF ;
   6:  RO[2:ALL MAGNETS]=OFF ;
   7:  RO[3:CLAMSHELL]=OFF ;
   8:  RO[4:VACUUM EXHAUST]=OFF ;
   9:  RO[5:VACUUM]=OFF ;
  10:  RO[6:SPREAD EAGLE VAC]=OFF ;
  11:   ;
  12:   ;
  13:  UFRAME_NUM=1 ;
  14:  UTOOL_NUM=3 ;
  15:   ;
  16:   ;
  17:  !PICK SECTION-------------------- ;
  18:J P[1:ABOVE INFEED] 100% CNT100    ;
  19:  IF (F[10:SMALL FOAM]=ON),JMP LBL[10] ;
  20:   ;
  21:   ;
  22:   ;
  23:  RO[1:spread eagle ]=ON ;
  24:  WAIT   1.00(sec) ;
  25:   ;
  26:  LBL[10] ;
  27:  F[10:SMALL FOAM]=(OFF) ;
  28:   ;
  29:L P[2:above part] 1500mm/sec CNT100    ;
  30:   ;
  31:L PR[R[98]] 100mm/sec FINE    ;
  32:   ;
  33:  RO[1:spread eagle ]=ON ;
  34:  WAIT   1.00(sec) ;
  35:   ;
  36:J P[1:ABOVE INFEED] 100% FINE    ;
  37:   ;
  38:   ;
  39:  !PLACE SECTION------------------- ;
  40:  UFRAME_NUM=21 ;
  41:  UFRAME[21:UF 3 HOLD]=PR[R[99]] ;
  42:   ;
  43:  PR[10,1:LINEAR OFFSET]=PR[R[98],1]    ;
  44:   ;
  45:  PR[10,3:LINEAR OFFSET]=200    ;
  46:   ;
  47:  R[95:FOAM_REG]=R[2:SORT CODE]+95    ;
  48:   ;
  49:J PR[R[95]] 100% CNT100 Offset,PR[10:LINEAR OFFSET]    ;
  50:   ;
  51:  !CLEAR CHECK ;
  52:  LBL[1] ;
  53:  IF (DI[R[96]]=OFF) THEN ;
  54:  WAIT DI[R[96]]=ON    ;
  55:  WAIT  15.00(sec) ;
  56:  ENDIF ;
  57:   ;
  58:  PR[10,3:LINEAR OFFSET]=0    ;
  59:   ;
  60:L PR[R[95]] 100mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  61:  RO[5:VACUUM]=OFF ;
  62:  WAIT   1.00(sec) ;
  63:   ;
  64:  PR[10,3:LINEAR OFFSET]=200    ;
  65:   ;
  66:L PR[R[95]] 100mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  67:   ;
  68:   ;
  69:  CALL GO_ZERO    ;
  70:   ;
  71:   ;
  72:   ;
  73:   ;
  74:   ;
  75:   ;
  76:   ;
  77:   ;
  78:   ;
  79:   ;
  80:   ;
  81:   ;
  82:   ;
  83:   ;
  84:   ;
  85:   ;
  86:   ;
  87:   ;
  88:   ;
  89:   ;
  90:   ;
  91:   ;
  92:   ;
  93:   ;
  94:   ;
  95:   ;
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
/POS
P[1:"ABOVE INFEED"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, -1, 1',
	X =   775.876  mm,	Y =  1264.172  mm,	Z =   970.108  mm,
	W =  -179.012 deg,	P =      .091 deg,	R =     2.006 deg,
	E1=  -171.179  mm
};
P[2:"above part"]{
   GP1:
	UF : 1, UT : 5,		CONFIG : 'N U T, 0, -1, 1',
	X =  1119.881  mm,	Y =  1203.697  mm,	Z =   557.838  mm,
	W =  -124.097 deg,	P =    26.582 deg,	R =  -104.276 deg,
	E1=  -171.179  mm
};
/END
