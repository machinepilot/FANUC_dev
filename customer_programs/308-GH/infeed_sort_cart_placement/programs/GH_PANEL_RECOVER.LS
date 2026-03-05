/PROG  GH_PANEL_RECOVER
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1559;
CREATE		= DATE 26-02-20  TIME 14:52:04;
MODIFIED	= DATE 26-02-20  TIME 15:57:22;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 104;
MEMORY_SIZE	= 2031;
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
   1:  !PANEL RECOVER ;
   2:  PR[10:LINEAR OFFSET]=PR[300:L_ZERO]    ;
   3:  PR[11:JOINT OFFSET]=PR[299:J_ZERO]    ;
   4:   ;
   5:  !RECOVER FROM CART ;
   6:  IF (DI[129:CART 1 ZONE]=OFF OR DI[130:CART 2 ZONE]=OFF) THEN ;
   7:   ;
   8:  PR[10:LINEAR OFFSET]=LPOS    ;
   9:   ;
  10:  PR[10,1:LINEAR OFFSET]=Constant    ;
  11:  PR[10,3:LINEAR OFFSET]=Constant    ;
  12:L PR[10:LINEAR OFFSET] 100mm/sec FINE    ;
  13:   ;
  14:  PR[10,1:LINEAR OFFSET]=Constant    ;
  15:L PR[10:LINEAR OFFSET] 100mm/sec FINE    ;
  16:   ;
  17:J P[1:ABOVE INFEED] 100% CNT100    ;
  18:  JMP LBL[100] ;
  19:  ENDIF ;
  20:   ;
  21:  !RECOVER FROM TRANSIT ;
  22:J P[2:ABOVE INFEED] 100% CNT100    ;
  23:   ;
  24:   ;
  25:   ;
  26:   ;
  27:   ;
  28:   ;
  29:   ;
  30:   ;
  31:   ;
  32:   ;
  33:   ;
  34:   ;
  35:   ;
  36:   ;
  37:   ;
  38:   ;
  39:   ;
  40:   ;
  41:   ;
  42:   ;
  43:   ;
  44:   ;
  45:   ;
  46:   ;
  47:   ;
  48:   ;
  49:   ;
  50:   ;
  51:   ;
  52:   ;
  53:   ;
  54:   ;
  55:   ;
  56:   ;
  57:   ;
  58:   ;
  59:   ;
  60:   ;
  61:   ;
  62:   ;
  63:   ;
  64:   ;
  65:   ;
  66:   ;
  67:   ;
  68:   ;
  69:   ;
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
 101:  LBL[100] ;
 102:   ;
 103:   ;
 104:   ;
/POS
P[1:"ABOVE INFEED"]{
   GP1:
	UF : 13, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2067.718  mm,	Y = -1676.182  mm,	Z = -1907.991  mm,
	W =  -147.194 deg,	P =    82.686 deg,	R =  -137.223 deg,
	E1=    -6.572  mm
};
P[2:"ABOVE INFEED"]{
   GP1:
	UF : 13, UT : 2,		CONFIG : 'F U T, 0, 0, 0',
	X =  2067.718  mm,	Y = -1676.182  mm,	Z = -1907.991  mm,
	W =  -147.194 deg,	P =    82.686 deg,	R =  -137.223 deg,
	E1=    -6.572  mm
};
/END
