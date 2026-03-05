/PROG  INFEED_PICK_1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2645;
CREATE		= DATE 25-01-24  TIME 16:22:26;
MODIFIED	= DATE 25-07-31  TIME 16:06:34;
FILE_NAME	= INFEED_P;
VERSION		= 0;
LINE_COUNT	= 123;
MEMORY_SIZE	= 3057;
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
   1:  UFRAME_NUM=1 ;
   2:  UTOOL_NUM=2 ;
   3:  OVERRIDE=R[52] ;
   4:  RO[1]=ON ;
   5:  WAIT   1.00(sec) ;
   6:   ;
   7:  IF (!DI[113] OR F[1]) THEN ;
   8:  JMP LBL[2] ;
   9:  ENDIF ;
  10:   ;
  11:  PR[14]=PR[3]    ;
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
  41:  PR[14,1]=(PR[3,1])+(R[7]*R[5]) ;
  42:   ;
  43:  PR[14,2]=(PR[3,2])+(R[8]*R[6]) ;
  44:   ;
  45:  PR[14,3]=(PR[3,3]+(R[9]-R[10]-R[22])) ;
  46:   ;
  47:  !CORRECTION FOR SQUARE TO CART INX ;
  48:  PR[14,1]=(PR[14,1])+(R[23]*R[6]) ;
  49:   ;
  50:  !CORRECTION FOR SQUARE TO CART INY ;
  51:  PR[14,2]=(PR[14,2])+(R[24]*R[5]) ;
  52:   ;
  53:J P[2:Transition to front] 50% CNT25    ;
  61:   ;
  62:J PR[2] 50% CNT25    ;
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
  89:L PR[4] 750mm/sec CNT15    ;
  90:   ;
  91:L P[2:Transition to front] 750mm/sec FINE    ;
  92:   ;
  93:J P[1:Final transition] 50% CNT15    ;
  94:   ;
  95:  R[4]=R[4]+1    ;
  96:   ;
  97:  R[14]=R[18]-R[4]+1    ;
  98:   ;
  99:  IF R[4]>R[18],JMP LBL[2] ;
 100:   ;
 101:  IF (R[4]>R[1]*R[2]),JMP LBL[2] ;
 102:   ;
 103:  JMP LBL[1] ;
 104:   ;
 105:  LBL[2] ;
 106:   ;
 107:  R[4]=1    ;
 108:   ;
 109:  R[13]=R[13]+1    ;
 110:   ;
 111:  F[1]=(ON) ;
 112:   ;
 113:  IF (R[13]>R[11]),JMP LBL[3] ;
 114:   ;
 115:  JMP LBL[1] ;
 116:   ;
 117:  LBL[3] ;
 118:   ;
 119:  CALL RESET_PROGRAM    ;
 120:   ;
 121:  LBL[1] ;
/POS
P[1:"Final transition"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -984.363  mm,	Y = -2318.619  mm,	Z =  2282.072  mm,
	W =  -179.819 deg,	P =      .422 deg,	R =    29.105 deg,
	E1=   232.799  mm
};
P[2:"Transition to front"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -178.604  mm,	Y = -1736.119  mm,	Z =  2276.686  mm,
	W =  -179.667 deg,	P =     -.002 deg,	R =    87.738 deg,
	E1=   232.799  mm
};
/END
