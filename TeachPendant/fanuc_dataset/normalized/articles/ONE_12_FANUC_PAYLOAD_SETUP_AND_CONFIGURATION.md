---
id: ONE_12_FANUC_PAYLOAD_SETUP_AND_CONFIGURATION
title: "FANUC Payload Setup and Configuration"
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

# FANUC Payload Setup and Configuration

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_12_FANUC_Payload_Setup_and_Configuration.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Payload Setup and Configuration

Filed under:FANUCTP Programming
What do you think this line of code does?
If you’ve been programming FANUC robots for a while, you probably guessed that this statement jumps to the end of the program. It comes in many variants:JMP LBL[999],JMP LBL[10000], etc., but the intent is almost always the same: end this routine.
The problem is that there’s no guarantee thatLBL[9999]orLBL[10000]or whatever actually ends the routine. That label may not even exist. You may be reasonably sure as to what will happen ifyouwrote the program, but I’m willing to bet that someday yourLBL[10000]won’t be the last line of your routine.
Maybe someone simply turned a bit off after your label. Maybe he or she added a conditional or a motion statement. This might work 99.9% of the time, but maybe there’s a rare execution path that will cause the robot to crash if the stars align just right.
You wanted the routine to end, but you did an unconditional jump. Why not just use theENDstatement if that’s what you wanted to do?
You should be able to safely replace all of yourJMP LBL[999]-type statements withENDstatements, but you will run into some limitations with the language itself if you want to end the routine conditionally.
For example, you can’t end a routine from a one-lineIFstatement:IF R[1]=1,END ;. You can’t end the routine as a result of aSELECTcase either:SELECT R[1]=1,END ;.
This is not meant to a be a post about the limitations of TP (though there are plenty). I tried to fix many of those withTP+and wrote abouthow unconditional jumps are harmful a couple years ago.
We finally gotIF-THENblocks with the R-30iB controller. If you’re lucky enough to be working on a newer robot, you could conditionally end a routine like this:
A one-liner would be nice, but this is the best we can do for now. TheSELECTstatement is a bit trickier.
One option is to use theELSEbranch of the statement to jump to a label used for ending the routine, but we’re pretty much back to square one at that point. It might be better to place anENDstatement after anySELECTand also be sure toENDany places we’ve jumped to e.g.:
This guarantees that the task will end no matter how theSELECTcondition was evaluated. (You have to remember that task execution will return to the line immediately following aCALLcase. This is quite different than the otherJMPcases.)
While TP lacks the many conveniences of a modern programming language, it does have anENDstatement, so use it when you can. Your programs should lose a label (the fewer labels the better) and you’ll know your programs will end when you want them to with no side effects.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2016/embrace-the-end-statement/

## Citations

- Primary: ONE Robotics Company Blog (keywords: PAYLOAD, payload schedule, mass, center of gravity, inertia, motion performance).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_12_FANUC_Payload_Setup_and_Configuration.txt`.
- Classification: articles / topic=anti_pattern.

