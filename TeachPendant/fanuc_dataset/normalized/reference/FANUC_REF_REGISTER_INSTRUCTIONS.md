---
id: FANUC_REF_REGISTER_INSTRUCTIONS
title: "Register Instructions"
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

# Register Instructions

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Register_Instructions.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


22. REGISTER INSTRUCTIONS 22. REGISTER INSTRUCTIONS PROGRAM ELEMENTS 22. REGISTE
R INSTRUCTIONS A register stores one number. to 999 registers are available for 
all the programs in the controller combined. The default number of registers is 
32. Registers are identified by numbers. You can increase the number of register
s during a controlled start. Refer to the “ System Operations” Appendix in the S
etup and Operations Manual for information on performing a Controlled start. Reg
ister instructions manipulate register data arithmetically. Register Addressing 
Many instructions employ direct or indirect addressing techniques. When direct a
ddressing is used, the actual value is entered into the instruction. For example
, if the register instruction R[2]= 5 is used, the current contents of register 
2 is replaced with the value 5. When indirect addressing is used, the instructio
n contains a register within a register. This indicates that the actual value of
the internal register becomes the register number of the external register. See 
Figure 106, " Direct and Indirect Addressing Example " . Figure 106. Direct and 
Indirect Addressing Example In Figure 106, " Direct and Indirect Addressing Exam
ple " , the first instruction illustrates direct addressing. This instruction ca
uses the current contents of register 3 to be replaced with the value 2. The sec
ond instruction in Figure 106, " Direct and Indirect Addressing Example " illust
rates indirect addressing. In this instruction, R[3] is the internal register an
d R[R[3]] is the external register. Since in the previous instruction the value 
of the internal register R[3] is 2, the external register number becomes R[R[3]=
2] or R[2]. Therefore, the result of the second instruction is that the contents
of the external register, R[2], is to be replaced with the value 5. R[x] = [valu
e] The R[x] = [value] instruction stores a value in a register. See Figure 107, 
" R[x] = [value] " . Figure 107. R[x] = [value] R[x]=[value][operator][value ] T
he R[x] = [value] [operator] [value] instructions store the result of an arithme
tic operation in a register. The arithmetic operations are Addition Subtraction 
Multiplication Division Whole number division (DIV) Remainder division (MOD) See
Figure 108, " R[x] = [value] [operator] [value] " . You can use multiple arithme
tic operators in a single instruction. However, there are the following limitati
ons: You can mix + and - in the same instruction. Arithmetic operations within a
n instruction that mixes + and - will be performed from left to right. You canno
t mix * or / in an instruction that already contains + or -. You can mix * and /
in the same instruction. Arithmetic operations within an instruction that mixes 
+ and - will be performed from left to right. You cannot mix + or - in an instru
ction that already contains * or /. The maximum number of arithmetic operators y
ou can have in the same instruction is 5. Figure 108. R[x] = [value] [operator] 
[value] 21. PROCESS SYNCHRONIZATION 23. SKIP INSTRUCTION
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: register, R[], numeric register, register instruction, assignment, arithmetic, register operation).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Register_Instructions.txt`.
- Classification: reference / topic=registers.

