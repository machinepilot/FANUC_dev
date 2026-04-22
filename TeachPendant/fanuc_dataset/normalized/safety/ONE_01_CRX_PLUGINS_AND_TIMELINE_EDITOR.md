---
id: ONE_01_CRX_PLUGINS_AND_TIMELINE_EDITOR
title: "CRX Plugins and Timeline Editor"
topic: safety
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

# CRX Plugins and Timeline Editor

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_01_CRX_Plugins_and_Timeline_Editor.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# CRX Plugins and Timeline Editor

Filed under:FANUCCRXCollaborative RobotsTP ProgrammingWorkflowKAREL Programming
I contend that programming FANUC robots is easy and can be learned quickly. But what if the idea of writing code is too intimidating or you just don’t have time?
Wouldn’t it be great if you could make the robot do a job without writing a single line of code?
That’s the idea behind FANUC’s new(ish) timeline editor forCRX robots. You basically program the robot by dropping functional blocks onto a timeline. My two-year old could figure it out.
FANUC’sCRX series of robotsare their newest collaborative robots (ones that can work right next to humans) that feature a new tablet for programming instead of the traditional teach pendant.
Functional blocks you say? What sort of functional blocks?
FANUC provides the basic building blocks for any robot application: motion statements, assigning values to registers, turning I/O on and off, calling subroutines, branching control structures, etc.
If these technical terms are foreign to you, you may want to check out my book:Robot Whispering: The Unofficial Guide to Programming FANUC Robots. I basically walk you through your first material handling application, going over everything you need to know about programming FANUC robots to be productive.
This is great for general programming, but it feels a lot like writing code. What if you could package complicated functionality into a single icon?
You can with a custom CRX plugin.
Think of CRX plugins like apps you install on your phone. Just install from a single file, and you’re good to go.
Plugins basically provide web-interfaces between the tablet and the controller. They can configure things on install, and they can also provide custom configuration menus and icons for user use.
The tablet is how you configure and control the robot. Think of it like a touch screen in a Tesla. The screen interacts with a computer that makes the car drive. In the same way the tablet interacts with the controller that makes the robot arm move.
The program probably loads some custom TP and KAREL programs on install. Maybe one of them runs every time the robot boots. It may also setup some configuration screens and set some system variables.
I’ve written a lot aboutTP ProgrammingandKAREL programmingin the past. TP programs are the traditional FANUC robot programs we’ve written for decades, and KAREL programs are a bit lower-level and allow more complex functionality.
Custom screens can be provided that show up underneath the main “Plugins” menu heading on the tablet UI:
Maybe the setup screen configures the communication between the robot and an external device, and the status screen displays some production data in an easy-to-consume format. You don’t need to include a PDF manual with your plugin because the documentation/help lives right alongside it on the controller.
If you’ve never used one of FANUC’s CRX collaborative robots, you may not be familiar with the new timeline editor, but like I said before, my two-year old could figure it out.
You get a timeline and an array of icons that represent functional blocks (e.g a linear move or a joint a move), and you can drag these blocks onto the timeline. The icons can be rearranged and configured individually. The timeline is executed left to right when you press play.
I’ve done a couple of plugins that interact with third-party devices. The device runs a TCP/IP server, so we include a socket messaging client in our plugin. All we have to do is configure the hostname and port, and then the plugin can connect and start talking with the device.
What does the device do? Anything. Maybe it’s a gripper or a welder or some sort of vision sensor. The sky’s the limit.
If we were working with some sort of smart gripper, maybe the plugin provides some global setup screens and a few icons: grip, ungrip and check grip status.
If it was a welder, there are probably some setup screens and icons for weld start, weld end and preset selection. Maybe the plugin has packaged up an entire weld in a single weld instruction that includes positions for the start and end of a weld.
A vision sensor plugin might include an icon to snap an image and get an offset, or maybe it packages up an entire vision-guided pick cycle into a single icon.
The point is that any complex functionality is hidden from the user. The user just drags configurable icons onto the timeline. It doesn’t really feel like writing code.
FANUC provides a plugin development manual, but honestly things are still a little rough.
They provide some components (e.g. buttons, text boxes for integers, reals, strings, list menus, etc.) and a build script to help transform these components into usable HTML and JavaScript. However, these components are a bit awkward to use, and you really do need to have a fair amount of JavaScript and KAREL experience to get things to work.
I eventually abandoned the FANUC iHMI components for my own custom components with a more modern JavaScript frontend framework (e.g.React,Vue.js,Svelte). This allows me to produce more complex interactions than can be done with the provided components.
Whether you use FANUC’s iHMI components or develop your own, the web pages need to exchange data with the controller. The iHMI components, once initialized, do this somewhat automatically. FANUC also documents some low-level APIs you can use to develop your own components.
The basic idea is that these setup screens persist data to the controller in KAREL variables stored in CMOS. (We store them in CMOS so the values aren’t lost upon a power cycle.)
Once these variables have been set, your plugin’s background tasks or icons can then use that data as necessary.
Icons are basically just a frontend for a TPCALLstatement. TheseCALLstatements can accept arguments, and those arguments are generally what the frontend of an icon change.
CALLstatements basically let the executing robot program dive into another program before returning to the current program.
For example, let’s say you had an icon that selects a preset on a device. The underlying program call might look like this:
When you click on the icon for this preset selection, you just see a drop down menu with the name of preset five selected.
If the user were to drop another “select preset” icon onto the timeline, they could select a different preset. The only thing that changes is the underlying program call’s argument:
The current values of the underlying arguments are sent to the JavaScript frontend whenever the icon is initialized, so you can pre-populate any form data with the icon’s current configuration.
It’s really cool to see FANUC open up a bit to 3rd-party developers. There is a lot of opportunity to bring complex functionality to these collaborative robots in an easy-to-use package.
I have mixed feelings about the tablet UI and timeline editor itself. On the positive side I think just about anyone can grasp how a timeline works in a matter of minutes, but I don’t like how you only get an extremely high-level overview of what’s going to happen when you glance at the timeline.
Maybe it’s just because I’m very comfortable reading code, but I would love to see FANUC provide APIs to include relevant icon-metadata onto the timeline itself so you don’t have to click on an icon to see some details.
The concept of ‘no-code’ development for FANUC robots is appealing. However, users will still require some initial training to understand the robot’s operations. FANUC has started providing a setup wizard to assist in achieving a basic operational state, but novice users may still need a few hours of guided instruction to become proficient.
Working on these plugins for the past year has been incredibly rewarding. My journey into web development began well before joining FANUC in 2008. Merging my long-standing passion for web development with programming FANUC robots has been an exciting and fulfilling experience.
If you’re considering developing a plugin or curious about what this technology can offer, please get in touch. I’m eager to explore how these innovations can benefit you and your customers.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2024/simplifying-robotics-mastering-fanuc-crx-plugins-and-timeline-editor/

## Citations

- Primary: ONE Robotics Company Blog (keywords: CRX, collaborative robot, timeline editor, plugin, drag-and-drop, no-code programming).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_01_CRX_Plugins_and_Timeline_Editor.txt`.
- Classification: safety / topic=karel, safety-routed.

