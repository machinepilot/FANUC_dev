---
id: ONE_38_FANUC_ETHERNET_IP_AND_NETWORK_CONFIGURATION
title: "FANUC Ethernet IP and Network Configuration"
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

# FANUC Ethernet IP and Network Configuration

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_38_FANUC_Ethernet_IP_and_Network_Configuration.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Ethernet IP and Network Configuration

Filed under:FANUCWorkflowTP Programming
If you’ve ever worked on a robot with the Constant Path option, you’ve
probably seen these funny motion segment modifiers and wondered what
they were for.
AP_LD and RT_LD stand for “Approach Linear Distance” and “Retreat Linear
Distance.” They guarantee the last (or first on a retreat) Xmm of a
given motion segment to be linear. This can be very useful when you
need to avoid an obstacle or make sure your motions are not rounding
off too soon.
Here’s a quick example:
Assuming your approach position is more than 50mm above the pick
position and your retreat position is more than 75mm above the pick
position (the function can’t do much if you don’t give it enough space
to work), your motion will be linear for at least those distances,
even at CNT100.
I used to accidentally place the modifiers on the wrong motion
statements. Just remember that each statement in your program
represents a motion segment from the robot’s current position to the
provided position. If you want the approach to a position to be linear,
put the AP_LD on that position. If you want the retreat from some
position to another, put the RT_LD function on the final segment.
This is effectively turning your CNT100 into CNT87 or CNT46 or
whatever would be required to round the corner such that the linear
distance is achieved.
If your approach position is only 50mm above the pick position, using
an AP_LD of 50mm effectively changes the CNT100 to a FINE termination
type. This is really slow! Even a CNT0 would be better.
I usually only use these features when I am working in a very tight
space. Maybe the robot has enter 150mm into a fixture with only a
couple millimeters clearance on either side of the gripper. To
guarantee the clearance while still maintaining maximum speed (CNT100),
I might throw an AP_LD150 onto the segment.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2013/ap_ld-and-rt_ld-functions/

## Citations

- Primary: ONE Robotics Company Blog (keywords: Ethernet IP, network, EtherNet IP, communication, PLC, fieldbus).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_38_FANUC_Ethernet_IP_and_Network_Configuration.txt`.
- Classification: articles / topic=motion.

