# 345-PJ

Placeholder customer. No programs migrated yet. Populated on demand when this customer becomes the active task.

## Steps to onboard

Follow `cowork/workflows/customer_onboarding.md`. The Orchestrator:

1. Updates `customer_programs/_manifest.json` (`active: true`, industry, systems).
2. Creates `backups/<date>/`, `current/`, `integration_notes/`, `integration_notes/raw_docs/`, `lint_baseline.md`.
3. Runs Integration + Safety + QA to produce the initial state.
4. Finalizes this README with controller, fieldbus, DCS, open work.
