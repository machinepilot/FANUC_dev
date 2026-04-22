---
name: ingest-pdf-to-normalized
description: Convert raw FANUC PDFs under fanuc_dataset/raw_sources/ into normalized, schema-valid dataset entries under fanuc_dataset/normalized/. Use when new manuals, application notes, training material, or error-code references arrive, or when research produces new source documents.
---

# Ingest PDFs to Normalized

## Purpose

Turn a pile of FANUC PDFs into agent-ready knowledge entries without hallucinations or copyright hazards.

## Prerequisites

- `fanuc_dataset/raw_sources/` contains the PDFs.
- PDF text layer is present (run OCR first if the PDF is image-only).
- `cowork/schemas/dataset_entry.schema.json` is the authority on frontmatter.
- `fanuc_dataset/INGESTION_SCHEMA.md` explains chunking and authoring rules.

## Steps

### 1. Plan

List every PDF under `raw_sources/`. For each, note:

- Kind: `vendor_manual`, `application_note`, `training`, `error_code_ref`, `white_paper`, `third_party_integrator`.
- Scope (platform / option it applies to): R-30iB, R-30iB Plus, V9.x, iRVision, DCS, etc.
- Expected number of atomic entries (a 400-page manual typically yields dozens).

Record the plan under `fanuc_dataset/ingestion_scratch/plan_<date>.md`.

### 2. Extract

For each PDF:

- Extract text per page.
- Retain page numbers - citations need them.
- Preserve figures/tables as references (image path + page), do not embed binary.

### 3. Chunk

Split extracted text into atomic knowledge units per `INGESTION_SCHEMA.md`:

- One concept per entry.
- <=400 lines per file.
- Reference content under `reference/`, conceptual under `articles/`, worked code under `examples/`, fieldbus/integration patterns under `protocols/`, safety under `safety/` (unconditionally).

### 4. Author Frontmatter

Every entry gets a YAML frontmatter block with at minimum:

```yaml
---
id: FANUC_REF_J_Motion
title: TP Joint Motion Instruction
topic: motion
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.30, V9.40]
language: TP  # or KAREL or mixed
source:
  type: vendor_manual
  title: "FANUC R-30iB V9 Operator's Manual"
  pages: [180, 195]
  tier: T1
license: reference-only
revision_date: <YYYY-MM-DD>
related: []
difficulty: intermediate  # basic | intermediate | advanced
---
```

Validate against `cowork/schemas/dataset_entry.schema.json`.

### 5. Body Structure

Follow `cowork/templates/INGESTION_ENTRY_TEMPLATE.md`:

- Summary (2-4 sentences; the agent-facing TL;DR).
- Syntax / Specification (reference entries).
- Semantics / Behavior.
- Common Pitfalls.
- Worked Example (for `examples/`).
- Related Entries.
- Citations.
- Provenance.

### 6. Copyright Discipline

- Never reproduce more than a short quote from a vendor manual.
- Cite page range in frontmatter and in Citations section.
- Paraphrase in your own words.
- If uncertain, summarize and link rather than extract.

### 7. Manifest and Index

- Append a row to `fanuc_dataset/_manifest.json`.
- Add a line under the appropriate topic in `fanuc_dataset/DATASET_INDEX.md`.

### 8. Validate

Kick the QA agent (`qa`) with `schema_in: dataset_entry.schema.json`. QA will:

- Validate frontmatter.
- Check `related:` IDs resolve.
- Spot-check Citations.
- Reject anything lacking a T1/T2 citation for a non-trivial claim.

### 9. Reindex

Call `fanuc_knowledge.reindex` so the MCP server picks up new entries.

## Outputs

- New files under `fanuc_dataset/normalized/<kind>/`.
- Updated `_manifest.json` and `DATASET_INDEX.md`.
- QA review in `task_state.qa`.

## Common Failures

| Failure | Cause | Fix |
|---------|-------|-----|
| QA rejects for missing citation | Body claim without `source:` | Add citation or mark `speculative: true` and kick to research. |
| Entry >400 lines | Two concepts merged | Split into two entries; update `related:`. |
| `related:` points at nonexistent ID | Not yet ingested | Ingest the dependency first or mark `related: []` and circle back. |
| Frontmatter invalid | Typo or missing enum | Check `dataset_entry.schema.json`. |
