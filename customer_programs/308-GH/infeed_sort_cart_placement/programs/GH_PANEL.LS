/PROG  GH_PANEL
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Cart Panel Prgm";
PROG_SIZE	= 1864;
CREATE		= DATE 26-01-19  TIME 15:31:48;
MODIFIED	= DATE 26-02-24  TIME 05:21:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 82;
MEMORY_SIZE	= 2304;
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
   1:  !PANEL ;
   2:  UFRAME_NUM=1 ;
   3:  UTOOL_NUM=3 ;
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
  14:  !OVERFLOW CHECK ;
  15:  IF (R[102:PANEL_COUNT]) THEN ;
  16:  GO[1:ERROR CODE]=101 ;
  17:  JMP LBL[100] ;
  18:  ENDIF ;
  19:   ;
  20:  !PICK SECTION-------------------- ;
  21:J P[1:ABOVE INFEED] 100% FINE    ;
  22:   ;
  23:  IF (F[10:SMALL FOAM]=ON),JMP LBL[10] ;
  24:   ;
  25:   ;
  26:  RO[1:spread eagle ]=ON ;
  27:  WAIT   1.00(sec) ;
  28:   ;
  29:   ;
  30:  LBL[10] ;
  31:  F[10:SMALL FOAM]=(OFF) ;
  32:L PR[R[98]] 100mm/sec FINE    ;
  33:   ;
  34:  RO[5:VACUUM]=ON ;
  35:  WAIT   3.00(sec) ;
  36:   ;
  37:J P[1:ABOVE INFEED] 100% FINE    ;
  38:   ;
  39:   ;
  40:  !PLACE SECTION------------------- ;
  41:  UFRAME_NUM=19 ;
  42:  UFRAME[19:UF 13 HOLD]=PR[R[99]] ;
  43:  //    ;
  44:  !CART OFFSET ;
  45:  PR[10,7:LINEAR OFFSET]=(R[61:CART OFFSET]*(R[2:SORT CODE]-1)) ;
  46:   ;
  47:  !MOVE TO CART ;
  48:J P[3:IN FRONT OF CART] 100% FINE Offset,PR[10:LINEAR OFFSET]    ;
  49:   ;
  50:  !SAFETY CHECK CART ;
  51:  IF (DI[R[96]]) THEN ;
  52:  GO[1:ERROR CODE]=102 ;
  53:  WAIT    .25(sec) ;
  54:  GO[1:ERROR CODE]=0 ;
  55:  WAIT DI[R[96]]=ON    ;
  56:  ENDIF ;
  57:   ;
  58:L P[2:ABOVE CART] 500mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  59:   ;
  60:  !PANEL OFFSET ;
  61:  PR[10,3:LINEAR OFFSET]=(PR[R[98],1]+((R[102:PANEL_COUNT]-1)*(-17.37))) ;
  62:   ;
  63:  PR[10,2:LINEAR OFFSET]=(47.74*(R[102:PANEL_COUNT]-1)) ;
  64:   ;
  65:L PR[100:PANEL PLACE ] 100mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  66:  RO[5:VACUUM]=OFF ;
  67:  WAIT   1.00(sec) ;
  68:   ;
  69:  R[R[92]]=R[R[92]]+1    ;
  70:   ;
  71:  !OUT OF CART ;
  72:  PR[10,2:LINEAR OFFSET]=0    ;
  73:   ;
  74:L P[2:ABOVE CART] 100mm/sec FINE Offset,PR[10:LINEAR OFFSET]    ;
  75:   ;
  76:  RO[1:spread eagle ]=OFF ;
  77:   ;
  78:L P[3:IN FRONT OF CART] 3000mm/sec CNT100 Offset,PR[10:LINEAR OFFSET]    ;
  79:   ;
  80:  CALL GO_ZERO    ;
  81:   ;
  82:  LBL[100] ;
/POS
P[1:"ABOVE INFEED"]{
   GP1:
	UF : 1, UT : 3,		CONFIG : 'N U T, 0, 0, 0',
	X =  1043.466  mm,	Y =   754.967  mm,	Z =   345.682  mm,
	W =   176.703 deg,	P =     -.726 deg,	R =    -1.145 deg,
	E1=   -10.358  mm
};
P[2:"ABOVE CART"]{
   GP1:
	UF : 19, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X =   687.319  mm,	Y =   475.074  mm,	Z =  -311.000  mm,
	W =  -172.164 deg,	P =   -86.228 deg,	R =   -95.932 deg,
	E1= -1496.295  mm
};
P[3:"IN FRONT OF CART"]{
   GP1:
	UF : 19, UT : 3,		CONFIG : 'N U T, 0, 0, -1',
	X = -1226.446  mm,	Y =   414.581  mm,	Z =   542.453  mm,
	W =   178.768 deg,	P =   -75.981 deg,	R =   -86.908 deg,
	E1= -2662.747  mm
};
/END
