---
id: FANUC_REF_FOR_ENDFOR
title: "For Endfor"
topic: anti_pattern
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

# For Endfor

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_For_Endfor.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


9. FOR/ENDFOR INSTRUCTIONS 9. FOR/ENDFOR INSTRUCTIONS PROGRAM ELEMENTS 9. FOR/EN
DFOR INSTRUCTIONS The FOR/ENDFOR instruction is a function that repeats a loop w
ithin FOR and ENDFOR instructions a specified number of times. 9.1. Overview FOR
/ENDFOR instructions have two INSTRUCTIONs: FOR instruction and ENDFOR instructi
on. FOR instruction - start of FOR/ENDFOR loop ENDFOR instruction - end of FOR/E
NDFOR loop INSTRUCTIONs within FOR and ENDFOR instructions are repeated. The num
ber of times to repeat is determined by the specified values in the FOR instruct
ion. 9.2. FOR/ENDFOR Instruction Specification 9.2.1. Form of FOR Instruction Th
e form of FOR instruction is as follows. Register is used for the Loop counter. 
Constant, Register, and Argument Register is used for the Initial value. For Con
stant, an integer whose range is –32767 to 32767 can be specified. Constant, Reg
ister, and Argument Register is used for the Target value. For Constant, the int
eger whose range is –32767 to 32767 can be specified. 9.2.2. FOR Instruction Exe
cution When the FOR instruction is executed, the Initial value is substituted in
to the Loop counter. The following condition should be satisfied to execute the 
FOR/ENDFOR loop. When TO is specified, Initial value is equal to or smaller than
Target value. When DOWNTO is specified, Initial value is equal to or larger than
Target value. When this condition is not satisfied, the cursor moves to the line
of the combined ENDFOR instruction and the FOR/ENDFOR loop is not executed. The 
FOR instruction is executed only once in the FOR/ENDFOR loop. 9.2.3. Form of END
FOR Instruction The form of ENDFOR instruction is as follows. 9.2.4. ENDFOR Inst
ruction Execution The FOR/ENDFOR loop is repeated as long as the following condi
tion is satisfied. When TO is specified, the value of Loop counter is smaller th
an Target value. When DOWNTO is specified, the value of Loop counter is larger t
han Target value. When this condition is satisfied and TO is specified, the valu
e of Loop counter is incremented. When this condition is satisfied and DOWNTO is
specified, the value of the Loop counter is decremented. And after that, the cur
sor moves to the line of the combined FOR instruction. When this condition is no
t satisfied, the cursor moves to line and the FOR/ENDFOR loop is not repeated. N
ote An internal delay is used when the FOR/ENDFOR loop is executed repeatedly. T
herefore, a WAIT instruction is not necessary in the FOR/ENDFOR loop to repeat t
he loop. 9.3. Teach FOR/ENDFOR Instruction 9.3.1. How to teach the FOR/ENDFOR In
struction How to teach FOR/ENDFOR instruction is as follows. Procedure 7. Teach 
FOR/ENDFOR Instruction In this example, insert blank lines in line 1 and 5. Move
the cursor to line 1 and press F1, [INST]. Select FOR/ENDFOR. Select FOR. The FO
R instruction is taught. The cursor automatically moves to the index of the regi
ster. Input the value of the index. In this example, input 1. The cursor automat
ically moves to Initial value part. In this example, Constant is selected and th
e value is 1. To choose register or argument register, press F4, [CHOICE] and se
lect one of them. The cursor automatically moves to TO/DOWNTO part. In this exam
ple, press ENTER. To choose DOWNTO, press F4, [CHOICE] and select DOWNTO. The cu
rsor automatically moves to Target value part. In this example, select R[]. Inpu
t 2 for the index of the register. Move the cursor to line 5 and press F1, [INST
]. Select FOR/ENDFOR. Select ENDFOR. ENDFOR instruction is taught. 9.3.2. FOR/EN
DFOR instruction Combination FOR and ENDFOR instructions are automatically combi
ned after teaching. The closest FOR instruction and ENDFOR instruction are combi
ned. By teaching FOR/ENDFOR instructions additionally in FOR/ENDFOR loop, nested
loops can be formed. to 10 nested loops can be formed. However, teaching more th
an 10 nested loops causes an alarm in execution. The number of FOR instruction a
nd ENDFOR instruction in a program should be the same. When the number is not th
e same, an alarm occurs in execution. Alarms related to FOR/ENDFOR function are 
described in Section 9.5, "Alarms" . How to combine FOR and ENDFOR instructions 
is described in the following example. Teach FOR instruction in line 1. In this 
case, the number of FOR instruction and ENDFOR instruction is not the same. Ther
efore, if this program is executed, the alarm “INTP-670 Need ENDFOR for FOR in l
ine 1” occurs. Teach ENDFOR instruction in line 6. FOR/ENDFOR loop is formed by 
FOR instruction in line 1 and ENDFOR instruction in line 6. Teach FOR instructio
n in line 3. In this case, the number of FOR instruction and ENDFOR instruction 
is not the same. Therefore, if this program is executed, the alarm “INTP-670 Nee
d ENDFOR for FOR in line 1” occurs. Teach ENDFOR instruction in line 8. The clos
est FOR instruction and ENDFOR instructions are combined. Therefore, the first F
OR/ENDFOR loop is formed by FOR instruction in line 3 and ENDFOR instruction in 
line 6, and the second FOR/ENDFOR loop is formed by FOR instruction in line 1 an
d ENDFOR instruction in line 8. In this example, 2 nested loops are formed. Note
Please be careful not to use the same register number as Loop counters in the sa
me nested loop. It might cause abnormal behavior. 9.4. Execution examples 9.4.1.
Backward execution Backward execution is prohibited on FOR/ENDFOR instructions. 
However, backward execution on instructions within FOR/ENDFOR loop is allowed. I
n the following example, when backward execution is started from line 1 or 5, th
e alarm “INTP-238 BWD execution completed” occurs. On the other hand, backward e
xecution can be done when started from line 2, 3, 4 or 6. 9.4.2. Examples The ex
amples of FOR/ENDFOR instruction are described with the following program. Case 
1: R[2]=3 TO is specified and Initial value is smaller than Target value. Theref
ore, the condition of FOR instruction is satisfied. As the value of Loop counter
changes from 1 to 3, the condition of ENDFOR instruction is satisfied and FOR/EN
DFOR loop is repeated three times. Case 2: R[2]=1 TO is specified and Initial va
lue is equal to Target value. Therefore, the condition of FOR instruction is sat
isfied. However, as the value of Loop counter is equal to Target value, the cond
ition of ENDFOR instruction is not satisfied. Therefore, FOR/ENDFOR loop is exec
uted only once. Case 3: R[2]=0 TO is specified and Initial value is larger than 
Target value. Therefore, the condition of FOR instruction is not satisfied. The 
cursor moves to the line of combined ENDFOR instruction, that is, line 6 and FOR
/ENDFOR loop is not executed. Other examples Start within FOR/ENDFOR loop: R[1]=
0 When the following program is executed from line 3 and R[1]=0, the condition o
f ENDFOR instruction is satisfied. Therefore, FOR/ENDFOR loop is repeated 4 time
s (0 to 3). Start within FOR /ENDFOR loop: R[1]=5 When the following program is 
executed from line 3 and R[1]=5, the condition of ENDFOR instruction is not sati
sfied. Therefore, FOR/ENDFOR loop is not repeated. JMP/LBL instructions exist wi
thin FOR/ENDFOR loop: In the following program, JMP/LBL instructions exist withi
n the FOR/ENDFOR loop. The cursor moves from line 3 to line 7 by JMP instruction
. FOR/ENDFOR loop between line 1 and 4 is not executed. As line 7 is also within
the FOR/ENDFOR loop and the condition of ENDFOR instruction in line 8 is satisfi
ed, FOR/ENDFOR loop between lines 5 and 8 is repeated. Finally, the value of R[1
] is equal to 1 and R[2] is equal to 2. Note Please be careful when you use JMP/
LBL within FOR/ENDFOR loop. Before you use them, please consider how the loop wo
rks. Otherwise, it might cause fatal errors. The Loop counter value is modified 
within FOR/ENDFOR loop: Loop counter can be modified within the FOR/ENDFOR loops
. In the following example, when DI[1] = ON, R[1] is changed to 11. As this valu
e is larger than Target value, this FOR/ENDFOR loop is finished. Note Please be 
careful when you modify Loop counter value within FOR/ENDFOR loop. Changing Loop
counter value within FOR/ENDFOR loop may cause an abnormal behavior or infinite 
loops. Please be careful when you modify Target value within FOR/ENDFOR loop whe
n register or argument register is specified for them. Changing the value within
FOR/ENDFOR loop might cause an abnormal behavior. The Loop counter value is calc
ulated within FOR/ENDFOR loop: In the following example, FOR/ENDFOR loop counter
is calculated. After execution, Loop counter value will be 11. Loop counter valu
e is different from Target value. However, this result is correct. This is expla
ined as follows. Line 1, R[1] is 6 (Initial value). Line 5, R[1] is 7. Line 6, R
[1] is 7 and this satisfies the ENDFOR condition. R[1] is incremented to be 8. L
ine 5, R[1] is 9. Line 6, R[1] is 9 and this satisfies the ENDFOR condition. R[1
] is incremented to be 10. Line 5, R[1] is 11. Line 6, R[1] is 11 and this does 
not satisfy the ENDFOR condition. The cursor goes to line. This means the user c
an calculate Loop counter, but need to be careful that the Loop counter value is
different from Target value. Note In some cases, calculating Loop counter causes
an alarm. This problem can be avoided by using DIV just before FOR/ENDFOR instru
ction or input the same value in DATA screen. Especially when you calculate with
real value use division, please make sure to use DIV. R[1]=R[1] DIV 1 9.5. Alarm
s Alarms occur in the following conditions with FOR/ENDFOR function. Execute whe
n the number of FOR instruction is smaller than ENDFOR instruction Execute when 
the number of ENDFOR instruction is smaller than FOR instruction Execute when th
ere is over 10 nested loops Other than integer is used for Initial value or Targ
et value in FOR instruction Other than integer is used for the value of Loop cou
nter or Target value in ENDFOR instruction Execute when the number of FOR instru
ction is smaller than ENDFOR instruction Execute the following program. As FOR i
nstruction for ENDFOR instruction in line 5 does not exist, the alarm “INTP-669 
Need FOR for ENDFOR in line 5” occurs in execution. Execute when the number of E
NDFOR instruction is smaller than FOR instruction Execute the following program.
As ENDFOR instruction for FOR instruction in line 1 does not exist, the alarm “I
NTP-670 Need ENDFOR for FOR in line 1” occurs in execution. Execute when there a
re over 10 nested loops The alarm “INTP-671 Too many FOR” occurs in execution. O
ther than integer is used for Initial value or Target value in FOR/ENDFOR instru
ction Other than integer is used for the value of Loop counter or Target value i
n ENDFOR instruction Execute the following program. As the value of the register
for Target value in FOR instruction in line 2 is not integer, the alarm “INTP-67
2 (program, 2) Value type is not integer” occurs when line 2 is executed. In oth
er cases, calculating the Loop counter, Initial value or Target value may cause 
the same alarm. Note In some cases calculating a register used for Loop counter 
or Target value causes the alarm above even though the result and the value disp
layed in DATA screen is integer. This problem can be avoided by using DIV as fol
lows just before FOR/ENDFOR instruction or input the same value in DATA screen. 
Especially when you calculate with real value using division, please make sure t
o use DIV. R[1]=R[1] DIV 1 8. BRANCHING INSTRUCTIONS 10. INPUT/OUTPUT INSTRUCTIO
NS
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: FOR, ENDFOR, loop, iteration, counter, repeat, increment, decrement, loop control).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_For_Endfor.txt`.
- Classification: reference / topic=anti_pattern.

