# Program Specification: [PROGRAM_NAME]

**Customer:** [Customer ID — e.g., 308-GH]
**Application:** [e.g., infeed sort to cart placement]
**Robot:** [Model — e.g., CRX-10iA/L]
**Controller:** [e.g., R-30iB Plus]
**Date:** [YYYY-MM-DD]
**Status:** Draft | Ready for Cursor | In Progress | Complete

---

## 1. Application Overview

[Brief description of the cell: what the robot does, what it interacts with, cycle flow.]

## 2. Program Structure

### Main Program: [NAME]
- Entry: UFRAME/UTOOL/PAYLOAD setup
- Loop: LBL[100]
- Dispatch: SELECT R[n:DESCRIPTION] on [criteria]
- Subprogram calls with ELSE error handler

### Subprograms
| Program | Purpose | Called From |
|---------|---------|------------|
| | | |

### Macros
| Macro | Purpose | Shared By |
|-------|---------|-----------|
| | | |

### Background Logic (if applicable)
| Program | Purpose | Runs In |
|---------|---------|---------|
| | | BG Logic |

## 3. Register Allocation

### Numeric Registers (R[])
| Register | Name | Purpose | Initial Value |
|----------|------|---------|---------------|
| R[1] | | | |

### Position Registers (PR[])
| Register | Name | Purpose |
|----------|------|---------|
| PR[1] | | |

### Digital Inputs (DI[])
| Signal | Name | Source | Purpose |
|--------|------|--------|---------|
| DI[1] | | | |

### Digital Outputs (DO[])
| Signal | Name | Target | Purpose |
|--------|------|--------|---------|
| DO[1] | | | |

### Flags (F[])
| Flag | Name | Purpose |
|------|------|---------|
| F[1] | | |

## 4. Motion Plan

### Key Positions
| Position | Description | Frame | Speed | Motion Type |
|----------|-------------|-------|-------|-------------|
| | | | | J / L / C |

### Approach / Retract Strategy
[Describe approach offsets, retract heights, safe positions]

## 5. Error Handling & Recovery

### Recovery Architecture
| Error Condition | Detection | Recovery Program | Action |
|----------------|-----------|-----------------|--------|
| | | | |

### Safety Interlocks
[List critical checks: gripper verify, interference zones, E-stop response]

## 6. Special Requirements

[Vision, Modbus, external axis, conveyor tracking, etc.]

## 7. Dataset References

Cursor should consult these dataset files during implementation:

| File | Reason |
|------|--------|
| `examples/[file]` | [pattern to follow] |
| `reference/[file]` | [syntax to use] |

All paths relative to `FANUC_Optimized_Dataset/optimized_dataset/`.

## 8. Applicable Cursor Rules

| Rule | Reason |
|------|--------|
| `fanuc-tp-conventions.mdc` | TWA structure patterns |
| | |

## 9. Acceptance Criteria

- [ ] Main program follows LBL[100] / SELECT / ELSE pattern
- [ ] All registers have descriptive comments
- [ ] WAIT instructions include TIMEOUT
- [ ] PAYLOAD set in each destination program
- [ ] UFRAME/UTOOL set at program top
- [ ] Recovery macros exist for each failure mode
- [ ] Gripper state verified before pick/place operations
- [ ] Background logic separated from main flow
- [ ] No hardcoded values where registers should be used
- [ ] [Application-specific criteria]
