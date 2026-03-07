# POC 03: Isaac Sim Digital Twin

*Third proof of concept — FANUC CRX in Isaac Sim for simulation and synthetic data*

---

## Objective

Import the FANUC CRX robot model into Isaac Sim to create a digital twin. Use it for virtual commissioning and (optionally) synthetic data generation for perception model training.

---

## Success Criteria

- [ ] Isaac Sim installed on development workstation (NVIDIA GPU required)
- [ ] FANUC CRX URDF imported and simulated
- [ ] Robot moves with correct physics
- [ ] (Optional) Synthetic images generated for a perception use case
- [ ] Documented workflow for future POCs

---

## Prerequisites

- Development workstation with **NVIDIA GPU**
- Isaac Sim (Omniverse)
- FANUC CRX URDF from `fanuc_description` package

---

## Steps

### 1. Install Isaac Sim

- Download from [NVIDIA Omniverse](https://developer.nvidia.com/isaac-sim)
- Install and launch

### 2. Work Through Training Modules

- [Module 1](https://docs.nvidia.com/learning/physical-ai/getting-started-with-isaac-sim/latest/building-your-first-robot-in-isaac-sim/) — Interface, physics, control
- [Module 2](https://docs.nvidia.com/learning/physical-ai/getting-started-with-isaac-sim/latest/ingesting-robot-assets-and-simulating-your-robot-in-isaac-sim/) — URDF import

### 3. Export FANUC URDF

From `fanuc_description` package, locate URDF (e.g., `crx10ia.urdf.xacro` or similar). Export to `.urdf` if needed:

```bash
# Example — adjust paths per fanuc_description structure
ros2 run xacro xacro path/to/crx_model.urdf.xacro > crx10ia.urdf
```

### 4. Import into Isaac Sim

- Use URDF Importer (Omniverse)
- Set import options for physics (collision, mass)
- Place in scene with ground plane

### 5. Configure Control

- Add differential or joint controller per Isaac Sim docs
- Optionally connect to ROS 2 (Omniverse ROS 2 Bridge)

### 6. (Optional) Synthetic Data

- [Module 3](https://docs.nvidia.com/learning/physical-ai/getting-started-with-isaac-sim/latest/synthetic-data-generation-for-perception-model-training-in-isaac-sim/) — Replicator, domain randomization
- Generate images of parts in scene
- Use for perception model training

---

## References

- [NVIDIA Isaac Reference](../references/NVIDIA_Isaac_Reference.md)
- [Isaac Sim Training Modules](../learning_path/Isaac_Sim_Training_Modules.md)
