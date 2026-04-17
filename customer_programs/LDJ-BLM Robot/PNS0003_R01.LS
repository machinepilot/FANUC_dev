/PROG  PNS0003_R01
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "6410816256";
PROG_SIZE	= 3631;
CREATE		= DATE 26-04-06  TIME 13:50:00;
MODIFIED	= DATE 08-10-21  TIME 06:36:44;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 143;
MEMORY_SIZE	= 3975;
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
/MN
   1:  !6410816256 ;
   2:  !--- INITIALIZE --- ;
   3:  UFRAME_NUM=0 ;
   4:  UTOOL_NUM=1 ;
   5:  R[10:PART INDEX]=0    ;
   6:   ;
   7:J PR[1:HOME] 100% CNT50    ;
   8:   ;
   9:  !--- CYCLE START --- ;
  10:  LBL[1] ;
  11:   ;
  12:  !--- PICK --- ;
  10:  UFRAME_NUM=1 ;
  11:  UTOOL_NUM=1 ;
  12:  TIMER[1]=RESET ;
  13:  TIMER[1]=START ;
  14:   ;
  15:J P[1:INTMPT] 100% CNT10    ;
  16:L P[2:IN FRONT OF IF] 2000mm/sec CNT10    ;
  17:L P[3:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  18:   ;
  19:  !--- FIRST PART SEARCH --- ;
  20:  IF R[10:PART INDEX]<>0,JMP LBL[10] ;
  21:  CALL SEARCH_R01    ;
  22:  PR[52,3]=PR[10,3]    ;
  23:  JMP LBL[11] ;
  24:  LBL[10] ;
  25:  !--- DEPLETION CHECK --- ;
  26:  R[13]=PR[52,3]    ;
  27:  IF R[13]<R[11:THRESHOLD],JMP LBL[99] ;
  28:  LBL[11] ;
  29:   ;
  30:  !INSERT PART PR ;
  20:  PR[2,3:OFFSET]=400    ;
  21:   ;
  22:L PR[52] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  23:L PR[52] 700mm/sec FINE    ;
  24:   ;
  25:  CALL ALL_VAC_ON_R01    ;
  26:   ;
  27:L PR[52] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  28:   ;
  29:J P[4:INTMPT] 100% CNT100    ;
  30:J P[5:INTMPT] 100% CNT100    ;
  31:J P[6:INTMPT] 100% CNT100    ;
  32:L P[7:INTMPT] 1500mm/sec CNT100    ;
  33:  !--- SET ON ZERO --- ;
  34:  UFRAME_NUM=2 ;
  35:   ;
  36:L P[11] 1500mm/sec FINE    ;
  37:L P[10] 500mm/sec FINE    ;
  38:   ;
  39:  CALL ALL_VAC_OFF_R01    ;
  40:   ;
  41:L P[12] 1500mm/sec FINE    ;
  42:L P[14] 1200mm/sec CNT100    ;
  43:L P[13] 300mm/sec CNT100    ;
  44:   ;
  45:  CALL ALL_VAC_ON_R01    ;
  46:   ;
  47:L P[15] 300mm/sec FINE    ;
  48:L P[8] 600mm/sec CNT100    ;
  49:   ;
  50:L P[9] 1200mm/sec CNT100    ;
  51:L P[34] 1200mm/sec CNT100    ;
  52:L P[35] 1200mm/sec CNT100    ;
  53:L P[36] 800mm/sec CNT100    ;
  54:L P[37] 600mm/sec CNT100    ;
  55:   ;
  56:   ;
  57:  !--- BEND 1 --- ;
  58:  UFRAME_NUM=3 ;
  59:L P[16] 300mm/sec CNT100    ;
  60:L P[17] 300mm/sec FINE    ;
  61:   ;
  62:  CALL BEND_R01    ;
  63:   ;
  64:L P[16] 300mm/sec FINE    ;
  65:   ;
  66:  !--- SET ON ZERO --- ;
  67:  UFRAME_NUM=2 ;
  68:   ;
  69:L P[37] 600mm/sec CNT100    ;
  70:L P[36] 800mm/sec CNT100    ;
  71:L P[35] 1200mm/sec CNT100    ;
  72:L P[34] 1200mm/sec CNT100    ;
  73:L P[9] 1200mm/sec CNT100    ;
  74:L P[8] 600mm/sec FINE    ;
  75:L P[15] 300mm/sec FINE    ;
  76:L P[18] 100mm/sec FINE    ;
  77:   ;
  78:  CALL ALL_VAC_OFF_R01    ;
  79:   ;
  80:  WAIT   2.00(sec) ;
  81:   ;
  82:L P[19] 300mm/sec FINE    ;
  83:L P[20] 600mm/sec FINE    ;
  84:L P[21] 300mm/sec FINE    ;
  85:   ;
  86:  CALL ALL_VAC_ON_R01    ;
  87:   ;
  88:  WAIT   2.00(sec) ;
  89:   ;
  90:L P[22] 300mm/sec FINE    ;
  91:L P[23] 600mm/sec CNT100    ;
  92:   ;
  93:L P[24] 1200mm/sec CNT100    ;
  94:L P[25] 1200mm/sec CNT100    ;
  95:L P[26] 1200mm/sec FINE    ;
  96:L P[27] 1200mm/sec FINE    ;
  97:   ;
  98:  !--- BEND 2 --- ;
  99:  UFRAME_NUM=3 ;
 100:   ;
 101:   ;
 102:L P[28] 300mm/sec FINE    ;
 103:L P[29] 300mm/sec FINE    ;
 104:   ;
 105:  CALL BEND_R01    ;
 106:   ;
 107:L P[28] 100mm/sec FINE    ;
 108:   ;
 109:  !--- OUTFEED --- ;
 110:  UFRAME_NUM=4 ;
 111:  !OUTFEED POSITIONS NEED LIVE TEACH ;
 112:   ;
 113:  CALL ALL_VAC_OFF_R01    ;
 114:   ;
 115:  !--- HOME --- ;
 116:J PR[1:HOME] 100% CNT100    ;
 117:   ;
 118:  TIMER[1]=STOP ;
 119:  R[20]=(TIMER[1]) ;
 120:   ;
 121:  !--- CYCLE HOUSEKEEPING --- ;
 122:  R[10:PART INDEX]=R[10:PART INDEX]+1    ;
 123:  PR[52,3]=PR[52,3]-R[12:THICKNESS]    ;
 124:  JMP LBL[1] ;
 125:   ;
 126:  !--- OUT OF PARTS --- ;
 127:  LBL[99] ;
 128:  UALM[8] ;
 129:  PAUSE ;
/POS
P[1:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   295.983  mm,	Y = -1001.060  mm,	Z =   641.268  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
	E1=   633.339  mm
};
P[2:"IN FRONT OF IF"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =      .000  mm,	Z =  -250.000  mm,
	W =   180.000 deg,	P =     -.000 deg,	R =     -.000 deg,
	E1=  1548.896  mm
};
P[3:"ROTATE OVER PICK"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  3074.267  mm,	Y =  1357.438  mm,	Z =  -250.000  mm,
	W =   180.000 deg,	P =      .000 deg,	R =    90.000 deg,
	E1=  2600.652  mm
};
P[4:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1565.474  mm,	Y =   779.079  mm,	Z =   927.535  mm,
	W =  -176.068 deg,	P =   -40.563 deg,	R =    88.652 deg,
	E1=  2600.656  mm
};
P[5:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1450.000  mm,	Y =   774.759  mm,	Z =  2476.163  mm,
	W =  -175.665 deg,	P =   -86.267 deg,	R =    87.929 deg,
	E1=  2600.656  mm
};
P[6:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1565.473  mm,	Y =  -696.446  mm,	Z =  2651.365  mm,
	W =  -147.168 deg,	P =   -65.974 deg,	R =   -35.346 deg,
	E1=  1923.842  mm
};
P[7:"INTMPT"]{
   GP1:
	UF : 1, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  2392.055  mm,	Y =  -696.432  mm,	Z =  2210.666  mm,
	W =  -147.173 deg,	P =   -65.972 deg,	R =   -35.342 deg,
	E1=  2132.484  mm
};
P[8]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   735.557  mm,	Y =   630.815  mm,	Z =  1103.073  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[9]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.517  mm,	Y =   209.375  mm,	Z =  1339.233  mm,
	W =  -159.819 deg,	P =    17.343 deg,	R =    27.842 deg,
	E1=  2068.407  mm
};
P[10]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   615.987  mm,	Y =  1192.749  mm,	Z =   126.188  mm,
	W =  -177.416 deg,	P =     -.281 deg,	R =     9.641 deg,
	E1=  2136.804  mm
};
P[11]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   641.875  mm,	Y =  1231.109  mm,	Z =   349.573  mm,
	W =  -177.426 deg,	P =    -4.623 deg,	R =     7.974 deg,
	E1=  2132.484  mm
};
P[12]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   745.594  mm,	Y =  1106.352  mm,	Z =   558.544  mm,
	W =  -177.417 deg,	P =     -.281 deg,	R =    45.994 deg,
	E1=  2136.804  mm
};
P[13]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.993  mm,	Y =   582.809  mm,	Z =    90.540  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[14]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.998  mm,	Y =   582.811  mm,	Z =   431.329  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[15]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   655.194  mm,	Y =   630.809  mm,	Z =   222.537  mm,
	W =  -178.590 deg,	P =     -.094 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[16]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   260.131  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
};
P[17]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.586  mm,	Y =  -747.635  mm,	Z =   260.094  mm,
	W =  -179.118 deg,	P =    -4.954 deg,	R =    93.964 deg,
	E1=  2061.958  mm
};
P[18]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   655.201  mm,	Y =   630.813  mm,	Z =   103.205  mm,
	W =  -178.591 deg,	P =     -.094 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[19]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   654.924  mm,	Y =   630.960  mm,	Z =   160.970  mm,
	W =  -178.583 deg,	P =     -.090 deg,	R =    45.519 deg,
	E1=  2147.609  mm
};
P[20]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   382.748  mm,	Y =  1437.282  mm,	Z =   160.924  mm,
	W =  -178.587 deg,	P =     -.089 deg,	R =   -24.942 deg,
	E1=  2379.401  mm
};
P[21]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   382.747  mm,	Y =  1437.283  mm,	Z =   108.126  mm,
	W =  -179.067 deg,	P =      .997 deg,	R =   -24.941 deg,
	E1=  2379.401  mm
};
P[22]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   406.003  mm,	Y =  1468.795  mm,	Z =   181.870  mm,
	W =  -179.067 deg,	P =      .996 deg,	R =   -24.941 deg,
	E1=  2379.401  mm
};
P[23]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   405.902  mm,	Y =  1468.680  mm,	Z =  1088.606  mm,
	W =  -179.073 deg,	P =      .998 deg,	R =   -24.945 deg,
	E1=  2379.402  mm
};
P[24]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   372.645  mm,	Y =   990.728  mm,	Z =  1521.630  mm,
	W =   163.321 deg,	P =    -4.617 deg,	R =   -38.545 deg,
	E1=  1953.874  mm
};
P[25]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   268.867  mm,	Y =   600.196  mm,	Z =  1399.988  mm,
	W =   146.458 deg,	P =   -16.807 deg,	R =   -50.346 deg,
	E1=  1953.888  mm
};
P[26]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   317.912  mm,	Y =  -160.444  mm,	Z =  1450.336  mm,
	W =   132.407 deg,	P =   -28.412 deg,	R =   -77.220 deg,
	E1=  1953.888  mm
};
P[27]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -540.898  mm,	Y =  -788.322  mm,	Z =  2122.882  mm,
	W =   119.733 deg,	P =   -26.708 deg,	R =   -77.060 deg,
	E1=  1953.894  mm
};
P[28]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1180.261  mm,	Y = -1363.944  mm,	Z =   344.893  mm,
	W =  -176.228 deg,	P =    -4.375 deg,	R =    60.827 deg,
	E1=  1953.894  mm
};
P[29]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1180.495  mm,	Y = -1075.432  mm,	Z =   218.666  mm,
	W =  -178.063 deg,	P =    -4.095 deg,	R =    99.650 deg,
	E1=  1953.926  mm
};
P[34]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   281.259  mm,	Y =  -188.972  mm,	Z =  1409.437  mm,
	W =  -174.754 deg,	P =    31.964 deg,	R =     3.139 deg,
	E1=  2068.407  mm
};
P[35]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   260.972  mm,	Y =  -560.465  mm,	Z =  1734.928  mm,
	W =   146.801 deg,	P =    25.778 deg,	R =   -35.910 deg,
	E1=  2068.407  mm
};
P[36]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -397.105  mm,	Y = -1014.563  mm,	Z =  2738.057  mm,
	W =   134.532 deg,	P =    31.888 deg,	R =   -41.527 deg,
	E1=  2068.407  mm
};
P[37]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -833.094  mm,	Y = -1201.160  mm,	Z =  3178.352  mm,
	W =   127.631 deg,	P =    33.378 deg,	R =   -42.525 deg,
	E1=  2068.407  mm
};
/END
