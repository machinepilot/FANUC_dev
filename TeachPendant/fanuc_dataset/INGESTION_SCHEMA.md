# Ingestion Schema

Rules for turning raw FANUC material (PDFs, training decks, research findings, integrator notes) into normalized dataset entries. Complements `cowork/schemas/dataset_entry.schema.json` (the machine enforcement) with human-readable guidance.

## File Anatomy

Every normalized entry is a single `.md` file:

```
---
<YAML frontmatter validated by dataset_entry.schema.json>
---

# <Title>

## Summary

## Syntax / Specification          (for reference entries)

## Semantics / Behavior

## Worked Example                    (for example entries)

## Common Pitfalls

## Related Entries

## Citations

## Discrepancies                     (if sources disagree)

## Provenance
```

Max ~400 lines. One concept per file.

## ID Rules

| Prefix | Kind | Example |
|--------|------|---------|
| `FANUC_REF_` | Reference (syntax, API, signals) | `FANUC_REF_J_Motion`, `FANUC_REF_PNS_Handshake` |
| `ONE_` | Conceptual article | `ONE_motion_termination`, `ONE_dcs_overview` |
| `EG_` | Worked example | `EG_J_Motion_Hello`, `EG_Socket_Echo_Server` |

- UPPER_SNAKE_CASE.
- Stable for the life of the entry. If the concept changes, new ID + deprecate.

## Chunking Rules

- One concept per file.
- Multi-section manuals are split: each chapter -> separate entries.
- An example that spans multiple subroutines goes in one file only if the subroutines are logically inseparable; otherwise split and use `related:`.

## Frontmatter Field Guide

### `topic`
Controlled vocabulary. See enum in `dataset_entry.schema.json`. Map fuzzy topics:

- Anything about robot motion instructions -> `motion`.
- Anything about I/O (DI/DO/RI/RO/GI/GO/UI/UO/SI/SO) -> `io`.
- Anything about `UTool`/`UFrame` -> `frames`.
- DCS / SafeOperation content -> `dcs` (and also goes into `normalized/safety/`).
- Profinet / EIP / Modbus / EtherCAT -> `fieldbus`.
- Socket Messaging / PC SDK -> `socket_messaging`.
- Stream Motion -> `stream_motion`.
- iRVision -> `vision`.
- Force sensor -> `force`.
- Mastering / EMT / calibration -> `mastering`.

### `fanuc_controller`
Which controllers the entry applies to. List them. If the content is controller-agnostic, list all current families.

### `system_sw_version`
Array of V9.x strings. If V8 also applies, include it. If a feature is V9-only, say so.

### `language`
- `TP` - content about TP programs only.
- `KAREL` - content about KAREL only.
- `mixed` - content touches both.
- `na` - not applicable (e.g., safety standards articles).

### `source`
| Field | Requirement |
|-------|-------------|
| `type` | Enum per schema. Vendor manuals, standards, etc. |
| `title` | Full source title as the source titles itself. |
| `pages` | `[first, last]`. Required for vendor manuals and books. |
| `tier` | T1..T4 or `generated`. |
| `url` | For web sources. |
| `access_date` | For web sources. |

For entries synthesized from multiple sources, set `source.type: generated` and populate `source_urls[]` with all underlying sources.

### `source_urls[]`
Array of `{url, access_date, tier, note}`. One per underlying source.

### `license`
- `reference-only` - vendor manual or copyrighted source; agent may cite and summarize but not reproduce.
- `public` - public domain or equivalent.
- `cc-by` / `cc-by-sa` - creative commons with the noted conditions.
- `proprietary` - internal use only.

### `revision_date`
YYYY-MM-DD of the last content change.

### `related`
IDs of neighbor entries. Bidirectional: if A lists B, B should list A.

### `difficulty`
- `basic` - no prior FANUC programming needed.
- `intermediate` - standard FANUC familiarity expected.
- `advanced` - deep knowledge required (KAREL internals, DCS tuning, custom fieldbus).

### `status`
- `approved` - QA-passed.
- `draft` - newly ingested; pending QA.
- `deprecated` - superseded; pointer in `supersedes:` on replacement entry.

## Body Structure

### Summary
2-4 sentences. The agent-facing TL;DR. Describe what this is, when to use it, and what it is not.

### Syntax / Specification
For reference entries. Show the EBNF, call signature, or parameter table. No narrative.

### Semantics / Behavior
How the feature behaves. Preconditions. Edge cases. Timing.

### Worked Example
For example entries. Include enough context to understand in isolation. Comment why, not what.

### Common Pitfalls
Bullet list. Concrete, observable mistakes.

### Related Entries
Bullet list of `id` and a short "why relevant".

### Citations
Primary source plus any additional sources. Every non-trivial claim in the body has a citation here or inline.

### Discrepancies
If two sources disagree, document. Do not silently average.

### Provenance
Who/what produced this entry. Input file path if from ingestion. Research run ID if from the deep-research prompt.

## Copyright Guardrails

- No verbatim quote > ~30 words unless strictly necessary for precision (e.g., an exact parameter name).
- Paraphrase vendor text. Link to the original through the citation, not by reproduction.
- Figures, diagrams, tables from vendor manuals: describe and reference by page; do not embed.

## Quality Bar

- Every non-trivial claim has a T1/T2 citation, OR two concurring T3/T4 citations.
- Frontmatter passes `dataset_entry.schema.json`.
- `related:` IDs resolve.
- No TBDs, no placeholder text, no "insert example here".
- Body is self-contained (you can understand it without reading a linked entry).

## Revision and Supersession

- Content change -> bump `revision_date`. Keep the ID.
- Concept change -> new entry with new ID. Old entry: `status: deprecated`; new entry: `supersedes: <old_id>`.

## Promotion from customer integration notes

Never copy an integration note into `normalized/`. The ingestion workflow takes the concept, scrubs customer identifiers, independently validates against T1/T2, and writes a fresh entry.
