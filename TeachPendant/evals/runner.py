"""TeachPendant eval harness CLI.

Usage:
    python runner.py --list
    python runner.py --case <id> [--schema-only|--replay|--manual] [--update-golden]
    python runner.py --all [--schema-only]

Exit codes:
    0 = all PASS
    1 = one or more FAIL (or NO_GOLDEN)
    2 = configuration / I/O error
"""
from __future__ import annotations

import argparse
import difflib
import json
import os
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any


WORKSPACE = Path(__file__).resolve().parent.parent
CASES_DIR = Path(__file__).resolve().parent / "cases"
GOLDEN_DIR = Path(__file__).resolve().parent / "golden"
RESULTS_DIR = Path(__file__).resolve().parent / "results"


# ---------- Optional dependency: jsonschema ----------
try:
    import jsonschema  # type: ignore
    HAVE_JSONSCHEMA = True
except ImportError:
    jsonschema = None  # type: ignore
    HAVE_JSONSCHEMA = False


def _validate_schema(doc: Any, schema_path: Path) -> dict[str, Any]:
    if not HAVE_JSONSCHEMA:
        return {"skipped": True, "reason": "jsonschema package not installed; schema check skipped"}
    with schema_path.open("r", encoding="utf-8") as f:
        schema = json.load(f)
    validator = jsonschema.Draft202012Validator(schema)
    errors = [{"message": e.message, "path": list(e.absolute_path)} for e in validator.iter_errors(doc)]
    return {"valid": not errors, "errors": errors}


# ---------- Case model ----------
@dataclass
class Case:
    case_id: str
    agent: str
    mode: str
    input: Any
    expected_schema: str | None
    golden_path: str | None


def _load_case(path: Path) -> Case:
    data = json.loads(path.read_text(encoding="utf-8"))
    return Case(
        case_id=data["case_id"],
        agent=data["agent"],
        mode=data.get("mode", "schema-only"),
        input=data.get("input"),
        expected_schema=data.get("expected_schema"),
        golden_path=data.get("golden_path"),
    )


def _load_cases() -> list[Case]:
    return [_load_case(p) for p in sorted(CASES_DIR.glob("*.json"))]


# ---------- Backends ----------
def _backend_ollama(case: Case) -> Any:
    # Stub: integrate with Ollama HTTP API (/api/chat or /api/generate).
    # In schema-only the replay path is not reached.
    model = os.environ.get("OLLAMA_MODEL", "llama3.1:8b-instruct")
    return {"_stub": f"ollama replay for {case.case_id} with model {model} not implemented in skeleton"}


def _backend_manual(case: Case) -> Any:
    print(f"[manual] case={case.case_id} agent={case.agent}")
    print("[manual] Paste output JSON (terminate with EOF / Ctrl-D):")
    try:
        data = sys.stdin.read()
    except KeyboardInterrupt:
        return None
    try:
        return json.loads(data)
    except json.JSONDecodeError as exc:
        return {"_error": f"invalid JSON: {exc}"}


# ---------- Comparison ----------
def _diff_json(actual: Any, golden: Any) -> list[str]:
    a = json.dumps(actual, indent=2, sort_keys=True).splitlines()
    b = json.dumps(golden, indent=2, sort_keys=True).splitlines()
    return list(difflib.unified_diff(b, a, fromfile="golden", tofile="actual", n=2, lineterm=""))


# ---------- Runner ----------
def _read_template_for_schema_only(case: Case) -> Any:
    # For schema-only smoke, default to reading the template file(s)
    if case.case_id == "smoke_task_state":
        return json.loads((WORKSPACE / "cowork/templates/task_state.template.json").read_text(encoding="utf-8"))
    # For other schema-only cases, the case's `input` is itself the doc
    return case.input


def run_case(case: Case, *, mode: str | None = None, update_golden: bool = False) -> dict[str, Any]:
    effective_mode = mode or case.mode
    result: dict[str, Any] = {"case_id": case.case_id, "agent": case.agent, "mode": effective_mode}

    if effective_mode == "schema-only":
        if not case.expected_schema:
            return {**result, "verdict": "FAIL_CONFIG", "reason": "schema-only case missing expected_schema"}
        doc = _read_template_for_schema_only(case)
        schema_path = WORKSPACE / case.expected_schema
        v = _validate_schema(doc, schema_path)
        if v.get("skipped"):
            return {**result, "verdict": "PASS", "note": v["reason"]}
        if v.get("valid"):
            return {**result, "verdict": "PASS"}
        return {**result, "verdict": "FAIL_SCHEMA", "errors": v["errors"]}

    if effective_mode == "replay":
        actual = _backend_ollama(case)
        # If a golden exists, diff; else NO_GOLDEN
        if case.golden_path:
            gpath = WORKSPACE / case.golden_path
            if gpath.exists():
                golden = json.loads(gpath.read_text(encoding="utf-8"))
                diff = _diff_json(actual, golden)
                if not diff:
                    return {**result, "verdict": "PASS"}
                if update_golden:
                    gpath.write_text(json.dumps(actual, indent=2, sort_keys=True) + "\n", encoding="utf-8")
                    return {**result, "verdict": "UPDATED_GOLDEN"}
                return {**result, "verdict": "FAIL_DIFF", "diff": diff}
        # No golden
        if update_golden and case.golden_path:
            gpath = WORKSPACE / case.golden_path
            gpath.parent.mkdir(parents=True, exist_ok=True)
            gpath.write_text(json.dumps(actual, indent=2, sort_keys=True) + "\n", encoding="utf-8")
            return {**result, "verdict": "UPDATED_GOLDEN"}
        return {**result, "verdict": "NO_GOLDEN", "hint": "run with --update-golden after reviewing output"}

    if effective_mode == "manual":
        actual = _backend_manual(case)
        return {**result, "verdict": "MANUAL", "actual": actual}

    return {**result, "verdict": "FAIL_CONFIG", "reason": f"unknown mode: {effective_mode}"}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--list", action="store_true", help="List cases")
    parser.add_argument("--case", help="Run one case by id")
    parser.add_argument("--all", action="store_true", help="Run all cases")
    parser.add_argument("--mode", choices=["schema-only", "replay", "manual"], help="Override case mode")
    parser.add_argument("--schema-only", action="store_true", help="Shortcut for --mode schema-only")
    parser.add_argument("--replay", action="store_true", help="Shortcut for --mode replay")
    parser.add_argument("--manual", action="store_true", help="Shortcut for --mode manual")
    parser.add_argument("--update-golden", action="store_true", help="Save actual output as new golden")
    args = parser.parse_args()

    mode = args.mode
    if args.schema_only:
        mode = "schema-only"
    elif args.replay:
        mode = "replay"
    elif args.manual:
        mode = "manual"

    cases = _load_cases()

    if args.list:
        for c in cases:
            print(f"{c.case_id}  agent={c.agent}  mode={c.mode}")
        return 0

    if not args.case and not args.all:
        parser.print_help()
        return 2

    selection = cases if args.all else [c for c in cases if c.case_id == args.case]
    if args.case and not selection:
        print(f"no such case: {args.case}", file=sys.stderr)
        return 2

    RESULTS_DIR.mkdir(exist_ok=True)
    any_fail = False
    for c in selection:
        res = run_case(c, mode=mode, update_golden=args.update_golden)
        print(json.dumps(res, indent=2))
        (RESULTS_DIR / f"{c.case_id}.json").write_text(json.dumps(res, indent=2) + "\n", encoding="utf-8")
        if res.get("verdict") not in ("PASS", "UPDATED_GOLDEN", "MANUAL"):
            any_fail = True

    return 1 if any_fail else 0


if __name__ == "__main__":
    sys.exit(main())
