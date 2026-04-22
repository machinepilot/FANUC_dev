---
name: migrate-from-fanuc-dev
description: Port content from the legacy FANUC_dev workspace into TeachPendant with the correct architectural discipline - schema-validate dataset entries, de-canonize customer integration notes, promote generalizable protocol content, log every move. Use exactly once per source FANUC_dev; re-runs are idempotent no-ops.
---

# Migrate From FANUC_dev

## Purpose

Execute the migration described in `MIGRATION_LOG.md`'s "Planned Migration Summary", with the quality bar of the new workspace rather than a blind copy.

## Prerequisites

- TeachPendant scaffolding exists (all agents, rules, schemas, templates, MCP servers in place).
- `fanuc_knowledge`, `program_repository`, `fanuc_safety_lint` MCP servers are registered and green.
- Source `FANUC_dev/` path is known (typical: `C:\Users\tripp\FANUC_dev`).

## Guiding Principles

1. **Copy, do not mutate source.** FANUC_dev remains unchanged; TeachPendant is the new home.
2. **Parse, don't dump.** Every dataset entry is re-validated. Every integration note gets `canonical: false` frontmatter.
3. **Log everything.** Each move gets a row in `MIGRATION_LOG.md`.
4. **LDJ-BLM is the flagship.** Its programs + notes move first and are exercised by a real lint baseline before anything else is declared done.

## Steps

### 1. Plan

Open `MIGRATION_LOG.md`. Confirm the source and destination columns match your environment. Adjust paths if your FANUC_dev lives elsewhere.

### 2. Dataset Migration (`FANUC_Optimized_Dataset` -> `fanuc_dataset/normalized/`)

For each entry in `FANUC_Optimized_Dataset/optimized_dataset/`:

1. Read source frontmatter + body.
2. Classify:
   - Reference (syntax, API, signals) -> `reference/`.
   - Conceptual (why, when, pattern) -> `articles/`.
   - Worked code -> `examples/`.
   - Fieldbus / integration pattern -> `protocols/`.
   - ISO 10218 / ISO/TS 15066 / DCS / safety-adjacent -> `safety/` (ALWAYS, regardless of original location).
3. Rewrite frontmatter to pass `cowork/schemas/dataset_entry.schema.json`. Translate fields:
   - legacy `kuka_platform` / `fanuc_platform` -> `fanuc_controller`.
   - legacy `kss_version` / version fields -> `system_sw_version`.
   - legacy `language: KRL` -> `language: TP` (or `KAREL`, or `mixed` as appropriate).
   - add `source.tier` (best available).
   - add `license: reference-only`.
   - add `revision_date` (today if unknown).
4. If body >400 lines or mixes concepts, split into atomic units; update `related:`.
5. Write to `fanuc_dataset/normalized/<kind>/<ID>.md`.
6. Append a row to `fanuc_dataset/_manifest.json`.
7. Add a line to `fanuc_dataset/DATASET_INDEX.md`.
8. Log in `MIGRATION_LOG.md`: `YYYY-MM-DD | Parsed | <src> -> <dest> | split=N, safety-routed=Y/N`.

### 3. Customer Programs Migration

#### LDJ-BLM (flagship)

1. Copy bytes verbatim (preserve CRLF via `.gitattributes`):
   - `FANUC_dev/customer_programs/LDJ-BLM Robot/**` -> `TeachPendant/customer_programs/ldj_blm/backups/latest/`.
   - `FANUC_dev/customer_programs/041626BKUP/**` -> `TeachPendant/customer_programs/ldj_blm/backups/041626/`.
2. Initialize `customer_programs/ldj_blm/current/` with a copy of the latest backup (working copy).
3. Author `customer_programs/ldj_blm/README.md` (see template below).
4. Run `fanuc_safety_lint.lint_ls` against every `.LS` in the latest backup.
5. Write findings to `customer_programs/ldj_blm/lint_baseline.md`.
6. Log each file copy.

#### Other customers (308_gh, 313_jd, 345_pj)

For each:

1. Create `customer_programs/<id>/README.md` as a placeholder stating the customer exists and the programs will land on demand.
2. Add an entry to `customer_programs/_manifest.json` with `active: false` unless you know otherwise.
3. Do NOT copy files yet; wait until the customer is the active task.

### 4. LDJ Integration Notes Migration (`FANUC_dev/LDJ/` -> `TeachPendant/customer_programs/ldj_blm/integration_notes/`)

For each markdown file under `FANUC_dev/LDJ/*.md`:

1. Read source.
2. Split content into two buckets:
   - Customer-specific (names, addresses, part numbers, specific BLM model, wiring to this site's PLC): keep as-is.
   - Generalizable (Modbus register map for ESA-brand press brakes, FANUC press-brake robot-interface patterns, generic error code translation): earmark for promotion to `fanuc_dataset/normalized/protocols/`.
3. Write the customer-specific content to `customer_programs/ldj_blm/integration_notes/<original_name>.md` with frontmatter:

```yaml
---
scope: customer_specific
customer: ldj_blm
canonical: false
status: evolving
supersedes: FANUC_dev/LDJ/<original_name>
source:
  type: onsite_notes
  acquired_from: The Way Automation LLC
  acquired_date: <earliest git log date>
---
```

4. Promote generalizable portions through the ingestion workflow (scrub customer identifiers, cite T1 sources for any claim, emit as `fanuc_dataset/normalized/protocols/ONE_*.md`).

For PDFs and binary archives under `FANUC_dev/LDJ/` (BLM manual, electrical diagrams, ESA manual, Kvara/, KVFILE/, modbus manuals/, etc.):

1. Copy to `customer_programs/ldj_blm/integration_notes/raw_docs/<same-structure>/`.
2. Git-LFS tracks them via the `.gitattributes` pattern.
3. They are `.cursorignored` for Cursor index hygiene.

### 5. ROS 2 Driver (`physical_ai/` -> `ros2/src/`)

- Copy directory tree as-is; preserve package structure.
- Author `ros2/README.md` pointing at the `fanuc-ros2-build` skill (carry the skill over from `FANUC_dev/.cursor/skills/fanuc-ros2-build/SKILL.md` with path updates).
- Log.

### 6. MQTT Bridge (`mqtt_bridge/` -> `tools/mqtt_bridge/`)

- Copy directory tree as-is.
- Author `tools/mqtt_bridge/README.md` if not already present.
- Log.

### 7. Cursor Rules and Skills (`.cursor/` in FANUC_dev)

- Do NOT copy verbatim. TeachPendant already has its own `.cursor/rules/` and `.cursor/skills/` authored in the new style.
- Inspect the FANUC_dev rules/skills for any useful content. If a rule or skill has content not already in TeachPendant, lift the content (not the file) into the corresponding TeachPendant file.
- Log each lift.

### 8. Deferred (not migrated on day one)

These are logged as "Deferred" in `MIGRATION_LOG.md`, NOT migrated:

- `roboguide_sdk_api_doc/`
- `roboguide_workcells/`
- `Robowave Exports/`
- `Configs/`, `Assets/`
- `Scripts/`, `Tools/`, `Outputs/`
- `fanuc_robot_backups/`
- `Fanuc_Roboguide_Documentation_Raw/`
- `fanuc_postprocessor_EXP/`
- `almacam_files_archive/`

If any agent needs these later, cite them via the original FANUC_dev path.

### 9. Final Verification

Run the `fanuc-workspace-setup` skill's smoke-eval step:

```bash
cd evals
python runner.py --case smoke_task_state --schema-only
python runner.py --case ldj_blm_pns_gen --schema-only
```

Both must pass schema-only.

Run the `fanuc-tp-lint` skill against `customer_programs/ldj_blm/backups/latest/*.LS` and confirm the output matches (or is a subset of) `lint_baseline.md`.

### 10. README Update

Update `customer_programs/ldj_blm/README.md` with:

- Controller model (confirmed from backup system data).
- V9.x version.
- Fieldbus in use.
- DCS zones summary (if documented in the backup).
- Lint baseline summary (count by severity).
- Open work list for the continuation workflow.

## Template: `customer_programs/ldj_blm/README.md`

```markdown
# LDJ-BLM

Active FANUC integration. Press-brake + robot cell.

## Controller

- Model: <fill in from backup>
- System software: <fill in>
- Group config: <fill in>

## Fieldbus

- Protocol: <fill in - likely Modbus TCP gateway + direct I/O>
- Remote partner: BLM press brake + ESA controller

## DCS

- Zones: <fill in from DCS config dump>
- Speed limits: <fill in>

## Program Repository

- Latest backup: `backups/<date>/`
- Working copy: `current/`
- Integration notes: `integration_notes/`

## Lint Baseline

See `lint_baseline.md`. Summary: critical=<>, high=<>, medium=<>, low=<>, info=<>.

## Open Work

- [ ] ...
- [ ] ...

## Continuation Workflow

`cowork/workflows/ldj_blm_continuation.md`
```

## Idempotency

A second run of this skill should be a no-op: every file already in the destination is skipped. The only side effect of a re-run is a fresh lint pass and an updated `lint_baseline.md`.

## Completion

When done, append a "MIGRATION COMPLETE" entry at the top of the `MIGRATION_LOG.md` entries table with the date, the operator, and the count of dataset entries migrated + customer files copied.
