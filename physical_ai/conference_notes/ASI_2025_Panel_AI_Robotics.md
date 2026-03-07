# ASI 2025 Panel: AI in Robotics and Industrial Automation

*Distilled from Panel Discussion transcript (02-10-2025) — NVIDIA, Intrinsic, Imbolt*

---

## Panelists

- **Murali Gopal Krishna** (NVIDIA): Head of Product Management, Autonomous Machines; GM of Robotics
- **Stefan Saric** (Intrinsic): CPO; former Fetch Robotics, Google, Willow Garage (where ROS was born)
- **Albane Engels** (Imbolt): CEO/Co-founder; AI vision + robots at 40+ factories, tens of millions of production cycles

---

## The Big Four AI Capabilities (Stefan)

1. **Perception** — Detect location and orientation of objects in space (6D pose)
2. **Grasping** — Figure out how to grab an object with an end effector without pre-planning
3. **Motion planning** — On-the-fly calculation of motion path from A to B
4. **Force control** — React to force (e.g., pin insertion, fine-grained tasks)

---

## Infrastructure Layer

- **Edge + cloud** — System runs on edge and cloud with connectivity
- **Software lifecycle management** — Ongoing refresh, distribution, maintenance, updates
- **Digital twin** — Virtual representation of work cell at design time and runtime
- **Simulation** — Generate data you can't collect in the field (synthetic data)

---

## Software-First Entry Points

- **Manufacturer SDK** — Start with FANUC's interface (Python, ROS)
- **FANUC + ROS** — Robots accessible in open source world
- **Simulators** — NVIDIA Omniverse/Isaac Sim
- **Perception SDKs** — Imbolt, others
- **Open source** — ROS, OpenCV, commercial platforms (Intrinsic)

---

## Deployment Speed (Imbolt)

- **5–10 minutes** for a non-expert to deploy perception-based system in production
- **10 minutes** to implement a new reference for production
- AI reduces **commissioning time** and **runtime microstops** (jig moved, path touch-up)
- No custom jigs/fixturing; less on-site revisits

---

## NVIDIA + FANUC Partnership (Murali)

- **Open source is foundational** — FANUC adopting ROS is a major shift
- **NVIDIA provides**: Libraries for motion planning, grasp, 6D pose — GPU-accelerated, open source
- **Three computers**:
  1. **Training** — Cloud-based
  2. **Simulation** — Digital twin of factory/cell/robot (Isaac Sim)
  3. **Edge** — Jetson; run trained models on real robot
- End-to-end workflow: build on cloud → train in simulation → run on edge

---

## Real-Time Tracking Breakthrough (Imbolt)

- **Better compute** — Process data very fast (hundreds of ms)
- **Robot openness** — Streaming motion, real-time trajectory adjustment
- "Robots need to be more open so perception can add proper value"

---

## Jetson Backward Compatibility (NVIDIA)

- Software written for Jetson DK1 (10 years ago) still runs on latest Orin
- Libraries portable: Xavier → Orin → Thor
- Same algorithms run on cloud or edge; only model size differs
- Industrial automation: don't break what's deployed

---

## Brownfield Automation (Imbolt)

- **Greenfield is rare** — Most automation is productivity improvement
- **Brownfield focus**: Reduce impact on production; add perception for flexibility
- **Two value streams**:
  1. New robots in existing lines (perception = adapt to worker-designed env)
  2. Improve existing stations (vision guidance reduces microstops, crashes, maintenance)

---

## Skills to Invest In (Panel Consensus)

| Source | Recommendation |
|--------|----------------|
| **Stefan** | Software first; Python, C++; ROS; OpenCV; commercial platforms; experiment |
| **Albane** | Mindset change: use camera + software instead of constraining environment; offline programming, virtual commissioning; hire for new tech |
| **Murali** | Lean on ecosystem; don't reinvent; leverage open source; **value and collect data** |

---

## Data Is Critical (NVIDIA)

- **Real data** from the field is immensely valuable
- Synthetic and internet data are noisy; real data makes models accurate
- Integrators are on the front line for data generation
- Plan to collect data in a reusable way; consider community approaches

---

## Expectation Management (Panel)

- **Customer cares about ROI**, not "AI"
- **Ongoing partnership** — Software updates, model refreshes, capability additions
- **Reliability** — "Does it run in my factory?" — that's the bar
- **AI value**: Easier commissioning (design time) or easier runtime (fewer microstops)

---

## One Thing to Do Next Week

| Panelist | Advice |
|----------|--------|
| **Murali** | Start collecting data; leverage open source and ecosystem |
| **Stefan** | Experiment; do a demo Friday afternoon; software enables instant feedback |
| **Albane** | Try it today — production-ready AI systems exist now |
| **Murali (add)** | NVIDIA has open source libraries on GitHub; download and run on ROS for quick benchmarking |

---

## Certification (Q&A)

- Define failure scenarios; build fail-safe logic (integrator experience)
- Ensure products guarantee reliability threshold (e.g., 99.99% in known env)
- Safety systems on robot remain; AI adds tools, not replacement for guardrails
- Start with use cases that tolerate some flexibility (e.g., bin picking — one ungraspable object still adds value)
