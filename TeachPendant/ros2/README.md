# TeachPendant ROS 2 Workspace

Migrated from `FANUC_dev/physical_ai/ros2/`. Contains FANUC ROS 2 Driver packages (`fanuc_driver`, `fanuc_description`, MoveIt configs) for URDF visualization, mock hardware, and real R-30iB/CRX integration.

## Build

See `.cursor/skills/fanuc-ros2-build/SKILL.md` for the colcon + rosdep workflow.

```bash
source /opt/ros/humble/setup.bash
cd ros2
rosdep install --from-paths src --ignore-src -r -y
colcon build --symlink-install
source install/local_setup.bash
```

## Scope

ROS 2 is a side track to the TeachPendant agent cell, not its main focus. The agents do not author ROS 2 code; they author TP/KAREL. The ROS 2 driver is kept here because it is sometimes useful for visualization, MoveIt motion planning, or hardware bring-up validation, and it was already proven to work in `FANUC_dev`.

If you don't need ROS 2, ignore this directory. It is excluded from Cursor indexing via `.cursorignore` when the build artifacts are present (`build/`, `install/`, `log/`).
