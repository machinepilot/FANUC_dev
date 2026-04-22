---
id: FANUC_REF_PARAMETERS_CALL_MACRO
title: "Parameters Call Macro"
topic: karel
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

# Parameters Call Macro

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Parameters_Call_Macro.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


17. PARAMETERS FOR PROGRAM CALL AND MACRO INSTRUCTIONS 17. PARAMETERS FOR PROGRA
M CALL AND MACRO INSTRUCTIONS PROGRAM ELEMENTS 17. PARAMETERS FOR PROGRAM CALL A
ND MACRO INSTRUCTIONS 17.1. Overview A parameter is an argument you pass with a 
program call or MACRO instruction to a corresponding sub-program or macro progra
m. This is similar to passing a parameter with a KAREL routine. In HandlingTool,
you can pass parameters to teach pendant programs and macros. In the example sho
wn in Figure 78, " Parameter Example " , the main program, MAIN.TP, calls the su
b program, PROC_1.TP, and uses two parameters. These parameters can be used in t
he sub-program as two argument registers, AR[1] and AR[2] . Figure 78. Parameter
Example To use parameters, you do the following: Define the parameter(s) in the 
CALL program instruction or macro program instruction. Use the parameters within
the sub-program or macro program by including one of the permitted instructions.
A parameter can be one of the following: Constant String Argument register (AR[ 
]) Register (R[ ]) This section contains information on the following topics: Pa
rameter instruction syntax String value selections Argument registers Parameter 
guidelines Including parameters in program call and MACRO instructions Including
argument registers in sub-programs 17.2. Parameter Instruction Syntax You can us
e parameters in the following kinds of instructions: Program call instructions M
ACRO instructions Refer to Table 20, " Parameter Instructions " for example para
meter instructions. Table 20. Parameter Instructions Instruction Name Example Pr
ogram Call instruction CALL SUBPRG_1(1, R[3], AR[1]) MACRO instruction Vacuum_Ha
nd_Release(2.5) Set_UTOOL(1) Refer to Table 21, " Parameter Data Types " for exa
mple parameter data types. Table 21. Parameter Data Types Parameter Type Example
Constant 1, 3.5 String* 'Perch' Register R[6] Argument Register AR[3] Program Ca
ll Instructions The syntax of the program call instruction is shown in Figure 79
, " CALL Program with Parameters " . Figure 79. CALL Program with Parameters MAC
RO Instructions The syntax of the MACRO instruction is shown in Figure 80, " MAC
RO Program with Parameters " . Figure 80. MACRO Program with Parameters 17.3. St
ring Value Selections When you program instructions for call parameters and you 
select string, the subwindow lists choices. You can control the choices you see 
in the subwindow by initializing the system variables summarized in Table 22, " 
String Parameter System Variables " . There are sets of choices: a top-level cat
egory and a lower-level sub-category. Table 22. String Parameter System Variable
s Item System Variables Notes HandlingTool Default Value String category Top-lev
el categories: $ARG_STRING[i].$title i = 1-10 At least one character, to 16 char
acters $ARG_STRING[1].$title = MENUS the menu utility option uses this first ent
ry. Do not make changes here. The menu utility program will overwrite your chang
es. $ARG_STRING[2].$title = 'PARTS' $ARG_STRING[3].$title = 'TOOL' $ARG_STRING[4
].$title = 'WORK' $ARG_STRING[5].$title = 'POS' $ARG_STRING[6].$title = 'DEV' $A
RG_STRING[7].$title = 'PALT' $ARG_STRING[8].$title = 'GRIP' $ARG_STRING[9].$titl
e = 'USER' $ARG_STRING[10].$title = 'PREG' String Lower level sub-categories: $A
RG_STRING[ i ].$item j i = 1-10 j = 1-20 to 16 characters $ARG_STRING[2].$item1=
'PARTS_ITEM1' $ARG_STRING[3].$item1 = 'TOOL_ITEM1' $ARG_STRING[4].$item1 = 'WORK
_ITEM1' $ARG_STRING[5].$item1 = 'POS_ITEM1' $ARG_STRING[6].$item1 = 'DEV_ITEM1' 
$ARG_STRING[7].$item1 = 'PALT_ITEM1' $ARG_STRING[8].$item1 = 'GRIP_ITEM1' $ARG_S
TRING[9].$item1 = 'USER_ITEM1' $ARG_STRING[10].$item1 = 'PREG_ITEM1' Function ke
y label "Words" displayed for F1-F5 keys when you select parameter string, F5, S
TRINGS. $ARG_WORD[i] i = 1-5 to 7 characters $ARG_WORD[1] = '$' $ARG_WORD[2] = '
[' $ARG_WORD[3] = ']' 17.4. Argument Registers When you refer to a parameter wit
hin a sub-program or macro program, you refer to it as an argument register . Fr
om left to right in the instruction, the first parameter is AR[1], the second pa
rameter is AR[2], and so forth. See Figure 81, " Argument Registers " . Figure 8
1. Argument Registers You can use the argument registers in specific instruction
s in the sub-program or macro program. Table 23, " Instructions That Can Use AR[
] " lists the kinds of instructions that can use argument registers. Table 23. I
nstructions That Can Use AR[] You Can Use an Argument Register... Example On the
right side of an assignment instruction R[1] = AR[1] + R[2] + AR[4] IF R[1] = AR
[1] AND R[2] = AR[4] , JMP LBL[1] GO[1] = AR[2] IF R[7] = AR[1] , JMP LBL[1] WAI
T AI[1] <> AR[2] , JMP LBL[1] UFRAME_NUM = AR[3] UTOOL_NUM = AR[4] As an indirec
t index in an instruction R[ AR[1] ] = R[ AR[2] ] DO[ AR[1] ] = ON As a paramete
r for program call instruction CALL SUBPRG_1( AR[5] ) As a parameter for MACRO i
nstruction Hand 3 Release ( AR[1] ] Note You cannot use an argument register as 
the index for an indirect register, as follows: Not allowed: R[ R[ AR[1] ] ] All
owed: AR[ [ AR[1] ] 17.5. Guidelines for Using Parameters Follow the guidelines 
in this section to use parameters correctly and avoid errors. Use No More than T
en Parameters in an Instruction You can use to ten parameters in a program call 
or MACRO program instruction. See Figure 82, " Use No More than Ten Parameters i
n an Instruction " for an example. Figure 82. Use No More than Ten Parameters in
an Instruction Make Sure Data Types Match The parameter type in AR[ ] must match
the data type in the sub-program or macro program instruction. The compatibility
of data types between parameters used in the main program and sub-program is not
checked until the main program is executed. If the data type specified in the ma
in program does not match how the argument register is used in the sub-program, 
an error will occur. In the example shown in Figure 83, " Make Sure Data Types M
atch " , if string data is stored in AR[2] as defined in the main program, when 
the instruction R[3] = AR[2] is executed in the sub-program, an alarm occurs. Fi
gure 83. Make Sure Data Types Match Define All Required Elements of the Paramete
rs You Add You must define all required elements of a parameter you add to an in
struction in the main program. Registers and argument registers require index nu
mbers. Constants and strings require values. In the examples shown in Figure 84,
" Define All Parameter Elements " , the constant parameter has not been specifie
d and the register index has not been defined. When the sub-program is executed,
an error will occur. Figure 84. Define All Parameter Elements In a Sub-Program, 
Use Parameters Defined in the Main Program Argument registers used in a sub-prog
ram must be defined in the corresponding main program. In the example shown in F
igure 85, " Use Parameters Defined in the Main Program " , the program MAIN sets
only one parameter, but the sub-program PROC_1 uses a second parameter (AR[2]). 
The sub-program cannot use a parameter that has not been defined. When that inst
ruction is executed, an error will occur. Figure 85. Use Parameters Defined in t
he Main Program In a Main Program, You Can Define Parameters that are Not Used i
n the Sub-Program Parameters can be defined in the main program that are not use
d in the sub-program. You can use this feature to pass optional parameters. The 
sub-program can provide branches that process a parameter only if it exists. Exe
cute Sub-Programs or Macro Programs only from Main Programs Sub-programs or MACR
O programs that use argument registers can be executed from the corresponding ma
in programs only. You cannot execute a sub-program that uses AR[ ] values unless
the sub-program is called from a main program. The main program supplies the val
ues of the parameters used in the sub-program. If you execute the sub-program in
dependently of the main program, the parameters will not have any values, and th
e following error is displayed: "INTP-288 Parameter does not exist." Therefore, 
the sub-program that uses the parameters cannot be executed. 17.6. Including Par
ameters in Program Call and Macro Instructions Use Including Parameters in Progr
am Call and MACRO Instructions to include parameters in program call and MACRO i
nstructions. Procedure 12. Including Parameters in Program Call and MACRO Instru
ctions Conditions You have created a teach pendant program. This program is not 
a process program. Steps Select the program you want to edit. Press ENTER. Inser
t a call program or MACRO instruction. To add a parameter to an instruction that
has no parameters , Move the cursor to the program call or MACRO program instruc
tion to which you want to add parameters. Press the right arrow key to move the 
cursor to the end of the instruction as shown in the following screen. 5: CALL P
ROC_1 Press F4, [CHOICE]. Select the kind of parameter you want to insert: To in
sert a constant parameter, go to Step 9 . To insert a string parameter, go to St
ep 10 . To insert an argument register (AR[]) parameter, go to Step 11 . To inse
rt a register (R[ ]) parameter, go to Step 7 . To insert a parameter in an instr
uction that has other parameters , Move the cursor to the program call or MACRO 
program instruction in which you want to insert a parameter. Move the cursor to 
the right of where you want to insert the parameter. See Figure 86, " Cursor Pos
ition to Insert Parameters " . Figure 86. Cursor Position to Insert Parameters P
ress F4, [CHOICE]. If you are inserting a parameter between existing parameters 
, select < Insert>. Otherwise, continue to Step 5 Step 5.e . Select the kind of 
parameter you want to insert: To insert a constant parameter, go to Step 9 . To 
insert a string parameter, go to Step 10 . To insert an argument register (AR[])
parameter, go to Step 11 . To insert a register (R[ ]) parameter, go to Step 7 .
To delete a parameter , Move the cursor to the program call or MACRO program ins
truction in which you want to delete a parameter. Move the cursor to the paramet
er you want to delete. Press F4, [CHOICE]. Select <None>. Note If no parameter i
s set for the instruction or the cursor is on ")" on the end of the line, no par
ameter will be deleted and the sub-menu will be closed. To insert a register (R[
]) parameter, Select R[ ]. Type the index of the register and press ENTER. To in
sert an indirect register (R[AR[ ]]orR[R[]]) parameter, Select R[ ]. To change t
he index between an R[ ] and an AR[ , move the cursor to the register and press 
F3, INDIRECT, repeatedly. The index will be changed as follows: R[ R[...] ] -> R
[ AR[...] ] -> R[ R[...] ] -> ... To insert a constant parameter , Select Consta
nt. Type the value of the constant and press ENTER. To insert a string parameter
, Select String. See the following screen for an example. MENUTEST 4/22 1: !MENU
TES 2: Clear User Page 3: 4: Prompt Box Msg(’NotAtPerch’) 5: 6: Op. Entry Menu(’
Chute’)Select item Select the kind of string you want. To select a string from a
list of already defined strings, move the cursor to the string you want and pres
s F5, CHANGE. Move the cursor to the group of strings from which you want to sel
ect and press ENTER. Move the cursor to the string you want and press ENTER. To 
enter a string directly, press F5, String, press the appropriate function keys t
o type the string, and press ENTER. To change a string after you have entered on
e , move the cursor to the string, press F5, CHANGE, and repeat Step 10.b . Note
If you want to change the string choices that are displayed, you must set system
variables. Refer to Section 17.3, " String Value Selections " for more informati
on. To insert an argument register AR[] parameter, Select AR[ ]. Type the index 
of the argument register and press ENTER. To insert an indirect argument registe
r (AR[R[]]orAR[AR[ ]]) parameter, Select AR[ ]. To change between an AR[ ] and a
n R[ ] , move the cursor to the AR[ ] and press F3, INDIRECT, repeatedly. The in
dex will be changed as follows: AR[ R[...] ] -> AR[ AR[...] ] -> AR[ R[...] ] ->
... Note To include an AR[ ] as an indirect index, move the cursor to the index,
and press F3, INDIRECT, two times. 17.7. Including Argument Registers in Sub-Pro
grams Use Including Argument Registers in a Sub-Program to include argument regi
sters (AR[ ]) in a sub-program. Procedure 13. Including Argument Registers in a 
Sub-Program Conditions You have created a teach pendant program that includes a 
program call or macro program instruction. Steps Select the sub-program or macro
program you want to edit. Press ENTER. Insert one of the kinds of instructions t
hat can contain an AR[ ]. Refer to Table 24, " Instructions that can Use AR[] " 
. Table 24. Instructions that can Use AR[] You Can Use an Argument Register... E
xample On the right side of an assignment instruction R[1] = AR[1] + R[2] + AR[4
] IF R[1] = AR[1] AND R[2] = AR[4] , JMP LBL[1] GO[1] = AR[2] IF R[7] = AR[1] , 
JMP LBL[1] WAIT AI[1] <> AR[2] , JMP LBL[1] UFRAME_NUM = AR[3] UTOOL_NUM AR[4] A
s an indirect index in an instruction R[ AR[1] ] = R[ AR[2] ] DO[ AR[1] ] = ON A
s a parameter for program call instruction CALL SUBPRG_1( AR[5] ) As a parameter
for MACRO instruction Hand 3 Release ( AR[1] ] In the instruction you just inser
ted, move the cursor to the element you want to change to an AR[ ]. Press F4, [C
HOICE]. Select AR[ ]. Type the index and press ENTER. To include an AR[ ] as an 
indirect index , move the cursor to the index, and press F3, INDIRECT, two times
. 16. OFFSET/FRAME INSTRUCTIONS 18. POINT LOGIC INSTRUCTION
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: parameters, CALL, macro, AR[], argument register, subroutine, sub-program, parameter passing, indirect register, R[AR[]], macro instruction).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Parameters_Call_Macro.txt`.
- Classification: reference / topic=karel.

