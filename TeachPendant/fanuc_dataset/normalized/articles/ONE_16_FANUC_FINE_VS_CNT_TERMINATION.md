---
id: ONE_16_FANUC_FINE_VS_CNT_TERMINATION
title: "FANUC FINE vs CNT Termination"
topic: motion
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

# FANUC FINE vs CNT Termination

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_16_FANUC_FINE_vs_CNT_Termination.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC FINE vs CNT Termination

Filed under:FANUCTP ProgrammingWorkflow
Have you ever looked at a TP program and gotten lost following all theLBLs andJMPs? Have you ever gotten lazy handling yourWAIT-statementTIMEOUTs because you didn’t want to bother adding the extra stuff to your main routine?
If you’re nodding “yes” right now, you should try isolating yourWAIT-statements into their ownsmall programs.
In my eight-plus years of programming robots and troubleshooting other people’s code, I’ve found that a mess of labels and lack of refactoring large programs into smaller routines is thesingle biggest cause of issues.
Here’s an example of how you might code a machine unload program:
Among other things, I see two glaring problems here:
Here’s how I would fix the issue:
We’ve made a number of improvements:
In the first version it would be very easy to accidently jump to the wrong part of the program when an error is acknowledged or lose track of why thatLBL[2]even exists. Do you think you’d make the same mistake if you could see the entire program in your editor at once?
Give it a try. Start isolating yourWAIT-statements into tiny programs and see how you like it. I bet you’ll get hooked and start thinking about all the other logic you can extract from your main routines.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2016/isolate-your-wait-statements/

## Citations

- Primary: ONE Robotics Company Blog (keywords: FINE, CNT, termination type, motion, cornering, continuous path, cycle time).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_16_FANUC_FINE_vs_CNT_Termination.txt`.
- Classification: articles / topic=motion.

