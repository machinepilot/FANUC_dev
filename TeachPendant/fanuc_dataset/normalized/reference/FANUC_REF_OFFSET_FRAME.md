---
id: FANUC_REF_OFFSET_FRAME
title: "Offset Frame"
topic: motion
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

# Offset Frame

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Offset_Frame.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


16. OFFSET/FRAME INSTRUCTIONS 16. OFFSET/FRAME INSTRUCTIONS PROGRAM ELEMENTS 16.
OFFSET/FRAME INSTRUCTIONS Offset/frame instructions specify positional offset in
formation or the frames used for positional information. There are five offset i
nstructions: Positional offset condition - contains information on the distance 
or degrees to offset positional information User frame Sets the number of the us
er frame to use Defines a user frame Tool frame Sets the number of the tool fram
e to use Defines a tool frame If your system is configured to have more than one
group, you can set the group mask when you create any offset instruction that co
ntains a position register. The group mask allows you to use function keys to sp
ecify: Whether the group mask will be used. If the group mask is not used, the p
osition register will affect the default group only. The group or groups that th
e position register will affect. OFFSET CONDITION PR[x] item The OFFSET CONDITIO
N PR[x] item instruction specifies a position register that contains the offset 
information used when the OFFSET command is executed. When a user frame is speci
fied in UFRAME[y], that user frame is used when the offset command uses the offs
et specified in PR[x]. The OFFSET command is entered in the motion instruction. 
Refer to Section 6, "MOTION OPTIONS INSTRUCTION" for more information. See Figur
e 73, " Offset Condition " . Figure 73. Offset Condition UFRAME_NUM = [value] Th
e UFRAME_NUM=[value] instruction sets the number of the user frame to use. A val
ue of zero indicates that no user frame is used. This means that world frame is 
used. See Figure 74, " UFRAME_NUM=[value] " . Refer to the “General Setup” chapt
er in the Setup and Operations Manual for information on setting the user frame.
Note To verify that this feature is enabled, check the value of $USEUFRAME and b
e sure it is set to TRUE. Also, make sure the UFRAME number is not zero before y
ou teach data. Note You must execute the UFRAME_NUM = value instruction after yo
u insert it into a teach pendant program in order for the subsequent positions t
o be recorded correctly with respect to the proper user frame. Note This instruc
tion can be used only if your system has the Userframe input option installed. F
igure 74. UFRAME_NUM=[value] UTOOL_NUM = [value] The UTOOL_NUM=[value] instructi
on sets the number of the tool frame to use. A value of zero indicates that no t
ool frame is used. This means that the frame defined by the faceplate coordinate
s is used. See Figure 75, " UTOOL_NUM=[value] " . Refer to the “General Setup” c
hapter in the Setup and Operations Manual for information on setting the tool fr
ame. Figure 75. UTOOL_NUM=[value] UFRAME[i] = PR[x] The UFRAME[i] = PR[x] instru
ction defines the specified user frame using the information contained in a posi
tion register. See Figure 76, " UFRAME[i] = PR[x] " . Figure 76. UFRAME[i] = PR[
x] UTOOL[i] = PR[x] The UTOOL[i] = PR[x] instruction defines the specified tool 
frame using the information contained in a position register. See Figure 77, " U
TOOL[i] = PR[x] " . Figure 77. UTOOL[i] = PR[x] 15. MULTIPLE CONTROL INSTRUCTION
S 17. PARAMETERS FOR PROGRAM CALL AND MACRO INSTRUCTIONS
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: offset, frame, UFRAME, UTOOL, user frame, tool frame, frame instruction, frame assignment).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Offset_Frame.txt`.
- Classification: reference / topic=motion.

