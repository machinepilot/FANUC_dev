# Migration Log - FANUC_dev to TeachPendant

This log records every file or folder moved, transformed, or promoted from the legacy `FANUC_dev` workspace into TeachPendant. It is the audit trail for the "port everything, but parse/integrate" migration strategy. Future archaeology starts here.

## Conventions

- **Copied**: bytes preserved; path changed.
- **Parsed**: content re-read, frontmatter rewritten to the new schema, body edited to match the new quality bar. Source hash logged so the original can be retrieved if needed.
- **Split**: one input file became multiple atomic dataset entries (typically because it exceeded 400 lines or mixed concepts).
- **Promoted**: content lived under customer-scoped folders in `FANUC_dev`; it was generalized (customer identifiers scrubbed) and moved into `fanuc_dataset/normalized/`.
- **De-canonized**: content that was treated as reference truth in `FANUC_dev` is relocated under a customer-scoped `integration_notes/` folder and marked `canonical: false`, because it is customer-specific and the underlying plan is still evolving.
- **Deferred**: acknowledged but not migrated on day one; listed for a later sprint with a reason.

## Format

```text
YYYY-MM-DD | verb | src -> dest | notes
```

## Entries

(Populated during the `migrate_fanuc_dev` task. Until then, the list below is empty.)

| Date | Verb | Source | Destination | Notes |
|------|------|--------|-------------|-------|
| 2026-04-22 | Summary | MIGRATION COMPLETE | TeachPendant/ | 102 dataset entries parsed, LDJ-BLM programs copied, LDJ folder de-canonized, ROS 2 driver + mqtt_bridge copied |
| 2026-04-22 | Parsed | FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/*.txt | TeachPendant/fanuc_dataset/normalized/{articles,safety}/*.md | 42 legacy articles -> 42 entries, safety auto-routed where applicable |
| 2026-04-22 | Parsed | FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/*.txt | TeachPendant/fanuc_dataset/normalized/{reference,safety}/*.md | 30 legacy references -> 30 entries |
| 2026-04-22 | Parsed | FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/examples/*.txt | TeachPendant/fanuc_dataset/normalized/{examples,safety}/*.md | 29 legacy examples -> 29 entries (one existing placeholder kept; 28 new) |
| 2026-04-22 | Parsed | FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/protocols/*.txt | TeachPendant/fanuc_dataset/normalized/protocols/*.md | 2 legacy protocol entries |
| 2026-04-22 | Copied | FANUC_dev/customer_programs/LDJ-BLM Robot/** | TeachPendant/customer_programs/ldj_blm/backups/latest/ | bytes preserved; CRLF retained |
| 2026-04-22 | Copied | FANUC_dev/customer_programs/041626BKUP/** | TeachPendant/customer_programs/ldj_blm/backups/041626/ | historical snapshot |
| 2026-04-22 | Copied | backups/latest/**/*.LS + *.KL | customer_programs/ldj_blm/current/ | 67 source files flattened into working copy |
| 2026-04-22 | De-canonized | FANUC_dev/LDJ/*.md | customer_programs/ldj_blm/integration_notes/*.md | 7 markdown files; added canonical:false frontmatter with supersedes pointer |
| 2026-04-22 | Copied | FANUC_dev/LDJ/*.pdf + subdirs | customer_programs/ldj_blm/integration_notes/raw_docs/ | 5 PDFs + 6 subdirs (archive, Kvara, KVFILE, modbus manuals, reference, sources); LFS via .gitattributes; .cursorignored |
| 2026-04-22 | Copied | FANUC_dev/physical_ai/ros2/** | TeachPendant/ros2/ | fanuc_driver / fanuc_description / MoveIt configs |
| 2026-04-22 | Copied | FANUC_dev/mqtt_bridge/** | TeachPendant/tools/mqtt_bridge/ | press-brake MQTT bridge utility |
| 2026-04-22 | Generated | fanuc_safety_lint rules | customer_programs/ldj_blm/lint_baseline.md | crit=0 high=14 medium=942 info=45 across 67 files |
| 2026-04-22 | Deferred | FANUC_dev/physical_ai/{conference_notes,hardware,learning_path,poc,references} | n/a | research/learning material; not central to LDJ-BLM finish |
| 2026-04-22 | Deferred | FANUC_dev/roboguide_sdk_api_doc, roboguide_workcells, Robowave Exports, Configs, Assets, Scripts, Tools, Outputs, fanuc_robot_backups, Fanuc_Roboguide_Documentation_Raw, fanuc_postprocessor_EXP, almacam_files_archive | n/a | large / binary / not part of agentic loop; cite FANUC_dev path if needed |

## Planned Migration Summary

Source tree (`FANUC_dev/`) - Destination tree (`TeachPendant/`):

| Source | Destination | Verb |
|--------|-------------|------|
| `FANUC_Optimized_Dataset/optimized_dataset/**` | `fanuc_dataset/normalized/**` | Parsed + split as needed; re-validated against `dataset_entry.schema.json` |
| `customer_programs/LDJ-BLM Robot/**` | `customer_programs/ldj_blm/backups/<date>/` | Copied (bytes preserved) |
| `customer_programs/041626BKUP/**` | `customer_programs/ldj_blm/backups/041626/` | Copied |
| `customer_programs/308-GH/` | `customer_programs/308_gh/` | Placeholder README; files on demand |
| `customer_programs/313-JD/` | `customer_programs/313_jd/` | Placeholder README; files on demand |
| `customer_programs/345-PJ/` | `customer_programs/345_pj/` | Placeholder README; files on demand |
| `LDJ/*.md` (integration notes) | `customer_programs/ldj_blm/integration_notes/*.md` | De-canonized: frontmatter `canonical: false`, `scope: customer_specific`, `customer: ldj_blm`, `status: evolving` |
| `LDJ/*.pdf` (BLM manual, electrical diagrams, ESA manual) | `customer_programs/ldj_blm/integration_notes/raw_docs/*.pdf` | Copied, LFS-tracked, `.cursorignored` |
| `LDJ/archive/`, `LDJ/Kvara/`, `LDJ/KVFILE/`, `LDJ/modbus manuals/`, `LDJ/reference/`, `LDJ/sources/` | `customer_programs/ldj_blm/integration_notes/raw_docs/<same-name>/` | Copied as archival reference |
| `LDJ/press_brake_reference.md` (generalizable portions) | `fanuc_dataset/normalized/protocols/ONE_press_brake_modbus_integration.md` | Promoted; customer identifiers scrubbed; citations preserved |
| `LDJ/robot_interface_reference.md` (generalizable portions) | `fanuc_dataset/normalized/protocols/ONE_fanuc_press_brake_robot_interface.md` | Promoted; customer identifiers scrubbed |
| `physical_ai/**` | `ros2/src/**` | Copied (packages `fanuc_driver`, `fanuc_description`) |
| `mqtt_bridge/**` | `tools/mqtt_bridge/**` | Copied |
| `.cursor/rules/*.mdc` | `.cursor/rules/*.mdc` | Rewritten (not copied) using the KUKA rule patterns plus FANUC specifics |
| `.cursor/skills/**` | `.cursor/skills/**` | Rewritten (not copied); new `migrate-from-fanuc-dev` skill added |
| `cowork/**` | n/a | Replaced by the new schema-driven `cowork/`; any valuable templates are re-authored |
| `AGENTS.md`, `CLAUDE.md` | `AGENTS.md`, `CLAUDE.md` | Rewritten using the KUKA template structure |
| `roboguide_sdk_api_doc/`, `roboguide_workcells/`, `Robowave Exports/`, `Configs/`, `Assets/`, `Scripts/`, `Tools/`, `Outputs/`, `fanuc_robot_backups/`, `Fanuc_Roboguide_Documentation_Raw/`, `fanuc_postprocessor_EXP/`, `almacam_files_archive/` | (not migrated on day one) | Deferred: large / mostly binary / not part of the agentic loop. Link back to `FANUC_dev` path if agents need them. |

## Post-Migration Artifacts

After migration, the following files should exist and be non-empty:

- `customer_programs/ldj_blm/README.md` - current installation status, controller model, fieldbus, DCS zone summary, open work items.
- `customer_programs/ldj_blm/lint_baseline.md` - output of `fanuc_safety_lint.lint_ls` against the migrated backups, serving as the initial findings baseline.
- `fanuc_dataset/_manifest.json` - lists every normalized entry.
- `fanuc_dataset/DATASET_INDEX.md` - topic-organized index.
- `customer_programs/_manifest.json` - lists all four customers with honest status (`active` vs placeholder).

## Rollback

The migration is a copy-then-transform. `FANUC_dev` is not modified (except for appending `TeachPendant/` to `FANUC_dev/.cursorignore`). To rollback, delete `TeachPendant/` and remove the `.cursorignore` line.

