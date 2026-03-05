# LDJ Integration Knowledge Base

Conventions, structure, and how to use the BLM press brake + FANUC robot integration framework.

## Integration Phases

- **Phase 1A (Primary):** Robot Interface — XC2F/XC3M/XC4M connectors, beam-level control. Deploy first.
- **Phase 1B (Alternative):** Foot Pedal Sim — M1-167/168 when robot interface unavailable.
- **Phase 2 (Future):** Modbus TCP — program load, mode, strobe. Not for beam control.

## Structure

```
LDJ/
├── LDJ_README.md                 # This file
├── robot_interface_reference.md   # Primary — BLM ver. 4.0, XC2F/XC3M/XC4M, PHASE 0-6 cycle
├── LDJ_INTEGRATION_INDEX.md      # Master index (Modbus → PLC → ESA → terminals)
├── PHYSICAL_WIRING_OVERVIEW.md   # Single-page physical wiring overview (Phase 1)
├── INTEGRATION_FLOW.md           # Signal flow and motion handshake
├── press_brake_reference.md      # Electrical diagram (34-page converted)
├── sources/                      # Raw, unmodified source files
│   ├── SOURCE_INVENTORY.md
│   ├── Esa_Manual_P0122.docx
│   ├── BLM_MANUAL.docx
│   ├── modbus_register_map/
│   └── archive/                  # Extracted temp files (for re-extraction)
├── reference/                    # Normalized reference files (LDJ_REF_*)
│   ├── LDJ_REF_ESA_Modbus.txt
│   ├── LDJ_REF_ESA_BLM_Manuals.txt
│   ├── LDJ_REF_PLC_Signals.txt
│   ├── LDJ_REF_Physical_IO_Terminal_Map.txt
│   ├── LDJ_REF_Physical_IO_Wiring_Spec.txt
│   └── VENDOR_DISCREPANCIES.md
├── Kvara/                        # Extracted from press — do not modify
└── KVFILE/
```

## Naming Conventions

| Element | Standard | Example |
|---------|----------|---------|
| Reference files | `LDJ_REF_<Topic>.txt` | LDJ_REF_ESA_Modbus.txt |
| Index files | `LDJ_<Purpose>.md` | LDJ_INTEGRATION_INDEX.md |
| Raw sources | `sources/` subfolder | sources/Esa_Manual_P0122.docx |

## How to Use

1. **Start with LDJ_INTEGRATION_INDEX.md** — Cross-reference table and file map.
2. **For physical wiring (Phase 1):** Start with **robot_interface_reference.md** (XC2F/XC3M/XC4M); then PHYSICAL_WIRING_OVERVIEW.md; then LDJ_REF_Physical_IO_Wiring_Spec.txt for details.
3. **For Modbus:** LDJ_REF_ESA_Modbus.txt — registers, handshake, opcodes.
4. **For PLC signals:** LDJ_REF_PLC_Signals.txt — C0–C11, PPTcpServer mapping.
5. **For physical I/O:** LDJ_REF_Physical_IO_Terminal_Map.txt — E20.x/A20.x (robot interface) or ESA QW/IW → M1/M2 → FANUC DI/DO.
6. **For wiring (Phase 1):** LDJ_REF_Physical_IO_Wiring_Spec.txt — XC2F/XC3M/XC4M or foot pedal sim, verification steps.
7. **For manuals:** LDJ_REF_ESA_BLM_Manuals.txt — modes, ram sizing, robotic interface.
8. **For discrepancies:** VENDOR_DISCREPANCIES.md — ESA vs this BLM machine.
9. **For signal flow:** INTEGRATION_FLOW.md — PHASE 0-6 (1A), 12-step (1B), Phase 2 Modbus.

## Source of Truth

robot_interface_reference.md (BLM ver. 4.0) is primary for Phase 1 beam control. Kvara/KVFILE and physical wiring (press_brake_reference.md) override ESA manual when they conflict. Always check VENDOR_DISCREPANCIES.md before assuming ESA docs apply.
