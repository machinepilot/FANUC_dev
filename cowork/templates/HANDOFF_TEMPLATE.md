# Handoff: [TASK_NAME]

**From:** Cowork (planning/review)
**To:** Cursor (code editing)
**Date:** [YYYY-MM-DD]
**Priority:** Critical | High | Medium | Low
**Source:** [PROGRAM_SPEC or REVIEW that triggered this handoff]

---

## Target Files

| File | Action | Description |
|------|--------|-------------|
| `[path/to/file.LS]` | Create / Edit / Refactor | [What needs to happen] |

## Context

[Brief description of what needs to happen and why. Reference the source spec or review.]

## Applicable Cursor Rules

These `.cursor/rules/*.mdc` files will auto-apply based on glob matching. Verify they're active:

| Rule | Triggers On | Why It Applies |
|------|------------|----------------|
| `fanuc-tp-conventions.mdc` | `**/*.LS` | TWA structure patterns |
| | | |

## Dataset References

Consult these files for correct syntax and patterns:

| Dataset File | What To Use From It |
|-------------|---------------------|
| `[path relative to optimized_dataset/]` | [specific pattern or syntax] |

## Edit Instructions

Numbered steps, each targeting a specific file and location:

1. **[file.LS]** — [Specific instruction]
   - Pattern to follow: [dataset example reference]
   - Before: [what it looks like now, if editing]
   - After: [what it should look like]

2. **[file.LS]** — [Specific instruction]

## Acceptance Criteria

- [ ] [Specific, verifiable criterion]
- [ ] [Specific, verifiable criterion]
- [ ] All modified programs pass TWA convention checks (see QA_REVIEW_TEMPLATE.md §2)

## Notes

[Any additional context: gotchas, dependencies on other files, timing constraints, things Cursor should NOT touch.]
