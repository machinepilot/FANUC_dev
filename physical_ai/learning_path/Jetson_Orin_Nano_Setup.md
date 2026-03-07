# Jetson Orin Nano Setup

*Setup guide for Jetson Orin Nano (4GB/8GB) — Physical AI edge deployment*

---

## Hardware Requirements

- **Jetson Orin Nano** (4GB or 8GB) — 8GB recommended for Isaac ROS
- **Storage**: NVMe SSD (30GB+ recommended)
- **Camera**: e-CAM121_CUONX on **CAM1** (see `physical_ai/hardware/e_cam121/`) or USB (V4L2)
- **Network**: Wired Ethernet (required for HIL; Wi-Fi insufficient)

---

## Step 1: Flash JetPack

1. Download **JetPack 6.2** (or latest) from [NVIDIA Jetson](https://developer.nvidia.com/embedded/jetpack)
2. Use **SDK Manager** (on host PC) or **SD card image** to flash
3. Boot Jetson; complete initial setup (Ubuntu 22.04)

---

## Step 2: Install Isaac ROS Dev Environment

NVIDIA recommends **Docker-based** Isaac ROS for consistent dependencies.

```bash
# Install Docker and NVIDIA Container Toolkit
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
# Log out and back in

# Install NVIDIA Container Toolkit
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# Install Git LFS
sudo apt-get install -y git-lfs
git lfs install
```

---

## Step 3: Create ROS 2 Workspace (on SSD)

```bash
# Prefer NVMe/SSD for workspace
mkdir -p ~/isaac_ros_ws/src
cd ~/isaac_ros_ws/src
```

---

## Step 4: Run Isaac ROS Container

```bash
# Pull and run Isaac ROS dev container
docker run -it --rm --network host \
  -v ~/isaac_ros_ws:/isaac_ros_ws \
  nvcr.io/nvidia/isaac_ros:4.2.0
```

Inside container:

```bash
cd /isaac_ros_ws
# Build or run Isaac ROS packages
```

---

## Step 5: Verify Camera

**e-CAM121_CUONX (CAM1)** — See `physical_ai/hardware/e_cam121/` for setup.

```bash
# Confirm e-CAM121 detected (if using e-con camera)
sudo dmesg | grep -i "Detected eimx412 sensor"

# List V4L2 devices
v4l2-ctl --list-devices
ls /dev/video*

# Launch e-con sample app (e-CAM121)
eCAM_argus_camera --device=0
```

---

## Step 6: First Isaac ROS Node

Try `isaac_ros_apriltag` or `isaac_ros_image_proc` to validate:

- Camera driver
- GPU pipeline
- ROS 2 topic flow

---

## References

- **e-CAM121_CUONX** — `physical_ai/hardware/e_cam121/ECAM121_README.md` (CAM1 connection, verification)
- [Isaac ROS Getting Started](https://nvidia-isaac-ros.github.io/getting_started/index.html)
- [Isaac ROS Dev Environment](https://nvidia-isaac-ros.github.io/getting_started/dev_env_setup.html)
- [Setting Up Jetson for HIL](https://docs.nvidia.com/learning/physical-ai/getting-started-with-isaac-sim/latest/leveraging-ros-2-and-hil-in-isaac-sim/03-setting-up-the-jetson-environment.html)
