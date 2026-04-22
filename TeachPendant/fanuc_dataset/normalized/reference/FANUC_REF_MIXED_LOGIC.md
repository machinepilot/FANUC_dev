---
id: FANUC_REF_MIXED_LOGIC
title: "Mixed Logic"
topic: registers
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "FANUC Teach Pendant Help System / Operator Manual"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# Mixed Logic

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Mixed_Logic.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


14. MIXED LOGIC INSTRUCTIONS 14. MIXED LOGIC INSTRUCTIONS PROGRAM ELEMENTS 14. M
IXED LOGIC INSTRUCTIONS 14.1. Overview The Mixed Logic Instructions option provi
des any combination of operators and data in TP program assignment statements, I
F statements and WAIT statements. Mixed Logic also supports the NOT operator (!)
and parenthesis ( “(“ and “)” ). You can specify Mixed Logic instructions throug
h the Register menu, the I/O menu, the IF/SELECT menu, and the WAIT menu. Mixed 
Logic instructions must be specified in parentheses, as follows: DO[1]=(DI[1] AN
D !DI[2]) IF (DI[1]) JMP,LBL[1] WAIT (DI[1]) When the statement does not have pa
rentheses, the statement is executed the same as any other Logic Instruction. Mi
xed logic also provides the additional boolean data types Flag and Marker and th
e additional statement TC_Online . Mixed logic also provides Background Logic, w
hich allows simultaneous, continuous, repeated execution of as many as eight TP 
programs containing only assignment statements. 14.2. Data Types The following d
ata types are available for mixed logic instructions: Table 9. Data Types Type V
alue Data Numerical The data can have numerical value. Both integer and real val
ues are available. Register, Constant, GI/O, AI/O, Element of position register 
, Argument, System variable Boolean The data can be On or Off . DI/O, RI/O, UI/O
, SI/O, WI/O, On, Off, Flag, Marker Note Position type data and Palletizing type
data cannot be specified in mixed logic instructions. 14.3. Operators The follow
ing operators are available for mixed logic instructions. Table 10. Arithmetical
Operators Operator Operation + Addition of left side and right side. - Subtracti
on of right side from left side * Multiplication of left side and right side. / 
Division of left side and right side. MOD Remainder of the division of left side
and right side. DIV Round off the decimal part of the division of left side and 
right side. Arithmetical operators are used for numerical data only. If numerica
l operators are used for boolean data, the INTP-205 Variable Type Mismatch error
occurs. The output data type of arithmetical operators is always numerical. Tabl
e 11. Logical Operators Operator Operation AND Logical AND of left side and righ
t side. OR Logical OR of left side and right side. ! Logical NOT of left side an
d right side. Logical operators are used for boolean data only. If logical opera
tors are used for numerical data, the INTP-205 Variable Type Mismatch error occu
rs. The output data type of logical operators is always boolean. Table 12. Compa
rison Operators Operator Operation = When the left side and right side are equal
, returns ON; when unequal, returns OFF. <> When the left side and right side ar
e not equal, returns ON; when equal, returns OFF. < When the left side is less t
han the right side, returns ON; when greater, returns OFF. > When the left side 
is greater than the right side, returns ON; when less, returns OFF. <= When the 
left side is less than the right side, or they are equal, returns ON; when great
er, returns OFF. >= When the left side is greater than the right side, or they a
re equal, returns ON; when less, returns OFF. ”=” and “<>” can be used for both 
numerical data and boolean data. “<”,“>”,“<=”, and “ >=” are used for numerical 
data only. If they are used for boolean data, the INTP-205 Variable Type Mismatc
h error occurs. The priority of the operators is indicated in the following tabl
e. Table 13. Priority of Operators Priority Operator HIGHEST ! *, /, DIV , MOD +
, — MEDIUM <, >, <=, >= =, <> AND LOWEST OR 14.4. Expressions Mixed logic instru
ctions can be specified in assignment statements, IF statements, and WAIT statem
ents. Assignment Statements The following is an example of a mixed logic assignm
ent statement: R[1] = ((GI[1] + R[1]) * AI[1]) DO[1] = (DI[1] AND (GI[1] — GI[2]
)) The first = from the left indicates an assignment statement. The other =s ind
icate comparison. The result of the right side expression is assigned to the lef
t side data. When the left side data type is boolean and the result of the right
side expression is numerical, left side data becomes OFF when the right side val
ue is less than 1 and greater than —1; the left side data becomes ON when the ri
ght side value is greater than 1 or less than —1. This behavior is the same as a
normal assignment statement. When the left side data type is numerical and the r
esult of the right side expression is boolean, the left side data becomes 0 when
the right side value is OFF, and the left side data becomes 1 when the right sid
e value is ON. This behavior is the same as a normal assignment statement. If a 
real value is assigned to GO, AO, or an integer type system variable, the decima
l part is rounded off. “Pulse” cannot be specified in mixed logic instructions. 
You must use normal logic instructions to specify “Pulse”. Position type data an
d palletizing type data cannot be specified in the right side or left side of mi
xed logic instructions. You must use normal logic instructions to specify positi
on or palletizing type data. The maximum number of items (data or operators) all
owed in an assignment statement is approximately 20. The exact maximum number al
lowed varies according to data type. The following data can be specified in the 
left side of the assignment: Table 14. Data Assignments Type Data Boolean DO, RO
, UO, SO, WO, Flag, Marker Numerical Register, GO, AO, element of a position reg
ister, system variable IF Statements The following is an example of a mixed logi
c IF statement: IF (R[1] = (GI[1] + R[1]) * AI[1]) JMP LBL[1] IF (DI[1] AND (!DI
[2] OR DI[3])) JMP LBL[1] You can specify mixed logic expressions in the conditi
on part of an IF statement. The result of the IF statement must be boolean. When
the result of the expression is on, the action part of the statement, for exampl
e, JMP LBL, is executed. The following statements can be used in the action part
of an IF statement when mixed logic is used in the condition part: JMP LBL[ ] CA
LL Mixed Logic assignment statement Pulse statement Mixed Logic assignment state
ments and Pulse statements can be specified in the action part of the IF stateme
nt only when the condition part is a Mixed Logic expression. See the following e
xample: IF (DI[1]), DO[1]=(On) IF (DI[2]), DO[1]=Pulse The maximum number of ite
ms (data or operators) in an IF statement is approximately 20. The exact maximum
number of items varies according to data type. WAIT Statements The following is 
an example of a mixed logic WAIT statement: WAIT (DI[1] AND (!DI[2] OR DI[3])) M
ixed Logic expressions can be specified in the condition of a WAIT statement The
result of the expression must be boolean. The WAIT statement waits until the res
ult of the expression becomes ON. “On+”,“Off-” and “ERR_NUM” cannot be specified
in mixed logic instructions. You must use normal logic instructions to specify t
hem. The maximum number of items (data or operators) in a WAIT statement is appr
oximately 20. The exact maximum number of items varies according to the data typ
e. 14.5. Adding Mixed Logic Instructions Editing mixed logic statements is more 
complex than editing normal statements because of the greater variety of data ty
pes and operators that can be used, and the flexibility with which they can be c
ombined. To make editing easier, the following functions are provided: To begin 
teaching a mixed logic instruction you must first choose a statement containing 
parentheses. Item selection menu shows the items available according to the loca
tion in the statement. When the combination of items is invalid, for example two
operators adjoin, empty item is inserted automatically, and you are prompted to 
select an item. When an item is deleted, the related items are deleted at the sa
me time. For example, an operator is deleted, the data is deleted at the same ti
me. When the cursor is on the item of Mixed Logic expression, if the expression 
is wrong, an error message is displayed on the prompt line. The following messag
es can be displayed. Table 15. Mixed Logic Error Messages Error Message Explanat
ion Parentheses mismatch The number of left parenthesis and right parenthesis ar
e not same. Invalid index Index number is not correct. Variable type mismatch Da
ta type is not correct for the operator. Invalid parameter name System variable 
name is not correct. Untaught element Empty item (...) exists. Invalid motion gr
oup The specified motion group of PR[ ] is not available for the program. Invali
d item for output The left side item of assignment statement is invalid. Invalid
item for Mixed Logic The item can not be used in Mixed Logical expression. Synta
x error Invalid statement. To add Mixed Logic instructions to a program, At the 
Edit menu, press F1, INST to go to the Instruction menu. Select the kind of inst
ruction you want to add: Register, I/O, IF/SELECT, or WAIT. At the Statement men
u, select the Mixed Logic statement, which contains parentheses: (...) Build the
instruction as you normally would. To change an item of a Mixed Logic statement,
when the cursor is on the item you want to change, press F4, CHOICE. The availab
le items will be displayed. You can insert items in any Mixed Logic statement, e
xcept for the left side of an Assignment statement. Press F1, INSERT. An empty i
tem, “...” is inserted before the cursor and an item selection menu is displayed
. If you select an operator, an empty item is inserted after the operator, and t
he data menu is displayed. You can delete items in any Mixed Logic statement exc
ept for the left side of an assignment statement. Move the cursor to the item an
d press CHOICE. The DELETE key will be displayed on F2. If an operand is deleted
, the following data item will also be deleted. To add or delete a NOT(!) operat
or, when the cursor is on a Digital I/O item of a Mixed Logic expression, except
the left side of an Assignment statement, press F5, (!). The NOT(!) operator wil
l be added or deleted. To change the left side of an Assignment statement when t
he right side of the Assignment statement is Mixed Logic instructions, move the 
cursor to the left side item and press F4, CHOICE. A menu that includes the item
s that can be specified in the left side of an Assignment statement will be disp
layed. 14.6. Background Logic 14.6.1. Overview Background logic allows any teach
pendant program that includes only Mixed logic statements to be executed in the 
background. The program is executed from beginning to end repeatedly. This execu
tion is not affected by E-STOP, HOLD, or any alarms. There are two execution mod
es in Background Logic, Normal mode and High-level mode. In Normal mode, all mix
ed logic instructions can be executed in the background. The number of items tha
t can be processed every ITP, (ITP is normally 8 msec) in normal mode, is depend
ant on the total number of items to be scanned in Normal and High-Level modes. A
n "item" is data, an operator or an allowed instruction. In High-Level mode, all
mixed logic instructions can be executed in the background. to 540 items are pro
cessed every 8 msec. Refer to Table 16, " Background Logic Execution Modes " for
information on the background logic execution modes. Use Setting Background Logi
c to execute background logic. Table 16. Background Logic Execution Modes Mode M
ax. number of Items Scanning time Available data Available operators Available I
nstructions Normal Mode No limitation (Total Num. of items / 600) * ITP Number o
f items means the total items in all background logic programs. (Normal and High
). ITP is normally 8 msec. F[], M[]*, DI[], DO[], AI[], AO[], GI[],GO[], SI[], S
O[], UI[], UO[], RI[], RO[] WI[], WO[] On, Off R[], PR[i.j], AR[] Constant Param
eter Timer, Timer overrun (, ), !, AND, OR, =, <>, <, < =, >, >=, +,—, *, /, DIV
, MOD All Mixed Logic Operations JMP LBL[...] (Only jumping in the down directio
n), RUN, UALRM[...] High-Level mode 540 8 msec Same as Normal Mode Same as Norma
l Mode Same as Normal Mode M[ ] cannot be specified as left side of assignment s
tatement in background logic. 8 programs can be executed as Background Logic at 
the same time. If the program includes anything but allowed statements, "INTP-44
3 Invalid item for Mixed Logic" error occurs at execution. While a program is be
ing executed in the background, the program cannot be edited, and the program ca
nnot be executed as a normal task. If the program is not running in the backgrou
nd, it can be run as a normal task in order to test it When a program is running
in the background, the program cannot be loaded as overwrite. If a program is ex
ecuting as Background Logic at power down, the program is executed at power auto
matically in the same execution mode. The Background Logic execution occurs befo
re than normal program execution. The Background Logic execution takes about 1 m
sec in every ITP. The background logic execution may affect the cycle time of th
e normal program. To decrease the execution time of Background Logic, change $MI
X_LOGIC.$ITEM_COUNT to smaller value. The default value of $MIX_LOGIC.$ITEM_COUN
T is 600, which is the number of items processed each ITP. Assignment statements
with the IF condition can be executed by Background Logic. The assignment statem
ent is not executed when the condition is OFF. In the following example: IF (DI[
1]), DO[1]=(DI[2]) the value of DO[1] is set to DI[2] when DI[1] is ON, DO[1] is
not changed when DI[1] is OFF. Pulse instruction can be used in Background Logic
. It can be combined with the IF condition to create an OFF DELAY TIMER. In the 
example: IF (DI[1]), DO[1]=Pulse 1sec DO[1] has 1sec pulse when DI[1] stays ON t
han 1 sec. If DI[1] turns OFF before 1 sec, DO[1] turns OFF immediately. While D
I[1] is OFF, this statement does not set DO[1]. To keep DO[1] on for 1 sec even 
if DI[1] turns OFF, use the following statements. F[1]=(DI[1] OR (F[1] AND DO[1]
)) IF (F[1]), DO[1]=Pulse 1sec If a Pulse instruction does not specify the time,
it will be one scan pulse in Background Logic execution. In the example: IF (DI[
1]), DO[1]=Pulse In this case, DO[1] becomes ON for only one scan when DI[1] is 
changed from OFF to ON. This can be used as edge detection. Pulse instruction wi
thout time means the pulse of $DEFPULSE in normal execution, so it is different 
in Background Logic execution. You can use the Background Logic screen to set an
d execute programs as Background Logic. Refer to Table 17, " Background Logic Sc
reen Items " for a description of each background logic screen item. Table 18, "
Background Logic Screen Operations " lists the background logic screen operation
s. Table 17. Background Logic Screen Items ITEM DESCRIPTION PROGRAM Enter the na
me of the program you want to execute as background logic. STATUS This item disp
lays the status of the background logic program: Stop: The program is stopped Ru
nning: The program is running in Normal mode. Running (High): The program is run
ning in High-Level mode. MODE Use this item to select the execution mode: Normal
: The program is always executed in Normal mode. Default is "Normal". If you wou
ld like to execute the program in High-Level mode but it is executed in Normal m
ode, set this item "High". High: The program is always executed in High-Level mo
de. Table 18. Background Logic Screen Operations FUNCTION KEY DESCRIPTION RUN Pr
ess this key to execute the program as background logic. If it contains statemen
ts that are not available in background mode, an error will be posted. STOP Pres
s this key to stop background execution of the program. CLEAR Press this key to 
remove a Background logic program from the list. (The program must be in "STOP" 
mode before it can be removed.) Procedure 9. Setting Background Logic Press MENU
Select 6, SETUP Press F1, TYPE Select BG Logic. You will see a screen similar to
the following: Background logic Normal mode scan time: 8 msec 3/8 PROGRAM STATUS
MODE 1 LOGIC1 Running Normal 2 LOGIC2 Stop High 3 LOGIC3 Running(High) High 4 St
op Normal 5 Stop Normal 6 Stop Normal 7 Stop Normal 8 Stop Normal In the PROGRAM
column, enter the name of the program you want to run as Background Logic. Press
F4, [CHOICE] to get a listing of programs. Select the desired program from the l
ist. The STATUS column will display the status of the background logic program: 
Stop: The program is stopped Running: The program is running in Normal mode.. Ru
nning (High): The program is running in High-Level mode. In the MODE column, sel
ect the execution mode. Press F4, [CHOICE] to get a listing of modes. Select the
desired mode from the list. Normal: The program is always executed in Normal mod
e. High: The program is always executed in High-Level mode. Note The scanning ti
me of Normal mode execution is displayed on the upper line of the screen. To run
the program as background logic, press F2, RUN. The program will run. If it cont
ains statements that are not available in background mode, an error will be post
ed. To stop background execution of the program, press F3, STOP. To remove a pro
gram from background execution, press F5, CLEAR. 14.6.2. Flag Flags (F[ ])are in
ternal I/O ports that can be read and set. They are not connected to any actual 
I/O device, they are like a Boolean type variable. The value of flags can be rec
overed by Power Failure Recovery function (HOT Start). It is the same as the oth
er output ports, for example DO. The following conditions set all Flags to OFF: 
COLD start CONTROL start INIT start I/O assignment is changed, even though in HO
T start. I/O configuration is changed, even though in HOT start. DI, DO, UI, UO,
GI and GO can be assigned to flags by configuring them as Rack 34, Slot 1, Start
point 1-1024. When UI/UO are assigned to flags, program execution can be control
led by TP program or Background Logic. For Example: Rack Slot Start Pt. UI[1-18]
34 1 1 In this case, when F[6] is changed from ON to OFF, UI[6:START] is changed
from ON to OFF, and the selected program is executed. To display the Flag monito
r menu Press MENU. Select 5 I/O. Press F1, TYPE. Select Flag. You will see a scr
een similar to the following: Flag # STATUS 1/1024 F[ 1] ON [ ] F[ 2] OFF [ ] F[
3] OFF [ ] F[ 4] ON [ ] F[ 5] OFF [ ] F[ 6] OFF [ ] F[ 7] OFF [ ] F[ 8] OFF [ ] 
F[ 9] OFF [ ] F[ 10] OFF [ ] You can change the value of flags in this menu. To 
display the port detail menu, press F2, DETAIL. You will see a screen similar to
the following: Port Detail Flag [ 1] Comment:[ ] You can change flag comments at
this screen. Examples of Edge Detection, Counter and Timer in Fast Mode Backgrou
nd Logic Fast mode has better performance than Normal mode, and Fast mode does n
ot affect the performance of normal program execution. But Fast mode cannot use 
numerical operation and Pulse instruction. Example 1: Edge Detection The followi
ng program is edge detection of DI[1]. DO[1] becomes ON only when DI[1] is chang
ed from OFF to ON. 1: DO[1]=(DI[1] AND !F[1]) 2: F[1]=(DI[1]) F[1] has the DI[1]
value of the previous scan. DO[1] becomes ON when DI[1] is ON and the previous v
alue of DI[1] is OFF. Example 2: Counter The following is the example of 4 bit c
ounter of DI[1] edge. The counter value is set in F[41-44]. You can read the cou
nter value by GI[1] if GI[1] is assigned as rack 34, slot 1, start pt 41 and poi
nts 4. 1: F[2]=(DI[1] AND !F[1]) ; 2: F[1]=(DI[1]) ; 3: ! BIT1 ; 4: F[3]=(F[41])
; 5: F[41]=((F[2] AND !F[3]) OR (!F[2] AND F[3])) ; 6: F[2]=(F[2] AND F[3]) ; 7:
! BIT2 ; 8: F[3]=(F[42]) ; 9: F[42]=((F[2] AND !F[3]) OR (!F[2] AND F[3])) ; 10:
F[2]=(F[2] AND F[3]) ; 11: ! BIT3 ; 12: F[3]=(F[43]) ; 13: F[43]=((F[801] AND !F
[3]) OR (!F[801] AND F[3])) ; 14: F[2]=(F[2] AND F[3]) ; 15: ! BIT4 ; 16: F[3]=(
F[44]) ; 17: F[44]=((F[2] AND !F[3]) OR (!F[2] AND F[3])) ; 18: F[2]=(F[2] AND F
[3]) ; The first 2 lines the edge detection of DI[1], F[2] becomes ON in one sca
n when DI[1] is changed from OFF to ON. The lines 4-6 process to count the first
bit of the counter (F[41]). F[3] is the work variable to keep the original value
. In line 5, F[41] is reversed when F[2] is ON, and F[41] is not changed when F[
2] is OFF. In line 6, F[2] is turned OFF when the original F[41] is OFF, it mean
s overflow does not occur. The lines 8-10 are for the second bit (F[42]), the li
nes 12-14 are for the third bit (F[43]), and the lines 16-18 are for the fourth 
bit (F[44]). Example 3: Timer Timer can be programmed by using the counter, beca
use the scanning time of Fast mode is always 8msec. The following is the example
of the 80msec Pulse. This program works as same as 'IF (DI[1]), DO[1]=Pulse 80ms
ec'. 1: F[1]=(DI[1]); 2: F[2]=(F[1] AND !F[4]); 3: DO[1]=F[2] 4: ! BIT1 ; 5: F[3
]=(F[41]) ; 6: F[41]=(F[1] AND ((F[2] AND !F[3]) OR (!F[2] AND F[3]))) ; 7: F[2]
=(F[2] AND F[3]) ; 8: ! BIT2 ; 9: F[3]=(F[42]) ; 10: F[42]=(F[1] AND ((F[2] AND 
!F[3]) OR (!F[2] AND F[3]))) ; 11: F[2]=(F[2] AND F[3]) ; 12: ! BIT3 ; 13: F[3]=
(F[43]) ; 14: F[43]=(F[1] AND ((F[2] AND !F[3]) OR (!F[2] AND F[3]))) ; 15: F[2]
=(F[2] AND F[3]) ; 16: ! BIT4 ; 17: F[3]=(F[44]) ; 18: F[44]=(F[1] AND ((F[2] AN
D !F[3]) OR (!F[2] AND F[3]))) ; 19: F[2]=(F[2] AND F[3]) ; 20: ! 80msec is 10 *
8msec. 10=0b1010 ; 21: F[4]=(F[44] AND !F[43] AND F[42] AND !F[41]) F[1] is the 
work variable to keep DI[1] value. All bits of counter (F[41-44]) are cleared wh
en F[1] is OFF. F[2] is the work variable, the counter value is increased when F
[2] is ON. When the counter value is 10 (F[41]:ON, F[42]:OFF, F[43]:ON, F[44]:OF
F), F[4] becomes ON, and F[2] becomes OFF, so the counter is not increased until
DI[1] is turned OFF. 14.6.3. Marker The Marker Screen allows you to monitor the 
status of Markers. Marker (M[ ]) is similar to flag, but the value of markers is
not set directly. When Marker (M[ ]) is specified in the left side of an assignm
ent (=) in a TP program and the statement is executed, the expressions are defin
ed as Background Logic internally, and the expression is executed repeatedly. Th
e marker (M[ ]) always has the result of the expression. By default, the Marker 
function is disabled, the Marker menu is not displayed, and M[ ] can not be taug
ht in TP program. To use the Marker function, set $MIX_LOGIC.$USE_MKR to TRUE. E
xample: M[1]=(DI[1] AND DI[2]) After this line is executed in a normal TP progra
m (not in Background Logic), M[1] always has the result of the right side expres
sion. When both DI[1] and DI[2] are ON, M[1] is ON, in the other case M[1] is OF
F. When a Marker assignment statement is executed in a normal TP program, the st
atement is registered to Background Logic. The statement is executed as Backgrou
nd Logic until another expression redefines the marker. Execution of the stateme
nt does not stop even though the program is paused or aborted, because it is Bac
kground Logic. By default, there are 8 markers (M[1]-M[8]). The number of marker
s can be changed by system variable "$MIX_LOGIC.$NUM_MARKERS". Maximum number of
markers is 100. One marker takes 300bytes permanent memory pool. The scanning ti
me to calculate a marker assignment statement is the same as the scanning time o
f Normal mode Background Logic. Having marker assignment statements defined affe
cts the scan time of background logic. Clear the defined marker expression to st
op the calculation. To clear the defined expression, execute the CLEAR operation
in the Marker detail menu or execute the following line of TP program. M[1]=() I
f a marker is not assigned to an expression and the marker is used in another st
atement, the "INTP-347 Read I/O value failed" error occurs when the marker value
is read. M[ ] cannot be specified in the left side of assignment statement in Ba
ckground Logic. To display the Marker monitor menu Press MENU. Select 5, I/O. Pr
ess F1, TYPE. Select Marker. You will see a screen similar to the following: Mar
ker # STATUS 1/8 M[ 1] ON [ ] M[ 2] OFF [ ] M[ 3] OFF [ ] M[ 4] ON [ ] M[ 5] OFF
[ ] M[ 6] OFF [ ] M[ 7] OFF [ ] M[ 8] OFF [ ] To display the port detail menu, p
ress F2, DETAIL. You will see a screen similar to the following: Port Detail Mar
ker [ 1] Comment:[ ] Expression: M[1]=((DI[1] OR DI[2]) AND !DI[3] AND !(DI[4] A
ND DI[5])) Monitor: M [1] ON DI[1] OFF DI[2] ON DI[3] OFF DI[4] OFF DI[5] ON You
can change marker comments in this screen. The port detail screen displays the d
efined expression. To clear the defined expression , press F5, CLEAR. When the m
essage Clear expression? is displayed, press F4, YES. Current value of every dat
a item in the defined expression is displayed in monitor area. You can change ma
rker comments in this screen. 14.6.4. TC_ONLINE TC_ONLINE is similar to marker. 
The TC_ONLINE statement defines the expression and the expression is calculated 
as Background Logic. While the result of the expression is OFF, all TP programs 
that have group motion are stopped. By default, the TC_ONLINE function is disabl
ed, the TC_ONLINE menu is not displayed and TC_ONLINE statement can not be taugh
t in TP program. To use TC_ONLINE function, please set $MIX_LOGIC.$USE_TCOL to T
RUE. For Example: TC_ONLINE (DI[1] AND DI[2]) After this line is executed, all T
P programs are stopped while DI[1] or DI[2] is OFF. Refer to Table 19, " TC Onli
ne Instruction " . Table 19. TC Online Instruction TC_ONLINE (...) Defines the s
pecified Mixed Logic Instructions as a TC_ONLINE expression and enables the TC_O
NLINE function. TC_ONLINE DISABLE* Disable TC_ONLINE function. Any TP program is
not stopped by TC_ONLINE when TC_ONLINE is disabled. TC_ONLINE ENABLE* Enable TC
_ONLINE function. This is used to enable TC_ONLINE that is disabled by TC_ONLINE
Disable. * By default, TC_ONLINE DISABLE and TC_ONLINE ENABLE are not available.
set $MIX_LOGOC.$USE_TCOLSIM to FALSE to use these instructions. When TC_ONLINE (
...) statement is executed, the specified expression is defined as a TC_ONLINE e
xpression. While TC_ONLINE is enabled, the defined expression is calculated as B
ackground Logic. If the result of the expression is OFF, all TP and KAREL progra
ms except NOPAUSE are stopped. If a program is started while TC_ONLINE expressio
n is OFF, the program is paused immediately. All types of start are affected by 
TC_ONLINE except Shif+BWD. Only when a program is executed by Shift+BWD, the pro
gram can be executed even though TC_ONLINE expression is OFF. TC_ONLINE expressi
on is calculated at every ITP (ITP is normally 8msec) even though the scanning t
ime of Background Logic is longer than ITP. Programs that do not have motion gro
up or in which 'ignore pause' parameter is TRUE are not paused even if TC_ONLINE
condition is OFF. When $MIX_LOGIC.$USE_TCOLSIM is TRUE (default), TC_ONLINE DISA
BLE and TC_ONLINE ENABLE cannot be taught by Edit menu. The setting of ENABLE/DI
SABLE of TC_ONLINE should be changed in the TC_ONLINE menu. In this case, TC_ONL
INE is enabled automatically when motion statement execution is completed. This 
means that TC_ONLINE is disabled only when the operator moves the robot temporar
ily. When $MIX_LOGIC.$USE_TCOLSIM is FALSE, TC_ONLINE DISABLE and TC_ONLINE ENAB
LE can be taught by Edit menu. The setting of ENABLE/DISABLE of TC_ONLINE is not
changed automatically when motion statement execution is completed. Use Adding a
TC_ONLINE Instruction to add a TC_ONLINE Instruction. Use Displaying the TC_ONLI
NE Monitor Menu to display the TC_ONLINE Monitor Menu. Procedure 10. Adding a TC
_ONLINE Instruction Steps At the Edit menu, press F1, INST to go to the Instruct
ion menu. Select TC_ONLINE. If $MIX_LOGIC.$USE_TCOLSIM is TRUE , select the item
and complete the statement as you normally would If $MIX_LOGIC.$USE_TCOLSIM is F
ALSE , Select 1 (...). Select the item and complete the statement as you normall
y would. To change a TC_ONLINE statement, press F4, CHOICE, on the first '(' in 
the TC_ONLINE statement, then select 2 ENABLE. Procedure 11. Displaying the TC_O
NLINE Monitor Menu Steps Press MENU. Select 5, I/O. Select F1, TYPE. Select TC O
NLINE. You will see a screen similar to the following: TC_ONLINE 1/6 Status: On 
Enable: TRUE Expression: ((DI[1] OR DI[2]) AND !DI[3] AND !(DI[4] AND DI[5])) Mo
nitor: DI[1] ON DI[2] OFF DI[3] ON DI[4] OFF DI[5] OFF “Enable” line shows wheth
er TC_ONLINE is enabled or not now. User can change this item in this menu. “Sta
tus“ line shows the status of TC_ONLINE. It is the result of the defined express
ion. The current value of every data in the defined expression is displayed in m
onitor area. The defined expression is displayed in expression area. To clear th
e defined expression, move the cursor to Monitor. Press F5, CLEAR. You will see 
the following prompt: Clear expression? Press F4, YES. 14.7. Backup/Restore Ever
y data of Mixed Logic Instructions are saved as follows. Mixed Logic Instruction
s are saved in TP file of the program. Background Logic program is saved to TP f
ile. Setting of Background Logic menu is saved in MIXLOGIC.SV. MIXLOGIC.SV has t
he value of the following system variables. $MIX_LOGIC $MIX_BG $MIX_MKR $DRYRUN 
$DRYRUN_PORT $DRYRUN_SUB Comments of Flag and Marker are saved in DIOCFGSV.IO. I
f DI/O, UI/O or GI/O are assigned to flags, the assignment is saved in DIOCFGSV.
IO. 13. MISCELLANEOUS INSTRUCTIONS 15. MULTIPLE CONTROL INSTRUCTIONS
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: mixed logic, IF, AND, OR, NOT, conditional, boolean, DI, DO, RI, RO, F[], flag, register comparison, complex condition, background logic, BG Logic).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Mixed_Logic.txt`.
- Classification: reference / topic=registers.

