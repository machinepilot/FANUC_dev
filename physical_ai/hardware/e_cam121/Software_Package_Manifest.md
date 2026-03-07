# e-CAM121_CUONX Software Release Package — Contents

*Explains the files in `e-CAM121_CUONX_JETSON_ONX_ONANO_L4T36.4.4_07-NOV-2025_R05`*

---

## Package Structure

```
e-CAM121_CUONX_JETSON_ONX_ONANO_L4T36.4.4_07-NOV-2025_R05/
├── install_binaries.sh          # Main install script
├── release_integrity.md5        # MD5 checksum
├── Kernel/
│   ├── e-CAM121_CUONX_JETSON_ONX_ONANO_L4T36.4.4_oot.patch
│   ├── e-CAM121_CUONX_JETSON_ONX_ONANO_L4T36.4.4_dtb.patch
│   └── e-CAM121_CUONX_JETSON_ONX_ONANO_L4T36.4.4_module.patch
├── misc/
│   ├── camera_overrides_jetson-onano.isp
│   ├── camera_overrides_jetson-onx.isp
│   ├── nvargus-daemon.service
│   └── modules
└── e-CAM121_CUONX_<L4T>_<JP>_JETSON-ONX-ONANO_<ver>.tar.gz  # Binaries archive
```

---

## File Descriptions

### install_binaries.sh

Script to install prebuilt kernel, camera drivers, and applications on the Jetson. Run on the Jetson (or from host with proper setup). Reboots the device after success.

```bash
sudo chmod +x ./install_binaries.sh
sudo -E ./install_binaries.sh
```

### Kernel Patches

| File | Purpose |
|------|---------|
| **oot.patch** | Out-of-tree kernel modifications for e-CAM121 support |
| **dtb.patch** | Device tree blob changes (camera overlay) |
| **module.patch** | IMX412 sensor driver module |

Used when building a custom kernel from source (Developer Guide). For quick setup, the prebuilt binaries in the `.tar.gz` include a patched kernel.

### misc/

| File | Purpose |
|------|---------|
| **camera_overrides_jetson-onano.isp** | ISP tuning for Jetson Orin Nano (e-con + NVIDIA) |
| **camera_overrides_jetson-onx.isp** | ISP tuning for Jetson Orin NX |
| **nvargus-daemon.service** | Systemd service for NVIDIA Argus camera daemon |
| **modules** | Kernel module(s) or module list |
| **v4l2-compliance** | Updated V4L2 compliance binary (in full package) |

### Binaries Archive (.tar.gz)

Contains prebuilt kernel image, device tree overlay, camera driver, eCAM_argus_camera application, and related binaries. Extracted and installed by `install_binaries.sh`.

---

## L4T / JetPack Compatibility

- **L4T**: 36.4.4
- **JetPack**: 6.2.1
- **Platform**: Jetson Orin Nano, Jetson Orin NX

---

## Connection

Camera must be connected to **CAM1** on the Jetson Orin Nano development kit.
