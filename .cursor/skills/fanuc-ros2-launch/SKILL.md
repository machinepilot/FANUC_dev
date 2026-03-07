---
name: fanuc-ros2-launch
description: Launch the FANUC ROS 2 Driver (URDF visualization, mock hardware, physical hardware). Use when launching view_crx, fanuc_moveit, connecting to a CRX robot, or running MoveIt 2.
---

# Launch FANUC ROS 2 Driver

Always source ROS 2 and the workspace before launching:

```bash
source /opt/ros/humble/setup.bash
source ~/ws_fanuc/install/setup.bash
```

## URDF Visualization

View the CRX model in RViz2 with joint sliders:

```bash
ros2 launch fanuc_crx_description view_crx.launch.py robot_model:=crx10ia
```

Replace `crx10ia` with: `crx5ia`, `crx10ial`, `crx20ial`, `crx30ia`, or `crx30_18a`.

## Mock Hardware (No Physical Robot)

Launch ros2_control + MoveIt 2 with simulated hardware:

```bash
ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia use_mock:=true
```

- Drag the IMarker in RViz2 to set goal pose, click "Plan & Execute".
- Use slider_publisher to scale trajectory speed (0-100%).

## Physical Hardware

Connect to a real FANUC CRX:

```bash
ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia robot_ip:="192.168.1.100"
```

### Controller Requirements

- R-30iB Plus: V9.40P/81+
- R-30iB Mate Plus: V9.40P/81+
- R-30iB Mini Plus: V9.40P/77+
- R-50iA: V10.10P/26+
- Options: J519 Stream Motion + R912 Remote Motion, or S636 External Control Package

### Network Setup

- Dedicate an Ethernet port for robot communication (isolated from other traffic).
- Robot IP example: `192.168.1.100`; PC IP: `192.168.1.101`, netmask `255.255.255.0`.

## I/O Control

Set a digital output via ROS 2 CLI:

```bash
ros2 service call /fanuc_gpio_controller/set_bool_io fanuc_msgs/srv/SetBoolIO "{io_type: {type: 'DO'}, index: 1, value: true}"
```

## References

- [FANUC_ROS2_Driver_Reference.md](physical_ai/references/FANUC_ROS2_Driver_Reference.md)
- [Controller Usage](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/fanuc_driver/controller_usage.html)
- [Controller Customization](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/fanuc_driver/controller_customization.html)
