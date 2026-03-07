# FANUC Dataset Quick Reference

Use this index to rapidly find relevant dataset files when answering FANUC TP questions or editing `.LS` programs. Paths are relative to `optimized_dataset/`.

---

## By Topic

| Topic | Primary File | Related Files |
|-------|--------------|---------------|
| **Motion (J, L, C)** | reference/FANUC_REF_Motion_Instructions.txt | reference/FANUC_REF_Motion_Options.txt, articles/ONE_16_FANUC_FINE_vs_CNT_Termination.txt, articles/ONE_33_FANUC_Motion_Speed_and_Acceleration_Tuning.txt |
| **I/O (DI, DO, WAIT, PULSE)** | reference/FANUC_REF_IO_Instructions.txt | articles/ONE_10_FANUC_I_O_Configuration_and_Mapping.txt, articles/ONE_22_FANUC_Digital_I_O_Pulse_Instructions.txt |
| **Vision (iRVision, RUN_FIND)** | reference/FANUC_REF_Vision_Instructions.txt | articles/ONE_14_FANUC_Vision_System_Setup_and_iRVision.txt, articles/ONE_20_FANUC_Vision_Line_Tracking_Setup.txt, examples/EG_Vision_3Point.txt, examples/EG_Vision_Wait.txt, examples/EG_Vision_Check.txt. For AI/ROS 2 perception: `physical_ai/poc/POC_01_Camera_Perception.md`, `physical_ai/references/Physical_AI_Concepts.md` |
| **Branching (IF, SELECT, JMP, LBL)** | reference/FANUC_REF_Branching_Instructions.txt | articles/ONE_35_FANUC_Program_Branching_and_Flow_Control.txt |
| **Registers (R[], PR[])** | reference/FANUC_REF_Register_Instructions.txt | reference/FANUC_REF_Position_Registers.txt, reference/FANUC_REF_String_Registers.txt, articles/ONE_13_FANUC_Register_Types_and_Usage.txt, articles/ONE_07_Position_Register_Math_and_Offset_Calculations.txt |
| **Macros & CALL** | reference/FANUC_REF_Macro_Instruction.txt | reference/FANUC_REF_Parameters_Call_Macro.txt, articles/ONE_15_FANUC_Macro_Programs.txt |
| **Background Logic** | articles/ONE_23_FANUC_Background_Logic_Programming.txt | examples/EG_Background_Logic.txt |
| **Machine Tending / RoboDrill** | examples/EG_JOB_A_CRDrill_SingleHand.txt | articles/ONE_32_FANUC_RoboDrill_Machine_Tending_Patterns.txt, examples/EG_JOB_B_CRDrill_DualHand.txt, examples/EG_JOB_C_DualDrill.txt, examples/EG_JOB_D_DualDrill_DualHand.txt |
| **Grid / Palletizing** | articles/ONE_26_FANUC_Palletizing_Patterns_and_Grid_Calculations.txt | examples/EG_PICK_Single_Grid.txt, examples/EG_PICK_Dual_Grid.txt, examples/EG_PUT_Dual_Grid.txt |
| **Chuck / Gripper** | examples/EG_Chuck_Operations.txt | examples/EG_DQ_Chuck_Operations.txt |
| **Skip Condition** | reference/FANUC_REF_Skip_Instructions.txt | articles/ONE_06_Refactoring_Skip_Conditions_with_AR_and_Indirect_Addressing.txt |
| **Wait / Timer** | reference/FANUC_REF_Wait_Instructions.txt | articles/ONE_18_FANUC_Timer_Instructions.txt |
| **Frames (UFRAME, UTOOL)** | reference/FANUC_REF_Offset_Frame.txt | articles/ONE_08_FANUC_User_Frames_and_Tool_Frames.txt, articles/ONE_24_FANUC_Tool_Center_Point_TCP.txt |
| **Error Recovery** | articles/ONE_28_FANUC_Error_Recovery_Programming.txt | examples/EG_C_Recovery_Macro.txt, examples/EG_DQ_C_Recovery.txt |
| **Alarms / Diagnosis** | articles/ONE_04_Diagnosing_FANUC_Alarm_Codes.txt | reference/FANUC_REF_Miscellaneous_Instructions.txt (UALM) |
| **KAREL** | reference/FANUC_KAREL_Reference.txt | articles/ONE_39_FANUC_KAREL_Programming_Fundamentals.txt, articles/ONE_11_KAREL_Position_Logging_to_File.txt. For external control via ROS 2: `physical_ai/references/FANUC_ROS2_Driver_Reference.md` |
| **Modbus / OPC UA** | protocols/FANUC_Modbus_Reference.txt | protocols/FANUC_OPCUA_Reference.txt. For ROS 2 / streaming motion: `physical_ai/references/FANUC_ROS2_Driver_Reference.md` |
| **Modbus / Press Brake** | LDJ/robot_interface_reference.md + protocols/FANUC_Modbus_Reference.txt + LDJ/reference/ | examples/EG_Press_Brake_Modbus_Handshake.txt (E20.x/A20.x, XC2F/XC3M/XC4M patterns) |
| **PNS / Job Scheduling** | examples/EG_PNS_Programs.txt | examples/EG_Collection_Programs.txt, reference/FANUC_REF_Collections.txt |
| **Signal Handshake** | examples/EG_Signal_Programs.txt | examples/EG_JOB_A_CRDrill_SingleHand.txt |
| **Math (MOD, DIV, etc.)** | reference/FANUC_REF_Math_Functions.txt | articles/ONE_07_Position_Register_Math_and_Offset_Calculations.txt |
| **Mixed Logic (IF/AND/OR)** | reference/FANUC_REF_Mixed_Logic.txt | — |
| **Program Control (RUN, CALL)** | reference/FANUC_REF_Program_Control.txt | — |
| **Point Logic (I/O during motion)** | reference/FANUC_REF_Point_Logic.txt | — |
| **Program Header / Structure** | reference/FANUC_REF_Program_Header.txt | articles/ONE_03_TP_Programming_Basics_and_Structure.txt, articles/ONE_09_FANUC_Program_Types_and_Subtypes.txt |
| **Payload** | articles/ONE_12_FANUC_Payload_Setup_and_Configuration.txt | reference/FANUC_REF_Miscellaneous_Instructions.txt |
| **System Variables** | articles/ONE_31_FANUC_System_Variable_Reference.txt | — |
| **Calibration / Mastering** | articles/ONE_21_FANUC_Robot_Calibration_and_Mastering.txt | examples/EG_Calib_Position.txt |
| **Best Practices** | articles/ONE_30_FANUC_Program_Maintainability_Best_Practices.txt | articles/ONE_17_FANUC_Program_Comments_and_Documentation.txt |

---

## By File Pattern

| Use Case | Location | Pattern |
|----------|----------|---------|
| **Syntax lookup** | reference/ | FANUC_REF_*.txt, FANUC_TP_Reference.md |
| **How-to / concepts** | articles/ | ONE_*.txt |
| **Program patterns** | examples/ | EG_*.txt |
| **Communication protocols** | protocols/ | FANUC_Modbus_Reference.txt, FANUC_OPCUA_Reference.txt |

---

## Master Reference

**reference/FANUC_TP_Reference.md** — Comprehensive TP reference (~82 sections, ~8,300 lines). Use for broad syntax questions when a specific topic file is not sufficient.

---

## Dataset Root

All paths above are relative to: `FANUC_Optimized_Dataset/optimized_dataset/`
