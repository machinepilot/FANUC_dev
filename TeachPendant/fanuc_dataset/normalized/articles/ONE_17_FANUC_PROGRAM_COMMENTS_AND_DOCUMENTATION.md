---
id: ONE_17_FANUC_PROGRAM_COMMENTS_AND_DOCUMENTATION
title: "FANUC Program Comments and Documentation"
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

# FANUC Program Comments and Documentation

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_17_FANUC_Program_Comments_and_Documentation.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Program Comments and Documentation

Filed under:FANUCTP Programming
My last project was a machine load/unload application where the robot had two basically identical grippers. Either gripper could be used to load or unload any station. Here’s how I handled the payload switching and grip/ungrip logic in the load/unload programs.

Start with four basicPAYLOADprograms, one for each possible condition: empty gripper, part on A side, part on B side and a part on both sides.
If you think using small one-line programs is silly, read my post onSmall Programsand see if it changes your mind.
We don’t want to create different load and unload routines for both grippers, so we will have to keep track of which gripper is active somewhere. Let’s useF[1:A Active].
We’ll also have to keep track of which grippers are currently gripping parts. This could be done a number of ways, but let’s just useF[2:GripA full]andF[3:GripB full].
Now the goal will be to simply call one program in our load and unload programs just like we normally would with a single gripper. We also want the name of this program to have good semantics. Since we are essentially adding and removing parts from the robot end-of-arm tool, I chose the namespayload_addandpayload_subfor the unload and load programs respectively.
Let’s write some code forpayload_add:
These nestedif-statements look nice here, but they will be difficult to read on the teach pendant. This is why I will extract some of this logic into a couple more small programs:
Thepayload_subprogram and associatedpayload_sub_aandpayload_sub_broutines will look very similar.
The idea here is to hide the logic that selects the correct payload from the load and unload routines. A load routine should only worry aboutloading. Modifying thePAYLOADshould be a small detail, even if you have a complex situation with multiple states.
Next time you have someIF-ELSElogic in a program, think about whether or not that logic is the main job of your current routine. If the answer is no, you should probably extract that into another program.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2016/smart-payloads/

## Citations

- Primary: ONE Robotics Company Blog (keywords: comment, documentation, remark, code readability, maintainability).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_17_FANUC_Program_Comments_and_Documentation.txt`.
- Classification: articles / topic=anti_pattern.

