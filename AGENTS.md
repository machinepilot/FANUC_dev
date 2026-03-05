# FANUC Programming Assistant

This project develops FANUC TP programs for The Way Automation LLC (TWA).

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
