# FANUC ROS 2 Driver — Workspace Index

Quick reference for FANUC ROS 2 Driver resources within this workspace. The driver itself lives in a separate colcon workspace (`~/ws_fanuc/src/`); this directory provides documentation, skills, and rules for effective AI-assisted development.

---

## By Topic

| Topic | Location | Notes |
|-------|----------|-------|
| **Overview** | `physical_ai/references/FANUC_ROS2_Driver_Reference.md` | Architecture, packages, supported models |
| **Build** | `.cursor/skills/fanuc-ros2-build/SKILL.md` | colcon workspace setup, git-lfs, rosdep |
| **Launch** | `.cursor/skills/fanuc-ros2-launch/SKILL.md` | URDF, mock hardware, physical hardware |
| **Troubleshooting** | `.cursor/skills/fanuc-ros2-troubleshoot/SKILL.md` | Build errors, launch failures, hardware connection |
| **Mock Hardware POC** | `physical_ai/poc/POC_02_FANUC_ROS2_Mock.md` | First-time build and mock launch walkthrough |
| **Cursor Rule** | `.cursor/rules/fanuc-ros2-driver.mdc` | Auto-applied when editing ROS 2 / launch files |

---

## Colcon Workspace Layout

The standard FANUC ROS 2 workspace is at `~/ws_fanuc/`:

```
~/ws_fanuc/
├── src/
│   ├── fanuc_description/     # URDF, meshes for CRX models
│   └── fanuc_driver/          # ros2_control driver (with submodules)
│       ├── fanuc_controllers/
│       ├── fanuc_forward_command/
│       ├── fanuc_hardware_interface/
│       ├── fanuc_libs/
│       ├── fanuc_moveit_config/
│       ├── fanuc_msgs/
│       └── slider_publisher/
├── build/
├── install/
└── log/
```

---

## Supported Robot Models

CRX-5iA, CRX-10iA, CRX-10iA/L, CRX-20iA/L, CRX-30iA, CRX-30-18A

---

## Key Launch Commands

```bash
source /opt/ros/humble/setup.bash
source ~/ws_fanuc/install/setup.bash

# URDF visualization
ros2 launch fanuc_crx_description view_crx.launch.py robot_model:=crx10ia

# Mock hardware (no physical robot)
ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia use_mock:=true

# Physical hardware
ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia robot_ip:="192.168.1.100"
```

---

## External Links

| Resource | URL |
|----------|-----|
| Official Docs | https://fanuc-corporation.github.io/fanuc_driver_doc/main/index.html |
| GitHub | https://github.com/FANUC-CORPORATION/fanuc_driver |
| Quick Start | https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/quick_start/quick_start.html |
| Troubleshooting | https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/troubleshooting/troubleshooting.html |
