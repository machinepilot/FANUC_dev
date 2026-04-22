---
scope: customer_specific
customer: ldj_blm
canonical: false
status: evolving
supersedes: FANUC_dev/LDJ/INTEGRATION_FLOW.md
source:
  type: onsite_notes
  acquired_from: The Way Automation LLC
  acquired_date: "2026-04-22"
---

# INTEGRATION FLOW

> CONTEXT, NOT CANON. This is customer-specific integration material. If it contradicts `fanuc_dataset/normalized/`, canon wins. Raise conflicts under `task_state.conflicts[]`.
# Integration Flow: FANUC â†” PLC â†” Press Brake

## Integration Phases

- **Phase 1A (Primary):** Robot Interface â€” XC2F/XC3M/XC4M connectors. Beam-level control. Deploy first.
- **Phase 1B (Alternative):** Foot Pedal Sim â€” M1-167/168 when robot interface connectors unavailable.
- **Phase 2 (Future):** Modbus TCP â€” program load, mode, strobe. Not for beam control.

---

## Phase 1A: Robot Interface (XC2F/XC3M/XC4M) â€” Primary

### Architecture

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     Physical I/O      â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     Hardwire          â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚   FANUC     â”‚ â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–º â”‚  Wago/Codesysâ”‚ â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–º â”‚  BLM Press Brakeâ”‚
â”‚   Robot     â”‚   DI/DO handshake     â”‚     PLC      â”‚   XC2F XC3M XC4M     â”‚  robot interface â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

### Signal Flow (Phase 1A)

| Source | Destination | Method | Purpose |
|--------|-------------|--------|---------|
| Press | PLC | XC2F (E20.x, E21.x, E22.x) | Beam position, axis status, finger sensors |
| PLC | Press | XC3M (A20.x, A21.x) | Beam Up/Down, Change Step, Reset Mute/CP/End Bend |
| Robot | PLC | DO | Cell clear, part present, safety enable |
| PLC | Robot | DI | E20.2 (UDP), E20.5 (End of Bend), E21.6 (Devices Clear) |

### Motion Handshake (PHASE 0â€“6 Cycle)

From [robot_interface_reference.md](robot_interface_reference.md):

**PHASE 0 â€” Startup:** A20.7 (START FROM FIRST BEND) â†’ wait E21.4 (FIRST BEND ACTIVE)

**PHASE 1 â€” Load Part:** Wait E20.2 (UDP), E20.6 (Axis in Position), E21.6 (Devices Clear) â†’ robot enters, loads part â†’ wait E21.0â€“E21.3 (finger sensors) â†’ robot releases gripper, clears

**PHASE 2 â€” Bend:** A20.1 (BEAM DOWNWARDS) + A21.0 (RESET MUTE) + A21.1 (RESET CLAMPING) â†’ beam descends â†’ wait E20.5 (END OF BEND) + E20.7 (ANGLE OK if used) â†’ A21.2 (RESET END BEND) â†’ beam retracts â†’ wait E20.2 (UDP)

**PHASE 3 â€” Change Step:** A20.4 (CHANGE BENDING STEP) â†’ wait E20.6 (Axis in Position) â†’ reposition part

**PHASE 4â€“5 â€” Additional Bends:** Same as Phase 2 (with/without mute, with/without angle control)

**PHASE 6 â€” Unload:** Wait E20.2 (UDP) â†’ robot enters, removes part â†’ A20.7 (START FROM FIRST BEND) or A20.4 (CHANGE STEP) or A22.3 (EDITING MODE) for program change

### Critical Rules (Phase 1A)

**Before Beam Down (A20.1):**
- E20.0 HIGH (Press in Automatic Mode)
- E21.6 HIGH (Press devices clear)
- XC3M Pins 9â€“12 CLOSED (Enable from Robot)
- XC3M Pins 1â€“4 CLOSED (No press emergency)

**Before entering press zone:** E20.2 (UDP), E20.6 (Axis in Position), E21.6 (Devices Clear)

**Before RESET END BEND (A21.2):** E20.5 (End of Bend) + E20.7 (Angle OK, if angle device active)

**Release part before:** E20.3 (Clamping Point) â€” sheet will be pinched

### Wiring Reference

- **[robot_interface_reference.md](robot_interface_reference.md)** â€” Full signal set, cycle timing, interlock rules
- **LDJ_REF_Physical_IO_Wiring_Spec.txt** â€” XC2F/XC3M/XC4M wiring checklist
- **LDJ_REF_Physical_IO_Terminal_Map.txt** â€” E20.x/A20.x mapping

---

## Phase 1B: Foot Pedal Sim (Alternative)

Use when XC2F/XC3M/XC4M connectors are not available on the press.

### Architecture

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     Physical I/O      â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     Physical I/O      â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚   FANUC     â”‚ â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–º â”‚  Wago/Codesysâ”‚ â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–º â”‚  BLM Press Brakeâ”‚
â”‚   Robot     â”‚   DI/DO handshake     â”‚     PLC      â”‚   M1-167, M1-168     â”‚  ESA/Kvara       â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

### Signal Flow (Phase 1B)

| Source | Destination | Method | Purpose |
|--------|-------------|--------|---------|
| Robot | PLC | DO | Cell clear, part present |
| PLC | Press | Hardwire to M1-167/168 | Foot Pedal Sim â€” trigger bend cycle |
| Press | PLC | Hardwire from QW 1.6, QW 2.4, etc. | CNC OK, Ram UP, Drive OK |
| PLC | Robot | DI | CNC OK, Ram UP, clamping status, drive OK |

### Motion Handshake (12-Step Cycle)

From press_brake_reference.md Section 13.3:

```
NORMAL AUTO CYCLE â€” Press Brake + Robot:

1.  Machine READY: ESA QW 1.6 HIGH (CNC OK to PCSS)
2.  Ram UP: ESA QW 2.4 HIGH (Upper Dead Point)
3.  â†’ Robot: "Safe to Load" â€” arm enters, loads part
4.  Robot: "Part Loaded / Arm Clear" â†’ PLC enables Foot Pedal Sim
5.  Robot PLC issues Foot Pedal Sim (M1-167 or M1-168) â€” same as operator pressing pedal
6.  PCSS verifies: STO OK, gates closed, no E-stop
7.  ESA commands: Slow Down (QW 2.0) â†’ Fast Down (QW 2.1) â†’ Slow Down
8.  Bend occurs at programmed force (TRS7.1 transductor feedback)
9.  ESA commands Up Movement (QW 2.2) â†’ Ram returns to top
10. ESA QW 2.4 HIGH again (Upper Dead Point)
11. â†’ Robot: "Safe to Unload" â€” arm enters, removes part
12. Repeat
```

### Wiring Reference

- **LDJ_REF_Physical_IO_Wiring_Spec.txt** â€” Foot pedal sim, terminal blocks, verification steps
- **LDJ_REF_Physical_IO_Terminal_Map.txt** â€” ESA QW/IW, M1/M2 mapping

---

## Phase 2: Modbus TCP (Future)

To be implemented after Phase 1 is running. **Modbus TCP is for program load, mode selection, and strobe â€” not for beam control.** Beam control remains via XC2F/XC3M/XC4M (Phase 1A) or foot pedal sim (Phase 1B).

### Architecture

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     Physical I/O      â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”     Modbus TCP      â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚   FANUC     â”‚ â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–º â”‚  Wago/Codesysâ”‚ â—„â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â–º â”‚  BLM Press Brakeâ”‚
â”‚   Robot     â”‚   DI/DO handshake     â”‚     PLC      â”‚   Port 502         â”‚  ESA/Kvara       â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜                       â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
       â”‚                                      â”‚  172.16.0.51 (Press)
       â”‚  172.16.0.50 (PLC)                   â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

### Signal Flow (Phase 2 â€” Future)

| Source | Destination | Method | Purpose |
|--------|-------------|--------|---------|
| Robot | PLC | DO | Cell clear, part present, inhibit, E-stop |
| PLC | Robot | DI | CNC OK, Ram UP, clamping status, drive OK |
| PLC | Press | Modbus TCP | Mode, command, program load, strobe |
| Press | PLC | Modbus TCP | Ack, error, mode ack, status |

### Modbus Handshake (PLC â†’ Press)

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

