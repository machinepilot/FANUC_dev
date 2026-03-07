---
name: fanuc-ros2-build
description: Build the FANUC ROS 2 Driver colcon workspace (git-lfs, rosdep, colcon). Use when building fanuc_driver, fanuc_description, or setting up the ROS 2 workspace from scratch.
---

# Build FANUC ROS 2 Driver Workspace

## Prerequisites

- Ubuntu 22.04 (native, WSL2, or Docker)
- ROS 2 Humble desktop install
- Internet access for cloning and rosdep

## Build Steps

Follow these steps in order on the target machine:

### 1. Install Git LFS

```bash
sudo apt install git-lfs
git lfs install
```

### 2. Create Workspace and Clone

```bash
mkdir -p ~/ws_fanuc/src
cd ~/ws_fanuc/src
git clone https://github.com/FANUC-CORPORATION/fanuc_description.git
git clone --recurse-submodules https://github.com/FANUC-CORPORATION/fanuc_driver.git
```

### 3. Install Dependencies

```bash
cd ~/ws_fanuc
sudo apt update
rosdep update
rosdep install --ignore-src --from-paths src -y
```

### 4. Build

```bash
colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1
```

### 5. Source

```bash
source install/setup.bash
```

Add to `~/.bashrc` for persistence:

```bash
echo "source ~/ws_fanuc/install/setup.bash" >> ~/.bashrc
```

## Verify Build

```bash
ros2 pkg list | grep fanuc
```

Expected output includes: `fanuc_crx_description`, `fanuc_moveit_config`, `fanuc_hardware_interface`, `fanuc_controllers`, `fanuc_msgs`, `slider_publisher`.

## Rebuild After Changes

```bash
cd ~/ws_fanuc
colcon build --symlink-install --packages-select <package_name>
source install/setup.bash
```

## References

- [FANUC_ROS2_Driver_Reference.md](physical_ai/references/FANUC_ROS2_Driver_Reference.md)
- [Quick Start](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/quick_start/quick_start.html)
