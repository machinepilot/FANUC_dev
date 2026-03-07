---
name: fanuc-ros2-troubleshoot
description: Troubleshoot FANUC ROS 2 Driver build failures, launch errors, or hardware connection issues. Use when colcon build fails, launch crashes, robot is unreachable, or motion does not execute.
---

# Troubleshoot FANUC ROS 2 Driver

## Build Issues

| Symptom | Cause | Fix |
|---------|-------|-----|
| `git-lfs` errors on clone | Git LFS not installed | `sudo apt install git-lfs && git lfs install`, re-clone |
| Missing dependencies | rosdep not run | `rosdep install --ignore-src --from-paths src -y` |
| CMake errors | Wrong ROS 2 version | Verify ROS 2 Humble: `printenv ROS_DISTRO` must show `humble` |
| Submodule missing | Forgot `--recurse-submodules` | `cd src/fanuc_driver && git submodule update --init --recursive` |

## Launch Issues

| Symptom | Cause | Fix |
|---------|-------|-----|
| Package not found | Workspace not sourced | `source ~/ws_fanuc/install/setup.bash` |
| Launch file not found | Wrong package name | URDF: `fanuc_crx_description`; MoveIt: `fanuc_moveit_config` |
| RViz2 blank | GPU/display issue | Check `echo $DISPLAY`; for WSL2 use VcXsrv or WSLg |

## Hardware Connection Issues

| Symptom | Cause | Fix |
|---------|-------|-----|
| Cannot reach robot | Network misconfigured | Verify PC/robot on same subnet; `ping <robot_ip>` |
| "Streaming motion not available" | Missing controller option | Verify J519 + R912 or S636 on pendant: STATUS > Version ID > CONFIG |
| Robot does not move | Safety fault or E-stop | Clear faults on pendant; verify robot is in AUTO mode |

## Controller Software Requirements

| Controller | Minimum Version |
|-----------|-----------------|
| R-30iB Plus | V9.40P/81 |
| R-30iB Mate Plus | V9.40P/81 |
| R-30iB Mini Plus | V9.40P/77 |
| R-50iA | V10.10P/26 |

Required options: **J519** (Stream Motion) + **R912** (Remote Motion), or **S636** (External Control Package).

## Diagnostic Commands

```bash
# Check ROS 2 environment
printenv ROS_DISTRO
ros2 pkg list | grep fanuc

# Check topics
ros2 topic list
ros2 topic echo /joint_states

# Check controllers
ros2 control list_controllers

# Network
ping <robot_ip>
```

## References

- [Official Troubleshooting](https://fanuc-corporation.github.io/fanuc_driver_doc/main/docs/troubleshooting/troubleshooting.html)
- [FANUC_ROS2_Driver_Reference.md](physical_ai/references/FANUC_ROS2_Driver_Reference.md)
- [POC_02_FANUC_ROS2_Mock.md](physical_ai/poc/POC_02_FANUC_ROS2_Mock.md)
