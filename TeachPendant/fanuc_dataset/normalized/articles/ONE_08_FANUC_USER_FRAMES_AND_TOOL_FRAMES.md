---
id: ONE_08_FANUC_USER_FRAMES_AND_TOOL_FRAMES
title: "FANUC User Frames and Tool Frames"
topic: bg_logic
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

# FANUC User Frames and Tool Frames

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_08_FANUC_User_Frames_and_Tool_Frames.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC User Frames and Tool Frames

Filed under:FANUCTP Programming
Every once in a while I get asked about FANUC’s multitasking capabilities:
“Can I do multitasking with a FANUC robot?”“How do I run a background task with FANUC?”“How do I run an aux axis independently while the robot is doing other stuff?”
The short answer is yes, but there are a number of options. Which one’s appropriate depends on your use-case.
*NOTE:PMC requires a robot software option and the FANUC Ladder PC software. Only recommended for budget systems that don’t have a separate PLC.
I use Background Logic most often, and I’ve written about it before withan Intro to FANUC Background LogicandHow to use BG Logic to to simplify your TP programs. If you don’t need motion, you can probably do it with Background Logic. For almost all other cases, I will generally use theRUNstatement to spawn another task.
NOTE:I almost never useAUTOEXECprograms, Condition Monitors or PMC, so let’s skip over those for now. Let me know if you want to know more about them.
Today I want to talk about theRUNstatement — the basics, potential use-cases and some things to watch for. I’ll wrap things up with a simple KAREL utility that should help with one of the most annoying issues you might see when using theRUNstatement.
You can add aRUNstatement in the TP editor viaINST > Multiple Control > RUN.
On the surface it looks just like a programCALL. You simply provide the program name and any (optional) parameters:
You’re probably aware that process control is immediately given to a called program and returned to the calling program when the called program ends.
RUNstatements work differently. The main program proceeds immediately after theRUNstatement is executed, and both programs will now execute concurrently.
NOTE:The details of how the controller handles task-scheduling are outside the scope of this post, butschedulingitself is a really interesting computer science problem. I learned a lot by takingthis free course on operating systems, and I would highly recommend it if you are interested in learning more about how computers and operating systems (like the FANUC robot controller) actually work.
I’ve generally onlyRUNa concurrent task when I am controlling an external device or independent axis.
You may also want to spin off a separate task when you need to signal something that takes a little while, but you don’t want the robot to wait for a response.
I generally use Flags (F[]) to communicate between tasks. Flags are just boolean I/O bits that are completely local to the robot — perfect for interprocess communication.
Say you wanted to spin off a concurrent task, let the robot do some other stuff without waiting but then you wanted the robot to make sure the task completed before moving on:
Sometimes it’s safe to just fire these tasks off and forget, but it’s usually helpful to have some sort of signaling to make sure your concurrent tasks don’t hang or create race conditions.
Only one task can have motion control for any group at one time. Have you ever noticed thatGROUP_MASKheader in your TP programs? That specifies which, if any, motion groups your program will lock when it is executed.
A FANUC robot can have up to 8 motion groups (a group of axes or a single axis), but most robots are probably just a single group. That’s why theGROUP_MASKheader is usually set to1,*,*,*,*,*,*,*. This indicates that the program will lock motion for group 1 and no other groups.
BGLOGIC programs must not lock any motion groups, so thatGROUP_MASKheader will be*,*,*,*,*,*,*,*.
In general, it may be a good idea to only lock motion when necessary (e.g. use a GROUP_MASK of*,*,*,*,*,*,*,*for your gripper macros, etc.)
Sometimes you want your concurrent task to continue running even if a fault occurs. If this is the case, set theIGNORE PAUSEheader from the programDETAILscreen.
When your robot is running, the TP editor will typically show the main task’s status.
The best way to see what your other tasks are doing is to bring up theSELECTscreen and then press theF4 (MONITOR)softkey. PressENTERto view the task in an editor, and you can alsoPAUSEandABORTeach one individually from this screen.
NOTE:You can also see the program status (but not the source code) from theMenu > Status > Programmenu. HitNEXTto cycle through the current running tasks.
You can configure the UOP cycle stop bit to abort all tasks by going toMenu > System > Configand settingCSTOPI for ABORTandAbort all Programs by CSTOPIto true. (You could also just set the$SHELL_CFG.$USE_ABORTand$SHELL_CFG.$CSTOPI_ALLsystem variables.)
I generally always set these bits. I can’t think of any instances where Iwouldn’twant a single bit to be able to abort everything in an error condition. It’s like giving the PLC access to the TP’sFunction > ABORT ALLbutton.
Ah the dreadedINTP-267 RUN stmt failederror caused byPROG-007 Program is already running. This error is always annoying, typically requires an abort, and I’ve seen a lot of people (including myself) throw some nasty hacks in to try and avoid this. (I’ve even seen this occur while running FANUC’s PalletTool and iRPickTool… maybe it’s fixed now!)
This could simply be a programming bug (e.g. you did not have appropriate checks in place to ensure that your task completed before running it again), but it could also be a case where your concurrent task hung up for some reason (e.g. IGNORE PAUSE header was not set) and did not get resumed properly. Maybe you are not using theAbort all Program by CSTOPIoption.
Wouldn’t it be nice if there was a way to check if a task is running before you attempt toRUNit? I’m looking for something a bit more reliable than aF[1:TASK RUNNING]flag.
I should have written this years ago, but here’s a little KAREL utility that provides just that. You give it the name of a program and a status register id, and it will tell you what the task is doing.
Example:
The possible return values are:
I’ll write another article about the KAREL internals ofTASK_STATUS, but for now you cancheck out the source codeanddownload the latest binary release on GitHub.
NOTE:You’ll need the R632 KAREL software option on your robot in order to load and use this utility.
As a parting note (and I actually did not know this until I was working on writing this post) you can actually use theRUNstatement to resume a paused task by name. This pairs nicely with theTASK_STATUSKAREL program.
Here’s a contrived example:
Traditionally I’ve avoided pausing concurrent tasks, preferring to useWAITstatement to keep things in sync instead, but maybe there are cases when you would legitimately want to use thePAUSEstatement. Paired withTASK_STATUS, you can be sure to avoid those peskyINTP-267andPROG-007errors.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2019/how-to-run-fanuc-programs-concurrently-with-the-run-statement/

## Citations

- Primary: ONE Robotics Company Blog (keywords: UFRAME, UTOOL, user frame, tool frame, coordinate system, calibration, TCP).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_08_FANUC_User_Frames_and_Tool_Frames.txt`.
- Classification: articles / topic=bg_logic.

