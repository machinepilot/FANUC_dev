/PROG  INFEED_PICK_4
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2619;
CREATE		= DATE 25-02-10  TIME 19:52:52;
MODIFIED	= DATE 25-03-27  TIME 08:13:58;
FILE_NAME	= INFEED_P;
VERSION		= 0;
LINE_COUNT	= 121;
MEMORY_SIZE	= 3039;
PROTECT		= READ_WRITE;
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
  ENABLE_SINGULARITY_AVOIDANCE   : FALSE;
/MN
   1:  UFRAME_NUM=4 ;
   2:  UTOOL_NUM=1 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[1]=ON ;
   5:  WAIT   1.00(sec) ;
   6:   ;
   7:  IF (!DI[116] OR F[4]) THEN ;
   8:  JMP LBL[2] ;
   9:  ENDIF ;
  10:   ;
  11:  PR[14]=PR[12]    ;
  12:   ;
  13:  IF (R[4]<=R[2]) THEN ;
  14:  R[5]=0    ;
  15:  ENDIF ;
  16:   ;
  17:  IF (R[4]>R[2] AND R[4]<=(R[2]*2)) THEN ;
  18:  R[5]=1    ;
  19:  ENDIF ;
  20:   ;
  21:  IF (R[4]>(R[2]*2) AND R[4]<=(R[2]*3)) THEN ;
  22:  R[5]=2    ;
  23:  ENDIF ;
  24:   ;
  25:  IF (R[4]>(R[2]*3) AND R[4]<=(R[2]*4)) THEN ;
  26:  R[5]=3    ;
  27:  ENDIF ;
  28:   ;
  29:  IF (R[4]>(R[2]*4) AND R[4]<=(R[2]*5)) THEN ;
  30:  R[5]=4    ;
  31:  ENDIF ;
  32:   ;
  33:  IF (R[4]>(R[2]*5) AND R[4]<=(R[2]*6)) THEN ;
  34:  R[5]=5    ;
  35:  ENDIF ;
  36:   ;
  37:  R[6]=(R[4]-((R[2]*R[5])+1)) ;
  38:   ;
  39:  IF ((R[5]>R[1]) OR R[6]>R[2]),JMP LBL[3] ;
  40:   ;
  41:  PR[14,1]=(PR[12,1])+(R[7]*R[6]) ;
  42:   ;
  43:  PR[14,2]=(PR[12,2])+(R[8]*R[5]) ;
  44:   ;
  45:  PR[14,3]=(PR[12,3]+(R[9]-R[10]-R[22])) ;
  46:   ;
  47:  !CORRECTION FOR SQUARE TO CART INX ;
  48:  PR[14,1]=(PR[14,1])+(R[29]*R[6]) ;
  49:   ;
  50:  !CORRECTION FOR SQUARE TO CART INY ;
  51:  PR[14,2]=(PR[14,2])+(R[30]*R[5]) ;
  52:   ;
  53:J P[1:Transition to front] 50% CNT25    ;
  61:   ;
  62:J PR[11] 50% CNT25    ;
  63:   ;
  64:L PR[14] 750mm/sec FINE Offset,PR[50]    ;
  65:   ;
  66:  IF (!RI[3]) THEN ;
  67:  RO[1]=ON ;
  68:  WAIT (RI[3])    ;
  69:  ENDIF ;
  70:   ;
  71:  WAIT   1.00(sec) ;
  72:   ;
  73:L PR[14] 700mm/sec FINE    ;
  74:   ;
  75:  RO[1]=OFF ;
  76:  WAIT   2.00(sec) ;
  77:   ;
  78:  IF (!RI[4]),CALL ERROR_HANDLER(102) ;
  79:   ;
  80:L PR[14] 700mm/sec FINE Offset,PR[51]    ;
  81:   ;
  82:  PR[49]=LPOS    ;
  83:  WAIT    .25(sec) ;
  84:   ;
  85:L PR[49] 750mm/sec FINE Offset,PR[52]    ;
  86:   ;
  87:  F[5]=(ON) ;
  88:   ;
  89:L PR[13] 750mm/sec CNT15    ;
  90:   ;
  91:J P[2:Final transition] 50% CNT15    ;
  92:   ;
  93:  R[4]=R[4]+1    ;
  94:   ;
  95:  R[14]=R[18]-R[4]+Constant    ;
  96:   ;
  97:  IF R[4]>R[18],JMP LBL[2] ;
  98:   ;
  99:  IF (R[4]>R[1]*R[2]),JMP LBL[2] ;
 100:   ;
 101:  JMP LBL[1] ;
 102:   ;
 103:  LBL[2] ;
 104:   ;
 105:  R[4]=1    ;
 106:   ;
 107:  R[13]=R[13]+1    ;
 108:   ;
 109:  F[4]=(ON) ;
 110:   ;
 111:  IF (R[13]>R[11]),JMP LBL[3] ;
 112:   ;
 113:  JMP LBL[1] ;
 114:   ;
 115:  LBL[3] ;
 116:   ;
 117:  CALL RESET_PROGRAM    ;
 118:   ;
 119:  LBL[1] ;
/POS
P[1:"Transition to front"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -182.511  mm,	Y =  2338.956  mm,	Z =  2293.273  mm,
	W =  -179.819 deg,	P =     -.126 deg,	R =    87.493 deg,
	E1=   232.799  mm
};
P[2:"Final transition"]{
   GP1:
	UF : 4, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -990.775  mm,	Y =  1759.909  mm,	Z =  2295.241  mm,
	W =  -179.793 deg,	P =      .227 deg,	R =    28.860 deg,
	E1=   232.799  mm
};
/END
