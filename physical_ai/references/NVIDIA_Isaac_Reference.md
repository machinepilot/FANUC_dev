# NVIDIA Isaac Ecosystem Reference

Reference for NVIDIA Isaac Sim, Isaac ROS, and the Physical AI toolchain.

---

## Overview

The NVIDIA Isaac ecosystem provides tools for simulation, training, and edge deployment of AI-powered robotics:

| Component | Purpose |
|-----------|---------|
| **Isaac Sim** | Simulation, digital twin, synthetic data generation (Omniverse-based) |
| **Isaac ROS** | GPU-accelerated ROS 2 packages for perception, SLAM, inference (edge deployment) |
| **Jetson** | Edge compute platform (Orin Nano, Orin, etc.) |

---

## Three Computers Architecture (NVIDIA)

From the ASI 2025 panel — NVIDIA's model for Physical AI:

```
┌─────────────────────────────────────────────────────────────────┐
│  1. TRAINING COMPUTER (Cloud)                                    │
│     - Model training, large datasets                            │
│     - Can be cloud-based                                         │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  2. SIMULATION COMPUTER (Workstation)                            │
│     - Isaac Sim digital twin                                     │
│     - Virtual factory, cell, or robot                            │
│     - Physics, synthetic data, virtual commissioning             │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│  3. EDGE COMPUTER (Jetson)                                       │
│     - Run trained models on device                              │
│     - Real-time perception, inference                           │
│     - Connects to robot controller                               │
└─────────────────────────────────────────────────────────────────┘
```

**Key**: Same algorithms run on cloud and edge; only model size differs. Software is backward compatible across Jetson generations (Xavier → Orin → Thor).

---

## Isaac Sim Training Modules

[NVIDIA Physical AI Learning Path](https://docs.nvidia.com/learning/physical-ai/getting-started-with-isaac-sim/latest/)

| Module | Focus |
|--------|-------|
| **1. Building Your First Robot** | Interface, components, physics, control (OmniGraph, ROS 2), sensors, streaming to RViz |
| **2. Ingesting Robot Assets** | URDF import, physics behavior, control systems, simulated environments |
| **3. Synthetic Data Generation** | Perception models, domain randomization (Replicator), dataset generation, model training/validation |
| **4. Software-in-the-Loop (SIL)** | OmniGraph, Python scripting, image segmentation, ROS 2 |
| **5. Hardware-in-the-Loop (HIL)** | Jetson setup, Isaac ROS deployment |

---

## Isaac ROS

- **Target**: Jetson platform, ROS 2 Humble
- **Approach**: Docker-based dev containers (recommended)
- **Packages**: Perception (apriltag, centerpose, foundationpose), image processing, SLAM, etc.
- **Docs**: [Isaac ROS Getting Started](https://nvidia-isaac-ros.github.io/getting_started/index.html)

---

## FANUC + NVIDIA Partnership

- **Isaac Sim**: FANUC robot models (URDF) for digital twin
- **Interoperability**: Realistic robot simulation with physics
- **Edge**: Jetson runs perception; FANUC ROS 2 driver executes motion
- **Imbolt**: Example deployment — 3D sensor + Jetson + FANUC for real-time tracking

---

## Open Source Libraries (NVIDIA)

- Motion planning, grasp, 6D pose — GPU-accelerated, available on GitHub
- ROS 2 compatible; quick benchmarking possible
- Integrate and go to market faster
