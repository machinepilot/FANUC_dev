# e-CAM121_CUONX GStreamer Usage Guide

**Version 1.4** | e-con Systems | July 2025

---

## Prerequisites

```bash
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install nvidia-l4t-gstreamer
```

Replace `<n>`, `<m>`, `<f>` with device node, sensor mode, and frame rate.

---

## Examples

### Stream 1080p (HW accelerated)

```bash
gst-launch-1.0 nvarguscamerasrc sensor-id=<n> sensor-mode=<m> ! \
  "video/x-raw(memory:NVMM), width=4056, height=3040, format=NV12, framerate=<f>/1" ! \
  queue ! nvvidconv ! "video/x-raw(memory:NVMM), width=1920, height=1080, format=NV12" ! \
  queue ! nv3dsink -e
```

### Capture 12 MP still

```bash
gst-launch-1.0 nvarguscamerasrc tnr-mode=2 tnr-strength=1 ee-mode=0 sensor-id=<n> sensor-mode=<m> num-buffers=7 ! \
  "video/x-raw(memory:NVMM), format=NV12, width=4056, height=3040, framerate=<f>/1" ! \
  nvjpegenc ! filesink location=<filename>.jpg
```

### Record 1080p H.265 (Orin NX; Orin Nano has no NVENC)

```bash
gst-launch-1.0 -v nvarguscamerasrc sensor-id=<n> sensor-mode=<m> ! \
  "video/x-raw(memory:NVMM), width=4056, height=3040, format=NV12, framerate=<f>/1" ! \
  nvvidconv ! "video/x-raw(memory:NVMM), format=NV12, width=1920, height=1080" ! \
  nvv4l2h265enc ! "video/x-h265, stream-format=byte-stream" ! h265parse ! matroskamux ! \
  queue ! filesink location=<filename>.mkv
```

### Record 1080p H.264 (Orin Nano — software encode)

```bash
gst-launch-1.0 -v nvarguscamerasrc sensor-id=<n> sensor-mode=<m> ! \
  "video/x-raw(memory:NVMM), width=4056, height=3040, format=NV12, framerate=<f>/1" ! \
  nvvidconv ! "video/x-raw(memory:NVMM), format=NV12, width=1920, height=1080" ! \
  nvvidconv ! x264enc bitrate=4000 speed-preset=superfast ! \
  "video/x-h264, stream-format=byte-stream" ! h264parse ! matroskamux ! filesink location=<filename>.mkv
```

---

## Notes

- **Orin Nano**: No NVENC; use x264enc for video. nvv4l2h265enc not supported.
- **Max FPS**: GStreamer mmap can limit frame rate; use eCAM_argus_camera for max fps.
- **Inspect plugin**: `gst-inspect-1.0 nvarguscamerasrc`
