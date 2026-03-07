# Physical AI Concepts

Core AI capabilities for robotics production — from ASI 2025 Panel (Stefan Saric, Intrinsic).

---

## The Big Four

### 1. Perception

- **Definition**: Detect location and orientation of objects in space (6D pose)
- **Technologies**: 2D vision, 3D vision, pose estimation
- **Value**: Enables flexible fixturing (no custom jigs), real-time tracking

### 2. Grasping

- **Definition**: Determine how to grab an object with an end effector without pre-planning
- **Challenge**: Unknown object shapes, orientations
- **Evolution**: Generalization across end effectors and object populations

### 3. Motion Planning

- **Definition**: On-the-fly calculation of motion path from A to B
- **AI role**: Dynamic environments, obstacle avoidance, multi-robot coordination
- **Emerging**: Machine-learned approaches for multi-arm efficiency

### 4. Force Control

- **Definition**: React to force feedback during task execution
- **Example**: Pin insertion, assembly with fine tolerances
- **Value**: Enables tasks that require compliance

---

## Infrastructure Layer

- **Edge + cloud** — Partially connected system
- **Software lifecycle** — Ongoing updates, distribution, maintenance
- **Digital twin** — Virtual representation at design and runtime
- **Simulation** — Synthetic data for training

---

## Software Stack

- **Python, C++** — Primary languages
- **ROS 2** — Messaging, control, ecosystem
- **OpenCV** — Vision (plugs into ROS)
- **Manufacturer SDK** — FANUC, etc.
- **Commercial platforms** — Intrinsic, Imbolt, etc.

---

## Brownfield vs Greenfield

- **Greenfield**: Rare — new factories, new lines
- **Brownfield**: Common — productivity improvement, labor replacement
- **AI value**: Add perception layer so robots adapt to existing (worker-designed) environments; reduce microstops and maintenance on existing stations
