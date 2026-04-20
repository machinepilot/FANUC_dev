# Code Review: [CUSTOMER_ID] — [SYSTEM_TYPE]

**Customer:** [Customer name and ID]
**Application:** [System type from manifest]
**Reviewer:** Cowork QA Agent
**Date:** [YYYY-MM-DD]
**Status:** In Review | Findings Complete | Fixes Handed Off | Closed

---

## 1. Programs Reviewed

| Program | Description | Lines | Last Modified |
|---------|-------------|-------|---------------|
| | | | |

## 2. Convention Compliance

Checked against TWA TP conventions (see `CLAUDE.md` Critical Rules §2):

| # | Convention | Status | Notes |
|---|-----------|--------|-------|
| 1 | Main program uses LBL[100] loop | | |
| 2 | SELECT with ELSE for dispatching | | |
| 3 | Register comments present (R[n:DESC]) | | |
| 4 | WAIT instructions include TIMEOUT | | |
| 5 | PAYLOAD set in destination programs | | |
| 6 | UFRAME/UTOOL set at program top | | |
| 7 | Recovery logic in dedicated macros | | |
| 8 | Background logic separated from main | | |
| 9 | Gripper state verified before operations | | |
| 10 | No hardcoded values where registers apply | | |

**Status key:** PASS | FAIL | PARTIAL | N/A

## 3. Findings

| # | Severity | File | Line(s) | Description | Dataset Reference | Suggested Fix |
|---|----------|------|---------|-------------|-------------------|---------------|
| 1 | | | | | | |

**Severity key:**
- **CRITICAL** — Safety risk, logic error, or data loss potential. Must fix before deployment.
- **WARNING** — Convention violation that affects maintainability or reliability. Should fix.
- **INFO** — Style or consistency issue. Fix when convenient.

## 4. Pattern Comparison

For each major program section, the closest dataset example and any deviations:

| Program Section | Closest Dataset Example | Deviations |
|----------------|------------------------|------------|
| Main loop | | |
| Subprogram calls | | |
| I/O handling | | |
| Error recovery | | |

All dataset paths relative to `FANUC_Optimized_Dataset/optimized_dataset/`.

## 5. Implementation Order

Priority fixes grouped by phase (see `GH_OPTIMAL_ARCHITECTURE.md` §Implementation Order for precedent):

### Phase 1: Critical (safety, logic)
- [ ] [Finding #]

### Phase 2: Convention Alignment (structure, naming)
- [ ] [Finding #]

### Phase 3: DRY Improvements (macros, shared logic)
- [ ] [Finding #]

### Phase 4: Polish (comments, whitespace, consistency)
- [ ] [Finding #]

## 6. Cursor Handoff

**Applicable rules:**
| Rule | Reason |
|------|--------|
| `fanuc-tp-conventions.mdc` | Convention fixes |
| | |

**Dataset files Cursor should consult:**
| File | For Finding(s) |
|------|----------------|
| | |

**Handoff document:** `HANDOFF_<task>_<date>.md` (created separately if fixes are complex)
