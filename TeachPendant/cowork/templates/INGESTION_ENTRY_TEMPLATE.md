---
# Validates against cowork/schemas/dataset_entry.schema.json
id: FANUC_<KIND>_<TOPIC>             # e.g. FANUC_REF_J_Motion, ONE_motion_termination, EG_PNS_Hello
title: <human title>
topic: motion | io | frames | interrupts | pmc | dcs | fieldbus | vision | karel | anti_pattern | safety | offline
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.30]
language: TP | KAREL | mixed | na
source:
  type: vendor_manual | application_note | training | error_code_ref | white_paper | third_party_integrator | community | standards_body | github_repo | generated
  title: "<source title>"
  pages: [<first>, <last>]             # when applicable
  tier: T1 | T2 | T3 | T4 | generated
  url: "<url if web source>"
  access_date: "<YYYY-MM-DD>"
source_urls:                           # for research-generated entries drawing from multiple sources
  - { url: "...", access_date: "YYYY-MM-DD", tier: "T1", note: "..." }
license: reference-only | public | cc-by | cc-by-sa | proprietary
revision_date: "<YYYY-MM-DD>"
related: [<other_id>, <other_id>]
difficulty: basic | intermediate | advanced
status: approved | draft | deprecated
supersedes: <prior_id or null>
---

# <Title>

## Summary

Two to four sentences. The agent-facing TL;DR.

## Syntax / Specification

For `reference/` entries. Provide the syntactic/semantic contract:

```
<EBNF or example signature>
```

## Semantics / Behavior

How the feature actually behaves at runtime. When does it fire, what are the preconditions, what are the edge cases?

## Worked Example

For `examples/` entries. A runnable snippet with enough context to understand in isolation:

```
 1:  UTOOL_NUM=1 ;
 2:  UFRAME_NUM=1 ;
 3:J P[1] 100% FINE    ;
 ...
```

## Common Pitfalls

- <Concrete mistake 1>
- <Concrete mistake 2>

## Related Entries

- `<id>` - <why relevant>

## Citations

- Primary: `<source.title>`, pages <first>-<last> (tier `<source.tier>`).
- Additional sources:
  - `<url>` (accessed `<date>`, tier `<tier>`): <what it adds>

## Discrepancies

If sources disagree, document (do not silently resolve):

- Source A claims X; Source B claims Y. Difference is likely explained by controller generation / firmware version.

## Provenance

- Emitted by: `<pipeline / agent / human>` on `<date>`.
- Input: `<path to raw source if ingestion>` or `<research prompt run>`.
