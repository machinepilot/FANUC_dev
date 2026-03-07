# POC 02: FANUC ROS 2 Driver (Mock Hardware)

*Second proof of concept — FANUC driver with mock hardware, no physical robot*

---

## Objective

Build and run the FANUC ROS 2 driver with **mock hardware** on a development workstation. Gain hands-on experience with ros2_control, MoveIt 2, and FANUC CRX model — without risk to production equipment.

---

## Success Criteria

- [ ] FANUC driver builds successfully
- [ ] Launch with `use_mock:=true` runs without errors
- [ ] RViz2 displays CRX robot model
- [ ] Slider publisher or MoveIt moves joints in simulation
- [ ] Learnings documented for future physical hardware integration

---

## Prerequisites

- Ubuntu 22.04 (native or WSL2)
- ROS 2 Humble installed
- No FANUC robot required

---

## Steps

### 1. Clone and Build

```bash
sudo apt install git-lfs
git lfs install

mkdir -p ~/ws_fanuc/src
cd ~/ws_fanuc/src
git clone https://github.com/FANUC-CORPORATION/fanuc_description.git
git clone --recurse-submodules https://github.com/FANUC-CORPORATION/fanuc_driver.git

cd ~/ws_fanuc
rosdep install --ignore-src --from-paths src -y
colcon build --symlink-install --cmake-args -DBUILD_TESTING=1 -DBUILD_EXAMPLES=1

source install/setup.bash
```

### 2. Launch URDF Visualization

```bash
ros2 launch fanuc_crx_description view_crx.launch.py robot_model:=crx10ia
```

### 3. Launch with Mock Hardware

```bash
ros2 launch fanuc_moveit_config fanuc_moveit.launch.py robot_model:=crx10ia use_mock:=true
```

### 4. Interact

- Use **slider_publisher** (if included) to move joints
- Use **MoveIt 2** motion planning to plan and execute moves
- Observe joint state and trajectory topics

### 5. Document

- Note any build or launch issues
- Record package names, launch file paths
- Document next steps for physical hardware (streaming motion, controller config)

---

## References

- [FANUC ROS 2 Driver Reference](../references/FANUC_ROS2_Driver_Reference.md)
- [FANUC ROS 2 Workspace Index](../ros2/FANUC_ROS2_INDEX.md)
- [FANUC ROS 2 Driver Docs](https://fanuc-corporation.github.io/fanuc_driver_doc/main/index.html)
- **Skills**: `fanuc-ros2-build` (workspace setup), `fanuc-ros2-launch` (launch modes), `fanuc-ros2-troubleshoot` (debugging)
