# Isaac Sim Training Modules

*NVIDIA Physical AI learning path — links and notes*

---

## Base URL

[NVIDIA Physical AI: Getting Started with Isaac Sim](https://docs.nvidia.com/learning/physical-ai/getting-started-with-isaac-sim/latest/)

---

## Module 1: Building Your First Robot in Isaac Sim

**URL**: `.../building-your-first-robot-in-isaac-sim/`

**Topics**:
- Isaac Sim interface (panels, menus, toolbars)
- Build a simple robot (chassis, wheels, joints)
- Physics (collision meshes, ground plane)
- Control (OmniGraph, ROS 2, differential drive)
- Sensors (RGB camera, 2D lidar)
- Stream sensor data to ROS 2 / RViz

---

## Module 2: Ingesting Robot Assets and Simulating Your Robot

**URL**: `.../ingesting-robot-assets-and-simulating-your-robot-in-isaac-sim/`

**Topics**:
- URDF structure (links, joints)
- URDF Importer in Isaac Sim
- Import and simulate robot model
- Physics behavior evaluation
- Control systems (differential, keyboard)
- Simulated environments with obstacles

**Relevance**: Use FANUC CRX URDF from `fanuc_description` for digital twin.

---

## Module 3: Synthetic Data Generation for Perception Model Training

**URL**: `.../synthetic-data-generation-for-perception-model-training-in-isaac-sim/`

**Topics**:
- Perception models in dynamic robotic tasks
- Domain randomization (Replicator)
- Generate synthetic dataset
- Train and validate AI perception model
- Fine-tune for specific settings

---

## Module 4: Software-in-the-Loop (SIL)

**Topics** (navigate from base URL):
- OmniGraph to drive robot
- Python scripting in Isaac Sim
- Image segmentation, ROS 2, Isaac ROS
- Image segmentation with/without simulation

---

## Module 5: Hardware-in-the-Loop (HIL)

**Topics**:
- HIL fundamentals
- Jetson platform overview
- Setting up Jetson environment
- Deploying Isaac ROS on Jetson

---

## Recommended Order

1. Module 1 — Interface and basics
2. Module 2 — URDF import (FANUC CRX)
3. Module 5 — Jetson setup (if edge-first)
4. Module 3 — Synthetic data (when training perception)
5. Module 4 — SIL (when integrating with ROS 2)
