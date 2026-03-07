# FANUC ROS 2 — Cursor Commands Reference

Suggested commands to add in Cursor (Settings > Rules, Commands) for quick access to FANUC ROS 2 workflows.

---

## Available Commands

### Build FANUC ROS 2

**Prompt**: Build the FANUC ROS 2 Driver colcon workspace. Follow the fanuc-ros2-build skill.

**When to use**: First-time setup, after cloning, or after dependency changes.

---

### Launch FANUC Mock

**Prompt**: Launch the FANUC ROS 2 Driver with mock hardware (no physical robot). Follow the fanuc-ros2-launch skill using the mock hardware section.

**When to use**: Testing MoveIt 2, trajectory planning, or controller behavior without a physical CRX.

---

### Launch FANUC Physical

**Prompt**: Launch the FANUC ROS 2 Driver with physical hardware. Follow the fanuc-ros2-launch skill using the physical hardware section. Ask for robot model and IP if not provided.

**When to use**: Connecting to a real FANUC CRX robot.

---

### Troubleshoot FANUC ROS 2

**Prompt**: Help troubleshoot a FANUC ROS 2 Driver issue. Follow the fanuc-ros2-troubleshoot skill. Ask for error messages or symptoms.

**When to use**: Build failures, launch errors, robot not responding.

---

## How to Add

1. Open Cursor Settings (Ctrl+Shift+P > "Cursor Settings" or gear icon).
2. Navigate to **Rules, Commands**.
3. Add each command with the prompt text above.
4. Commands will appear in the command palette and chat.

---

## Related Skills

| Skill | Purpose |
|-------|---------|
| `fanuc-ros2-build` | Workspace setup and colcon build |
| `fanuc-ros2-launch` | URDF, mock, and physical launch |
| `fanuc-ros2-troubleshoot` | Error diagnosis and resolution |
