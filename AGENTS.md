# FANUC Programming Assistant

This project develops FANUC TP programs for The Way Automation LLC (TWA).

## Tool Roles (Cowork + Cursor)

This workspace is operated by two AI tools with distinct responsibilities:

**Cowork (Claude Desktop) — Orchestration**
- Plans program architecture and register allocation
- Runs code reviews / QA audits against dataset conventions
- Generates documentation, integration guides, and handoff docs
- Manages workspace configuration (this file, `.cursor/rules/*.mdc`, index files)
- Coordinates multi-program refactoring campaigns

**Cursor IDE — In-File Editing**
- Writes and edits `.LS`, `.kl`, `.launch.py`, and other code files
- Applies `.cursor/rules/*.mdc` context automatically via glob matching
- Executes `.cursor/skills/*.md` for ROS 2 build/launch/troubleshoot
- Consumes handoff documents produced by Cowork

**Handoff Protocol:** When Cowork plans work that requires code editing, it creates `HANDOFF_<task>_<date>.md` in the relevant project directory with target files, applicable Cursor rules, dataset references, edit instructions, and acceptance criteria. See `cowork/templates/HANDOFF_TEMPLATE.md` for the standard format.

**Agent Workflows:**
- TP Program Generator: Spec intake → architecture → register allocation → `PROGRAM_SPEC.md` → Cursor generates `.LS` → Cowork QA. Template: `cowork/templates/PROGRAM_SPEC_TEMPLATE.md`
- Code Review / QA: Load context → audit 10 TWA conventions → compare to dataset → `REVIEW.md` → hand off fixes. Template: `cowork/templates/QA_REVIEW_TEMPLATE.md`

## Customer Program Repository

Customer programs are production backups organized by customer and robot system in `customer_programs/`.

1. **Index** — `customer_programs/PROGRAM_REPOSITORY_INDEX.md` and `customer_programs/_manifest.json` for context.

2. **Purpose** — Application-specific context (press brake tending, infeed sort, tube bending, etc.).

3. **Caveats** — Program errors, multiple programmers, different philosophies. Do NOT mix with the dataset. When editing customer programs, use the dataset for correct syntax; do not copy patterns from other customer programs without verification.

## Dataset Usage

When assisting with FANUC TP programming:

1. **Always reference** `FANUC_Optimized_Dataset/optimized_dataset/` for syntax, concepts, and patterns.

2. **Use the index** — `FANUC_Optimized_Dataset/optimized_dataset/DATASET_INDEX.md` maps topics to file paths for rapid lookup.

3. **@ reference dataset files** when providing syntax, examples, or troubleshooting guidance.

4. **Example alignment** — Dataset examples (RoboDrill, machine tending, grid pick/put, vision) align with customer application patterns.

## LDJ Integration (Press Brake + FANUC)

When planning FANUC + press brake integration:

1. **Use robot_interface_reference.md** — Primary for XC2F/XC3M/XC4M signal set, PHASE 0-6 cycle phases, and critical interlock rules. Integration approach: Hardwire (primary) + Modbus TCP (backup for program/mode).

2. **Use LDJ references** — `LDJ/LDJ_INTEGRATION_INDEX.md`, `LDJ/reference/LDJ_REF_*` files, `LDJ/press_brake_reference.md`.

3. **Use FANUC dataset** — Modbus, signal handshake, machine tending patterns.

4. **Reference `customer_programs/345-PJ/press_brake_tending/`** — Tandem press brake patterns, WAIT/cycle-time patterns.

## Physical AI Development (FANUC + NVIDIA)

When working on Physical AI, ROS 2, or NVIDIA Isaac topics:

1. **Use the index** — `physical_ai/PHYSICAL_AI_INDEX.md` maps topics to reference files.

2. **Conference context** — `physical_ai/conference_notes/` contains distilled insights from ASI 2025.

3. **FANUC ROS 2 Driver** — [Official docs](https://fanuc-corporation.github.io/fanuc_driver_doc/main/index.html), [GitHub](https://github.com/FANUC-CORPORATION/fanuc_driver).

4. **NVIDIA Isaac** — Isaac Sim for simulation, Isaac ROS for edge deployment on Jetson.

5. **Learning path** — `physical_ai/learning_path/` for ROS 2, Jetson, and Isaac Sim guides.

## FANUC ROS 2 Driver (Workspace Integration)

When assisting with fanuc_driver, ros2_control, MoveIt 2, or CRX robot control:

1. **Use the ROS 2 index** — `physical_ai/ros2/FANUC_ROS2_INDEX.md` maps topics to skills, rules, and docs.

2. **Reference** — `physical_ai/references/FANUC_ROS2_Driver_Reference.md` for architecture, packages, launch commands, and supported models.

3. **Skills** — Use `fanuc-ros2-build` (workspace setup), `fanuc-ros2-launch` (URDF/mock/physical), `fanuc-ros2-troubleshoot` (errors and debugging).

4. **Rule** — `.cursor/rules/fanuc-ros2-driver.mdc` auto-applies when editing ROS 2 packages or `.launch.py` files.

5. **Colcon workspace** — Standard path is `~/ws_fanuc/`; source `~/ws_fanuc/install/setup.bash` before launch.

6. **POC** — `physical_ai/poc/POC_02_FANUC_ROS2_Mock.md` for mock hardware walkthrough.
