---
id: ONE_27_FANUC_TEACH_PENDANT_NAVIGATION_TIPS
title: "FANUC Teach Pendant Navigation Tips"
topic: registers
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

# FANUC Teach Pendant Navigation Tips

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_27_FANUC_Teach_Pendant_Navigation_Tips.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Teach Pendant Navigation Tips

Filed under:FANUCTP Programmingtp.js
Last week I wrote aboutTesting TP Programs with Ruby,
but you had to trust that I wasn’t just making things up. Over the past
few days I’ve ported most of my work into a JavaScript library so you
can actually see TP programs running directly in your web browser.
Let’s cut to the chase and do an example. I’ve written a simple TP
program below that performs a few basic functions like numeric register
assignment, conditional evaluation, jumping to a label and linear
motion. Next to the program, I’ve created a simple debugger which gives
you some insight into how the program is running and what’s happening to
the numeric register.
Click the Run button below to start the program. You can also Pause the
program and Step through it one line at a time. Keep an eye on the
debugger to the right where the controller is telling you what it’s
doing in detail.(Note: the current line is highlighted in the source
code)
R[1] =0
I think there’s a lot of potential in this library. JavaScript is a
pretty universal platform that almost every modern device supports. It
certainly has it’s limitations, but the accessibility makes a very
strong case for its use.
In future articles aboutTP programming,
I will embed controller runtimes like this one so you can actually
modify and execute the code to see what it’s doing. Look out for
something similar on KAREL in the future too.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/simulating-tp-programs-in-the-browser-with-tp-js/

## Citations

- Primary: ONE Robotics Company Blog (keywords: teach pendant, TP, navigation, menu, shortcut, efficiency, workflow).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_27_FANUC_Teach_Pendant_Navigation_Tips.txt`.
- Classification: articles / topic=registers.

