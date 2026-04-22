---
id: ONE_39_FANUC_KAREL_PROGRAMMING_FUNDAMENTALS
title: "FANUC KAREL Programming Fundamentals"
topic: karel
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: KAREL
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

# FANUC KAREL Programming Fundamentals

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_39_FANUC_KAREL_Programming_Fundamentals.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC KAREL Programming Fundamentals

Filed under:FANUCRobot HappinessTP Programming
That is the question. And the answer is “probably not.”
Once a programmer learns that the ACC instruction exists (and figures
out how to make it go over 100) this is often the first place they go
to make the robot faster. It’s such an easy change to make with
immediate results, but there are serious consequences. I’d argue that
going over ACC100 should only be done as a last resort.
Here are some alternatives with a brief discussion of why higher ACCs
might be a bad idea.
Here’s my method for increasing throughput:
Accurate payload settings are very important. Not only do they protect
the robot by allowing Collision Guard to make its calculations
accurately, but they also alter the path and speed of the robot. An
R-2000iB/165F will move much faster with a payload of 40kg than the full
capacity of 165kg, and a M-3iA/6S will move much faster with a payload
setting of 0.5kg than the default 6kg.
I’ve come into projects where the customer is complaining about cycle
time to find random waits for 1.0s here, 0.8s there, all completely
arbitrary. If your gripper only needs 0.1s to close, why have a wait of
0.2s? Or better yet: if you have reliable gripper inputs, why have a
wait for time at all? Just wait for the correct input state.
If you’re driving from Chicago to Detroit, you’re probably not going to
detour up to Traverse City. In fact, the fastest way to get there is to
fly in a straight line.
It’s very easy to be too conservative with your approach and retreat
heights or clear something by 12” when you really only need 1”.
Robot motion should be smooth. Say it with me now, “smooooooth.” Very
good. Who’s the best at creating smooth motion? The FANUC motion
planner, not you.
Don’t use 5 points when 4 will do. Better yet: don’t use 4 points where
2 will do. Chances are those extra points are causing the slower axes of
the robot to slow your cycle down. If you just move from point A to
point B, the slowest axis has that entire segment to get to where it
needs to be.
Use CNT100 wherever possible. Avoid FINE moves if you can.
On your pick position, see if you can use CNT0. If CNT0 works, try CNT5.
As you change the termination type you might have to tweak the position
itself to achieve the same result, but rounding that corner is going to
be much faster than stopping on a dime. (Note: different CNT values are
going to yield vastly different results depending on segment speeds and
ACCs when you get there… remember that.)
If you have the correct payload settings, you’re not waiting on
anything, your path is optimized and it looks like a smooth dance, I
hope you’re making your cycle time guarantee. If not, your layout is
probably bad or you made some bad assumptions when bidding the project!
If you’re still not there yet, you may consider increasing ACCs, but
here are a few things to watch out for:
“But what about Constant Path?!”You
Constant Path makes the robot follow the same path regardless ofOVERRIDE, not segment speed. Your pick position with Z=-5.0 at CNT5
may have worked great before, but the same move at ACC150 might drive
your robot into the conveyor.
FANUC has really smart people to tune the standard accelerations for
speed and reliability. As soon as you start increasing these
accelerations, you’re putting greater strain on the servos, reducers,
brakes and the arms themselves. Tread lightly.
Remember what we said about being smooth? It’s fairly likely that your
buttery motion ends up looking violent with higher ACCs. If it looks
violent, it’s probably not good for the robot.
Driving the robot harder also increases your risk of over-current (OVC)
and overheat (OVH) faults. Your Accord might drive around the oval until
the gas runs out at 65mph, but how long do you think it can drive
100? 115?
If you’re using a genkotsu robot (M-1iA, M-2iA, M-3iA), did you know
that there’s always a small chance the force of your motion may cause
an arm to pop off?
These robots constantly monitor this likelihood and try to prevent a
“dislocation” by stopping themselves if a dislocation is likely. If
you’re lucky, the software works great and keeps the arms intact. If
you’re unlucky, you’re going to be spending the next hour or so putting
your fancy robot back together.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2013/to-acc-or-not-to-acc/

## Citations

- Primary: ONE Robotics Company Blog (keywords: KAREL, programming, variable, routine, program structure, KAREL syntax).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_39_FANUC_KAREL_Programming_Fundamentals.txt`.
- Classification: articles / topic=karel.

