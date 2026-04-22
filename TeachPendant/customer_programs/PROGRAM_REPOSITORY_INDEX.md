# Customer Program Repository

Index of customer production FANUC programs.

## Customers

| ID | Name | Active | Industry | Application | Controller | V9.x | Fieldbus | Collaborative |
|----|------|--------|----------|-------------|-----------|------|----------|---------------|
| `ldj_blm` | LDJ (BLM press brake cell) | yes | metal fabrication | press-brake tending | R-30iB Plus | V9.x | Modbus TCP gateway | no |
| `308_gh` | 308-GH | placeholder | - | - | - | - | - | - |
| `313_jd` | 313-JD | placeholder | - | - | - | - | - | - |
| `345_pj` | 345-PJ | placeholder | - | - | - | - | - | - |

Each customer's detail is in `customer_programs/<id>/README.md`.

## Directory shape

```
<customer_id>/
  README.md
  backups/<YYYYMMDD>/          # dated bytes-preserved snapshots
  current/                     # active working copy
  integration_notes/           # customer-scoped notes (canonical: false)
    raw_docs/                  # PDFs, drawings (LFS, .cursorignored)
  lint_baseline.md             # baseline findings from fanuc_safety_lint
  docs/                        # operator guides, installation notes, change logs
  reviews/                     # QA_REVIEW_*.md, SAFETY_REVIEW_*.md
```

## Rules

- Customer programs are CONTEXT, not CANON. Canon lives in `fanuc_dataset/normalized/`.
- Never edit files in `backups/`. Snapshot-then-edit: copy to `backups/<YYYYMMDD>-preedit/`, then edit `current/`.
- Customer identifiers never appear in `fanuc_dataset/`. Promotion is through the ingestion workflow with scrubbing.

## Machine-readable

`_manifest.json`, validated by `_manifest.schema.json`.
