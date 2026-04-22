# Vendor Discrepancy Tracker

TOPIC: Vendor Discrepancy Tracker
KEYWORDS: ESA, BLM, Kvara, register, discrepancy, override, source of truth
CATEGORY: reference
SOURCE: Kvara, KVFILE, electrical diagram, on-site verification
APPLIES_TO: BLM SERIES 420-200, ESA/Kvara, FANUC + PLC integration
---

**Purpose:** Log differences between ESA generic documentation and this BLM press brake. Actual machine config (Kvara/KVFILE, electrical diagrams) overrides ESA manual when they conflict.

**Update this file** as you discover mismatches during integration.

---

## Template

| Item | ESA/Generic Says | This Machine (BLM) | Source | Notes |
|------|------------------|--------------------|--------|-------|
| — | — | — | Kvara/KVFILE/diagram/on-site | — |

---

## Known Discrepancies

| Item | ESA/Generic Says | This Machine (BLM) | Source | Notes |
|------|------------------|--------------------|--------|-------|
| Robot interface vs foot pedal sim | Foot pedal sim (M1-167/168) for cycle trigger | Two approaches: (1) XC2F/XC3M/XC4M robot interface primary; (2) foot pedal sim alternative | robot_interface_reference.md | Robot interface (beam-level control) is primary when connectors available |
| 24V source | FE4.1 channel 4-6 (7.E0) for robot interface | robot_interface: press supplies 24V at XC2F Pin 2 | robot_interface_reference.md, press_brake_reference | FE4.1 4-6 may feed XC2F — verify on wiring diagram |
| E20.2 vs QW 2.4 | QW 2.4 = Ram UP (upper dead point) | E20.2 = Beam at UDP (robot interface) | robot_interface_reference.md, ESA | Both indicate UDP; E20.2 is robot interface, QW 2.4 is ESA internal — may be same physical state |
| Program Name register | Reg 53 (40 regs, STRING) | Reg 2 (80 regs, PPProgram) in ServerModbus | ServerModbus.xml vs Quick_Reference.csv | Kvara uses MbAddr 2 for PPProgram; verify on machine |
| Command Ack | Reg 1231 | Reg 82 (PPClientAckCmd) in ServerModbus | ServerModbus.xml | Different address spaces; 82 is OutputArea |
| Mode selection | Reg 0, 1 word | Reg 0, PPMode | Aligned | — |

---

## How to Use

1. When integration fails or behavior differs from docs, add a row.
2. **Source** = where you confirmed the actual value (Kvara file, diagram page, on-site test).
3. **This Machine** wins over ESA/Generic for integration decisions.
