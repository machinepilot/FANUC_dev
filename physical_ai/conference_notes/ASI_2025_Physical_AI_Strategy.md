# ASI 2025 Conference Briefing: FANUC Physical AI Strategy

*Distilled from FANUC ASI Conference transcript (02-10-2025) — Physical AI, ROS 2 Integration, and Automotive Collaboration*

---

## Executive Summary

FANUC is embracing **Physical AI**: an external AI "brain" (Jetson GPU) connected to the robot via streaming motion interfaces. The robot executes what the AI decides — a fundamental shift from traditional TP programming. FANUC has published its **ROS 2 interface on GitHub** for the first time ever, enabling external software to command FANUC robots.

---

## Key Concepts

### Physical AI Defined

- **AI brain** sits outside the robot (e.g., Jetson GPU)
- Compute power for perception, classification, tracking runs on external hardware
- A **connection** (streaming motion, ROS 2) drives the robot to execute AI decisions
- "Take AI and do something physical with it" — the robot fundamentally acts on AI output

### Example Capabilities in the AI Brain

- **Recyclable sorting**: Camera identifies object type (color, barcode) and sorts automatically — no teaching by color
- **Human form detection**: Find/track humans with a camera
- **Object tracking**: Track parts in real time
- **Gesture recognition**: Follow finger commands, trace drawings, recognize gestures
- **Pick and place**: Teach pick/place once; AI handles classification and placement logic

---

## FANUC GitHub and ROS 2

- **First time ever** FANUC has published code on GitHub (significant effort with Japan)
- **ROS 2 interface** is currently available
- Download from GitHub and push commands through ROS to FANUC from the outside
- "Make stuff on the outside and push commands through ROS to FANUC on the inside"

---

## Imbolt Engine Block Demo (iREX Japan)

Real-world example of Physical AI:

- **Scenario**: Engine blocks on a chain moving down an assembly line — hard to automate with traditional vision/line tracking
- **Solution**: 3D sensor (Imbolt) + Jetson GPU + FANUC robot
- **Process**: Pre-program 3D CAD model of engine block; sensor sees real block; software aligns images on GPU
- **Result**: Robot screws screws on the engine block regardless of part movement — real-time hand-eye coordination
- **Key point**: **No robot programming** — AI software says "find the engine block and screw those three screws" and the robot executes

---

## Implications for Integrators

1. **Not mainstream yet** — applications exist in the field but adoption is still early
2. **Start preparing now**: Ask about Python, ROS, AI when hiring
3. **Upskill current staff**: Consider classes to understand the stack
4. **Work with FANUC**: Eric Potter, Clifton Moore, and team are versed — discuss applications
5. **Humanoids**: FANUC won't make bipedal humanoids, but dual-arm CRX on AMR, multi-arm control (dual, triple, quad) enables humanoid-like tasks

---

## Automotive Market Context

- Clarity in automotive: gas, plug-in hybrid, EV segments now defined
- Investment in final assembly automation: trim pieces, IP panels, wheels, operator assistance
- FANUC innovation lab (West Campus) for next-gen collaborative applications
- Resources available for new collaborative ideas — talk to Lou (Lupinazzo)

---

## Training and Support

- FANUC America Academy (former Cooley Law School) — expanded training facility
- Largest robotic training facility in the world
- 5,000+ robots/CNCs in 1,700+ schools across North and South America
- Multiple support levels: regional sales, engineers, development (Claude's group), ASI sales, service/training, marketing

---

## Action Items

| Action | Notes |
|--------|-------|
| Explore FANUC GitHub | Download ROS 2 interface, experiment |
| Hire for Python/ROS/AI | Add to qualifications for next software engineer |
| Discuss with FANUC | Eric Potter, Clifton Moore for application ideas |
| Consider training | Classes for current staff on AI/ROS |
