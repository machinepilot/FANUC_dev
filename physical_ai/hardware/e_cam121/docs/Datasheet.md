# e-CAM121_CUONX Datasheet

**Revision 1.3** | e-con Systems | September 2025

---

## Overview

12.3MP MIPI CSI-2 camera for Jetson Orin NX / Orin Nano. Two-board solution: camera module (e-CAM121_CUMI412C_MOD_H01R1) + adaptor board (ACC-ONX-MI-WTB-ADP-H01). S-mount (M12) lens holder.

---

## Modes

### Asynchronous (Normal Streaming)

| S.No | Resolution | Frame Rate |
|------|------------|------------|
| 1 | 4056 x 3040 (10 BPP) | 60 fps |
| 2 | 4056 x 3040 (12 BPP) | 30 fps |
| 3 | 2028 x 1112 (10 BPP) | 240 fps |
| 4 | 2028 x 1112 (10 BPP) | 60 fps |

### Synchronous (External Trigger)

PWM trigger via CN5 connector. 3.3V or 5V only; >5V causes damage.

---

## Key Specifications

| Item | Value |
|------|-------|
| Video Format | NV12 |
| Image Resolution | 4056 x 3040 (12.3MP) |
| OS | Linux |
| Power | 567.6 mW (streaming) |
| Temperature | -20°C to 60°C |

---

## Sensor (IMX412)

- 1/2.3" optical format
- 12.3MP, RAW 10/12-bit
- Pixel: 1.55 µm x 1.55 µm
- Active: 4056H x 3040V

---

## Connectors

- **CN1, CN3**: Dual-row 20-pin (module mating)
- **CN4**: 22-pin FFC to Jetson (max 15 cm cable)
- **CN5**: External trigger (VCC_3P3, EXT_TRIGGER, CAM_SHUTTER, GND)
