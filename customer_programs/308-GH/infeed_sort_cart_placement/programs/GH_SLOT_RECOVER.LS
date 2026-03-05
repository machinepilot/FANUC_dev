/PROG  GH_SLOT_RECOVER
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2142;
CREATE		= DATE 26-01-29  TIME 06:40:44;
MODIFIED	= DATE 26-01-29  TIME 07:23:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 140;
MEMORY_SIZE	= 2598;
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
   1:  !SLOT RECOVERY------------------- ;
   2:   ;
   3:  PR[10:LINEAR OFFSET]=PR[300:L_ZERO]    ;
   4:  PR[11:JOINT OFFSET]=PR[299:J_ZERO]    ;
   5:   ;
   6:  !RECOVER FROM CART ;
   7:  IF (DI[129:CART 1 ZONE]=OFF OR DI[130:CART 2 ZONE]=OFF),JMP LBL[1] ;
   8:   ;
   9:   ;
  10:  !OUT OF INFEED ;
  11:  IF DI[135]=OFF,JMP LBL[2] ;
  12:   ;
  13:   ;
  14:  !OUT OF TRANSIT ;
  15:  PR[11:JOINT OFFSET]=JPOS    ;
  16:  PR[11,1:JOINT OFFSET]=0    ;
  17:  PR[11,2:JOINT OFFSET]=0    ;
  18:  PR[11,3:JOINT OFFSET]=0    ;
  19:   ;
  20:J PR[11:JOINT OFFSET] 100% CNT100    ;
  21:  PR[10,7:LINEAR OFFSET]=0    ;
  22:   ;
  23:J PR[11:JOINT OFFSET] 100% CNT100    ;
  24:   ;
  25:  !OUT OF CART-------------------- ;
  26:  LBL[1] ;
  27:  UFRAME[13:outfeed cart]=PR[R[99]] ;
  28:  PR[10:LINEAR OFFSET]=LPOS    ;
  29:   ;
  30:  !UPWARDS OFFSET ;
  31:  PR[10,1:LINEAR OFFSET]=1000    ;
  32:   ;
  33:L PR[10:LINEAR OFFSET] 100mm/sec FINE    ;
  34:   ;
  35:  !OUTWARDS OFFSET ;
  36:  PR[10,2:LINEAR OFFSET]=(-1500)    ;
  37:  !J7 OFFSET ;
  38:  PR[10,7:LINEAR OFFSET]=PR[10,7:LINEAR OFFSET]-500    ;
  39:   ;
  40:L PR[10:LINEAR OFFSET] 100mm/sec FINE    ;
  41:   ;
  42:  !CLEAR BAY ;
  43:   ;
  44:   ;
  45:  PR[11,1:JOINT OFFSET]=0    ;
  46:  PR[11,2:JOINT OFFSET]=0    ;
  47:  PR[11,3:JOINT OFFSET]=0    ;
  48:   ;
  49:J PR[11:JOINT OFFSET] 100% CNT100    ;
  50:   ;
  51:  !RETURN TO INFEED ;
  52:J PR[3:ACP_ABOVE_IF] 100% CNT100    ;
  53:  JMP LBL[100] ;
  54:   ;
  55:   ;
  56:   ;
  57:  !RETURN FROM INFEED-------------- ;
  58:  LBL[2] ;
  59:  PR[10:LINEAR OFFSET]=LPOS    ;
  60:  PR[10,2:LINEAR OFFSET]=750    ;
  61:   ;
  62:L PR[10:LINEAR OFFSET] 500mm/sec FINE    ;
  63:   ;
  64:J P[1:ORIENT] 100% CNT100    ;
  65:   ;
  66:J PR[3:ACP_ABOVE_IF] 100% FINE    ;
  67:  ENDIF ;
  68:   ;
  69:   ;
  70:   ;
  71:  LBL[100] ;
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
/POS
P[1:"ORIENT"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =  1352.695  mm,	Y =  1094.771  mm,	Z =  1268.480  mm,
	W =  -159.882 deg,	P =     4.380 deg,	R =    69.672 deg,
	E1=     5.000  mm
};
/END
