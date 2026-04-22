---
name: fanuc-ros2-build
description: Build the FANUC ROS 2 workspace under ros2/src (fanuc_driver, fanuc_description). Use when making driver changes, first-time ROS 2 build, or troubleshooting colcon.
---

# FANUC ROS 2 Build

## Purpose

Build the ROS 2 packages migrated from `FANUC_dev/physical_ai/` into `TeachPendant/ros2/src/`.

## Prerequisites

- ROS 2 Humble (or newer) installed.
- `rosdep` initialized (`sudo rosdep init && rosdep update`).
- `git lfs` pulled (driver descriptions may include LFS meshes).

## Steps

### 1. Source ROS 2

```bash
source /opt/ros/humble/setup.bash
```

### 2. Install Dependencies

```bash
cd ros2
rosdep install --from-paths src --ignore-src -r -y
```

### 3. Build

```bash
colcon build --symlink-install
```

### 4. Source the Overlay

```bash
source install/local_setup.bash
```

### 5. Sanity Launch

```bash
ros2 launch fanuc_description view_<robot_model>.launch.py
```

RViz should show the URDF. If URDFs fail to load, check LFS pointer files - they need `git lfs pull`.

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `package not found` | Rosdep didn't install; rerun Step 2. |
| URDF meshes missing | `git lfs pull` in the repo root. |
| MoveIt launch errors | Check the robot model matches the config; some configs are R-30iB-Plus specific. |

## Scope

This skill covers only the ROS 2 driver. The FANUC controller integration (TP / KAREL / PNS handshakes) is covered by other skills.
