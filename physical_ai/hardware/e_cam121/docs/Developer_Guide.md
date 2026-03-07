# e-CAM121_CUONX Developer Guide

**Version 1.7** | e-con Systems | November 2025

---

## Overview

Guide for building a custom kernel with e-CAM121_CUONX support on Jetson Orin Nano/Orin NX. Use when prebuilt binaries are insufficient.

---

## Prerequisites

- Host PC: Ubuntu 22.04 or 20.04 (64-bit)
- lbzip2, L4T release, sample rootfs
- USB Type-C (recovery), 19V power, 128GB boot drive
- GCC toolchain, L4T sources from NVIDIA

---

## Quick Path (Prebuilt Binaries)

If L4T 36.4.4 is already flashed:

1. Copy release package to Jetson HOME
2. Extract, run `install_binaries.sh`
3. Reboot

See Getting Started Manual for details.

---

## Building from Source (Summary)

1. Set up environment variables (TOP_DIR, RELEASE_PACK_DIR, L4T_DIR, etc.)
2. Download L4T, rootfs, toolchain, kernel sources
3. Extract L4T, apply `apply_binaries.sh`
4. Extract release package
5. Apply kernel patches (oot, dtb, module)
6. Build kernel, modules, dtbs
7. Copy DTB: `tegra234-p3767-0000-p3768-0000-a0-4lane-imx412.dtbo` to rootfs `/boot`
8. Copy misc files: `camera_overrides_jetson-onano.isp`, `v4l2-compliance`, `nvargus-daemon.service`
9. Flash Jetson (recovery mode, `l4t_initrd_flash.sh`)

---

## Loading Overlay (Post-Flash)

```bash
sudo /opt/nvidia/jetson-io/config-by-hardware.py -n 2="Jetson camera EIMX412 4lane"
# Reboot
sudo dmesg | grep -i "Detected eimx412 sensor"
ls /dev/video*
```

---

## Key Files

- **camera_overrides.isp**: ISP tuning (e-con + NVIDIA)
- **v4l2-compliance**: Updated binary for compliance testing
- **nvargus-daemon.service**: Argus camera daemon
