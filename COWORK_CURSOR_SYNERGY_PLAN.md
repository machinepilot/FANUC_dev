# Cowork + Cursor Synergy Architecture Plan

**Project:** FANUC_dev — The Way Automation LLC  
**Date:** April 15, 2026  
**Purpose:** Optimize the joint operation of Claude Desktop (Cowork) and Cursor IDE for FANUC TP programming, ROS 2 development, and autonomous agent workflows.

---

## 1. Current State Assessment

### What Exists (Cursor — well-developed)

| Asset | Count | Purpose |
|-------|-------|---------|
| `.cursor/rules/*.mdc` | 8 rules | Context-aware coding guidance (TP conventions, dataset refs, LDJ, ROS 2, Physical AI, press brake Modbus, customer programs) |
| `.cursor/skills/*.md` | 3 skills | ROS 2 build, launch, troubleshoot automation |
| `AGENTS.md` | 1 file | Master instruction doc for AI assistants |
| `FANUC_Optimized_Dataset/` | 99 files | Canonical TP syntax, patterns, and reference (~8,300 lines) |
| `customer_programs/` | 3 customers | Production backups (PJ Trailers, Greenheck Fan, JD Tube) |
| `LDJ/` | 346 MB | Press brake integration (Kvara, manuals, references) |
| `physical_ai/` | 128 KB | ROS 2, NVIDIA Isaac, Jetson, e-CAM121, POCs |
| `mqtt_bridge/` | 36 KB | KAREL MQTT integration (2 options) |

### What's Missing (Cowork — unconfigured)

| Gap | Impact |
|-----|--------|
| No `.claude/` directory | Cowork has zero workspace awareness |
| No `CLAUDE.md` | No persistent instructions for Cowork sessions |
| Project instructions = 1 sentence | Cowork can't leverage the rich context Cursor has |
| No Cowork skills | No automation workflows for orchestration tasks |
| No agent definitions | No TP generator or QA review workflows |
| No handoff protocol | No defined way to coordinate Cursor ↔ Cowork work |

---

## 2. Architecture: "Brain and Hands"

```
┌─────────────────────────────────────────────────────────┐
│                    COWORK (Brain)                        │
│                                                         │
│  Orchestration · Planning · Reviews · Documentation     │
│  Agent Workflows · Config Management · Quality Gates    │
│                                                         │
│  Owns:                                                  │
│    CLAUDE.md (master config)                            │
│    AGENTS.md (shared instructions)                      │
│    .cursor/rules/*.mdc (generates/updates)              │
│    Agent workflow definitions                            │
│    Quality standards & review checklists                 │
│                                                         │
├─────────────────────────────────────────────────────────┤
│                         ↕                               │
│              Shared Workspace (FANUC_dev/)               │
│                         ↕                               │
├─────────────────────────────────────────────────────────┤
│                    CURSOR (Hands)                        │
│                                                         │
│  In-file editing · TP programs · KAREL · ROS 2 code    │
│  Real-time syntax · Context rules · Build/launch        │
│                                                         │
│  Consumes:                                              │
│    .cursor/rules/*.mdc (auto-applied by glob)           │
│    .cursor/skills/*.md (task automation)                 │
│    AGENTS.md (instruction context)                      │
│    FANUC_Optimized_Dataset/ (syntax reference)          │
│                                                         │
└─────────────────────────────────────────────────────────┘
```

### Division of Responsibility

| Capability | Cowork (Brain) | Cursor (Hands) |
|-----------|----------------|-----------------|
| **TP program generation** | Spec intake, architecture decisions, register allocation, program structure planning | Write .LS files, apply syntax from dataset, fill in motion/logic |
| **Code review / QA** | Run review checklists, generate findings reports, track issues across programs | Apply fixes in-file, refactor code, test syntax |
| **Customer program work** | Review scope, plan refactoring phases, manage implementation order | Edit individual .LS files, apply dataset patterns |
| **LDJ integration** | Plan signal mapping, review wiring docs, generate integration checklists | Write TP programs with Modbus handshake, edit KAREL |
| **ROS 2 development** | Plan POC execution, review architecture, coordinate build/launch/test cycles | Edit launch files, Python nodes, URDF, CMakeLists |
| **Documentation** | Generate reports, architecture docs, integration guides, meeting prep | Inline comments, docstrings, code-level docs |
| **Configuration management** | Update AGENTS.md, generate/revise .cursor rules, maintain indexes | Consume rules automatically via glob matching |

---

## 3. Implementation Plan

### Phase 1: Foundation (Immediate)

Create the Cowork configuration layer that mirrors and complements the Cursor setup.

#### 3.1 Create `CLAUDE.md`

This file goes in the project root and is automatically read by Claude Desktop when the workspace is mounted. It should contain:

```markdown
# FANUC_dev — Cowork Instructions

## Role
You are the orchestration layer for TWA's FANUC development workspace. Cursor handles
in-file code editing; you handle planning, reviews, documentation, agent workflows,
and configuration management.

## Workspace Awareness
- AGENTS.md — Master instruction doc (shared with Cursor)
- FANUC_Optimized_Dataset/optimized_dataset/DATASET_INDEX.md — TP syntax reference index
- customer_programs/PROGRAM_REPOSITORY_INDEX.md — Customer program catalog
- LDJ/LDJ_INTEGRATION_INDEX.md — Press brake integration cross-reference
- physical_ai/PHYSICAL_AI_INDEX.md — Physical AI topic map
- physical_ai/ros2/FANUC_ROS2_INDEX.md — ROS 2 workspace index
- GH_OPTIMAL_ARCHITECTURE.md — Greenheck Fan implementation blueprint

## Critical Rules
1. Customer programs are production backups with known errors. NEVER use them as
   syntax reference. Always use the FANUC_Optimized_Dataset/ for correct syntax.
2. When generating TP programs, follow TWA conventions: LBL[100] main loop, SELECT
   dispatching, descriptive register comments (R[1:PART INDEX]), WAIT with TIMEOUT,
   recovery macros.
3. For LDJ/press brake work, robot_interface_reference.md is primary. Always check
   VENDOR_DISCREPANCIES.md before assuming ESA manual applies.
4. ROS 2 colcon workspace lives at ~/ws_fanuc/. Supported CRX models: 5iA, 10iA,
   10iA/L, 20iA/L, 30iA, 30-18A.

## Cowork Responsibilities
- Plan and architect before coding (specs, register maps, program structure)
- Run QA reviews against dataset conventions
- Generate documentation and integration guides
- Manage workspace configuration (AGENTS.md, .cursor/rules)
- Coordinate multi-program refactoring campaigns

## Handoff Protocol
When work requires in-file code editing:
1. Document the plan (what to change, which files, what patterns to follow)
2. Save the plan to a .md file in the relevant project directory
3. Reference specific dataset files the Cursor agent should consult
4. List the .cursor/rules that apply to the work
```

#### 3.2 Revised Cowork Project Instructions

Replace the current single-sentence project instructions with:

```
FANUC robotics development workspace for The Way Automation LLC (TWA).

This is the orchestration hub — Cowork plans, reviews, and coordinates; Cursor
executes in-file code edits.

On session start, read CLAUDE.md and AGENTS.md for full workspace context.

Key workflows:
- TP program generation: Intake specs → plan architecture → define registers →
  hand off to Cursor for .LS file creation
- Code review / QA: Audit customer programs against FANUC_Optimized_Dataset
  conventions → generate findings → hand off fixes to Cursor
- LDJ integration: Plan signal mapping from robot_interface_reference.md →
  generate wiring checklists → hand off TP programs to Cursor
- ROS 2 development: Plan POC execution → coordinate build/launch/test →
  review results
- Config management: Update AGENTS.md and .cursor/rules as workspace evolves
```

### Phase 2: Agent Workflows

#### 3.3 TP Program Generator Agent

**Purpose:** Generate complete FANUC TP programs from a specification, using the dataset as the style authority.

**Workflow:**

```
INPUT: Program Specification
  - Application type (press brake, machine tending, sort, palletize, etc.)
  - Robot model and controller
  - I/O map (DI/DO assignments)
  - Part types and gripper configuration
  - Motion requirements (approach, pick, place, retract)
  - Special requirements (vision, Modbus, background logic)

STEP 1: Architecture Planning (Cowork)
  - Read DATASET_INDEX.md to identify relevant examples and references
  - Read matching customer program for application context (if applicable)
  - Design program structure:
    * Main program (LBL[100] loop, SELECT dispatching)
    * Subprograms (destination handlers, utility macros)
    * Background logic (if needed)
  - Allocate registers (R[], PR[], DI[], DO[], flags)
  - Define recovery architecture
  - Output: PROGRAM_SPEC.md saved to target directory

STEP 2: Program Generation (Cursor consumes spec)
  - Cursor reads PROGRAM_SPEC.md
  - Cursor applies .cursor/rules (fanuc-tp-conventions, fanuc-dataset-reference)
  - Cursor generates .LS files following dataset patterns
  - Cursor references specific dataset examples cited in the spec

STEP 3: QA Review (Cowork)
  - Review generated .LS files against spec
  - Check register allocation consistency
  - Verify I/O mapping matches spec
  - Validate error handling and recovery paths
  - Output: REVIEW_FINDINGS.md
```

**Dataset Files to Reference by Application Type:**

| Application | Primary Examples | Primary References |
|-------------|-----------------|-------------------|
| Machine tending | EG_JOB_A_CRDrill_SingleHand.txt | FANUC_REF_Motion_Instructions.txt, FANUC_REF_IO_Instructions.txt |
| Press brake | EG_Press_Brake_Modbus_Handshake.txt | FANUC_Modbus_Reference.txt, robot_interface_reference.md |
| Sort / cart placement | GH_OPTIMAL_ARCHITECTURE.md | FANUC_REF_Branching_Instructions.txt, FANUC_REF_Register_Instructions.txt |
| Vision-guided | EG_Vision_*.txt | FANUC_REF_Vision_Instructions.txt |
| Palletizing | ONE_26_FANUC_Palletizing_Patterns_and_Grid_Calculations.txt | FANUC_REF_Register_Instructions.txt |
| PNS / job scheduling | EG_PNS_Programs.txt | FANUC_REF_Macro_Instruction.txt |

#### 3.4 Code Review / QA Agent

**Purpose:** Audit customer programs against TWA conventions and dataset patterns, then generate actionable findings.

**Workflow:**

```
INPUT: Target program(s) to review
  - Customer ID and system type from PROGRAM_REPOSITORY_INDEX.md
  - Specific .LS files or entire customer directory

STEP 1: Context Loading (Cowork)
  - Read customer manifest (customer_programs/<id>/_manifest.json or manifest.json)
  - Read PROGRAM_REPOSITORY_INDEX.md for system context
  - Identify applicable .cursor/rules for the application type
  - Load relevant dataset references

STEP 2: Convention Audit (Cowork reads .LS files)
  - Check against TWA conventions:
    □ Main program uses LBL[100] loop pattern
    □ SELECT with ELSE for dispatching (no bare IF chains)
    □ Register comments present (R[n:DESCRIPTION])
    □ WAIT instructions include TIMEOUT
    □ PAYLOAD set in each destination program
    □ UFRAME/UTOOL set at program top
    □ Recovery macros exist (not inline recovery)
    □ Background logic separated from main flow
    □ Gripper state verified before operations
    □ No hardcoded values where registers should be used

STEP 3: Pattern Matching (Cowork compares to dataset)
  - For each program section, identify the closest dataset example
  - Flag deviations from dataset patterns
  - Categorize findings: Critical (safety/logic), Warning (convention), Info (style)

STEP 4: Findings Report (Cowork generates)
  - Output: REVIEW_<DATE>.md in the customer directory
  - Format: Table of findings with severity, location, description, suggested fix
  - Include specific dataset file references for each fix
  - Prioritized implementation order

STEP 5: Fix Handoff (to Cursor)
  - Generate a fix list with exact file paths and line references
  - Cite the dataset pattern to apply for each fix
  - List applicable .cursor/rules
```

**QA Checklist Template:**

```markdown
# Program Review: [CUSTOMER_ID] — [SYSTEM_TYPE]
Date: [DATE]
Reviewer: Cowork QA Agent

## Programs Reviewed
- [ ] [program1.LS] — [description]
- [ ] [program2.LS] — [description]

## Convention Compliance
| Check | Status | Notes |
|-------|--------|-------|
| LBL[100] main loop | ✅/❌ | |
| SELECT with ELSE | ✅/❌ | |
| Register comments | ✅/❌ | |
| WAIT with TIMEOUT | ✅/❌ | |
| PAYLOAD set | ✅/❌ | |
| UFRAME/UTOOL at top | ✅/❌ | |
| Recovery macros | ✅/❌ | |
| BG logic separated | ✅/❌ | |
| Gripper verification | ✅/❌ | |

## Findings
| # | Severity | File | Line | Description | Dataset Reference |
|---|----------|------|------|-------------|-------------------|
| 1 | CRITICAL | | | | |
| 2 | WARNING | | | | |

## Implementation Order
1. Critical fixes first (safety, logic errors)
2. Convention alignment (structure, naming)
3. DRY improvements (macros, shared logic)
4. Polish (comments, whitespace, consistency)
```

### Phase 3: Configuration Sync Protocol

#### 3.5 How Cowork Manages Cursor Rules

When the workspace evolves (new customer, new integration, new application type), Cowork should:

1. **Assess need** — Does this new context require a Cursor rule?
   - New file types or glob patterns? → New .mdc rule
   - New reference documents? → Update existing rule
   - New conventions? → Update fanuc-tp-conventions.mdc

2. **Generate/update the rule** — Write the .mdc file with:
   - Accurate `globs` matching the new file patterns
   - References to the correct index files
   - Clear instructions that complement (not duplicate) AGENTS.md

3. **Update AGENTS.md** — Add the new context section following the existing pattern:
   - Purpose, key references, caveats, cross-references

4. **Update indexes** — If new reference files are added, update the relevant INDEX.md

#### 3.6 Handoff Protocol (Cowork → Cursor)

When Cowork has planned work that requires in-file editing:

```markdown
## Handoff: [TASK_NAME]
Date: [DATE]
Target files: [list of .LS, .kl, .py, .launch.py files]

### Context
[Brief description of what needs to happen and why]

### Applicable Cursor Rules
- [rule1.mdc] — [why it applies]
- [rule2.mdc] — [why it applies]

### Dataset References
- [specific file] — [what to use from it]

### Instructions
1. [Specific edit instruction with file path]
2. [Specific edit instruction with file path]

### Acceptance Criteria
- [ ] [criterion 1]
- [ ] [criterion 2]
```

Save handoff documents as `HANDOFF_<task>_<date>.md` in the relevant project directory.

### Phase 4: Future Agent Expansions

These agents build on the foundation above and can be added as needs arise:

| Agent | Purpose | Priority |
|-------|---------|----------|
| **Integration Planner** | Plan wiring, Modbus registers, signal handshakes for new press brake cells | Medium |
| **ROS 2 POC Coordinator** | Execute POC plans step-by-step, track progress, validate results | Medium |
| **Customer Onboarding** | When a new customer is added, scaffold the directory structure, manifest, initial program set | Low |
| **Dataset Curator** | When new patterns are discovered in production, distill them into dataset entries | Low |
| **MQTT Bridge Deployer** | Guide Option A vs B selection, generate config, validate connectivity | Low |

---

## 4. File Changes Summary

### New Files to Create

| File | Purpose |
|------|---------|
| `CLAUDE.md` | Cowork master instructions (read on every session) |
| `cowork/templates/PROGRAM_SPEC_TEMPLATE.md` | TP program specification template |
| `cowork/templates/QA_REVIEW_TEMPLATE.md` | Code review findings template |
| `cowork/templates/HANDOFF_TEMPLATE.md` | Cursor handoff document template |

### Files to Update

| File | Change |
|------|--------|
| Cowork project instructions | Replace 1-sentence with full orchestration context |
| `AGENTS.md` | Add Cowork orchestration section, handoff protocol reference |

### Files Unchanged

All `.cursor/rules/*.mdc`, `.cursor/skills/*.md`, and dataset/reference files remain as-is. Cowork reads and manages them but doesn't need to change them initially.

---

## 5. Implementation Order

| Step | Action | Effort |
|------|--------|--------|
| 1 | Create `CLAUDE.md` in project root | 10 min |
| 2 | Update Cowork project instructions | 5 min |
| 3 | Update `AGENTS.md` with Cowork section | 10 min |
| 4 | Create `cowork/templates/` directory with templates | 15 min |
| 5 | Test: Run a TP program generation workflow end-to-end | 30 min |
| 6 | Test: Run a code review on a Greenheck program | 30 min |
| 7 | Iterate on templates and instructions based on test results | Ongoing |

---

## 6. Success Criteria

After implementation:

- [ ] Cowork sessions automatically load full workspace context (CLAUDE.md + AGENTS.md)
- [ ] TP program generation follows a repeatable spec → plan → generate → review cycle
- [ ] Code reviews produce actionable findings with dataset references
- [ ] Handoff documents give Cursor everything it needs without Cowork re-explaining context
- [ ] New customers/integrations can be onboarded by Cowork updating configs that Cursor consumes
- [ ] Neither tool duplicates the other's work — clear separation of brain vs. hands
