# ROS 2 Getting Started

*Curated for Linux-comfortable, ROS-new users — focused on FANUC Physical AI*

---

## Prerequisites

- Ubuntu 22.04 (native or WSL2)
- Comfort with terminal, package managers (apt), and basic scripting

---

## Install ROS 2 Humble

```bash
# Set locale
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

# Add ROS 2 apt repository
sudo apt install software-properties-common
sudo add-apt-repository universe
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# Install ROS 2 Humble Desktop
sudo apt update
sudo apt install ros-humble-desktop

# Source (add to ~/.bashrc)
source /opt/ros/humble/setup.bash
```

---

## Core Concepts (Quick Reference)

| Concept | Description |
|---------|-------------|
| **Node** | Process that does work (publishes/subscribes) |
| **Topic** | Named bus for messages (e.g., `/camera/image`) |
| **Service** | Request-response (synchronous) |
| **Launch file** | Start multiple nodes together |
| **Workspace** | `src/` (packages) + `build/` + `install/` + `log/` |

---

## Essential Commands

```bash
# List topics
ros2 topic list

# Echo a topic
ros2 topic echo /topic_name

# List nodes
ros2 node list

# Run a node
ros2 run package_name node_name

# Build workspace
cd ~/ws_ros2 && colcon build --symlink-install
source install/setup.bash
```

---

## ros2_control (Critical for FANUC)

The FANUC ROS 2 driver uses **ros2_control** — the standard interface for robot hardware.

- **Controller**: Manages joints (position, velocity, effort)
- **Hardware interface**: Talks to real hardware (or mock)
- **MoveIt 2**: Uses ros2_control to send motion commands

---

## Learning Resources

- [ROS 2 Humble Docs](https://docs.ros.org/en/humble/)
- [ROS 2 Tutorials](https://docs.ros.org/en/humble/Tutorials.html)
- [ros2_control](https://control.ros.org/humble/doc/ros2_control/doc/index.html)

---

## Next Steps

1. Complete ROS 2 Humble install
2. Run `ros2 run demo_nodes_cpp talker` and `ros2 run demo_nodes_cpp listener`
3. Build FANUC driver with mock hardware (see [POC_02_FANUC_ROS2_Mock](../poc/POC_02_FANUC_ROS2_Mock.md))
4. Proceed to [Jetson_Orin_Nano_Setup](Jetson_Orin_Nano_Setup.md) for edge deployment
