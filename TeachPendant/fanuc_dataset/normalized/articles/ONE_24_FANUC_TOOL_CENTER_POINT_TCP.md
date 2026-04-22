---
id: ONE_24_FANUC_TOOL_CENTER_POINT_TCP
title: "FANUC Tool Center Point TCP"
topic: frames
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

# FANUC Tool Center Point TCP

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_24_FANUC_Tool_Center_Point_TCP.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Tool Center Point TCP

Filed under:FANUCBackupTool
The process of sticking PCMCIA memory cards (or now USB sticks) into
each one of your controllers, going to the FILE menu, creating directories,
Backup > All of the above, etc. is a huge pain. I felt this pain very
sharply when working on an 18-robot line years ago.
BackupTool allows you to concurrently backup all the robots on your
project to your PC with a single command.

Download BackupTool v0.0.1 for Windows 64-bit
(Edit: Go tothe BackupTool pageto download the latest version)
(Note: this is considered alpha software, only tested on a 64-bit Windows
7 machine… use at your own risk!)
There’s a README included in the distribution, but here’s a quick
how-to:
[What’s a PATH?](http://en.wikipedia.org/wiki/PATH_(variable))
You can simply typeBackupToolto see a help on available commands,
sub-commands, options, etc.
BackupTool will create a timestamped backup for each robot on your
project that may look something like this:
Let me know if you run into any issues. I’d appreciate any feedback.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/backup-tool-for-fanuc-robots/

## Citations

- Primary: ONE Robotics Company Blog (keywords: TCP, tool center point, tool setup, coordinate, calibration).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_24_FANUC_Tool_Center_Point_TCP.txt`.
- Classification: articles / topic=frames.

