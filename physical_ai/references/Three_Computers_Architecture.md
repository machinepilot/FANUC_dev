# Three Computers Architecture

*NVIDIA's model for Physical AI — from ASI 2025 Panel (Murali Gopal Krishna)*

---

## Overview

Physical AI systems use three distinct compute environments:

1. **Training** — Where models are built
2. **Simulation** — Where digital twins and synthetic data live
3. **Edge** — Where real-time inference runs on the robot

---

## The Three Computers

### 1. Training Computer (Cloud)

- **Location**: Cloud or high-end workstation
- **Role**: Train AI models (perception, grasping, motion planning)
- **Data**: Large datasets, synthetic + real
- **Output**: Trained models

### 2. Simulation Computer

- **Location**: Workstation with NVIDIA GPU
- **Role**: Digital twin of factory, cell, or robot
- **Tools**: Isaac Sim (Omniverse)
- **Capabilities**:
  - Realistic physics
  - Virtual commissioning
  - Synthetic data generation

### 3. Edge Computer (Jetson)

- **Location**: On or near the robot
- **Role**: Run inference in real time
- **Input**: Trained models from (1), validated in (2)
- **Output**: Commands to robot (e.g., via FANUC ROS 2 driver)

---

## Data Flow

```
Training (Cloud)     →  Models
Simulation (Isaac)   →  Validation, synthetic data, virtual commissioning
Edge (Jetson)        →  Real-time perception, motion commands → Robot
```

---

## Portability

- **Same algorithms** run on cloud and edge
- **Only difference**: Model size (bigger in cloud, smaller on edge)
- **Jetson backward compatibility**: Software from Jetson DK1 (10 years ago) still runs on Orin
