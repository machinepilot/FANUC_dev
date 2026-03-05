/PROG  CLSKP_EX
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2194;
CREATE		= DATE 80-01-01  TIME 23:10:20;
MODIFIED	= DATE 00-02-21  TIME 13:39:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 60;
MEMORY_SIZE	= 2594;
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
/MN
   1:  !NOTE: ;
   2:  !First, set $MISC_MSTR.$HPD_ENB  ;
   3:  !to TRUE, and cycle power. ;
   4:  ! ;
   5:  !Program CLSKP_EX ;
   6:  !Example program for Touch ;
   7:  !skip function ;
   8:  !Copy the lines of this program ;
   9:  !and paste them into your program ;
  10:  !and modify them if necessary. ;
  11:  ! ;
  12:  !Teach the point just before use ;
  13:  !of Touch skip function to ;
  14:  !P[98].  Motion type, position ;
  15:  !number, and speed should be ;
  16:  !modified if necessary. ;
  17:L P[98] 200mm/sec FINE    ;
  18:  ! ;
  19:  !Sub program CLSKP(g,j,max,min) ;
  20:  !Call this program just before ;
  21:  !the motion while which touch ;
  22:  !occurs. ;
  23:  !NOTE: Registers R[96] to R[99] ;
  24:  !are used in CLSKP. ;
  25:  !Description of arguments ;
  26:  !g: group number to detect ;
  27:  !   touch ;
  28:  !j: axis number to detect ;
  29:  !   touch ;
  30:  !max: if disturbance torque ;
  31:  !   becomes greater than max, ;
  32:  !   touch is detected ;
  33:  !min: if disturbance torque ;
  34:  !   becomes less than min, ;
  35:  !   touch is detected ;
  36:  !Set the appropriate value to g ;
  37:  !and j.  At first, use 99999 and ;
  38:  !-99999 for max and min, ;
  39:  !respectively.  Then execute the ;
  40:  !program from P[98] to P[99] ;
  41:  !without touch, and set ;
  42:  !$MOR_GRP[g].$MAX_DIS_TRQ[j] to ;
  43:  !max and ;
  44:  !$MOR_GRP[g].$MIN_DIS_TRQ[j] to ;
  45:  !min. ;
  46:  CALL CLSKP(1,1,99999,(-99999)) ;
  47:  ! ;
  48:  !Teach P[99] so that touch ;
  49:  !can occur between P[98] and ;
  50:  !P[99].  Motion type, position ;
  51:  !number, speed, label number, and ;
  52:  !position register number should ;
  53:  !be modified if necessary. ;
  54:L P[99] 200mm/sec FINE Skip,LBL[99],PR[99]=LPOS    ;
  55:  ! ;
  56:  !Modify label number if ;
  57:  !necessary. ;
  58:  LBL[99] ;
  59:  ! ;
  60:  !End of CLSKP_EX ;
/POS
P[98]{
   GP1:
	UF : F, UT : F,		CONFIG : 'N D B, 0, 0, 0',
	X = ********  mm,	Y = ********  mm,	Z = ********  mm,
	W = ******** deg,	P = ******** deg,	R = ******** deg
	E1 = ********  mm
};
P[99]{
   GP1:
	UF : F, UT : F,		CONFIG : 'N D B, 0, 0, 0',
	X = ********  mm,	Y = ********  mm,	Z = ********  mm,
	W = ******** deg,	P = ******** deg,	R = ******** deg
	E1 = ********  mm
};
/END
