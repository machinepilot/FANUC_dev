---
id: ONE_04_DIAGNOSING_FANUC_ALARM_CODES
title: "Diagnosing FANUC Alarm Codes"
topic: error_codes
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

# Diagnosing FANUC Alarm Codes

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_04_Diagnosing_FANUC_Alarm_Codes.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# Diagnosing FANUC Alarm Codes

Filed under:FANUCTP Programming
It’s inevitable. You’re setting up your robot, programming it or running production, and you come across an alarm code that you don’t recognize. What do you do? Call tech support? Google? Read the manuals?
Based on some of the questions I’ve seen, I think a lot of people are unaware of the troubleshooting resources available at their fingertips.
Your robot probably has a ton of help files and documentation available right on the teach pendant. That eDoc CD that came with your robot is also packed with documentation gold, and there are also a couple of ways to lookup alarms online.
Have you ever noticed the littleHELP/DIAGbutton in the lower left corner?
I think that little guy is easy to miss, nestled among the 60+ other buttons on the teach pendant. If you accidentally pressed it in the past, maybe you were just annoyed when you were rudely taken away from your current screen and forced to look at documentation.
If you’re confused about something, this built-in documentation can be very helpful. Split your teach pendant screen withSHIFT+DISPand then pressHELP. This will bring up some documentation for the active screen on the left.
Of course the teach pendant is probably not the most ideal place to read documentation. The resolution is low, the split pane is pretty skinny, there’s no search function, etc.
Luckily, you can view these files in your web browser too (if you’re on the same network).
Open up the robot web page (e.g.http://robot.ip.address) and then click “Active Program/Variables/Diagnostics” and select “Error/Diagnostic files (text) available on MD:”. On the next page you can click on the link to “TPMENU.DG” to see a list of the screens available from theMENUbutton. Click on the help file link located in the “Help Files” column to read the same stuff you’d see on the teach pendant.
NOTE: This is as of v9.10, R-30iB+. If you’re on an older controller (R-30iB, R-30iA), the “Error/Diagnostic files” link is right on the homepage.
I’m not sure why there’s not a big fat “Help” button on the robot web page, but there you go.
Help files and documentation are great, but error code descriptions and remedies are even better.
Did you ever notice theHELPkey is a twofer?
NOTE:I was sorry to discover the fact that “twofer” is a real word. Ilooked it up.
Just like theDISPkey and the minus (-) key (I bet you didn’t knowSHIFT+-gives you a comma), the blue labeled function on the button is the “shifted” function, in other words: what happens when you press the key while also pressingSHIFT.
PressingSHIFT+DIAG(orSHIFT+HELP, depending on how you look at it) while an alarm is active will bring up a rather large display of the current program status and alarm which isn’t terribly useful. But if you click the “Continue” button, it’ll bring you right to the documentation for that particular alarm code, showing you the cause of the alarm and any remedies for it.
If an alarm is no longer active, you can get to the error code documentation from the Alarm Log History screen (Menu > Alarm > F3 (HIST)). Scroll down to the alarm you’re interested in and pressSHIFT+DIAGagain. For some reason this only brings you to the full documentation for the alarm’s facility code (you’ll have to scroll down to the correct error number), but it’s a nice feature to have.
If you’re like me and prefer to view documentation on your PC, you can lookup these alarm codes in the official “Controller Software Error Code Manual” (available on your robot’s eDoc CD or perhaps the CRC website).
Another option is the excellent web-based alarm code tool developed by Jie Huanghere. Simply enter an alarm code (e.g. “SRVO-063”) and get thedocumentation for itinstantly.
Bonus:if you havecurlavailable in your terminal, you can get the raw cause and remedy response right there:
Bonus #2:If you’re super cool and use abash-like shell, you can add a simple function to your.bashrcto quickly get alarm code data:
You can then get error codes by simply typing:
Faults, errors, alarms, whatever you want to call them are inevitable, but knowing how to look up what they really mean and how to fix them will help you get your robots back up and running quickly.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2019/how-to-diagnose-fanuc-alarm-codes-and-error-codes/

## Citations

- Primary: ONE Robotics Company Blog (keywords: alarm code, SRVO, INTP, diagnosis, error, fault, HELP, DIAG, troubleshooting).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_04_Diagnosing_FANUC_Alarm_Codes.txt`.
- Classification: articles / topic=error_codes.

