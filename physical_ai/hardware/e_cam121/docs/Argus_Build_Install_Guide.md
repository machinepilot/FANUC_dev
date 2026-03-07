# e-CAM121_CUONX eCAM Argus Camera Build and Install Guide

**Version 1.1** | e-con Systems | March 2024

---

## Prerequisites

- cmake, build-essential, pkg-config
- X11, gtk+-3.0, expat, JPEG, gstreamer-1.0
- v4l-utils, libv4l2-dev

---

## Install Dependencies

```bash
sudo apt-add-repository universe
sudo apt-get update
sudo apt-get install cmake build-essential libgtk-3-dev v4l-utils libv4l-dev nvidia-l4t-gstreamer
echo 'export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/nvidia/libnvjpeg.so' >> ~/.bashrc
source ~/.bashrc
```

---

## Build from Source

```bash
cd Application/eCAM_argus_camera/Source/
tar -xvf eCAM_argus_camera.tar.gz
cd eCAM_argus_camera/argus
mkdir build && cd build
cmake ..
make eCAM_argus_camera -j4
sudo make install
```

Installed to `/usr/local/bin/eCAM_argus_camera`.

---

## Install Prebuilt Binary

```bash
cd ~/e-CAM121_CUONX_JETSON_ONX_ONANO_<L4T>_<date>_<ver>
tar -xaf e-CAM121_CUONX_<L4T>_<JP>_JETSON-ONX-ONANO_<ver>.tar.gz
cd e-CAM121_CUONX_<L4T>_<JP>_JETSON-ONX-ONANO_<ver>/ONX_ONANO/Application/Binaries/eCAM_argus_camera/
sudo cp eCAM_argus_camera /usr/local/bin/eCAM_argus_camera
```

---

## Launch

```bash
eCAM_argus_camera
# Multiple cameras: eCAM_argus_camera -d n  (n = 0–3)
```
