# Eval Harness

Lightweight harness to measure agent behavior against golden outputs. Keeps agents honest as prompts and dataset drift.

## Philosophy

- Schema-first. Every case validates frontmatter or structural JSON against a schema; this is cheap and catches most drift.
- Golden diff. For replay mode, the case's actual output is diffed against a committed golden file. Any non-trivial change is intentional and lands in its own commit.
- Cheap models. Default replay backend is Ollama. The harness runs locally, without API keys.

## Layout

```
evals/
  runner.py           # CLI
  README.md
  cases/              # *.json test cases
  golden/             # expected outputs, committed
  results/            # runtime output; gitignored
```

## Case file

```json
{
  "case_id": "ldj_blm_pns_gen",
  "agent": "motion-synthesis",
  "mode": "schema-only",
  "input": { ... },
  "expected_schema": "cowork/schemas/handoff.schema.json",
  "golden_path": "evals/golden/ldj_blm_pns_gen.json"
}
```

## Modes

- `schema-only`: validate frontmatter/JSON against the schema. No LLM.
- `replay`: send the case input to a backend (Ollama default), compare against golden.
- `manual`: interactive; useful for authoring new goldens.

## CLI

```bash
python runner.py --list
python runner.py --case smoke_task_state --schema-only
python runner.py --case ldj_blm_pns_gen --schema-only
python runner.py --all --schema-only
python runner.py --case <id> --replay --update-golden  # after reviewing the diff
```

## Exit Codes

- 0: all cases pass.
- 1: one or more fail.
- 2: configuration or I/O error.

## Shipped Cases

- `smoke_task_state` - validates `cowork/templates/task_state.template.json` against `task_state.schema.json`.
- `ldj_blm_pns_gen` - replay case for the flagship customer. Ships in schema-only mode until a sanitized golden is produced from hardware-tested output.

## Adding a Case

1. Drop `evals/cases/<case_id>.json`.
2. If `schema-only`, point `expected_schema` at the schema file.
3. If `replay`, put a candidate output under `evals/golden/<case_id>.json` after reviewing it.
4. Run `python runner.py --case <case_id>` to confirm.
