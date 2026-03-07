# e-CAM121_CUONX eCAM Argus App User Manual

**Version 1.7** | e-con Systems | November 2025

---

## Overview

eCAM_argus_camera is a GUI application (based on NVIDIA argus_camera) for viewing and controlling the e-CAM121_CUONX. Stream, capture stills, record video.

---

## Launch

```bash
eCAM_argus_camera --device=<n>
```

`<n>` = video device node (e.g., 0 for /dev/video0).

---

## Supported Modes

| Mode | Resolution | Frame Rate |
|------|------------|------------|
| 0 | 4056 x 3040 @ 10 bpp | 60 fps |
| 1 | 4056 x 3040 @ 12 bpp | 30 fps |
| 2 | 2028 x 1112 @ 10 bpp | 240 fps |
| 3 | 2028 x 1112 @ 10 bpp | 60 fps |

---

## Controls (Summary)

- **Exposure time**: 450000–100000000 ns
- **Gain**: 1–22 (Af)
- **ISP digital gain**: 1–3
- **Sensor mode index**: 0–3
- **Frame rate**: Mode-dependent
- **De-noise**: off, fast, high quality
- **Edge enhance**: off, fast, high quality
- **AE antibanding**: off, 50Hz, 60Hz, auto
- **AWB**: auto, incandescent, fluorescent, etc.
- **Still capture**: JPEG, YUV
- **Video**: H264, H265; MP4, 3GP, AVI, MKV

---

## External Trigger (Frame Sync)

1. Connect PWM to CN5 (EXT_TRIGGER pin). Use 3.3V or 5V.
2. Enable sync: `v4l2-ctl -d 0 -c frame_sync_mode=1`
3. Disable: `v4l2-ctl -d 0 -c frame_sync_mode=0`
4. Launch app. Ensure trigger pulse is active before launch.

---

## Troubleshooting

- **JPEG encoder timeout**: Kill app, run `sudo service nvargus-daemon restart`
- **Orin Nano video recording**: No NVENC; use x264enc (software). H265 not supported for encoding on Orin Nano.
