# LDJ Integration Index

**Purpose:** Master index mapping Modbus registers → Kvara shared addresses → PLC signals (C0–C11) → ESA Rack I/O (QW/IW) → Terminal blocks (M1/M2) for BLM press brake + FANUC robot integration.

**Source of truth:** robot_interface_reference.md (BLM ver. 4.0) is primary for Phase 1 beam control. Kvara/KVFILE and physical wiring override ESA manual when they conflict. See **VENDOR_DISCREPANCIES.md**.

**Integration path:** Phase 1 = XC2F/XC3M/XC4M hardwire (primary); foot pedal sim = alternative if robot interface connectors unavailable. Phase 2 = Modbus TCP (program load, mode — not beam control).

---

## Robot Interface Cross-Reference (XC2F/XC3M/XC4M — Primary)

| Signal | Connector | Address | Description | Use Case |
|--------|-----------|---------|-------------|----------|
| Beam at UDP | XC2F | E20.2 | Ram at upper dead point | Safe to load/unload |
| End of Bend | XC2F | E20.5 | Bend step complete | Trigger RESET END BEND |
| Press in Auto | XC2F | E20.0 | Machine in automatic mode | Precondition for Beam Down |
| Devices Clear | XC2F | E21.6 | Press devices out of robot area | Collision avoidance |
| Beam Downwards | XC3M | A20.1 | Command beam down | Initiate bend |
| Reset End Bend | XC3M | A21.2 | Command beam retract | After bend complete |
| Change Bending Step | XC3M | A20.4 | Advance to next bend | Between bends |
| Start from First Bend | XC3M | A20.7 | Reset to step 1 | New part cycle |

Full signal set: [robot_interface_reference.md](robot_interface_reference.md).

---

## Cross-Reference Table (Modbus + ESA Alternative)

| Register | MbAddr | ShAddr | ESA QW/IW | Terminal | Description | Use Case |
|----------|--------|--------|-----------|----------|-------------|----------|
| Mode | 0 | PPMode | — | — | Operating mode selection | Load=Editor, Start=Auto |
| Strobe | 1 | PPCommand | — | — | Command handshake strobe | Set 1 → wait ack → clear |
| Program Name | 2 (80 regs) | PPProgram | — | — | Program name string | Load/Change program |
| Program Name (alt) | 53 (40 regs) | — | — | — | Quick_Ref: STRING | See VENDOR_DISCREPANCIES |
| Command Ack | 82 / 1231 | PPClientAckCmd | — | — | Command received/complete | Wait before next command |
| Error | 1024 | PPErrorCode | — | — | Error code (0=OK) | Check after every command |
| Foot Pedal Sim | — | — | KP16.7/16.8 | M1-167 / M1-168 | PLC DO in parallel with NO contact | Phase 1: Trigger bend cycle |
| CNC OK | — | — | QW 1.6 | 15.D4 | Machine ready | Robot: safe to approach |
| Ram UP | — | — | QW 2.4 | 10.D4 | Upper dead point | Robot: safe to load/unload |
| Clamping | — | — | QW 1.12 | 7A.B6 | Clamping command | Robot: clamp/unclamp |
| Clamping Status | — | — | QW 1.13 | 15.D6 | Clamping open alarm | Status feedback |
| Drive OK | — | — | IW 0.12 | 14.C6 | Both drives healthy | Safety interlock |
| Robot Cell Clear | — | — | ESA/PCSS input | Gate/FC14.x | Robot arm clear | Inhibit down until clear |
| Inhibit Down | — | — | QW 2.0/2.1 gate | CN3 X02/X03 | Prevent ram down | Robot in zone |
| Part Present | — | — | ESA M.IN | Spare PCSS | Part positioned | Confirm load |
| E-Stop (Robot) | — | — | PCSS CH1/CH2 | KE14.x chain | Robot fault | Dual-channel safety |

---

## File Map

| Topic | Reference File | Source |
|-------|----------------|--------|
| **Robot interface (Phase 1 primary)** | **robot_interface_reference.md** | BLM Press-Brake Interface ver. 4.0 |
| Modbus registers | reference/LDJ_REF_ESA_Modbus.txt | modbus_register_map, ServerModbus.xml |
| PLC signals | reference/LDJ_REF_PLC_Signals.txt | Kvara/PLC/Iol.inc |
| Physical IO / terminals | reference/LDJ_REF_Physical_IO_Terminal_Map.txt | press_brake_reference.md Sec 6, 12, 13 |
| Physical wiring overview | PHYSICAL_WIRING_OVERVIEW.md | Single-page entry point for Phase 1 wiring |
| Physical IO wiring spec | reference/LDJ_REF_Physical_IO_Wiring_Spec.txt | press_brake_reference.md Sec 3.1, 11, 13 |
| ESA/BLM manuals | reference/LDJ_REF_ESA_BLM_Manuals.txt | sources/Esa_Manual_P0122.docx, BLM_MANUAL.docx |
| Vendor discrepancies | reference/VENDOR_DISCREPANCIES.md | — |
| Electrical diagram | press_brake_reference.md | 34-page diagram |
| Signal flow | INTEGRATION_FLOW.md | — |
| Customer FANUC TP backups (LDJ BLM cell) | [../customer_programs/LDJ-BLM Robot/](../customer_programs/LDJ-BLM%20Robot/) | Robot `.LS` exports and nested LS backup folder |

---

## Quick Reference

- **Phase 1 primary:** XC2F/XC3M/XC4M connectors per robot_interface_reference.md
- **24V from press:** XC2F Pin 2 (24 VDC PRESS) — do NOT use robot-side 24V for these signals
- **Network:** Press 172.16.0.51, PLC 172.16.0.50, Port 502
- **Mode:** Editor for Load/Modify; Auto for Start
- **Handshake:** Write data → Reg 2 opcode → Reg 1 BIT0=1 → wait Reg 1231 BIT0=1 → clear strobe → check Reg 1024
- **24V integration rail (foot pedal alt):** FE4.1 channel 4-6 (7.E0) — Robot Interface & Clamping
