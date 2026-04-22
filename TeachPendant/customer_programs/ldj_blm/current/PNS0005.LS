/PROG  PNS0005
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 4026;
CREATE		= DATE 08-10-21  TIME 23:12:52;
MODIFIED	= DATE 08-10-21  TIME 23:18:02;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 109;
MEMORY_SIZE	= 4370;
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
/MN
   1:  !--- INITIALIZE --- ;
   2:  UFRAME_NUM=0 ;
   3:  UTOOL_NUM=1 ;
   4:   ;
   5:  R[10:PART INDEX]=0    ;
   6:   ;
   7:J PR[1:HOME] 100% CNT50    ;
   8:   ;
   9:   ;
  10:   ;
  11:  !--- PICK --- ;
  12:  UFRAME_NUM=1 ;
  13:  UTOOL_NUM=1 ;
  14:  TIMER[1]=RESET ;
  15:  TIMER[1]=START ;
  16:   ;
  17:J P[1:INTMPT] 100% CNT10    ;
  18:L P[2:IN FRONT OF IF] 2000mm/sec CNT10    ;
  19:L P[3:ROTATE OVER PICK] 2000mm/sec CNT10    ;
  20:   ;
  21:  !INSERT PART PR ;
  22:  PR[2,3:OFFSET]=400    ;
  23:   ;
  24:L PR[52:save infd search] 2000mm/sec FINE Offset,PR[2:OFFSET]    ;
  25:L PR[52:save infd search] 700mm/sec FINE    ;
  26:   ;
  27:  CALL ALL_VAC_ON    ;
  28:   ;
  29:L PR[52:save infd search] 700mm/sec FINE Offset,PR[2:OFFSET]    ;
  30:   ;
  31:J P[4:INTMPT] 100% CNT100    ;
  32:J P[5:INTMPT] 100% CNT100    ;
  33:J P[6:INTMPT] 100% CNT100    ;
  34:L P[7:INTMPT] 1500mm/sec CNT100    ;
  35:  !--- SET ON ZERO --- ;
  36:  UFRAME_NUM=2 ;
  37:   ;
  38:L P[8] 1500mm/sec FINE    ;
  39:L P[9] 500mm/sec FINE    ;
  40:   ;
  41:  CALL ALL_VAC_OFF    ;
  42:   ;
  43:L P[10] 1500mm/sec FINE    ;
  44:L P[11] 1200mm/sec CNT100    ;
  45:L P[12] 300mm/sec CNT100    ;
  46:   ;
  47:  CALL ALL_VAC_ON    ;
  48:   ;
  49:L P[13] 300mm/sec FINE    ;
  50:L P[14] 600mm/sec CNT100    ;
  51:   ;
  52:L P[15] 1200mm/sec CNT100    ;
  53:L P[16] 1200mm/sec CNT100    ;
  54:L P[17] 1200mm/sec CNT100    ;
  55:L P[18] 800mm/sec CNT100    ;
  56:L P[19] 600mm/sec CNT100    ;
  57:   ;
  58:   ;
  59:  !--- BEND 1 --- ;
  60:  UFRAME_NUM=3 ;
  61:L P[20] 300mm/sec CNT100    ;
  62:L P[21] 300mm/sec FINE    ;
  63:   ;
  64:  CALL BEND    ;
  65:   ;
  66:L P[22] 300mm/sec FINE    ;
  67:   ;
  68:  !--- SET ON ZERO --- ;
  69:  UFRAME_NUM=2 ;
  70:   ;
  71:L P[23] 600mm/sec CNT100    ;
  72:L P[24] 800mm/sec CNT100    ;
  73:L P[25] 1200mm/sec CNT100    ;
  74:L P[26] 1200mm/sec CNT100    ;
  75:L P[27] 1200mm/sec CNT100    ;
  76:L P[28] 600mm/sec FINE    ;
  77:L P[29] 300mm/sec FINE    ;
  78:L P[30] 100mm/sec FINE    ;
  79:   ;
  80:  CALL ALL_VAC_OFF    ;
  81:   ;
  82:  WAIT   2.00(sec) ;
  83:   ;
  84:L P[31] 300mm/sec FINE    ;
  85:L P[32] 600mm/sec FINE    ;
  86:L P[33] 300mm/sec FINE    ;
  87:   ;
  88:  CALL ALL_VAC_ON    ;
  89:   ;
  90:  WAIT   2.00(sec) ;
  91:   ;
  92:L P[34] 300mm/sec FINE    ;
  93:L P[35] 600mm/sec CNT100    ;
  94:   ;
  95:L P[36] 1200mm/sec CNT100    ;
  96:L P[37] 1200mm/sec CNT100    ;
  97:L P[38] 1200mm/sec FINE    ;
  98:L P[39] 1200mm/sec FINE    ;
  99:   ;
 100:  !--- BEND 2 --- ;
 101:  UFRAME_NUM=3 ;
 102:   ;
 103:   ;
 104:L P[40] 300mm/sec FINE    ;
 105:L P[41] 300mm/sec FINE    ;
 106:   ;
 107:  CALL BEND    ;
 108:   ;
 109:L P[42] 100mm/sec FINE    ;
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
	X =   641.875  mm,	Y =  1231.109  mm,	Z =   349.573  mm,
	W =  -177.426 deg,	P =    -4.623 deg,	R =     7.974 deg,
	E1=  2132.484  mm
};
P[9]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   615.987  mm,	Y =  1192.749  mm,	Z =   126.188  mm,
	W =  -177.416 deg,	P =     -.281 deg,	R =     9.641 deg,
	E1=  2136.804  mm
};
P[10]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   745.594  mm,	Y =  1106.352  mm,	Z =   558.544  mm,
	W =  -177.417 deg,	P =     -.281 deg,	R =    45.994 deg,
	E1=  2136.804  mm
};
P[11]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.998  mm,	Y =   582.811  mm,	Z =   431.329  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[12]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   647.993  mm,	Y =   582.809  mm,	Z =    90.540  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[13]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   655.194  mm,	Y =   630.809  mm,	Z =   222.537  mm,
	W =  -178.590 deg,	P =     -.094 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[14]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   735.557  mm,	Y =   630.815  mm,	Z =  1103.073  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[15]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.517  mm,	Y =   209.375  mm,	Z =  1339.233  mm,
	W =  -159.819 deg,	P =    17.343 deg,	R =    27.842 deg,
	E1=  2068.407  mm
};
P[16]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   281.259  mm,	Y =  -188.972  mm,	Z =  1409.437  mm,
	W =  -174.754 deg,	P =    31.964 deg,	R =     3.139 deg,
	E1=  2068.407  mm
};
P[17]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   260.972  mm,	Y =  -560.465  mm,	Z =  1734.928  mm,
	W =   146.801 deg,	P =    25.778 deg,	R =   -35.910 deg,
	E1=  2068.407  mm
};
P[18]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -397.105  mm,	Y = -1014.563  mm,	Z =  2738.057  mm,
	W =   134.532 deg,	P =    31.888 deg,	R =   -41.527 deg,
	E1=  2068.407  mm
};
P[19]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -833.094  mm,	Y = -1201.160  mm,	Z =  3178.352  mm,
	W =   127.631 deg,	P =    33.378 deg,	R =   -42.525 deg,
	E1=  2068.407  mm
};
P[20]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   260.131  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
};
P[21]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.586  mm,	Y =  -747.635  mm,	Z =   260.094  mm,
	W =  -179.118 deg,	P =    -4.954 deg,	R =    93.964 deg,
	E1=  2061.958  mm
};
P[22]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1825.585  mm,	Y = -1038.009  mm,	Z =   260.131  mm,
	W =  -179.119 deg,	P =    -4.956 deg,	R =   124.411 deg,
	E1=  2068.420  mm
};
P[23]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -833.094  mm,	Y = -1201.160  mm,	Z =  3178.352  mm,
	W =   127.631 deg,	P =    33.378 deg,	R =   -42.525 deg,
	E1=  2068.407  mm
};
P[24]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -397.105  mm,	Y = -1014.563  mm,	Z =  2738.057  mm,
	W =   134.532 deg,	P =    31.888 deg,	R =   -41.527 deg,
	E1=  2068.407  mm
};
P[25]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   260.972  mm,	Y =  -560.465  mm,	Z =  1734.928  mm,
	W =   146.801 deg,	P =    25.778 deg,	R =   -35.910 deg,
	E1=  2068.407  mm
};
P[26]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   281.259  mm,	Y =  -188.972  mm,	Z =  1409.437  mm,
	W =  -174.754 deg,	P =    31.964 deg,	R =     3.139 deg,
	E1=  2068.407  mm
};
P[27]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   712.517  mm,	Y =   209.375  mm,	Z =  1339.233  mm,
	W =  -159.819 deg,	P =    17.343 deg,	R =    27.842 deg,
	E1=  2068.407  mm
};
P[28]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   735.557  mm,	Y =   630.815  mm,	Z =  1103.073  mm,
	W =  -178.590 deg,	P =     -.093 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[29]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   655.194  mm,	Y =   630.809  mm,	Z =   222.537  mm,
	W =  -178.590 deg,	P =     -.094 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[30]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   655.201  mm,	Y =   630.813  mm,	Z =   103.205  mm,
	W =  -178.591 deg,	P =     -.094 deg,	R =    45.518 deg,
	E1=  2147.604  mm
};
P[31]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   654.924  mm,	Y =   630.960  mm,	Z =   160.970  mm,
	W =  -178.583 deg,	P =     -.090 deg,	R =    45.519 deg,
	E1=  2147.609  mm
};
P[32]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   382.748  mm,	Y =  1437.282  mm,	Z =   160.924  mm,
	W =  -178.587 deg,	P =     -.089 deg,	R =   -24.942 deg,
	E1=  2379.401  mm
};
P[33]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   382.747  mm,	Y =  1437.283  mm,	Z =   108.126  mm,
	W =  -179.067 deg,	P =      .997 deg,	R =   -24.941 deg,
	E1=  2379.401  mm
};
P[34]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   406.003  mm,	Y =  1468.795  mm,	Z =   181.870  mm,
	W =  -179.067 deg,	P =      .996 deg,	R =   -24.941 deg,
	E1=  2379.401  mm
};
P[35]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   405.902  mm,	Y =  1468.680  mm,	Z =  1088.606  mm,
	W =  -179.073 deg,	P =      .998 deg,	R =   -24.945 deg,
	E1=  2379.402  mm
};
P[36]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   372.645  mm,	Y =   990.728  mm,	Z =  1521.630  mm,
	W =   163.321 deg,	P =    -4.617 deg,	R =   -38.545 deg,
	E1=  1953.874  mm
};
P[37]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   268.867  mm,	Y =   600.196  mm,	Z =  1399.988  mm,
	W =   146.458 deg,	P =   -16.807 deg,	R =   -50.346 deg,
	E1=  1953.888  mm
};
P[38]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   317.912  mm,	Y =  -160.444  mm,	Z =  1450.336  mm,
	W =   132.407 deg,	P =   -28.412 deg,	R =   -77.220 deg,
	E1=  1953.888  mm
};
P[39]{
   GP1:
	UF : 2, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  -540.898  mm,	Y =  -788.322  mm,	Z =  2122.882  mm,
	W =   119.733 deg,	P =   -26.708 deg,	R =   -77.060 deg,
	E1=  1953.894  mm
};
P[40]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1180.261  mm,	Y = -1363.944  mm,	Z =   344.893  mm,
	W =  -176.228 deg,	P =    -4.375 deg,	R =    60.827 deg,
	E1=  1953.894  mm
};
P[41]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1180.495  mm,	Y = -1075.432  mm,	Z =   218.666  mm,
	W =  -178.063 deg,	P =    -4.095 deg,	R =    99.650 deg,
	E1=  1953.926  mm
};
P[42]{
   GP1:
	UF : 3, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =  1180.261  mm,	Y = -1363.944  mm,	Z =   344.893  mm,
	W =  -176.228 deg,	P =    -4.375 deg,	R =    60.827 deg,
	E1=  1953.894  mm
};
/END
