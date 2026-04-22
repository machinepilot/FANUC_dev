---
id: ONE_14_FANUC_VISION_SYSTEM_SETUP_AND_IRVISION
title: "FANUC Vision System Setup and iRVision"
topic: protocols
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

# FANUC Vision System Setup and iRVision

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_14_FANUC_Vision_System_Setup_and_iRVision.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Vision System Setup and iRVision

Filed under:FANUC
You’ve finished programming your robot, tested it in T1, and now you want to run it faster. If you’re like me, you sometimes forget the details on Remote vs. Local, UOP signals and the different startup types available (RSR, PNS, Style, Other). For your (and my own) reference, here’s a quick no-BS guide on how to get things running.
NOTE:If you like this post and are interested in the programming side of things, be sure to check out mybook on programming FANUC robots.
T1 and T2 are for teaching and testing the robot. T1 limits the tool center point (TCP) speed to a nice and safe 250mm/sec.
If your robot has T2, you probably have an older robot or you’re outside the US. This mode became non-standard in the US several years ago, but it allows you to test-run programs with the teach pendant at full speed. Be careful out there.
When the robot is switched into AUTO, you’re running programs without the teach pendant. In fact, if the teach pendant is enabled, the robot will be in a fault condition. Some other device (covered later) will issue signals to start the robot.
The fence circuit is bypassed in T1 and T2, but it must be closed when in AUTO mode.
Now that your robot is in AUTO, you can choose to start it remotely or locally. This configuration option is on the System Config screen (Menu > System > Config).
When in local mode, the robot will be started from the Standard Operator Panel (SOP) buttons located on the controller.
Be careful:when the robot is in local mode, it will always run whatever program you have selected on the SELECT menu. The robot will ignore any setup you have done on the Program Select method screen.
I generally switch things over to AUTO/Local after some thorough testing in T1. Start out slow with your finger on the HOLD button, gradualling bumping up the override before doing the same thing with the PLC in charge.
When the robot is in Remote mode, it will follow the Program Select method and Production Start method you defined in the system config screen. You’ll probably always use UOP as the Production Start method.
There are four Program Select methods: RSR, PNS, STYLE and OTHER, but I think OTHER is best option.
Ah, OTHER: the simplest, most barebones and easy-to-use startup method. The robot simply runs an explicitly stated program when it receives a start signal.
Set your Program Select Mode to OTHER on the system config screen and then specify a program to run by hitting DETAIL. You can also set the program name via the$shell_wrk.$cust_namesystem variable.
I find that keeping it simple, having the robot start some main task and handling any job requests, etc. from there is generally best, but I’ll briefly summarize the other methods as well.
I’m not sure why anyone would use this program select method. (If you have a compelling reason, please let me know.) RSR basically lets you specify 8 numerically identified programs that correspond to 8 input bits. You have the option to add an acknowledge bit, but it’s not really a full handshake.
The setup screen has you associate a number with each of your 8 RSR bits (e.g. 10, 20, 30, etc.). You can also specify a base that these numbers will get added to (e.g. 100). With these example values, if the RSR1 input is given the robot will execute RSR0110 (base of 100 + RSR1 bit value of 10). RSR2 would execute RSR0120, RSR0130 for RSR3, and so on.
You have to follow this naming convention (RSRxxxx) exactly, but you can modify the RSR prefix via$shell_cfg.$job_root.
I’m not a fan of these non-descriptive names (what the heck does RSR0150 do again?), so I wouldn’t recommend using this method.
PNS is kinda like RSR, but it interprets the 8-bits as a binary number. You don’t have to explicitly set numbers fo each signal, but you can define a base number$shell_cfg.$pns_base. The naming convention is similar (PNSxxxx) unless you change the prefix with$shell_cfg.$pns_program.
This startup type is a bit more useful since it requires less setup and you get more jobs, but I’m still not seeing the benefit here…
Style is basically PNS without a naming convention. You have to explicitly setup a table that associates a given TP program with the input job number.
Additionally, you can enable/disable entries via the setup table. You can also write a comment to remind yourself what your poorly named program does if that’s how you roll.
It seems to me that the RSR, PNS and STYLE Program Select methods are all remnants of an earlier time. Who wants to name their programsRSR0001orPNS1000when you could write something more descriptive likeUNLOAD_LATHE_A?
If you can’t be bothered to setup your own logic for job requests, STYLE is probably your best bet.
Here’s how I might write a simple routine to get a job request:
The PLC would be responsible for validatingGO[1]afterDO[1:job ack]comes on.
Then your main routine might look something like this:
In 2016 I think it’s a little silly to pass integers around… I haven’t personally seen anyone do it this way, but you could (in theory) use Explicit Messaging to set a string register and call the result:
I’m willing to bet you’re going to start your robot with a PLC communicating via Ethernet/IP. I won’t go over the Ethernet/IP setup here (maybe a topic for another post), but let’s quickly cover the various UOP signals and what they do.
On the input side (from the robot’s perspective), you get up to 18 signals, but you’ll probably only need the first 8.
NOTE:You have to enableUIsignals from theMENU > System > Configscreen. Set “Enable UI Signals” toTRUE.
UI[1:*IMSTP]Leave this on all the time. When it drops, the robot will stop immediately, but this should not be used for safety purposes.
UI[2:*Hold]Leave this on unless you want to pause the robot. If this signal ever dips, the robot will slow to a controlled stop, pause its program and wait for a start signal to resume.
UI[3:*SFSPD]This annoying little signal is normally on. When it drops, it will pause the robot and clamp the override to$scr.$sfrunovlim. If you’re in teach, it’ll clamp the override to$scr.$sfjogovlim.
UI[4:Cycle stop]This signal can be used as a cycle stop or immediate abort signal depending on the value of$shell_cfg.$use_abort. If set to true, it will act as an abort signal. If set to false, you’ll have to checkUI[4]in your program andABORTby hand.
UI[5:Fault reset]Normally off, this signal will attempt to reset any errors on your robot. Note: your robot cannot start or resume if any faults are present.
UI[6:Start]This one depends on$shell_cfg.$cont_only. If set to true,UI[6]will only resume a paused program, and you’ll have to useUI[18:Prod start]to start from scratch. If set to false, it will resume or start an aborted program from the cursor position.
UI[7:Home]Pretty useless, but the idea is that your robot will execute a home macro when this signal is received.
UI[8:Enable]When this signal is high, the robot can move.
So basically, to start the robot:
If the robot is paused (from dropping the hold signal, a fault or e-stop):
You’ll get some signals back from the robot if you want. Feel free to use any or all of them to make your PLC more intelligent.
UO[1:Cmd enabled]This is ON when the robot is in Remote mode and not faulted. You can only start/resume the robot when this is ON.
UO[2:System ready]Servo motors are on
UO[3:Prg running]A program is running
UO[4:Prg paused]A program is paused
UO[5:Motion held]On when the robot is actively being held (e.g.UI[2:*Hold]is low)
UO[6:Fault]On when there is a fault that needs to be cleared/reset
UO[7:At perch]When the robot is at reference position #1
UO[8:TP Enabled]When the teach pendant is on
UO[9:Batt alarm]When the CMOS RAM battery voltage is less than 2.6V or robot battery voltage is low
UO[10:Busy]When the robot is thinking
I’m not a PLC guy, but I would:
That about does it. At this point you should know how to start your robot both locally and remotely while in AUTO via whichever program select method serves you best. We also covered the UOP Startup Method which you’ll probably use 99% of the time. (The other option is OTHER, which looks at a system variable$shell_wrk.$cust_start, usually used when the robot is controlled by a PC.)
Let me know if you have any questions or know something about RSR/PNS/STYLE that I’m missing!
If you enjoyed this post and want to learn more about FANUC robot programming, please check out the book I wrote,Robot Whispering: The Unofficial Guide to Programming FANUC Robots.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2016/starting-fanuc-robots-in-auto/

## Citations

- Primary: ONE Robotics Company Blog (keywords: vision, iRVision, camera, calibration, visual process, 2D vision, image processing).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_14_FANUC_Vision_System_Setup_and_iRVision.txt`.
- Classification: articles / topic=protocols.

