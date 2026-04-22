---
id: ONE_36_FANUC_CONVEYOR_TRACKING_INTEGRATION
title: "FANUC Conveyor Tracking Integration"
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

# FANUC Conveyor Tracking Integration

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_36_FANUC_Conveyor_Tracking_Integration.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Conveyor Tracking Integration

Filed under:TestingFANUCTP ProgrammingKAREL ProgrammingWorkflow
If you're looking for a how-to guide onFANUC KAREL programming, you're
probably better off reading myIntroduction
to KAREL Programmingarticle.
One of the things I love about the Ruby community is its dedication and
support for testing. Having very little formal computer science
education, concepts like unit testing and integration testing were
completely foreign to me. After first ignoring everyone’s advice to test
now and test often, I eventually forced myself to learn out of
necessity and now advocate the practice to anyone who will listen.
Having confidence in your code is very important, especially when your
code is the only thing keeping a $100k robot from crashing through a
$500k machine tool. By testing thoroughly, it’s much easier to have
confidence in your code and gives you the freedom to perform large
refactorings while still maintaining essential functionality.
Ok, that was a little heavy. Let’s dumb it down: a test is a bit of code that
proves some other bit of code does what it’s supposed to do correctly.
Taken a step further, Test-Driven Development advocates writing your
test first, before you’ve even written the code you are testing to
ensure that your test fails. You then write your code, run your test
again, and hopefully it passes. Once it passes, feel free to refactor
your code for readability, cleanliness, length, whatever, but feel
confident that you are not changing the functionality because your test
is passing.
Here’s a quick example of how to apply TDD to some HandlingTool TP code.
Let’s say we are writing a small subroutine that adds numbers together
and outputs the result into the provided register. (Contrived I know,
but bear with me.) Maybe we’ll write a test program like this:
The first time we run TEST_ADDER, we’ll get an error complaining that
the program “ADDER” does not exist. Let’s write the smallest possible
piece of code that will fix this issue:
Ok, we don’t have to comment our programs, but you get the idea. We
haven’t actually made the ADDER program do anything yet. That’s the
point! Let’s run our test again. It now fails on the test case,
attempting to jump to LBL[404] which does not exist because the output
register is not equal to the expected value.
Let’s write the smallest amount of code to make this test pass:
You might say, “wait a minute… that’s cheating!” And I would argue
that the program is actually doing everything that is expected of it,
based on our current set of tests. We run TEST_ADDER again, and it makes
it to the bottom with flying colors. Fantastic, but it’s not exactly
what we want the routine to do. Let’s add another test to make it fail:
We run TEST_ADDER again, and although the program makes it pass our
first test, it gets caught up on our 2+2=4 test. We could fool around
and make this test pass without writing a functional “adder” too, but
let’s not waste any more time. How about this:
We run TEST_ADDER again, and voila! both our tests pass. What about our
output register? We aren’t testing the use of of third argument.
Our test now hangs up on the third test. Hopefully you’re starting to
get the feel for the 1) write test, 2) watch test fail, 3) write code to
fix, 4) watch test pass cycle.
We run TEST_ADDER one more time, and it makes it all the way through. We
now have a fully functional “adder” routine. Contrived? Yes? Useful for
demonstration purposes? Hopefully.
You may be wondering what would happen if we accidentally leave out an
argument. What happens if we provide a String argument? Does it work
with REAL numbers? I’ll leave it as an exercise for the reader to add
tests for these cases.
KAREL is a lot more powerful than TP. However, since the source-code is
not visible on the controller, you’re pretty much working with a black
box. I’d argue that because of this fact alone, it’s more important to
test your KAREL routines to ensure that they work in all cases and fail
in expected ways. The last thing you want is for a customer to call with
a question about “UNINITIALIZED DATA” used on some line of some KAREL
routine where they have absolutely no way of troubleshooting themselves.
Lets say at some point the requirements of your ADDER routine became too
complex to do in TP. You decide to port your TP program into KAREL. This
might be a little nerve-wracking if you didn’t have a TEST program that
exercised its full functionality, but it should be no sweat to re-write
the routine in KAREL, plug it into your TEST program, and once things
pass, throw it right into your production system with no worries.
Motion is a bit trickier to test. It also gets pretty difficult to test
the complex interation of I/O between machines, sensors, PLCs, other
robots, etc. Difficulty acknowledged, but I always try to test what I
can.
One of my recent projects involved using a tool changer to switch
between two different EOATs. Each subroutine would generally use one of
the two EOATs, but the robot could start each subroutine with either
tool in hand. If the robot had the required tool already, it should just
move along. Otherwise it would have to drop off its current tool and
pick up the required tool before proceeding. How do you test this?
I ended up using just a few routines:
GET_TOOL_ID figures out what tool the robot is currently using based
on the I/O state at the tool-change fixtures. DROP_TOOL would get the
robot from wherever it is to the tool-change fixtures and drop off the
current tool (if one is present). GET_TOOL takes an argument of 1 or 2
and takes care of dropping off a tool if required and ensuring the robot
has the correct tool when things are finished.
To test this functionality, I just had a simple routine like this:
Simple but effective. If you start the test routine with no tool, it
gets tool 1. If the robot already has tool 1, it simply glances over
that routine and moves on try and get tool 2. If things are working
correctly, the robot should drop off its current tool before grabbing
the required tool while running in the loop.
I didn’t use TDD here, but I certainly could have. I probably would have
started with the GET_TOOL_ID routine, writing tests to ensure that the
robot ends up with the correct TOOL ID value based on simulated states
of IO. I could then make sure the DROP_TOOL routine gets called if the
TOOL ID is not equal to the provided argument, and I could verify that
the result of GET_TOOL_ID matches the argument of GET_TOOL once the
routine is completed.
Follow the80-20 rule.
Don’t worry about testing every single line of code. Test what matters.
The point is help you maintain confidence over your growing codebase but
not at the cost of efficiency. Testing takes time, but trust me, taking
a few minutes to write some tests that exercise some complex
interactions can save you many headaches when your robot keeps getting
stuck with a 100-pound part in its gripper with nowhere to put it.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2013/testing-fanuc-tp-and-karel-code/

## Citations

- Primary: ONE Robotics Company Blog (keywords: conveyor tracking, line tracking, encoder, trigger, pick-on-the-fly).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_36_FANUC_Conveyor_Tracking_Integration.txt`.
- Classification: articles / topic=karel.

