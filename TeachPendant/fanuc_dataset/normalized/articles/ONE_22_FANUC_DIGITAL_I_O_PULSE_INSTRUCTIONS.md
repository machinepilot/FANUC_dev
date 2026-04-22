---
id: ONE_22_FANUC_DIGITAL_I_O_PULSE_INSTRUCTIONS
title: "FANUC Digital I/O Pulse Instructions"
topic: io
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

# FANUC Digital I/O Pulse Instructions

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_22_FANUC_Digital_I_O_Pulse_Instructions.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Digital I/O Pulse Instructions

Filed under:FANUCTP Programming
I used to be a frame offset (PR Offset) guy almost 100% of the time. Assuming
you areusing accurate UFRAMEs and UTOOLs,
this should get you pretty far in material handling. However, once
things stop being perfect and your tolerances start getting really
tight, you might be better off using tool offsets in your pick and place
situations.
This works great when you can approach and retreat from your fixtures in
an orthogonal or parallel direction, but what happens when your part
doesn’t sit quite perfectly in the fixture? What if your user frame
isn’t perfectly accurate? Time to use a tool offset.
I would actually argue that you should almost always use tool offsets
for pick and place situations by convention. (More on conventions here:Using Conventions to Improve Your
WorkFlow)
Assuming your tool frame is accurate, you will be approaching and
retreating in a direction parallel to one of the tool axes most of the
time. You’re picking up the product, not the frame, and you should
probably be approaching/retreating relative to the product as well.
FANUC seems to favor this way of doing things in recent years. Whereas
PalletTool and PickTool use frame calculations and separate position
registers for approaches/retreats, the new iRPickTool uses a tool
offset.
I’ve seen people stick to their beloved frame offsets by actually
teaching their user frame origin as the pick position and then teaching
the primary dimension by backing the part out in TOOL coordinates. You
could have now matched your UFRAME X-coordinate with TOOL Z, but I would
argue that this defeats the purpose of having a user frame altogether. A
user frame should be easily touched up in a spot where it’s easy to
visualize that coordinate system. Having the ability to use both frame
and tool offsets gives additional flexibility. Why make them redundant?
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/when-to-use-tool-offsets-vs-frame-offsets/

## Citations

- Primary: ONE Robotics Company Blog (keywords: PULSE, digital output, pulse duration, DO, signal timing).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_22_FANUC_Digital_I_O_Pulse_Instructions.txt`.
- Classification: articles / topic=io.

