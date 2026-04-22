---
id: ONE_07_POSITION_REGISTER_MATH_AND_OFFSET_CALCULATIONS
title: "Position Register Math and Offset Calculations"
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

# Position Register Math and Offset Calculations

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_07_Position_Register_Math_and_Offset_Calculations.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# Position Register Math and Offset Calculations

Filed under:FANUCTP Programming
Have you ever needed your FANUC robot to search for something and stop when it “sees” it with some sort of sensor?
There are probably 100 ways you could pull this off (macros, background logic, manipulating UOP signals, etc.), but if you’ve been programming FANUC robots for a while, your first thought is probably “SKIP CONDITIONS!” followed almost immediately by “How exactly do those work again? I remember them being kinda weird.”
Or maybe you’re thinking about Touch Skip, theartistoption formerly known as Collision Skip (whoops, bad name). I won’t cover this option here, but it basically gives you a UI for setting up disturbance torque limits that’ll trip your Skip Conditions before an actual collision.
Maybe you’re pretty new to FANUC and TP programming and have never heard of either of these things.
Whatever the case may be, it’s worth knowing how to interrupt the robot’s motion based on some predefined condition. FANUC’s Skip Conditions are probably what you need in most cases, and they are deceptively simple. The usage can be confusing and tends to trip a lot of people up.
Let’s talk about what they’re for, where people make mistakes, why the syntax is confusing and also introduce a seemingly unknown option that’s more clear.
The most common thing people want to do with Skip Conditions is search for something that’s not always in the same spot.
In palletizing we often search for the top of a slipsheet or pallet stack. In material handling we might need to scan a stack of trays to count them (and maybe they don’t stack consistently). Maybe we have a part that varies in length, and we want the robot to scan and see how long it is. We could also stop a motion segment in its tracks if a part-presence signal is lost.
Let’s start with a simple search routine.
Imagine a fixture that holds a stack of parts. It may be empty, full or anywhere in between, and there’s no way for us to know how many parts are in the stack without looking for ourselves.
Luckily we’ve been given a laser on our end-of-arm tool (EOAT). We’re going to point it sideways at the stack, scanning from a start position above where the highest part would be to a bottom position where the laser would be off if the stack was empty.
Here’s some code:
Like I said, deceptively simple. There are only two slightly unusual parts of this entire program: 1) theSKIP CONDITION RI[1]=ONstatement that defines our Skip Condition and 2) theSkip,LBL[501]motion option attached to our move toPR[2:search end].
I purposely kept this program a little vague. What do you think will happen when the robot moves fromPR[1:search start]toPR[2:search end]andRI[1]turnsON?
Cue Jeopardy! thinking music…
You probably correctly guessed that the robot will stop moving toPR[2]whenRI[1]turnsON, but I would be willing to bet that you thought it would then jump toLBL[501].
This is where everyone (including me) gets confused. TheSkip,LBLoption actually works the opposite way. When the Skip Condition is satisfied, the robot stops andmoves onto the next statement. TheLBLis only used when we actually finish the motion segment.
Let me reiterate:the robot only jumps to the specified label if the condition never becomes true and makes it all the way to the destination point.
Here’s the search routine with some comments to show what’s happening:
NOTE:Yes I know the teach pendant doesn’t indent, but wouldn’t it be great if it did? This is how I indent my TP programs in a text editor for legibility.
Clear as mud? Great.
Let’s do another example where we’re monitoring a vacuum signal:
This one feels a little different to me because the “error” condition comes immediately after the motion statement, but I don’t like all the code duplication and jumping around. (In the first example, the “error” condition was where we made it all the way to our destination and jumped to the specified label.)
My guess is that FANUC has gotten some feedback about this instruction over the years, because they (recently? R-30iB I think?) came out with an almost identical instructionSkipJump,LBLthat works the opposite way.
The SkipJump Instruction (R866) option seems to be free (at least in the US) but might require a PAC code to install.
Motion is halted When the Skip Condition is satisfied, and we immediately jump to the specified label. If the Skip Condition never comes true, we get all the way to the destination point and move onto the next line.
Let’s go back to the previous examples and implement them with theSkipJumpmotion option.
First the search routine:
Does this look more natural to you? It certainly does to me.
What happens if you remove theSKIP CONDITIONandSkipJumpmotion options entirely?
The program proceeds like we would expect: search from top to bottom and straight on through the retry logic.
What about theSkipoption version?
Our code is almost identical, but the functionality is completely incorrect. I think that this is the contradiction that makes theSkipoption behavior so surprising to many of us.
Let’s try the vacuum switch example with theSkipJumpoption:
Yep, still looks better. Fewer labels. Our “normal code path” is easier to follow, and we can disable the feature without moving any code around:
You’ll often want to save the robot’s current position to a Position Register (PR) when the Skip Condition is satisfied. Here’s one way to do that:
This might be ok for your application, but the accuracy ofPR[2]will not be great (probably ±2mm or worse?).
If you need to be within ~1.5mm, you can use the Quick Skip (High Speed Skip) motion option. It looks almost just like the normalSkip,LBLoption, but you add aPRto record after theLBL: e.g.Skip,LBL[x],PR[y]=LPOS(orJPOS).
The robot also stops quicker (I guess that’s why they call it Quick Skip), and for this reason you are limited to just100mm/secwith this type of skip. The expected error should be approximately± speed * ITP, but you may get better results with a High Speed Digital Input module.
You’re not limited to just inputs and outputs with your Skip Conditions. You also have thousands of system variables (SKIP CONDITION $...=...) and error codes (SKIP CONDITION ERR_NUM=xxyyy) to watch out for.
So go forth and interrupt your robot’s motion! Fast or slow, obvious or unclear, you should now have a good understanding of your Skip Condition options and how to avoid implementing them incorrectly.
I’m curious to hear what you think about the difference between theSkipandSkipJumpmotion options. Do you agree/disagree?Send me an email!
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2019/how-to-search-with-a-fanuc-robot-using-skip-conditions/

## Citations

- Primary: ONE Robotics Company Blog (keywords: PR[], position register, math, offset, calculation, grid, pallet, coordinate).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_07_Position_Register_Math_and_Offset_Calculations.txt`.
- Classification: articles / topic=bg_logic.

