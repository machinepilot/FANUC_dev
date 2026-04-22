---
id: ONE_10_FANUC_I_O_CONFIGURATION_AND_MAPPING
title: "FANUC I/O Configuration and Mapping"
topic: io
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

# FANUC I/O Configuration and Mapping

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_10_FANUC_I_O_Configuration_and_Mapping.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC I/O Configuration and Mapping

Filed under:FANUCTP Programming
I worked on a palletizing project recently that required serialization. In effect, the product must be tracked through every stop of the process:
The robot simply sends a Digital Output signal to the PLC when any of these events takes place, and the PLC is responsible for sending signals on to the customer’s serialization service.
It’s tempting to simply sprinkleDO[x]=PULSE,0.1secstatements in the appropriate places and be done with it, but I think it is better to design a single interface that the robot will use to handle all serialization requirements.
Robot programmers already have plenty to worry about: safety, motion, logic, I/O, tooling, etc. The list goes on. Now we have to worry about data tracking as well?
Writingclean codeis challenging regardless of your development environment, though it is especially difficult in TPE.
Over the years I’ve found that the best thing I can do is separate my concerns intosmall programs, allowing my high-level routines to be very readable and descriptive.
I likeWikipedia’s definitionfor Separation of Concerns:
In computer science, separation of concerns (SoC) is a design principle for separating a computer program into distinct sections, so that each section addresses a separate concern. A concern is a set of information that affects the code of a computer program.
Instead of adding a bunch of I/O-statements to our high-level routines, let’s think about this serialization requirement as a single component. We can encapsulate the functionality with a smallinterface, hiding the details from the calling program.
The customer specification already numbers our serialization signals, so it makes sense to use these unique identifiers as the argument to our interface.
The high-level routines can simplyCALLthis interface at the appropriate times and trust that the underlying implementation does what it’s supposed to do.
It does not matter ifSERIALIZEis a TP or KAREL program. It does not matter if the signal is sent with a handshake or aPULSE. We are free to bypass serialization entirely with one line of code or swap in new signal definitions behind the scenes. It’s also trivial to find every routine that performs serialization by simply searching forCALLs toSERIALIZE.
Here’s a simple TP implementation:
TheJMP LBL[AR[1]]statement does a “good enough” job of making sure that any invalid calls toSERIALIZEare caught with a runtime exception. Normally I recommendhandling errors gracefully, but i’m ok with the equivalent of apanichere since it would only occur when the programmer makes an error.
This is somewhat contrived, but what if there are two serialization devices: one for testing and one for production? We can implement them separately and delegate to the appropriate one in the mainSERIALIZEroutine.
It does not matter to the calling routines how (or even if) the serialization actually gets done. They’ve done their job by calling the interface at the appropriate time, and that’s all that matters to them.
If you have unix-like development environment (I highly recommendmsys2for Windows), you can quickly find all of your serialization calls with the followinggrepcommand:
I can’t pass up the opportunity to discuss theDon’t Repeat Yourself (DRY) principle.
Had I written the entireSERIALIZE*routines, you would have noticed a ton of duplication: lots ofPULSEstatements and handshakes. Let’s refactor:
Not only do we significantly reduce duplication, but we also provide the opportunity to make sweeping changes in one place. We can make all pulses 200msec by changing one line of code inPULSE_DOUT. We could support handshake timeouts by adding a few lines toHANDSHAKE.
Again, the serlialization programs don’t care about the implementation details of the IO-pulse or handshake mechanisms. They simply call the interface and let those concerns take care of themselves.
My only concern with the above refactoring is a slight reduction in code readability, but I would argue that the benefits Concern Separation and DRY-ness outweigh the small hit. This is due to a limitation in the TP programming language itself: a lack of named constants.
I’d much rather write something like this:
As a programmer I don’t really care thatSIGNAL_ROBOT_PICKEDhappens to be 101. I just want to call the correct handshake. (Constants are supported inTP+, by the way.)
The best I can do for now is add a comment to indicate that handshake’s intent. I prefer descriptive code over comments, but when we cannot write descriptive code we must comment.
…but I digress. Separate your concerns appropriately, and you will find that your core functionality is easier to compose. I often start by writing my ideal high-level programs first, implementing the details later.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2019/tp-programming-with-interfaces/

## Citations

- Primary: ONE Robotics Company Blog (keywords: I/O, DI, DO, RI, RO, signal mapping, rack, slot, configuration).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_10_FANUC_I_O_Configuration_and_Mapping.txt`.
- Classification: articles / topic=io.

