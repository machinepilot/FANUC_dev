---
id: ONE_09_FANUC_PROGRAM_TYPES_AND_SUBTYPES
title: "FANUC Program Types and Subtypes"
topic: karel
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

# FANUC Program Types and Subtypes

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_09_FANUC_Program_Types_and_Subtypes.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Program Types and Subtypes

Filed under:FANUCOpen SourceWorkflow
I remember when I first discovered that FANUC robots had the web-based
Comment Tool. No longer would I have to endure the pain of trying to mash
F1 five times just to get the letter “E”, only to accidentally get “F” due
to an extra keypress. I just have to unlock KAREL, head to the robot webpage
and start commenting away.
Better, but still not great.
Most of us use Excel spreadsheets to keep track of our robot data, so we still
have to manually copy things over from the spreadsheet to the robot.
I’ve seen some people develop tools that will export excel data in a special
format for use with a custom KAREL routine that loads the comments. I’ve seen
others write custom CM files based on their spreadsheet data.
Even better, but I’d rather just use my spreadsheet itself.
fexcelis a free open-source tool for setting the comments on your FANUC
robot data and I/O directly from Excel.
fexcelsupports a bunch of configuration flags that tell it where to look
for your data. You tell it where your numeric registers start, where your
position registers start, where your digital inputs are, etc. and fexcel
does the rest.
Let’s say you have a spreadsheet that looks like this:
Send the numeric register and position register comments to the
robot with the following command:
If you renamed your worksheet from the default “Sheet1,” pass in the-sheetflag:
Have an extra column between the ids and the comments? No problem. Set the-offsetflag:
fexcelwill set the comments on all the pieces of data you specify.
It’ll start in the cell you tell it to and keep reading down that column until
it sees a cell that’s not an integer.
The source code and a full description of configuration flags is availableon GitHub. You can download the latest binary release onthe releases
page.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2019/labeling-fanuc-robot-io-and-data-directly-from-excel/

## Citations

- Primary: ONE Robotics Company Blog (keywords: program type, macro, subtype, program detail, group mask).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_09_FANUC_Program_Types_and_Subtypes.txt`.
- Classification: articles / topic=karel.

