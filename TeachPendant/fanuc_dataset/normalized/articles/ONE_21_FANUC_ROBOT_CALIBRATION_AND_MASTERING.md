---
id: ONE_21_FANUC_ROBOT_CALIBRATION_AND_MASTERING
title: "FANUC Robot Calibration and Mastering"
topic: mastering
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

# FANUC Robot Calibration and Mastering

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_21_FANUC_Robot_Calibration_and_Mastering.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Robot Calibration and Mastering

Filed under:WorkflowFANUCTP Programming
TP programs should be readable. If an operator can step through the code
and understand it, you might be able to avoid a phone call when the
robot inevitably misbehaves. Lately I’ve been simplifying complex
conditionals into unique flags to keep my programs short and simple.
Let’s say you have an application where the robot needs to unload one
machine and then load another machine. The part out of machine 1 is hot
so you want to wait until both machines are ready before unloading the
first machine. You might have a line of code that looks like this:
It’s very clear that all 6 conditions need to be true before machine 1
gets unloaded, but it’s a little long. Why not simplify these conditions
into a couple flags?
I wrote aboutFANUC’s BG Logicoption earlier this year. It basically allows you to create programs that are
constantly scanned in the background, kind of like ladder logic. Flag IO
ports are simple ON/OFF boolean states that don’t go anywhere unless you
map something else to the same rack/slot/port.
Here are a couple lines of BG logic code you could write to simplify the
case outline above:
…and here’s how the updated TP program might look:
Your code is now simpler and easier to read. Semantically, it’s easy to
understand that you’re waiting to unload machine 1 until 1) machine 1 is
can be unloaded and 2) machine 2 can be loaded. If you ever want to
unload machine 1 regardless of machine 2’s status, you can simply remove
the condition onF[2]. There’s a little bit of indirection here, but
hopefully you list the underlyingDIsignals in the error HMI screen
that pops up atLBL[500].
It’s always a balancing act between duplication and indirection, but as
long as your program is still readable and the intent is clear, you
should be ok. If you plan out the BG logic in advance, you’ll probably
even save yourself a few keystrokes while programming the rest of the
project.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/use-bg-logic-to-simplify-your-tp-programs/

## Citations

- Primary: ONE Robotics Company Blog (keywords: calibration, mastering, zero position, encoder, joint calibration).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_21_FANUC_Robot_Calibration_and_Mastering.txt`.
- Classification: articles / topic=mastering.

