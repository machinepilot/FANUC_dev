# e-CAM121_CUONX Getting Started Manual

**Version 1.5** | e-con Systems | September 2025

---

## Introduction

e-CAM121_CUONX is a 12.3MP camera from e-con Systems, interfaced with NVIDIA Jetson Orin Nano/Orin NX via **CAM1**. The board uses a Sony IMX412-AACK-D CMOS sensor, 1/2.3" optical form-factor, electronic rolling shutter, and Jetson ISP.

### Supported Resolutions (4-Lane)

| S.No | Resolution | Frame Rate |
|------|------------|------------|
| 1 | 4056x3040 (10 BPP) | 60 fps |
| 2 | 4056x3040 (12 BPP) | 30 fps |
| 3 | 2028x1112 (10 BPP) | 240 fps |
| 4 | 2028x1112 (10 BPP) | 60 fps |

---

## Prerequisites

- Host PC: Ubuntu 20.04 (64-bit) for flashing
- Minimum 60 GB free space
- JetPack 6.2.1 flashed on Jetson (via SDK Manager)

---

## Parts Supplied

- Custom Lens Camera Module (e-CAM121_CUMI412C_MOD_H01R1) — 1
- Adaptor Board (ACC-ONX-MI-WTB-ADP-H01) — 1
- 15 cm FPC Cable — 1

---

## Hardware Connection

1. **Unlock CN4** on adaptor board; insert FPC cable (conductive side toward board); lock CN4.
2. **Unlock CAM1** on Jetson Orin Nano; insert FPC cable (conductive side toward board); lock CAM1.
3. **Power**: Use 19V DC jack for full resolutions. USB Type-C supports only low resolutions.

**Warning**: Reversing the FPC cable may damage the camera and Jetson.

---

## Software Quick Setup

### 1. Extract Release Package

```bash
tar -xaf e-CAM121_CUONX_JETSON_ONX_ONANO_<L4T_version>_<release_date>_<release_version>.tar.gz
cd e-CAM121_CUONX_JETSON_ONX_ONANO_<L4T_version>_<release_date>_<release_version>
```

### 2. Install Binaries

```bash
sudo chmod +x ./install_binaries.sh
sudo -E ./install_binaries.sh
```

The script reboots the Jetson after installation.

### 3. Verify Camera

```bash
sudo dmesg | grep -i "Detected eimx412 sensor"
ls /dev/video*
```

### 4. Launch Application

```bash
eCAM_argus_camera
```

---

## Known Issues

**Camera freezing when switching modes**: Stop streaming, then launch with explicit mode:

```bash
eCAM_argus_camera -d <n> --sensormode=<m>
```

Modes: 0 (4056x3040@60), 1 (4056x3040@30), 2 (2028x1112@240), 3 (2028x1112@60).

---

## Troubleshooting

**Q: Can I connect to any camera port?**  
A: No. Only CAM1 is supported (4-lane).

**Q: Does it support OpenCV?**  
A: Yes. V4L2-compliant; any V4L2 application works. See https://www.e-consystems.com/Articles/Camera/accessing_cameras_in_opencv_with_high_performance.asp

---

## Reference Documents

- e-CAM Argus App User Manual
- eCAM Argus Camera Build and Install Guide
- GStreamer Usage Guide
- Developer Guide
- Release Package Manifest
