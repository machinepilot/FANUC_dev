# fanuc_safety_lint

MCP server for deterministic static analysis of FANUC TP/LS and KAREL source. Not an LLM. A rule engine.

## Install

```bash
uv pip install -e .
```

## Run

```bash
python -m fanuc_safety_lint.server
```

## Tools

- `lint_ls(path)` - run TP/LS rule catalog. Returns `{path, findings[], summary}`.
- `lint_karel(path)` - run KAREL rule catalog.
- `list_rules()` - enumerate all rules with `{id, severity, description, applies_to}`.
- `explain_rule(rule_id)` - rationale + normative refs for a given rule.

## Seed Rule Catalog

| ID | Applies | Severity | Rule |
|----|---------|----------|------|
| `FANUC-UTL-001` | TP | high | UTool/UFrame not set before first motion |
| `FANUC-UOP-001` | TP | high | PROD_START referenced without ENBL + UI[8] handshake |
| `FANUC-WAIT-001` | TP | high | WAIT DI[]=ON without TIMEOUT branch |
| `FANUC-SKIP-001` | TP | high | SKIP CONDITION declared without LBL receiver |
| `FANUC-PR-001` | TP | medium | Motion uses P[n] where PR[n] is customer convention |
| `FANUC-OV-001` | TP | critical | Programmatic override modification ($PRGOVERRIDE / $OVERRIDE) |
| `FANUC-COND-001` | TP | high | MONITOR opened without MONITOR END |
| `FANUC-DCS-001` | TP | critical | Motion outside DCS Joint/Cartesian Position Check envelope (heuristic) |
| `FANUC-BG-001` | TP | high | Background Logic modifies motion-owned registers |
| `FANUC-ALIAS-001` | TP | medium | Raw DI[]/DO[] in body without aliased signal name |
| `FANUC-KAREL-STK-001` | KAREL | medium | Missing explicit %STACKSIZE |
| `FANUC-KAREL-SOCK-001` | KAREL | high | Socket opened without matched close/disconnect |

## Extending

Add new rules to `fanuc_safety_lint/rules.py`. Each rule is a `RuleDef` with a matcher function that takes the parsed source and returns a list of findings.
