# e-CAM121_CUONX Release Package Manifest

**Version 1.3** | e-con Systems | July 2025

---

## Top-Level Contents

| Directory/File | Description |
|----------------|-------------|
| **Application/** | Application source and dependencies |
| **e-CAM121_CUONX_&lt;L4T&gt;_&lt;JP&gt;_JETSON-ONX-ONANO_&lt;ver&gt;.tar.gz** | Compressed binaries for Jetson |
| **install_binaries.sh** | Install script for kernel, drivers, apps |
| **Kernel/** | Patch files for e-CAM121_CUONX |
| **release_integrity.md5** | MD5 checksum of archive |
| **misc/** | Support files (ISP config, v4l2-compliance, nvargus-daemon) |

---

## Application Directory

| Path | Description |
|------|--------------|
| eCAM_argus_camera/Source | Application source code |
| eCAM_argus_camera/Source/eCAM_argus_camera.tar.gz | Archive of application source |

---

## Kernel Directory

| File | Description |
|------|-------------|
| e-CAM121_CUONX_JETSON_ONX_ONANO_&lt;L4T&gt;_oot.patch | Out-of-tree kernel patch |
| e-CAM121_CUONX_JETSON_ONX_ONANO_&lt;L4T&gt;_dtb.patch | Device tree blob patch |
| e-CAM121_CUONX_JETSON_ONX_ONANO_&lt;L4T&gt;_module.patch | Camera module driver patch |

---

## Compatible L4T

- L4T 36.4.4 (JetPack 6.2.1)
