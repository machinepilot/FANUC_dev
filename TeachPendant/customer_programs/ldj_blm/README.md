# LDJ (BLM press brake cell)

Active FANUC integration. Press-brake + robot tending cell using a BLM press brake with an ESA controller, integrated over Modbus TCP to a FANUC R-30iB Plus controller.

## Status

- Integration is in progress. The plan is evolving.
- Migration from `FANUC_dev` is complete; see `MIGRATION_LOG.md` in the workspace root.
- The canonical reference for press-brake Modbus protocol is `fanuc_dataset/normalized/protocols/ONE_press_brake_modbus_integration.md` (populated during migration). Notes in this directory are customer-specific CONTEXT, not canon.

## Controller

- Model: R-30iB Plus (confirm from `backups/<latest>/SYSMAST.SV` controller info dump).
- System software: V9.x (confirm).
- Group config: single-arm, group 1. No external axes configured (confirm).
- Primary robot: BLM-integrated handling arm (confirm model from backup).

## Fieldbus

- Primary: Modbus TCP to the BLM/ESA press-brake controller (via `tools/mqtt_bridge/` or direct KAREL socket, depending on deployment).
- Secondary: Direct digital I/O to operator station (PB_START pushbutton, E-stop tie).
- No EtherNet/IP or Profinet PLC master on this cell.
- Remote partner: BLM press brake with ESA press-brake controller. Reference: `integration_notes/BLM_press_brake.md`.

## DCS

To be confirmed from the `SYSMAST.SV` safety parameter dump:

- Joint Position Check zones: TBD.
- Cartesian Position Check zones: at minimum, operator reach envelope and press-brake pinch zone.
- Cartesian Speed Check: TBD.
- Tool Frame: gripper assembly.

Safety posture is captured in `reviews/SAFETY_REVIEW_ldj_blm_BASELINE.md` after migration. Every subsequent task re-verifies.

## Program Repository

- Latest backup: `backups/<date>/` (populated during migration from `FANUC_dev/customer_programs/LDJ-BLM Robot/`).
- Older backup: `backups/041626/` (from `FANUC_dev/customer_programs/041626BKUP/`).
- Working copy: `current/` (initialized from latest backup).

Known program set (from the migrated backups):

- `PNS0001.LS` through `PNS0005.LS` (and `_R01` revisions) - style-specific mains called by PNS handshake.
- `BG_LOGIC.LS` - Background Logic program handling press-brake signalling.
- `BEND.LS`, `PINCH.LS`, `OPEN_PRESS.LS`, `PRE_BG.LS` - press-brake sequence subroutines.
- `GO_HOME.LS`, `GO_ZERO.LS`, `GO_MAINTENANCE.LS` - navigation utilities.
- `TOOL_LOCK.LS`, `TOOL_UNLOCK.LS`, `CHANGE_TOOLS.LS` - tool-change utilities.
- `ALL_VAC_ON.LS`, `ALL_VAC_OFF.LS` - vacuum gripper I/O.
- `START_PART.LS`, `END_PART.LS` - cycle boundary routines.
- `SEARCH.LS` - part-present search routine.
- `ADJ_BG.LS` - background logic tuner.
- `-BCKED2-.LS`, `-BCKED8-.LS`, `-BCKED9-.LS`, `-BCKEDT-.LS` - controller backup markers (not user programs; leave in place).

## Local Conventions (deviations from canon)

Document here any LDJ-specific conventions the agents should respect inside this directory:

- PNS numbering: style N -> `PNS000N.LS` directly. No indirection through a dispatcher.
- Background Logic: `BG_LOGIC.LS` owns press-brake handshake registers `R[...]` - confirm range from source; do not reuse in foreground motion programs.
- Vacuum cup groups: `ALL_VAC_ON/OFF` assume the DO range captured in `integration_notes/` - confirm before use.
- Naming: customer uses leading/trailing hyphens and uppercase for backup markers (`-BCKED*-`). These are not user programs.

Any additional convention discovered during review goes here.

## Lint Baseline

See `lint_baseline.md`. Updated on the first lint of the migrated backups, then diff-tracked on each subsequent task.

## Open Work

- [ ] Confirm controller model + V9.x version from SYSMAST dump.
- [ ] Capture and document current DCS configuration under `reviews/SAFETY_REVIEW_ldj_blm_BASELINE.md`.
- [ ] Verify press-brake Modbus register map in `integration_notes/BLM_press_brake.md` against BLM manual PDF (`integration_notes/raw_docs/BLM_Manual.pdf`).
- [ ] End-to-end handshake test: PLC/operator starts cycle -> robot executes PNS -> press-brake cycle -> robot retrieves part.
- [ ] Document fault recovery path (what happens when press brake signals fault mid-cycle).
- [ ] Lint baseline review: close all `critical` and `high` findings before next production run.
- [ ] Operator guide for the cell.

## Continuation Workflow

`cowork/workflows/ldj_blm_continuation.md` is the entry point when resuming work. The Orchestrator follows that workflow end-to-end.

## Contact

The Way Automation LLC (internal).
