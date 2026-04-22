---
id: ONE_40_FANUC_FORCE_SENSING_AND_COMPLIANCE
title: "FANUC Force Sensing and Compliance"
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

# FANUC Force Sensing and Compliance

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_40_FANUC_Force_Sensing_and_Compliance.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Force Sensing and Compliance

Filed under:WorkflowFANUC
As a contract programmer, it’s important for me to be as efficient as
possible. Coding faster saves my clients money and allows me to move on
to the next project quicker. Over the years I’ve developed quite a few
tools and habits that help me do more work faster.
I picked upRuby on Railsback in 2007. One
of the things I really like about it is its liberal use ofconvention
over configuration.
By defining conventions for things that always come up, you don’t have
to waste any time or energy developing solutions for them.
Almost every application requires registers for the following:
Defining these before you even start coding helps, but it will take you
even less brain-power to decide where they’re going to be once and for
all. Why not use these?
How many times do you need to use a temp register for a calculation? If
it’s always R[2], you’ll never have to pull out your register definition
spreadsheet to find out where it is.
It’s very easy for a clean program to become nasty quickly once error
handling and conditionals start getting included. My thoughts on good
labeling are enough for another post, but I do use a couple of labeling
conventions that keep my programs consistent/readable and save my brain
from reinventing the wheel.
Some people use LBL[9999] or LBL[10000], but jumping to the end of a
subroutine is so common that you should probably standardize it.
Error: LBL not found
I come from a web programming background. The HTTP response code that
indicates a “Not Found” condition is 404. It’s generally displayed when
the user follows a broken or dead link. How does this relate to FANUC
TPE programming?
My programs will never actually feature a LBL[404] definition, but I’ll
probably have JMP LBL[404] sprinkled throughout my code. I use it to
prevent the program from doing something stupid such as setting a PR
Z-value to a value beneath the floor. For example:
If everything has been implemented correctly, R[10:Pick position] should
always be within 1 and 10, but on the off-chance that someone gets
things into a bad state, we won’t accidentally move to PR[11].
I usually use the 500 range of labels for different error conditions.
Borrowing again from the HTTP status codes, 5XX response codes indicate
that “the server is aware that it has encountered an error or is
otherwise incapable for performing the request.”Wikipedia
You’ll see stuff like this all over my code:
Why not just use labels 1-3 and do something like this:
Or if you really wanted the -hundred range:
First of all, no error checking outside of jumping to a missing label
(that you didn’t purposefully fail to include). You definitely could do
this, but I just find it much explicit and readable. Even if you
included error checking, it’s still not terribly clear which Product IDs
are actually valid:
Maybe it’s just the second-line indent of the SELECT statement, but it
just looks much more readable to me. The intent is clear and it includes
error checking for free with the ELSE block. There’s obviously a point
where the SELECT gets ridiculous (e.g. 15 or 20 cases), but it works
well for the majority of situations.
Don’t underestimate how important a good workflow is in being
productive. Saving yourself a minute or two every time you have to do
a repetitive task adds up to serious time in the long run.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2013/using-conventions-to-improve-your-workflow/

## Citations

- Primary: ONE Robotics Company Blog (keywords: force sensor, force control, compliance, insertion, contact, force torque).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_40_FANUC_Force_Sensing_and_Compliance.txt`.
- Classification: articles / topic=anti_pattern.

