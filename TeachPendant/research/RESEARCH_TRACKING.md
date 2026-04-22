# FANUC Research Coverage Tracker

Companion to [RESEARCH_PROMPT_FANUC.md](./RESEARCH_PROMPT_FANUC.md). Every research sprint updates this file.

## Legend

- `status`: `empty` | `draft` | `covered` (>=1 QA-passed entry with T1/T2) | `rich` (>=3 entries with cross-citations).
- `priority`: `P0` urgent (blocks other work), `P1` high, `P2` normal, `P3` nice-to-have.

## Sprint Log

| Date | Researcher | Entries Added | Net Coverage Delta | Notes |
|------|-----------|---------------|--------------------|-------|
| _template_ | _n/a_ | _n/a_ | _n/a_ | Initial scaffold. |

## Taxonomy Coverage

### 3.1 TP/LS Language Core

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| Program structure (/PROG /ATTR /MN /POS /END) | P0 | empty |  |  |
| Motion: J, L, C, A + termination + speed units | P0 | draft | EG_J_Motion_Hello | Need `FANUC_REF_J_Motion` and `FANUC_REF_L_Motion` with T1 citations. |
| Position types (P[], PR[], LPOS, JPOS) | P0 | empty |  |  |
| Frames (UTool, UFrame, teach methods, TCP calibration) | P0 | empty |  |  |
| Registers (R[], PR[], SR[], GI/GO) | P1 | empty |  |  |
| I/O (DI/DO/RI/RO/GI/GO/UI/UO/AI/AO/F/M) | P0 | empty |  |  |
| Flow control (IF/SELECT/FOR/WAIT/SKIP/JMP/CALL) | P1 | empty |  |  |
| Error handling (MONITOR, CONDITION, UALM, error programs) | P0 | empty |  |  |
| Macro instructions / string registers | P2 | empty |  |  |

### 3.2 KAREL Language Core

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| Program structure + directives | P1 | empty |  |  |
| Types (INTEGER, REAL, STRING, XYZWPR, JOINTPOS, PATH, FILE) | P1 | empty |  |  |
| Routines + parameters | P1 | empty |  |  |
| CONDITION / HANDLER | P1 | empty |  |  |
| Built-ins (SET_VAR, GET_VAR, file I/O) | P1 | empty |  |  |
| Socket Messaging patterns | P0 | empty |  |  |
| Motion from KAREL | P2 | empty |  |  |
| Program loading (CALL_PROG, RUN_TASK) | P2 | empty |  |  |

### 3.3 System / Machine Configuration

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| System variables (safe to modify vs not) | P1 | empty |  |  |
| Mastering (QuickMaster, EMT, single-axis) | P1 | empty |  |  |
| Calibration (TCP, UFrame teach methods) | P1 | empty |  |  |
| Load data / payload schedules | P1 | empty |  |  |

### 3.4 Safety

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| ISO 10218-1/-2 overview | P0 | empty |  |  |
| ISO/TS 15066 body-region limits | P0 | empty |  |  |
| DCS Joint Position Check | P0 | empty |  |  |
| DCS Joint Speed Check | P1 | empty |  |  |
| DCS Cartesian Position Check | P0 | empty |  |  |
| DCS Cartesian Speed Check | P0 | empty |  |  |
| DCS Tool Frame / User Frame | P1 | empty |  |  |
| DCS Safe I/O | P1 | empty |  |  |
| E-stop stop categories | P1 | empty |  |  |
| Collaborative CR/CRX (SRMS, HG, SSM, PFL) | P1 | empty |  |  |

### 3.5 Fieldbus & Integration

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| EtherNet/IP M/S + PNS | P0 | empty |  |  |
| Profinet IO + PNS | P1 | empty |  |  |
| Modbus TCP (KAREL / gateway) | P1 | empty |  | Relevant to LDJ-BLM press brake. |
| UOP signal baseline | P0 | empty |  |  |
| Background Logic rules | P0 | empty |  |  |
| PMC programming model | P2 | empty |  |  |

### 3.6 Application Packages

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| HandlingPRO / iRPickTool | P2 | empty |  |  |
| PalletTool / PalletPRO | P2 | empty |  |  |
| ArcTool / SeamTech | P2 | empty |  |  |
| SpotTool+ | P3 | empty |  |  |

### 3.7 Sensor Integration

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| iRVision (2D, 3DL, 3DV) | P2 | empty |  |  |
| Force Sensor | P2 | empty |  |  |
| Stream Motion | P2 | empty |  |  |

### 3.8 External Comms

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| PC SDK architecture | P1 | empty |  |  |
| Socket Messaging (KAREL) reconnect pattern | P1 | empty |  |  |
| Ricochet | P2 | empty |  |  |
| OPC UA | P3 | empty |  |  |

### 3.9 Diagnostics

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| Alarm code taxonomy (SRVO, SYST, MOTN, INTP) | P1 | empty |  |  |
| Diagnostic procedures | P2 | empty |  |  |
| Backup types (SYSMAST, RIPE, IPLS) | P1 | empty |  |  |

### 3.10 Offline Programming

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| Roboguide workflow | P2 | empty |  |  |
| Simulation vs reality delta | P2 | empty |  |  |

### 3.11 Anti-patterns

| Node | Priority | Status | Entry IDs | Gaps |
|------|----------|--------|-----------|------|
| Programmatic $OVERRIDE | P1 | empty |  |  |
| Unbounded WAIT | P0 | empty |  |  |
| SKIP without LBL | P1 | empty |  |  |
| Motion before UTOOL/UFRAME set | P0 | empty |  |  |
| Raw DI/DO without aliases | P1 | empty |  |  |
| Background Logic motion | P0 | empty |  |  |
| KAREL socket leaks | P1 | empty |  |  |
| Hardcoded P[] vs PR[] | P2 | empty |  |  |
| MONITOR without MONITOR END | P1 | empty |  |  |
| Catch-all fault handlers | P1 | empty |  |  |

## Source Tier Distribution

Updated per sprint.

| Tier | Count | % of Citations |
|------|-------|----------------|
| T1   | 0     | 0%             |
| T2   | 0     | 0%             |
| T3   | 0     | 0%             |
| T4   | 0     | 0%             |

## Open Questions / Conflicts

- _none yet_

## Next-Sprint Focus

- Start: TP motion (J/L/C/A + termination + speeds) with T1 manual citations.
- Then: UOP baseline + PNS handshake.
- Then: I/O aliasing + group I/O.
- Then: Error recovery primitives (MONITOR/CONDITION, SKIP, UALM, error programs).
- Then: DCS fundamentals.
- Then: KAREL socket messaging.
- Then: Background Logic rules.
- Then: Modbus TCP (LDJ-BLM).
