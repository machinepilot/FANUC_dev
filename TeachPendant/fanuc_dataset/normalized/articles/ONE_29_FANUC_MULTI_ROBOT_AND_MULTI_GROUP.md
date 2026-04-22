---
id: ONE_29_FANUC_MULTI_ROBOT_AND_MULTI_GROUP
title: "FANUC Multi-Robot and Multi-Group"
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

# FANUC Multi-Robot and Multi-Group

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_29_FANUC_Multi_Robot_and_Multi_Group.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Multi-Robot and Multi-Group

Filed under:FANUCTP Programming
I’ve been working on several machine-tending applications lately. These
projects tend to get complicated quickly as the robot decides where to
go next based on the state of the peripheral equipment. The
decision-making logic is hard enough, but getting the robot to and from
each station safely can be tricky. This is how I handle it.
I start off by defining a list of stations:
I then define a register for saving the robot’s current location. I’ll
typically also add another register for saving the previous station,
just in case I need it.
Let’s create a simple macro for saving the robot’s current station and
previous station:
It would be nice to be able to use String Registers for this, but until
FANUC beefs up String Register comparison and assignment, simple integer
constants are going to have to do.
I use this macro whenever the robot actually gets to a given station.
Saving your current location is only half the battle. The next step is
creating a routine that gets the robot from A to B, or C, or D, etc.
Let’s create a new routine calledTRAVERSE. It takes a single
argument, the target station, and simply acts as a man-in-the-middle,
inserting any necessary points between stations.
TheTRAVERSEprogram doesn’t do anything right now. It just prevents
us from accidentally crashing the robot into something when moving from
station to station. This is how I might use this routine:
There are a couple things to notice here:
With the current implementation ofTRAVERSE, you’ll simply get a user
alarm as soon as the robot starts executingUNLOAD_MACHINE_1. Let’s
assume that the robot is supposed to move from the regrip station to
machine 1 and add a valid traversal for this case:
The first thing the program does is see if there are any valid
traversals from the current station stored inR[50]. It then jumps
down and checks to see if there are any valid traversals to the target
station inAR[1]. If everything looks good, it executes the motion
statement or two required to get from A to B, otherwise it catches the
error and potentially saves the robot from crashing.
It’s pretty common for the robot to have to traverse to and from itself,
so I’ll typically add one simple line to the top of TRAVERSE to allow
this:
It’s also pretty common for no extra motion to be necessary, so I’ll
usually have a NOOP (no operation) label to handle this case.
I purposefully jump here instead of the end of the program just in case
I want to do any logging, etc.
As you add more and more traversals, theTRAVERSEroutine starts to
get pretty large. At this point, it probably makes sense to separate
each station’s traversals into their own routines:
This is the cleanest way I’ve found to get the robot from station to
station, protect us both from programming errors and keep our actual
operation programs clean. How do you handle this problem? Let me know if
you have any alternative ideas or ways to improve how I currently handle
this.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/intelligent-traversing/

## Citations

- Primary: ONE Robotics Company Blog (keywords: multi-robot, multi-group, coordinated motion, dual arm, interference, coordination).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_29_FANUC_Multi_Robot_and_Multi_Group.txt`.
- Classification: articles / topic=motion.

