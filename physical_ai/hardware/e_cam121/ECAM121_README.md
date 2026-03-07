# e-CAM121_CUONX — Development Camera

**12.3MP MIPI CSI-2 camera for Jetson Orin Nano / Orin NX**

---

## Connection: CAM1 Port

This camera is connected to **CAM1** on the Jetson Orin Nano development kit. The e-CAM121_CUONX uses 4-lane MIPI and is supported only on the CAM1 connector.

---

## Quick Reference

| Item | Value |
|------|-------|
| **Sensor** | Sony IMX412-AACK-D (1/2.3", 12.3MP) |
| **Interface** | MIPI CSI-2, 4-lane |
| **Connector** | CAM1 (Jetson Orin Nano) |
| **Video Node** | `/dev/video0` (typical) |
| **Format** | NV12 (Jetson ISP) |
| **V4L2** | Yes — OpenCV compatible |

---

## Supported Resolutions and Frame Rates

| Mode | Resolution | BPP | Frame Rate |
|------|------------|-----|------------|
| 0 | 4056 x 3040 | 10 | 60 fps |
| 1 | 4056 x 3040 | 12 | 30 fps |
| 2 | 2028 x 1112 | 10 | 240 fps |
| 3 | 2028 x 1112 | 10 | 60 fps |

---

## Verification Commands

```bash
# Confirm camera detected
sudo dmesg | grep -i "Detected eimx412 sensor"

# List video nodes
ls /dev/video*

# Launch e-con sample app
eCAM_argus_camera --device=0
```

---

## Document Index

See [ECAM121_INDEX.md](ECAM121_INDEX.md) for the full document map.

---

## Source

e-con Systems — https://www.e-consystems.com/
