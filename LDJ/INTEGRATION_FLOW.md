# Integration Flow: FANUC ↔ PLC ↔ Press Brake

## Integration Phases

- **Phase 1A (Primary):** Robot Interface — XC2F/XC3M/XC4M connectors. Beam-level control. Deploy first.
- **Phase 1B (Alternative):** Foot Pedal Sim — M1-167/168 when robot interface connectors unavailable.
- **Phase 2 (Future):** Modbus TCP — program load, mode, strobe. Not for beam control.

---

## Phase 1A: Robot Interface (XC2F/XC3M/XC4M) — Primary

### Architecture

```
┌─────────────┐     Physical I/O      ┌─────────────┐     Hardwire          ┌─────────────────┐
│   FANUC     │ ◄───────────────────► │  Wago/Codesys│ ◄──────────────────► │  BLM Press Brake│
│   Robot     │   DI/DO handshake     │     PLC      │   XC2F XC3M XC4M     │  robot interface │
└─────────────┘                       └─────────────┘                       └─────────────────┘
```

### Signal Flow (Phase 1A)

| Source | Destination | Method | Purpose |
|--------|-------------|--------|---------|
| Press | PLC | XC2F (E20.x, E21.x, E22.x) | Beam position, axis status, finger sensors |
| PLC | Press | XC3M (A20.x, A21.x) | Beam Up/Down, Change Step, Reset Mute/CP/End Bend |
| Robot | PLC | DO | Cell clear, part present, safety enable |
| PLC | Robot | DI | E20.2 (UDP), E20.5 (End of Bend), E21.6 (Devices Clear) |

### Motion Handshake (PHASE 0–6 Cycle)

From [robot_interface_reference.md](robot_interface_reference.md):

**PHASE 0 — Startup:** A20.7 (START FROM FIRST BEND) → wait E21.4 (FIRST BEND ACTIVE)

**PHASE 1 — Load Part:** Wait E20.2 (UDP), E20.6 (Axis in Position), E21.6 (Devices Clear) → robot enters, loads part → wait E21.0–E21.3 (finger sensors) → robot releases gripper, clears

**PHASE 2 — Bend:** A20.1 (BEAM DOWNWARDS) + A21.0 (RESET MUTE) + A21.1 (RESET CLAMPING) → beam descends → wait E20.5 (END OF BEND) + E20.7 (ANGLE OK if used) → A21.2 (RESET END BEND) → beam retracts → wait E20.2 (UDP)

**PHASE 3 — Change Step:** A20.4 (CHANGE BENDING STEP) → wait E20.6 (Axis in Position) → reposition part

**PHASE 4–5 — Additional Bends:** Same as Phase 2 (with/without mute, with/without angle control)

**PHASE 6 — Unload:** Wait E20.2 (UDP) → robot enters, removes part → A20.7 (START FROM FIRST BEND) or A20.4 (CHANGE STEP) or A22.3 (EDITING MODE) for program change

### Critical Rules (Phase 1A)

**Before Beam Down (A20.1):**
- E20.0 HIGH (Press in Automatic Mode)
- E21.6 HIGH (Press devices clear)
- XC3M Pins 9–12 CLOSED (Enable from Robot)
- XC3M Pins 1–4 CLOSED (No press emergency)

**Before entering press zone:** E20.2 (UDP), E20.6 (Axis in Position), E21.6 (Devices Clear)

**Before RESET END BEND (A21.2):** E20.5 (End of Bend) + E20.7 (Angle OK, if angle device active)

**Release part before:** E20.3 (Clamping Point) — sheet will be pinched

### Wiring Reference

- **[robot_interface_reference.md](robot_interface_reference.md)** — Full signal set, cycle timing, interlock rules
- **LDJ_REF_Physical_IO_Wiring_Spec.txt** — XC2F/XC3M/XC4M wiring checklist
- **LDJ_REF_Physical_IO_Terminal_Map.txt** — E20.x/A20.x mapping

---

## Phase 1B: Foot Pedal Sim (Alternative)

Use when XC2F/XC3M/XC4M connectors are not available on the press.

### Architecture

```
┌─────────────┐     Physical I/O      ┌─────────────┐     Physical I/O      ┌─────────────────┐
│   FANUC     │ ◄───────────────────► │  Wago/Codesys│ ◄──────────────────► │  BLM Press Brake│
│   Robot     │   DI/DO handshake     │     PLC      │   M1-167, M1-168     │  ESA/Kvara       │
└─────────────┘                       └─────────────┘                       └─────────────────┘
```

### Signal Flow (Phase 1B)

| Source | Destination | Method | Purpose |
|--------|-------------|--------|---------|
| Robot | PLC | DO | Cell clear, part present |
| PLC | Press | Hardwire to M1-167/168 | Foot Pedal Sim — trigger bend cycle |
| Press | PLC | Hardwire from QW 1.6, QW 2.4, etc. | CNC OK, Ram UP, Drive OK |
| PLC | Robot | DI | CNC OK, Ram UP, clamping status, drive OK |

### Motion Handshake (12-Step Cycle)

From press_brake_reference.md Section 13.3:

```
NORMAL AUTO CYCLE — Press Brake + Robot:

1.  Machine READY: ESA QW 1.6 HIGH (CNC OK to PCSS)
2.  Ram UP: ESA QW 2.4 HIGH (Upper Dead Point)
3.  → Robot: "Safe to Load" — arm enters, loads part
4.  Robot: "Part Loaded / Arm Clear" → PLC enables Foot Pedal Sim
5.  Robot PLC issues Foot Pedal Sim (M1-167 or M1-168) — same as operator pressing pedal
6.  PCSS verifies: STO OK, gates closed, no E-stop
7.  ESA commands: Slow Down (QW 2.0) → Fast Down (QW 2.1) → Slow Down
8.  Bend occurs at programmed force (TRS7.1 transductor feedback)
9.  ESA commands Up Movement (QW 2.2) → Ram returns to top
10. ESA QW 2.4 HIGH again (Upper Dead Point)
11. → Robot: "Safe to Unload" — arm enters, removes part
12. Repeat
```

### Wiring Reference

- **LDJ_REF_Physical_IO_Wiring_Spec.txt** — Foot pedal sim, terminal blocks, verification steps
- **LDJ_REF_Physical_IO_Terminal_Map.txt** — ESA QW/IW, M1/M2 mapping

---

## Phase 2: Modbus TCP (Future)

To be implemented after Phase 1 is running. **Modbus TCP is for program load, mode selection, and strobe — not for beam control.** Beam control remains via XC2F/XC3M/XC4M (Phase 1A) or foot pedal sim (Phase 1B).

### Architecture

```
┌─────────────┐     Physical I/O      ┌─────────────┐     Modbus TCP      ┌─────────────────┐
│   FANUC     │ ◄───────────────────► │  Wago/Codesys│ ◄────────────────► │  BLM Press Brake│
│   Robot     │   DI/DO handshake     │     PLC      │   Port 502         │  ESA/Kvara       │
└─────────────┘                       └─────────────┘                       └─────────────────┘
       │                                      │  172.16.0.51 (Press)
       │  172.16.0.50 (PLC)                   └─────────────────────────────────────────────┘
```

### Signal Flow (Phase 2 — Future)

| Source | Destination | Method | Purpose |
|--------|-------------|--------|---------|
| Robot | PLC | DO | Cell clear, part present, inhibit, E-stop |
| PLC | Robot | DI | CNC OK, Ram UP, clamping status, drive OK |
| PLC | Press | Modbus TCP | Mode, command, program load, strobe |
| Press | PLC | Modbus TCP | Ack, error, mode ack, status |

### Modbus Handshake (PLC → Press)

For Load Program, Start, etc.:

1. Write data (if needed) to appropriate register
2. Write command opcode to register 2
3. Set register 1 BIT0 = 1 (strobe)
4. Wait for register 1231 BIT0 = 1 (acknowledgment)
5. Set register 1 BIT0 = 0 (clear strobe)
6. Wait for register 1231 BIT0 = 0 (ack clear)
7. Check register 1024 for error (0 = success)

### Mode Requirements

| Command | Required Mode |
|---------|---------------|
| Load Program | EDITOR |
| Modify Parameters | EDITOR |
| Start Cycle | AUTOMATIC |

### Network

- **Press:** 172.16.0.51
- **PLC:** 172.16.0.50
- **Port:** 502 (Modbus TCP)
