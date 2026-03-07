# FANUC ROS 2 Driver Reference

Reference for the FANUC ros2_control driver — high-frequency motion, cyclic I/O, and asynchronous command support for FANUC robots.

---

## Overview

The FANUC ROS 2 Driver is a **ros2_control** high-bandwidth streaming driver that enables development of ROS 2 applications to control FANUC virtual or real robots. It is the first open-source software FANUC has published on GitHub.

- **Repository**: [FANUC-CORPORATION/fanuc_driver](https://github.com/FANUC-CORPORATION/fanuc_driver)
- **Documentation**: [FANUC ROS 2 Driver Documentation](https://fanuc-corporation.github.io/fanuc_driver_doc/main/index.html)

---

## Supported Robot Models

| Model | Notes |
|-------|-------|
| CRX-5iA | Collaborative |
| CRX-10iA | Collaborative |
| CRX-10iA/L | Collaborative, long reach |
| CRX-20iA/L | Collaborative, long reach |
| CRX-30iA | Collaborative |
| CRX-30-18A | Collaborative |

**Note**: Requires R-30iB+ or newer controller with streaming motion support.

---

## System Requirements

- **ROS 2**: Humble (recommended)
- **OS**: Ubuntu 22.04
- **Dependencies**: ros2_control, MoveIt 2, robot_description
- **FANUC controller**: Streaming motion option for physical hardware

---

## Installation (Source Build)

```bash
# Install Git LFS
sudo apt install git-lfs
git lfs install

# Create workspace
mkdir -p ~/ws_fanuc/src
cd ~/ws_fanuc/src

# Clone repositories
git clone https://github.com/FANUC-CORPORATION/fanuc_description.git
git clone --recurse-submodules https://github.com/FANUC-CORPORATION/fanuc_driver.git

# Install dependencies
cd ~/ws_fanuc
rosdep install --ignore-src --from-paths src -y

# Build
colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1

# Source
source install/setup.bash
```

---

## Launch Options

| Mode | Launch Command | Use Case |
|------|----------------|----------|
| **URDF visualization** | `ros2 launch fanuc_crx_description view_crx.launch.py robot_model:=crx10ia` | Visualize robot model in RViz2 |
| **Mock hardware** | `ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia use_mock:=true` | Test without physical robot |
| **Physical hardware** | `ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia robot_ip:="192.168.1.100"` | Connect to real FANUC |

---

## Architecture

- **ros2_control**: Standard ROS 2 interface for robot control
- **Hardware interface**: Connects to FANUC controller via Ethernet/IP or FANUC protocol
- **Streaming motion**: Real-time trajectory updates from external compute (e.g., Jetson)
- **MoveIt 2**: Motion planning integration

---

## Key Packages

| Package | Purpose |
|---------|---------|
| `fanuc_driver` | Core ros2_control driver |
| `fanuc_crx_description` | URDF and meshes for CRX models |
| `fanuc_controllers` | Joint/position controllers |
| `fanuc_forward_command` | Forward command controller |
| `fanuc_hardware_interface` | Hardware abstraction |
| `fanuc_libs` | Shared libraries (sockpp, readwriterqueue, etc.) |
| `fanuc_moveit_config` | MoveIt 2 configuration |
| `fanuc_msgs` | Custom service/message definitions |
| `slider_publisher` | GUI for joint control (demo) |

---

## Documentation Links

- [Quick Start](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/quick_start/quick_start.html)
- [Controller Customization](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/fanuc_driver/controller_customization.html)
- [fanuc_description Overview](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/fanuc_description/fanuc_description_overview.html)
- [Troubleshooting](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/troubleshooting/common_issues.html)

---

## Workspace Integration

The FANUC ROS 2 Driver is developed in a separate colcon workspace (`~/ws_fanuc/src/`). This FANUC_dev workspace provides:

- **Index**: `physical_ai/ros2/FANUC_ROS2_INDEX.md`
- **Cursor rule**: `.cursor/rules/fanuc-ros2-driver.mdc` (auto-applies for ROS 2 and launch files)
- **Skills**: `fanuc-ros2-build`, `fanuc-ros2-launch`, `fanuc-ros2-troubleshoot`
- **POC**: `physical_ai/poc/POC_02_FANUC_ROS2_Mock.md` (mock hardware walkthrough)

---

## Controller Requirements (Physical Hardware)

| Controller | Minimum Version |
|-----------|-----------------|
| R-30iB Plus | V9.40P/81 |
| R-30iB Mate Plus | V9.40P/81 |
| R-30iB Mini Plus | V9.40P/77 |
| R-50iA | V10.10P/26 |

Required options: **J519** (Stream Motion) + **R912** (Remote Motion), or **S636** (External Control Package).

---

## Integration with Physical AI

- **Perception node** (e.g., on Jetson) publishes pose/target via ROS 2 topics
- **FANUC driver** receives commands and streams motion to robot
- **No TP programming** required for AI-driven tasks — the AI brain computes and the driver executes
