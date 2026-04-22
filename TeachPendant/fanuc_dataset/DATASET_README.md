# FANUC Dataset

This is the canonical knowledge source for TeachPendant. Everything under `normalized/` is what agents cite.

## Structure

```
fanuc_dataset/
  DATASET_README.md        # this file
  DATASET_INDEX.md         # topic -> file lookup
  INGESTION_SCHEMA.md      # chunking + frontmatter rules
  _manifest.json           # machine-readable catalog of entries
  _manifest.schema.json    # validates _manifest.json
  normalized/
    articles/              # ONE_<topic>.md - conceptual
    reference/             # FANUC_REF_<topic>.md - syntax, API, signals
    examples/              # EG_<scenario>.md - worked TP/KAREL
    protocols/             # fieldbus / integration patterns (Profinet, EIP, Modbus TCP, PNS, Socket Messaging, Stream Motion)
    safety/                # ISO 10218 / ISO/TS 15066 / DCS
  raw_sources/             # raw PDFs, LFS-tracked, .cursorignored
```

## Rules

1. **Canon, not folklore.** Every entry carries a `source:` citation in its frontmatter. No citation, no entry.
2. **Atomic.** One concept per file. Max ~400 lines. If you exceed that, split and use `related:`.
3. **Safety is a directory, not a tag.** Anything safety-relevant goes under `normalized/safety/` regardless of whether it also touches motion, fieldbus, or KAREL.
4. **License-aware.** Vendor manual content is `license: reference-only`; cite and summarize, never reproduce long passages verbatim.
5. **Cross-referenced.** `related:` entries point both ways. When you add entry `B` that references `A`, update `A.related` to include `B`.
6. **Versioned.** `revision_date` every entry. Superseded entries set `status: deprecated` and `supersedes:` on the new one.

## Retrieval

Agents retrieve entries through the `fanuc_knowledge` MCP server:

- `fanuc_knowledge.search(query, ...)` - hybrid keyword + semantic (Ollama embeddings if configured).
- `fanuc_knowledge.get(id)` - direct by ID.
- `fanuc_knowledge.list_by_tag(tag)` - by topic, controller, language.
- `fanuc_knowledge.related(id)` - graph neighbors.

Direct filesystem reads are acceptable when MCP is unavailable.

## Raw sources

- PDFs under `raw_sources/` are LFS-tracked and `.cursorignored`.
- Never commit `raw_sources/` to a public remote unless you own the copyright or have an explicit license.
- The ingestion pipeline extracts text, chunks, and emits normalized entries. It never copies PDFs into `normalized/`.

## Customer content

- Never promote a customer program or integration note into `normalized/` without scrubbing customer identifiers and re-validating against T1/T2 sources.
- Promotion goes through the `knowledge_ingestion` workflow, not a direct file move.

## Revision policy

- New entries start `status: draft` until QA validates. Then `approved`.
- Deprecation: mark `status: deprecated`, add `supersedes:` on the replacement, leave the old file in place for archeology.
- Never rename an entry ID. If the concept changes, create a new ID and deprecate the old one.
