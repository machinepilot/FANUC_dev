---
id: ONE_32_FANUC_ROBODRILL_MACHINE_TENDING_PATTERNS
title: "FANUC RoboDrill Machine Tending Patterns"
topic: anti_pattern
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: third_party_integrator
  title: "ONE Robotics Company Blog"
  tier: T3
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# FANUC RoboDrill Machine Tending Patterns

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_32_FANUC_RoboDrill_Machine_Tending_Patterns.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC RoboDrill Machine Tending Patterns

Filed under:FANUCTP ProgrammingTP+
I hate to disagree withthe wise words of House of Pain,
but excessive jumping around is the most common issue I see when
reviewing others’ TP code. Labels and jump-statements come natural in a
language that doesn’t support actual code-blocks for simple
if-statements. Within just a few minutes of programming, a beginner sees
anIF (...),JMP LBL[X]and decides that this is how FANUC programming
is done.
Randall Munroe fromxkcdsums up the potential for catastrophe when
using GOTO statements (TP’s JMP) in this comic:

Unfortunately you can’t avoid them completely. TP only supports FOR and
SELECT control structures, and it only supports them in a very limited
fashion. IF-statements require jumps, there’s no such thing as an ELSE
in TP so you have to do it with a jump, and WHILE-loops don’t exist;
their functionality has to be done with a couple labels and a jump.
Here’s how each of these control structures is implemented in TP on the
left and a more fully-featured programming language implementation (TP+)
on the right:
Which side is easier to read? Which side makes it easier to make a
mistake by jumping to an incorrect label?
Here’s an example of a bad main routine that’s similar to a lot of
programs I see:
That code is not an exaggeration. Can anyone tell me what the hell this
program is supposed to do? Probably not. This is the part where the
dinosaur comes in and bites your head off.
I would argue that you should almost only use labels when implementing
these simple control structures. If you are jumping around in your code
for any other reason, there’s probably a better way to do it.
I pretty much only use labels and jumps in the following situations:
Item #2 could probably be considered a standard control structure, and
maybe item #3 is actually a good candidate for refactoring. So there you
have it: only use labels and jumps when implementing control structures
like if-else statements, while loops, complex for loops and more
complicated select-case statements that don’t exist in TP. If you want
to save yourself some pain, just letTP+implement those features for
you. (But maybe not quite just yet… I still consider TP+ to be in the
alpha development stage.)
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/dont-jump-around/

## Citations

- Primary: ONE Robotics Company Blog (keywords: RoboDrill, CNC, machine tending, door, chuck, handshake, service request, load unload).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_32_FANUC_RoboDrill_Machine_Tending_Patterns.txt`.
- Classification: articles / topic=anti_pattern.

