---
id: ONE_35_FANUC_PROGRAM_BRANCHING_AND_FLOW_CONTROL
title: "FANUC Program Branching and Flow Control"
topic: bg_logic
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

# FANUC Program Branching and Flow Control

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_35_FANUC_Program_Branching_and_Flow_Control.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Program Branching and Flow Control

Filed under:FANUCTP Programming
FANUC’s Background Logic feature is basically the ladder-logic you know
and love in TP Program form. These programs only consist of Mixed Logic
statements (e.g. F[1]=(DI[1] AND DI[2])), and the programs are
constantly scanned in the background while your robot is online,
ignoring all E-Stops, alarms, etc. Depending on the complexity of your
system, you may be able to skip the PLC and simply use BG Logic to
control everything.
Well, that depends on a few things:
Each BG Logic program can run in one of two modes: Normal and
High-Level. A Normal mode BG Logic program’s scan time will vary with
the number of items to be scanned (no maximum). A High-Level mode BG Logic
program is guaranteed to scan up to 540 items every 8ms. An “item” is is
any instruction (e.g. assignment, if-statement), operator (e.g. AND,
OR, =, ‘(’, ‘)’, +) or piece of data (F[], R[], DI[], DO[]).
The scan time of a normal mode program is:
Your ITP is typically 8ms unless you’re using a Genkotsu robot.
Let’s first draw a ladder-logic diagram:
How would you write this in a BG Logic program?
Now what about scan time? If we’re running in Normal mode, we have to
count up the number of items in our program.
It’s easy to see we have 3 mixed-logic assignment instructions. Counting
up the parens and boolean operators gives us 8 operators. We have 6 data
points after counting all instances of F[] and DI[].
You can see that we have plenty of time to scan through this simple
program during one 8ms ITP, but you can also see how the total # of
items adds up pretty quickly.
Even if you don’t come from a PLC background, hopefully the ladder logic
diagram above makes sense. Imaginecurrentrunning from left to right to
thecoilon the right side of therung. If thecontactis closed
(true or ON), current is allowed to continue on to the right. If current
reaches a regularcoil, it getsenergized.
The example above was pretty easy, but what about a more complicated
rung?
This turns into the following BG Logic code:
It’s a lot easier to see what’s going in the diagram, but it’s possible
with Mixed Logic too.
Do you really need to add the complexity of an additional PLC to your
system? If you’re only controlling a couple of actuators and turning a
couple of conveyors on and off, maybe not. Combine Background Logic
with the iPendant as your HMI and you’ve saved yourself quite a bit of
money.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/intro-to-fanuc-background-logic/

## Citations

- Primary: ONE Robotics Company Blog (keywords: branching, JMP, LBL, SELECT, IF, program flow, label, conditional).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_35_FANUC_Program_Branching_and_Flow_Control.txt`.
- Classification: articles / topic=bg_logic.

