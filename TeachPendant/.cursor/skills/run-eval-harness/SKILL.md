---
name: run-eval-harness
description: Execute the TeachPendant eval harness under evals/ to measure agent behavior against golden outputs. Use before committing changes to agent prompts, workflows, or dataset, and as the final step of any migration.
---

# Run Eval Harness

## Purpose

Keep agents honest as prompts, schemas, and knowledge drift. The harness is lightweight: replay cases, diff against goldens, report pass/fail.

## When to Use

- Before landing any change to `.cursor/agents/*.md`.
- Before landing any change to `cowork/schemas/*.schema.json`.
- After ingesting new dataset entries that an agent relies on.
- As the last step of the migration skill.

## Steps

### 1. List cases

```bash
cd evals
python runner.py --list
```

Ships with:

- `smoke_task_state` - validates `task_state.template.json` against its schema.
- `ldj_blm_pns_gen` - replay case: Architect + Motion generate a PNS program for LDJ-BLM; diffed against a sanitized golden derived from existing backups.

### 2. Modes

- `--schema-only`: only validate frontmatter/JSON against schemas; no LLM calls. Fast.
- `--replay`: send the prompt to the configured backend (Ollama by default); compare against golden.
- `--manual`: open the case interactively; useful for authoring new goldens.

### 3. Run

```bash
python runner.py --case smoke_task_state --schema-only
python runner.py --case ldj_blm_pns_gen --schema-only
python runner.py --all --schema-only
```

### 4. Interpret

Each case emits a verdict:

- `PASS` - schema valid and (for replay) diff is empty.
- `FAIL_SCHEMA` - frontmatter invalid.
- `FAIL_DIFF` - output differs from golden; view `evals/results/<case>.diff`.
- `NO_GOLDEN` - replay mode, no golden yet. Run with `--update-golden` after reviewing the output.

### 5. Update Golden

When a prompt change is deliberate:

```bash
python runner.py --case <id> --update-golden
```

Review the diff in `git diff evals/golden/` before committing. Every golden update is a breaking change and should be in its own commit with a justification.

### 6. Backends

- `ollama` (default for replay): `OLLAMA_MODEL=llama3.1:8b-instruct` or similar. Requires Ollama running.
- `anthropic` or `openai`: set `EVAL_BACKEND=<name>` and the appropriate API key. Stubs in `runner.py`.

## Cases

Under `evals/cases/*.json`:

```json
{
  "case_id": "ldj_blm_pns_gen",
  "agent": "motion-synthesis",
  "input": {
    "program_spec_path": "evals/fixtures/ldj_blm/PROGRAM_SPEC_PNS0001.md"
  },
  "expected_schema": "cowork/schemas/handoff.schema.json",
  "golden_path": "evals/golden/ldj_blm_pns_gen.json",
  "mode": "replay"
}
```

## Outputs

- `evals/results/<case>.json` - structured result.
- `evals/results/<case>.diff` - unified diff when `FAIL_DIFF`.
- Exit code: 0 on all PASS; non-zero otherwise.

## Anti-patterns

- Running `--update-golden` blindly in bulk. Always review diffs first.
- Adding a new case without a golden. Cases that have never passed are noise, not signal.
- Editing goldens by hand instead of regenerating.
