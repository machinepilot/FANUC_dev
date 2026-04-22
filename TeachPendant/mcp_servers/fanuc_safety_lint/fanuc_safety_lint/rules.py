"""Rule catalog for fanuc_safety_lint.

Each rule is a RuleDef with an id, severity, description, rationale, and a
matcher callable. Matchers operate on (lines: list[str]) and return a list of
Finding dicts.
"""
from __future__ import annotations

import re
from dataclasses import dataclass, field
from typing import Callable


@dataclass
class Finding:
    rule_id: str
    severity: str
    line: int
    column: int
    message: str
    snippet: str


@dataclass
class RuleDef:
    rule_id: str
    severity: str
    applies_to: str  # "tp" or "karel"
    description: str
    rationale: str
    normative_refs: list[str] = field(default_factory=list)
    matcher: Callable[[list[str]], list[Finding]] = field(default=lambda lines: [])


# ---------- TP rule matchers ----------

_MOTION_RE = re.compile(r"^\s*\d+:\s*[JLCA]\s+P", re.IGNORECASE)
_MOTION_PR_RE = re.compile(r"^\s*\d+:\s*[JLCA]\s+PR", re.IGNORECASE)
_UTOOL_RE = re.compile(r"UTOOL_NUM\s*=", re.IGNORECASE)
_UFRAME_RE = re.compile(r"UFRAME_NUM\s*=", re.IGNORECASE)
_WAIT_DI_RE = re.compile(r"WAIT\s+(?:DI|RI|SI|F|UI|GI)\s*\[", re.IGNORECASE)
_TIMEOUT_RE = re.compile(r"TIMEOUT\s*,\s*LBL\s*\[", re.IGNORECASE)
_SKIP_COND_RE = re.compile(r"SKIP\s+CONDITION", re.IGNORECASE)
_LBL_RE = re.compile(r"LBL\s*\[", re.IGNORECASE)
_OVERRIDE_RE = re.compile(r"\$(?:PRGOVERRIDE|OVERRIDE|MCR_GRP\[\d+\]\.\$PRGOVERRIDE)", re.IGNORECASE)
_MONITOR_OPEN_RE = re.compile(r"^\s*\d+:\s*MONITOR\s+\w+", re.IGNORECASE)
_MONITOR_END_RE = re.compile(r"^\s*\d+:\s*MONITOR\s+END\s+\w+", re.IGNORECASE)
_RAW_DIO_RE = re.compile(r"\b(DI|DO|RI|RO|SI|SO)\s*\[\s*\d+\s*\]", re.IGNORECASE)
_ALIASED_DIO_RE = re.compile(r"\b(DI|DO|RI|RO|SI|SO)\s*\[\s*\d+\s*:\s*[A-Z]", re.IGNORECASE)
_PROD_START_RE = re.compile(r"\bUI\s*\[\s*18\b", re.IGNORECASE)
_ENBL_RE = re.compile(r"\bUI\s*\[\s*8\b", re.IGNORECASE)
_BG_FOREGROUND_MOTION_RE = re.compile(r"^\s*\d+:\s*[JLCA]\s+P", re.IGNORECASE)


def _first_motion_line(lines: list[str]) -> int | None:
    for i, line in enumerate(lines, start=1):
        if _MOTION_RE.match(line) or _MOTION_PR_RE.match(line):
            return i
    return None


def _tp_fanuc_utl_001(lines: list[str]) -> list[Finding]:
    first = _first_motion_line(lines)
    if first is None:
        return []
    utool_line = None
    uframe_line = None
    for i, line in enumerate(lines, start=1):
        if i >= first:
            break
        if _UTOOL_RE.search(line):
            utool_line = i
        if _UFRAME_RE.search(line):
            uframe_line = i
    findings = []
    if utool_line is None:
        findings.append(Finding("FANUC-UTL-001", "high", first, 1,
                                "UTOOL_NUM not set before first motion",
                                lines[first - 1].strip()))
    if uframe_line is None:
        findings.append(Finding("FANUC-UTL-001", "high", first, 1,
                                "UFRAME_NUM not set before first motion",
                                lines[first - 1].strip()))
    return findings


def _tp_fanuc_wait_001(lines: list[str]) -> list[Finding]:
    findings = []
    for i, line in enumerate(lines, start=1):
        if _WAIT_DI_RE.search(line) and "=ON" in line.upper():
            if not _TIMEOUT_RE.search(line):
                findings.append(Finding("FANUC-WAIT-001", "high", i, 1,
                                        "WAIT on input without TIMEOUT branch",
                                        line.strip()))
    return findings


def _tp_fanuc_skip_001(lines: list[str]) -> list[Finding]:
    findings = []
    pending_skip = None
    for i, line in enumerate(lines, start=1):
        if _SKIP_COND_RE.search(line):
            pending_skip = i
        elif pending_skip is not None and _LBL_RE.search(line):
            pending_skip = None
        elif pending_skip is not None and (_MOTION_RE.match(line) or _MOTION_PR_RE.match(line)):
            # motion before LBL receiver -> treat as possibly unguarded
            findings.append(Finding("FANUC-SKIP-001", "high", pending_skip, 1,
                                    "SKIP CONDITION declared before LBL receiver; motion encountered first",
                                    lines[pending_skip - 1].strip()))
            pending_skip = None
    return findings


def _tp_fanuc_ov_001(lines: list[str]) -> list[Finding]:
    findings = []
    for i, line in enumerate(lines, start=1):
        if _OVERRIDE_RE.search(line) and "=" in line:
            findings.append(Finding("FANUC-OV-001", "critical", i, 1,
                                    "Programmatic override modification",
                                    line.strip()))
    return findings


def _tp_fanuc_cond_001(lines: list[str]) -> list[Finding]:
    opens = []
    for i, line in enumerate(lines, start=1):
        if _MONITOR_END_RE.match(line):
            if opens:
                opens.pop()
        elif _MONITOR_OPEN_RE.match(line):
            opens.append(i)
    return [Finding("FANUC-COND-001", "high", ln, 1,
                    "MONITOR opened without matching MONITOR END",
                    lines[ln - 1].strip()) for ln in opens]


def _tp_fanuc_alias_001(lines: list[str]) -> list[Finding]:
    findings = []
    for i, line in enumerate(lines, start=1):
        # skip header / POS / comment-only lines
        s = line.strip()
        if s.startswith("!") or s.startswith(";") or s.startswith("/"):
            continue
        if _RAW_DIO_RE.search(line) and not _ALIASED_DIO_RE.search(line):
            findings.append(Finding("FANUC-ALIAS-001", "medium", i, 1,
                                    "Raw DI/DO/RI/RO index without aliased signal name",
                                    line.strip()))
    return findings


def _tp_fanuc_uop_001(lines: list[str]) -> list[Finding]:
    findings = []
    saw_enbl = False
    for i, line in enumerate(lines, start=1):
        if _ENBL_RE.search(line):
            saw_enbl = True
        if _PROD_START_RE.search(line):
            if not saw_enbl:
                findings.append(Finding("FANUC-UOP-001", "high", i, 1,
                                        "PROD_START referenced without prior ENBL UI[8] check",
                                        line.strip()))
    return findings


def _tp_fanuc_pr_001(lines: list[str]) -> list[Finding]:
    # heuristic: flag every J/L P[n] with no comment (:NAME) so humans decide
    findings = []
    for i, line in enumerate(lines, start=1):
        m = re.match(r"^\s*\d+:\s*[JLCA]\s+P\[\s*(\d+)\s*\]", line)
        if m and ":" not in line.split("P[")[1].split("]")[0]:
            findings.append(Finding("FANUC-PR-001", "medium", i, 1,
                                    "Motion uses P[n] without comment - consider PR[n:NAME] if retunable",
                                    line.strip()))
    return findings


def _tp_fanuc_bg_001(lines: list[str]) -> list[Finding]:
    # applies only to programs named BG_LOGIC or TCD with motion-owner flags;
    # here we approximate by flagging motion instructions inside a TP program
    # whose header COMMENT says "BG" or "background". The server passes
    # lines only, so we do a light heuristic: if any line says BG_LOGIC in the
    # header area, flag subsequent motion.
    is_bg = any("BG_LOGIC" in line.upper() or "BACKGROUND" in line.upper() for line in lines[:30])
    if not is_bg:
        return []
    findings = []
    for i, line in enumerate(lines, start=1):
        if _BG_FOREGROUND_MOTION_RE.match(line):
            findings.append(Finding("FANUC-BG-001", "high", i, 1,
                                    "Background Logic program contains motion instruction",
                                    line.strip()))
    return findings


def _tp_fanuc_dcs_001(lines: list[str]) -> list[Finding]:
    # Placeholder: without DCS config on the controller, we cannot truly check
    # the envelope. We flag an informational note on every program with motion
    # so the safety agent explicitly addresses DCS.
    first = _first_motion_line(lines)
    if first is None:
        return []
    return [Finding("FANUC-DCS-001", "info", first, 1,
                    "Motion detected - verify DCS Position/Speed Check envelope covers all taught points",
                    lines[first - 1].strip())]


# ---------- KAREL rule matchers ----------

_STACKSIZE_RE = re.compile(r"%STACKSIZE", re.IGNORECASE)
_MSG_CONNECT_RE = re.compile(r"\bMSG_CONNECT\b", re.IGNORECASE)
_MSG_DISCO_RE = re.compile(r"\bMSG_DISCO\b", re.IGNORECASE)


def _karel_stk_001(lines: list[str]) -> list[Finding]:
    if any(_STACKSIZE_RE.search(line) for line in lines):
        return []
    return [Finding("FANUC-KAREL-STK-001", "medium", 1, 1,
                    "KAREL program missing explicit %STACKSIZE directive",
                    lines[0].strip() if lines else "")]


def _karel_sock_001(lines: list[str]) -> list[Finding]:
    opens = sum(1 for line in lines if _MSG_CONNECT_RE.search(line))
    closes = sum(1 for line in lines if _MSG_DISCO_RE.search(line))
    if opens > closes:
        return [Finding("FANUC-KAREL-SOCK-001", "high", 1, 1,
                        f"KAREL program opens {opens} socket(s) but closes {closes} - mismatched MSG_CONNECT/MSG_DISCO",
                        "")]
    return []


RULES: list[RuleDef] = [
    RuleDef("FANUC-UTL-001", "high", "tp",
            "UTool/UFrame not set before first motion",
            "Relying on previously-loaded tool/frame values is a leading cause of first-motion crashes.",
            ["ISO 10218-2 5.10", "fanuc-tp-conventions.mdc#utool-uframe"],
            _tp_fanuc_utl_001),
    RuleDef("FANUC-UOP-001", "high", "tp",
            "PROD_START referenced without ENBL UI[8] handshake",
            "PROD_START on a disabled robot either silently fails or enters an unknown state.",
            ["FANUC UOP Manual", "fanuc-fieldbus.mdc#uop-signal-baseline"],
            _tp_fanuc_uop_001),
    RuleDef("FANUC-WAIT-001", "high", "tp",
            "WAIT on input without TIMEOUT branch",
            "Unbounded waits hang the cycle; every WAIT must have a documented fault escalation.",
            ["fanuc-tp-conventions.mdc#wait-with-timeout"],
            _tp_fanuc_wait_001),
    RuleDef("FANUC-SKIP-001", "high", "tp",
            "SKIP CONDITION declared without LBL receiver",
            "An orphan SKIP can cause unexpected branch behavior or be silently ignored.",
            ["fanuc-tp-conventions.mdc#skip-and-condition"],
            _tp_fanuc_skip_001),
    RuleDef("FANUC-PR-001", "medium", "tp",
            "Motion uses P[n] where PR[n:NAME] is customer convention",
            "P[n] is program-local; PR[n] is tunable at runtime. Customer field tuning is common.",
            ["fanuc-tp-conventions.mdc#motion-instructions"],
            _tp_fanuc_pr_001),
    RuleDef("FANUC-OV-001", "critical", "tp",
            "Programmatic override modification",
            "Changing $OVERRIDE from program invalidates operator speed control and safety assumptions.",
            ["ISO 10218-1 5.6", "fanuc-tp-conventions.mdc#anti-patterns"],
            _tp_fanuc_ov_001),
    RuleDef("FANUC-COND-001", "high", "tp",
            "MONITOR opened without matching MONITOR END",
            "Orphan MONITOR leaks condition scope and can keep handlers live across program ends.",
            ["fanuc-tp-conventions.mdc#flow-control"],
            _tp_fanuc_cond_001),
    RuleDef("FANUC-DCS-001", "info", "tp",
            "Motion detected - verify DCS envelope",
            "Lint cannot see DCS config. This is an informational reminder for the Safety agent to cover the envelope explicitly.",
            ["FANUC DCS Operator's Manual", "fanuc-safety.mdc#fanuc-dcs-coverage"],
            _tp_fanuc_dcs_001),
    RuleDef("FANUC-BG-001", "high", "tp",
            "Background Logic program contains motion instruction",
            "Background Logic must not issue motion; it shares CPU with foreground and cannot own groups.",
            ["FANUC Background Logic Operator's Manual"],
            _tp_fanuc_bg_001),
    RuleDef("FANUC-ALIAS-001", "medium", "tp",
            "Raw DI/DO index without aliased signal name",
            "Aliased signals (DI[123:NAME]) survive re-numbering and self-document; raw indices rot.",
            ["fanuc-tp-conventions.mdc#i-o-discipline"],
            _tp_fanuc_alias_001),
    RuleDef("FANUC-KAREL-STK-001", "medium", "karel",
            "KAREL program missing %STACKSIZE",
            "Default stack is too small for any non-trivial program; silent stack overflow crashes the task.",
            ["fanuc-karel-conventions.mdc#directives"],
            _karel_stk_001),
    RuleDef("FANUC-KAREL-SOCK-001", "high", "karel",
            "Mismatched MSG_CONNECT / MSG_DISCO",
            "Every socket open needs a close. Leaks exhaust tag pools and leave dangling TCP state.",
            ["fanuc-karel-conventions.mdc#socket-messaging"],
            _karel_sock_001),
]


def list_rules() -> list[dict]:
    return [
        {
            "rule_id": r.rule_id,
            "severity": r.severity,
            "applies_to": r.applies_to,
            "description": r.description,
        } for r in RULES
    ]


def explain_rule(rule_id: str) -> dict | None:
    for r in RULES:
        if r.rule_id == rule_id:
            return {
                "rule_id": r.rule_id,
                "severity": r.severity,
                "applies_to": r.applies_to,
                "description": r.description,
                "rationale": r.rationale,
                "normative_refs": r.normative_refs,
            }
    return None


def lint_tp(lines: list[str]) -> list[Finding]:
    out: list[Finding] = []
    for r in RULES:
        if r.applies_to != "tp":
            continue
        try:
            out.extend(r.matcher(lines))
        except Exception as exc:  # keep the server alive on rule bugs
            out.append(Finding(r.rule_id, "info", 1, 1,
                               f"rule matcher raised: {exc!r}", ""))
    return out


def lint_karel(lines: list[str]) -> list[Finding]:
    out: list[Finding] = []
    for r in RULES:
        if r.applies_to != "karel":
            continue
        try:
            out.extend(r.matcher(lines))
        except Exception as exc:
            out.append(Finding(r.rule_id, "info", 1, 1,
                               f"rule matcher raised: {exc!r}", ""))
    return out


def summarize(findings: list[Finding]) -> dict:
    counts = {"critical": 0, "high": 0, "medium": 0, "low": 0, "info": 0}
    for f in findings:
        counts[f.severity] = counts.get(f.severity, 0) + 1
    return counts
