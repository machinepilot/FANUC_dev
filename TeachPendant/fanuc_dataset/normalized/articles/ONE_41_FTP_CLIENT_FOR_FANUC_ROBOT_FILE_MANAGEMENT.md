---
id: ONE_41_FTP_CLIENT_FOR_FANUC_ROBOT_FILE_MANAGEMENT
title: "FTP Client for FANUC Robot File Management"
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

# FTP Client for FANUC Robot File Management

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_41_FTP_Client_for_FANUC_Robot_File_Management.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FTP Client for FANUC Robot File Management

Filed under:WorkflowFANUC
One of the easiest ways to save time while working on a FANUC robot is
to become familiar with an FTP client. The addition of the USB port on
the Teach Pendant helped bring most people out of the dark ages of
lugging PCMCIA cards around (although many people still use them), but
even USB sticks aren’t the fastest way to get files to and from your
robots.
For those unfamiliar with the concept, FTP stands for File Transfer
Protocol; it’s basically a method for getting files from one computer
to another. One computer (like the robot controller) runs an FTP server
and waits for FTP clients (like your laptop) to connect and issue
commands. You have commands for getting a list of files, downloading
files, uploading files, creating directories, etc. As long as your
laptop is on the same network as your robot, you’re good to go.
There are many GUI-based FTP clients out there, but I find it easiest to
just use the command line. For the example below, I’ll assume you’re
running Windows.
Voila! Your FTP client is connected to the robot’s FTP server. Now what?
Well, let’s say you want to see the current error history.
You just “got” the errall.ls file from the robot which lists all the
recent alarms. What if you wanted to backup all your TP programs?
Whoah… bin? prompt? mget? What do those do? I’ll explain them briefly
here, but in case you forget, you can always type ‘help’ or ‘help bin’
to see what your FTP client says about them.
The ‘bin’ command sets the transfer type to binary. TP files are a
binary format. If you open them up in a text editor, you’re not going to
be able to read them, but the robot reads them just fine. By setting the
transfer type to binary, you’re going to be downloading the file in its
original format. Google is your friend if you want more information on
that.
The ‘prompt’ command saves you from having to answer ‘y’ to each file
download. It toggles whether or not the FTP client should ask you to
confirm downloads/uploads.
The ‘mget’ command stands for ‘multiple get.’ You can use an asterisk as
a wildcard character and the client will attempt to download any files
that match.
It’s very easy to upload files too. Just remember that all of these
operations take place within the current working directory when you
started the FTP client. You can always see your current directory by
using the ‘lcd’ command.
Let’s say you have a modified version of your MAIN.TP file, and you want
to upload it.
Easy as pie. Lets say you wanted to update the robot with a whole
directory’s worth of TP files:
Magic. One thing to note is that you might see errors while uploading if
the Teach Pendant is currently running or editing the file you’re trying
to upload. Make sure to do a FCTN > Abort all and even SELECT another
program before attempting to upload a newer version.
Use the ‘help’ command to find out more about all the commands. There
aren’t very many. I promise you’ll thank me when you stop having to
worry about losing your USB stick and using the cumbersome FILE menu.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2013/using-ftp-to-increase-productivity/

## Citations

- Primary: ONE Robotics Company Blog (keywords: FTP, file transfer, backup, restore, file management, USB, PCMCIA, network).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_41_FTP_Client_for_FANUC_Robot_File_Management.txt`.
- Classification: articles / topic=anti_pattern.

