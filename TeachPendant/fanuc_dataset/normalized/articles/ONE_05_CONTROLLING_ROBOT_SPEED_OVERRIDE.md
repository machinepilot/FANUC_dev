---
id: ONE_05_CONTROLLING_ROBOT_SPEED_OVERRIDE
title: "Controlling Robot Speed Override"
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

# Controlling Robot Speed Override

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_05_Controlling_Robot_Speed_Override.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# Controlling Robot Speed Override

Filed under:FANUCTP Programming
Imagine this: you have a robot that easily keeps up with its task (trust me, these applications do exist!). Like a considerate parent, you allow the robot to run at 70% which still gives it a little time to rest between cycles.
But every time you walk by the cell, the teach pendant shows a glaring 100% override. The robot works its ass off for a few seconds and then sits there motionless, waiting for the next part to come down the line.
You try putting up signs. You hold a special training session onrobot happinessto no avail. The next step is locking the teach pendant away in a cabinet.
All of this could have been avoided if you (or your integrator) took control of the robot override properly.
If you leave it open, it’s going to get changed, and you may find your robot running at 10% one day and 100% the next. You can still give your operators some control, but you’ll probably want to define some sensible limits in your HMI or robot code.
As with most things FANUC, there are several ways to control the override in production. Two of them are built in features provided by FANUC, but you can also do so from a TP program (though I generally don’t recommend it).
Let’s talk about the pros and cons of each method along with my preferred approach: a one-liner you can insert into your background logic.
Did you know that you can set up a pre-flight checklist on your robots?
Navigate to the Program Select menu viaMenu > Setup > Prog Selectand you’ll find eight (as of v9.10) different production checks that the robot can look at before starting.
One of them is  “General override < 100%.” This check can make sure the robot is at 100% before starting and/or resuming, and it can also (optionally) force that override for you.
One issue with this is that it will not prevent people from changing the override while the robot is running.
Lucky for you there’s a system variable for that:$GENOV_ENB. If you set it to false (viaMenu > System > Variables), the%+and%-keys on the teach pendant will be disabled when the teach pendant is off (which it will be during production).
This combination is great if you only ever want to run at 100%, but what if you want more flexibility?
Lucky for you, FANUC has another feature that lets you configure four different overrides based on a couple of input signals.
I am fairly certain that this is a standard option (at least here in North America), but I could be wrong. If your robot has it, the Override Select function can be found underMenu > Setup > Ovrd Select.
The function itself is pretty self-explanatory: two user-defined DIs control the override based on a setup table when the feature is enabled.
Example:
The function is only in effect while the robot is in AUTO. You will still have control in teach mode.
The issue with this is, of course, that you only get four override values. In all honesty this should be more than enough, but a lot of times people want even more control.
ASIDE:My guess is that the feature was developed way back in the day when I/O was hard to come by and came through real wires and input cards (not this magic ethernet stuff we’re spoiled with now). Maybe FANUC will update the feature to accept a GI someday.
The most obvious way to set the override is with theOVERRIDEstatement. You can find this in the teach pendant editor underF1 [ INST ] > Miscellaneous > OVERRIDE.
I’d recommend not using this statement for three reasons:
Reason #1:you can only use this statement to set the override to the value of a register, constant or argument register. If you want to use a GI, you’ll have to set a numeric register first.
Reason #2:if you accidentally send a real number (e.g. 3.14) instead of an integer, you’ll get an “INTP-304 Specified value exceeds limit” error. (The error should probably indicate a type mismatch instead, but this is what you get.)
Reason #3:this statement cannot be used in a Background Logic program. (You’ll get an “INTP-443 Invalid item for Mixed Logic” error.)
Ok, what’s a better way to set the override?
You can set the override directly via the$MCR.$GENOVERRIDEsystem variable.
You can set a system variable from within the teach pendant editor via two instruction menu paths:F1 [ INST ] > Registers > …=(...) > Parameter nameorF1 [ INST ] > Miscellaneous > Parameter name > $...=..., but I would only recommend the first mixed-logic option since it allows more flexibility (e.g. you can use a GI as a value, which we eventually want to do).
NOTE:The “Parameter name” instruction below Miscellaneous gives you anF4 [CHOICE]menu with a few pre-defined system variables (which is nice), but unfortunately$MCR.$GENOVERRIDEis not one of them.
You’ll have to pressENTERon the...and manually type in the name (be sure to get the dots and dollar signs in the right place). (If FANUC is listening, a tree menu would be nice here!) If you misspell something, you’ll see an “INTP-254 Parameter not found” alarm.
Another lesser known system variable that affects robot speed is$MCR_GRP[1].$PRGOVERRIDE. This is essentially a scaling factor for$MCR.$GENOVERRIDEwhich defaults to100.0(no effect).
NOTE:The scaling factor is out of100.0, not1.0. The resulting override will be$MCR.$GENOVERRIDE * $MCR_GRP[1].$PRGOVERRIDE / 100.0.
If for some reason (and I would never do this… 😉), you wanted to slow the robot down globally, but your boss insists on seeing 100% on the teach pendant, you could lower$MCR_GRP[1].$PRGOVERRIDEa bit while keeping$MCR.$GENOVERRIDEat 100 to keep everyone happy. (Of course you could just modify all your segment speeds, but who wants to do that?)
NOTE:While the general override is globally applied, you may notice that$PRGOVERRIDEis unique to each motion group. If you had a controller with multiple groups, you could use$MCR_GRP[x].$PRGOVERRIDEto slow down one group while keeping the other at full speed.
I never set the override within my process TP programs. There’s nothing worse than testing a robot’s path at 10% in T1 (or T2!)  when the robot suddenly takes off at 100% right next to your head.
If you’re going to change the override, do it in a Background Logic program so that there are no surprises.
The simplest background logic program to control the override based on a GI is:
REMEMBER:You have to use the instruction located underF1 [ INST ] > Registers > …=(...) > Parameter name. The other one will not allow you to select a GI as the value.
The problem with this is that your teach pendant+%and-%keys will be overridden at all times, even in T1/T2.
The solution is to simply look atUO[8:TP enabled]and only assign$MCR.$GENOVERRIDEwhen the TP is OFF:
NOTE:Use the instruction located at[ INST ] > IF/SELECT > IF (...). After you insertUO[8:TP Enabled]as the condition you can cursor over to it and useF5 (!)to negate the signal.
You may also want to echo the override back to the PLC:
Make sure your program’s group mask is set to*,*,*,*,*,*,*,*, spin it up from theMenu > Setup > BG Logicmenu, and you’re good to go.
In general I don’t recommend changing system variables. I almost never do, but this is one case where it’s the only option for maximum flexibility.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2019/four-ways-to-control-fanuc-robots-speed-override/

## Citations

- Primary: ONE Robotics Company Blog (keywords: speed override, $MCR.$GENOVERRIDE, GI, GO, BG Logic, override select, speed control).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_05_Controlling_Robot_Speed_Override.txt`.
- Classification: articles / topic=motion.

