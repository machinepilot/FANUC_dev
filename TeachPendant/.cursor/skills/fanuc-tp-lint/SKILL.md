---
name: fanuc-tp-lint
description: Run deterministic static analysis against FANUC TP/LS and KAREL source via the fanuc_safety_lint MCP server. Use before any QA review, after Motion Synthesis emits files, and against customer backups to produce baselines.
---

# FANUC TP Lint

## Purpose

Deterministic safety and convention checks on `.LS` and `.KL` files. Not an LLM. A rule engine.

## When to Use

- Immediately after Motion Synthesis writes files (self-check before handoff).
- In the QA stage of every workflow.
- Against customer backups to produce `lint_baseline.md`.
- Before any release commit to verify no new violations landed.

## Steps

### 1. Check MCP Server Status

Call `fanuc_safety_lint.list_rules`. If the call fails, the MCP server isn't registered; see `register-mcp-servers` skill.

### 2. Lint a File

```
fanuc_safety_lint.lint_ls(path="customer_programs/ldj_blm/current/PNS0001.LS")
```

Returns:

```json
{
  "path": "customer_programs/ldj_blm/current/PNS0001.LS",
  "findings": [
    {
      "rule_id": "FANUC-WAIT-001",
      "severity": "high",
      "line": 42,
      "column": 1,
      "message": "WAIT DI[...]=ON without TIMEOUT branch",
      "snippet": "WAIT DI[123:PB_START]=ON ;",
      "normative_refs": ["FANUC_REF_WAIT_Timeout", "fanuc-tp-conventions.mdc#wait-with-timeout"]
    },
    ...
  ],
  "summary": { "critical": 0, "high": 2, "medium": 3, "low": 5, "info": 1 }
}
```

### 3. Triage

- `critical`: must be fixed before handoff; workflow blocks.
- `high`: must be fixed before handoff.
- `medium`: fix unless the architect has documented a reason.
- `low` / `info`: fix opportunistically; acceptable to hand off with these open if tracked.

### 4. Explain

If a rule ID isn't immediately obvious, call `fanuc_safety_lint.explain_rule(rule_id)` for the rationale and normative refs.

### 5. Baseline Diff

For existing programs, compare current lint output against `customer_programs/<c>/lint_baseline.md`:

- Any new finding is a regression and must be addressed.
- Any resolved finding is progress - log it in the QA review.

### 6. Record in QA Review

The QA agent's `QA_REVIEW_<NAME>.md` includes the lint summary table. Update after each lint pass.

## Rule Catalog Snapshot

| ID | Severity | Rule |
|----|----------|------|
| `FANUC-UTL-001` | high | UTool/UFrame not set before first motion |
| `FANUC-UOP-001` | high | PROD_START referenced without ENBL + UI[8] handshake |
| `FANUC-WAIT-001` | high | WAIT DI[]=ON without TIMEOUT branch |
| `FANUC-SKIP-001` | high | SKIP CONDITION declared without LBL receiver |
| `FANUC-PR-001` | medium | Motion uses P[n] where PR[n] is customer convention |
| `FANUC-OV-001` | critical | Programmatic override modification ($PRGOVERRIDE / $OVERRIDE) |
| `FANUC-COND-001` | high | MONITOR opened without MONITOR END |
| `FANUC-DCS-001` | critical | Motion outside DCS Joint/Cartesian Position Check envelope |
| `FANUC-BG-001` | high | Background Logic modifies motion-owned registers |
| `FANUC-ALIAS-001` | medium | Raw DI[]/DO[] in body without aliased signal name |

Full catalog: `fanuc_safety_lint.list_rules` or `mcp_servers/fanuc_safety_lint/README.md`.

## Outputs

- Structured JSON from the MCP call.
- Summary table in `QA_REVIEW_<NAME>.md`.
- Baseline file `customer_programs/<c>/lint_baseline.md` on first lint of a customer's programs.
