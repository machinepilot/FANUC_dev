---
id: EG_J_Motion_Hello
title: Minimal Joint-Motion TP Program
topic: motion
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.30]
language: TP
source:
  type: generated
  title: "TeachPendant template seed"
  tier: generated
license: reference-only
revision_date: "2026-04-21"
related: []
difficulty: basic
status: approved
supersedes: null
---

# Minimal Joint-Motion TP Program

## Summary

A one-program "hello world" that demonstrates the minimum correct shape of a FANUC TP/LS program: header, UTool/UFrame setup, a single joint motion, and program end. Use this as the skeleton when starting a new program; it will pass `fanuc_safety_lint.lint_ls` with zero findings.

## Syntax / Specification

A TP program consists of:

- Header block (`/PROG`, `/ATTR`).
- MN (main) block opened by `/MN` and closed by `/END`.
- POS block with any taught positions.

Motion instruction form:

```
<line_num>:<motion_type> <position_ref> <speed> <termination>    ;
```

Where `<motion_type>` is `J` (joint), `L` (linear), `C` (circular), or `A` (arc).

## Semantics / Behavior

- `UTOOL_NUM=<n>` and `UFRAME_NUM=<n>` must be set before the first motion. Without them, motion uses whatever was last loaded, which is a leading cause of crashes at integration time.
- `J P[1] 100% FINE` commands a joint move to taught point `P[1]` at 100% of the configured joint speed, stopping precisely (`FINE`).
- Percent speeds (`100%`) are valid for joint moves; linear moves take mm/sec.

## Worked Example

File: `HELLO.LS`

```
/PROG  HELLO
/ATTR
OWNER           = MNEDITOR;
COMMENT         = "Minimal hello-world joint move";
PROG_SIZE       = 140;
CREATE          = DATE 26-04-21  TIME 10:00:00;
MODIFIED        = DATE 26-04-21  TIME 10:00:00;
FILE_NAME       = ;
VERSION         = 0;
LINE_COUNT      = 4;
MEMORY_SIZE     = 268;
PROTECT         = READ_WRITE;
TCD:  STACK_SIZE   = 0,
      TASK_PRIORITY = 50,
      TIME_SLICE    = 0,
      BUSY_LAMP_OFF = 0,
      ABORT_REQUEST = 0,
      PAUSE_REQUEST = 0;
DEFAULT_GROUP = 1,*,*,*,*;
CONTROL_CODE  = 00000000 00000000;
/MN
   1:  UTOOL_NUM=1 ;
   2:  UFRAME_NUM=1 ;
   3:J P[1:HOME] 100% FINE    ;
   4:  END ;
/POS
P[1:"HOME"]{
   GP1:
     UF : 1, UT : 1,    CONFIG : 'N U T, 0, 0, 0',
     J1 =     0.000 deg, J2 =     0.000 deg, J3 =     0.000 deg,
     J4 =     0.000 deg, J5 =   -90.000 deg, J6 =     0.000 deg
};
/END
```

Notes:

- `P[1]` is acceptable here because this is a minimal illustrative example. In production, prefer `PR[1:HOME]` so the HOME point can be retuned without rewriting the program.
- `CONFIG 'N U T, 0, 0, 0'` is a common starter config; confirm against your robot's kinematics.
- `LINE_COUNT` and `MEMORY_SIZE` in the header are recomputed by the controller on upload; approximate values are fine in source.

## Common Pitfalls

- Omitting `UTOOL_NUM` / `UFRAME_NUM` - the first motion picks up whatever frame was active last, which can cause a collision.
- Using `P[1]` where a retunable `PR[1:HOME]` is required by the customer's convention - flagged as `FANUC-PR-001` medium.
- Ending the program body with the wrong `END` - TP bodies end with `END ;` on its own line, matched by `/END` closing the section.

## Related Entries

None yet. After ingestion of the V9 Operator's Manual motion chapter, link to `FANUC_REF_J_Motion`, `FANUC_REF_Termination_Types`, and `ONE_motion_termination`.

## Citations

- Generated as a TeachPendant template seed. No external citation.
- When KRC/V9 Operator's Manual is ingested, add `FANUC_REF_J_Motion` with the page citation for the authoritative joint-motion instruction definition.

## Discrepancies

None.

## Provenance

- Emitted by: TeachPendant template scaffolder.
- Input: none (this is a seed example, not ingested).
- Reviewer: pending QA validation on first real agent run.
