# FANUC TP Knowledge Base — Optimized Dataset
## For: The Way Automation LLC (TWA)

### Overview
This dataset has been consolidated and optimized for maximum retrieval efficiency
in Claude Project Knowledge. All files include structured metadata headers with
TOPIC, KEYWORDS, CATEGORY, SOURCE, and APPLIES_TO fields.

**Original:** 323 files, 4.8 MB
**Optimized:** 102 files, 1.2 MB (75% reduction)

### Structure

```
optimized_dataset/
├── reference/          (30 files, ~709 KB)
│   ├── FANUC_TP_Reference.md         — Master TP syntax reference (82 sections)
│   ├── FANUC_KAREL_Reference.txt     — KAREL programming language reference
│   ├── FANUC_REF_Motion_Options.txt  — Acceleration, CNT, Tool_Offset, Skip, etc.
│   ├── FANUC_REF_Motion_Instructions.txt — J, L, C motion instructions
│   ├── FANUC_REF_Vision_Instructions.txt — iRVision, RUN_FIND, GET_OFFSET
│   ├── FANUC_REF_Branching_Instructions.txt — JMP, LBL, IF, SELECT
│   ├── FANUC_REF_IO_Instructions.txt — DI, DO, RI, RO, GI, GO, WAIT, PULSE
│   ├── FANUC_REF_Mixed_Logic.txt     — Complex IF/AND/OR conditions
│   └── ... (22 more topic-specific reference files)
│
├── articles/           (42 files, ~220 KB)
│   ├── ONE_01_CRX_Plugins_and_Timeline_Editor.txt
│   ├── ONE_02_Async_Part_Presence_Checking_with_Multitasking.txt
│   ├── ONE_05_Controlling_Robot_Speed_Override.txt
│   ├── ONE_06_Refactoring_Skip_Conditions_with_AR_and_Indirect_Addressing.txt
│   ├── ONE_26_FANUC_Palletizing_Patterns_and_Grid_Calculations.txt
│   └── ... (37 more articles with descriptive names)
│
├── examples/           (28 files, ~119 KB)
│   ├── EG_JOB_A_CRDrill_SingleHand.txt  — Main job, single RoboDrill
│   ├── EG_JOB_D_DualDrill_DualHand.txt  — Main job, dual drill + dual hand
│   ├── EG_PICK_Single_Grid.txt          — Grid pick with MOD/DIV offsets
│   ├── EG_Chuck_Operations.txt          — All chuck open/close programs
│   ├── EG_Vision_3Point.txt             — 3-point vision offset
│   ├── EG_C_Recovery_Macro.txt          — Counter recovery after crash
│   └── ... (22 more example files)
│
└── protocols/          (2 files, ~163 KB)
    ├── FANUC_Modbus_Reference.txt       — Complete Modbus TCP/RTU reference
    └── FANUC_OPCUA_Reference.txt        — OPC UA server reference
```

### What Changed

| Category | Before | After | Change |
|----------|--------|-------|--------|
| FANUC Manual Pages | 169 files, 3.5 MB | 26 topic files, 284 KB | -92% (deduped) |
| TP Help Reference | 3 files, 523 KB | 1 file, 205 KB | Deduped, structured |
| ONE Robotics Articles | 42 files, generic names | 42 files, descriptive names | Renamed + headers |
| Program Examples | 78 files, many duplicates | 28 files, best variants | -64% (consolidated) |
| Modbus/OPCUA | 26 files, many stubs | 2 files | Consolidated |
| Removed | - | Experiment1.md, duplicate files | Meta-content removed |

### How to Use
Upload all files from this dataset to your Claude Project Knowledge base.
The structured headers ensure the search engine can match queries to the most
relevant files efficiently.
