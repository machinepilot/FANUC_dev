---
id: ONE_34_FANUC_COLLISION_DETECTION_AND_GUARD
title: "FANUC Collision Detection and Guard"
topic: mastering
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

# FANUC Collision Detection and Guard

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_34_FANUC_Collision_Detection_and_Guard.txt` as part of the TeachPendant migration. Original source: ONE Robotics Company Blog. Review and update `related:` with neighbor entry IDs.

## Body


# FANUC Collision Detection and Guard

Filed under:FANUCLine TrackingVision
Visual tracking is intimidating, much more intimidating than most other
material handling applications. With all the additional hardware
required (cameras, encoders, multiplexers) and steps to get things
moving (camera calibration, tracking frame calibration, vision process
creation, reference setting, accuracy tuning), it’s easy to get
overwhelmed. And you haven’t even made any of your other extremely
important decisions yet:what robot(s) should I use?What is the best layout for this application?Should I use
parallel flow or counterflow?What type of gripper should I
use?Can I get away with a single-pick gripper, or should I
design one that picks two at a time? Should I use PickTool, or should I
write it all from scratch? Lots of questions, difficult answers.
Just like eating an elephant, let’s tackle this problem one bite at a
time:
That list doesn’t look so bad anymore. I’m going to cover the entire
list in two parts. In part one (this post), I’ll go through items 1-5,
and I’ll address items 6-9 innext week’s
post.
Your gripper design is absolutely crucial to the success of your visual
tracking application. As with any other application, your $60k robot
isn’t worth much if it can’t reliably handle your parts at the required
speeds. Because visual tracking applications often end up being
multi-robot, your gripper design can easily save (or cost) you a robot
or two.
Do extensive testing with your actual product. Make sure to do it at
full speed over the entire range of motion. What happens if you push the
robot even harder? Can the gripper hold on to the product while rotating
it? How long can the gripper hold on before damaging the part? How long
does the gripper take to actuate? Is there any way to reduce that time?
Is there anything the gripper can do that will make the robot’s job
easier?
Testing takes time and money, but it will save you both in the long run.
I’ve seen too many projects drag on with revision after revision to the
end-of-arm tool with arguable levels of success.
I personally prefer single-pick grippers, or at least a gripper that
picks its entire payload in one pick-cycle. Making that second pick
while holding onto another part is a lot more difficult. (Will the first
part be in the way? With all the potential for rotation, does the second
gripper slot really save you any time?)
Often an afterthought, reliably recognizing your products is extremely
important. Not only do you have to make sure you can accurately identify
the position and probably orientation of your parts, but, when tracking,
you have to do it quickly.
Lighting is key, so is the color of your conveyor. Use a lens filter!
Make sure to pick a lens and standoff distance so you have a wide enough
field of view (FOV) that minimizesperspective
distortion.
Your conveyor speed and FOV determine how often you need to trigger the
camera.
If your vision process takes longer than your trigger interval, you’re
going to get Vision Overrun errors. Those parts may never get into your
tracking queue.
Of course you also need to snap often enough to not miss any parts. If
you only snap once every FOV length, a part that’s only half-visible in
the first shot will also be half-visible on the other side during the
next snap. A good rule of thumb is to make sure your trigger distance is
less than your total FOV length minus half the length of your largest part.
Vision is worth a post on its own someday.
When FANUC first started pushing into the high-speed visual tracking
market, picking a robot was easy. You could use the M-430iA/2F, and
that’s about it. You might have been able to get away with an LR Mate,
but if you’re conveyors were moving at any sort of speed, you probably
needed the M-430iA. With the advent of their Genkotsu robots (delta),
you have many more (and better) choices.
Right now, there are at least 8 different LR Mate 200iC models, the LR
Mate 200iD aka the mini-Mate, 3 different M-1iA’s, 4 different types of
M-2iA and 2 different M-3iA variants. You may still be able to get an
M-430iA, but you’d probably be better off with one of these other
options.
Which robot should you choose? Personally I would look at a delta robot
first. They are built specifically for these types of applications, and
they don’t suffer from some of the nasty limitations that articulated
robots have when trying to do these jobs. Chances are a single delta
robot can do the job of two LR Mates, and it may end up being cheaper.
Just be careful here since your gripper will have to do twice as much
work twice as fast.
Don’t use more axes than you need. If it can be done with a 3-axis
delta, don’t buy a 4-axis. If it can be done with 5 axes, don’t buy a
6-axis robot. Unless you’re looking to repurpose these robots later,
you’ll save money and probably have better performance.
Keep in mind that an articulated robot can essentially only use half of
its work envelope. If you mount it on a pedestal, it can probably only
use the area directly in front of it. Even if you hang the robot
upside-down, the area directly underneath the robot is a dead-zone which
becomes very troublesom while tracking. Be careful when using an
articulated arm.
Once you are pretty confident in your gripper design and have a favorite
robot, it’s time to start thinking about layout. Layout is always
important, but it’s especially important when you’re trying to do
something extremely fast at the upper limit of the robot’s capability.
It’s tempting to throw a work envelope on top of your proposed layout
and call it done if the robot can reach, but have you considered the
distance the robot will need to track? Boundaries are hard to get right,
and they’re really hard to work with if you get limit errors all over
the place. You shrink your boundaries to fix the limit errors only to
start getting track destination gone errors. Battling a bad layout after
everything is built is the worst.
Now try out your layout and robot in ROBOGUIDE. Don’t have ROBOGUIDE?
Stop now. Do not pass Go. You heard me right: don’t even bother
attempting a high-speed visual tracking application without simulating
it, especially if it looks like it’s going to be more than one robot.
The dynamics of these systems make them very difficult to estimate. You
really have to spend a lot of time in simulation putting different
stresses on the system to get a feel for how it will perform. Use very
conservative gripper delays and run your conveyors faster than you
expect. See where the system’s breaking point is and give yourself some
room.
You may be able to get some help or advice from FANUC’s Material
Handling Segment or a regional office, but remember that it’s your
project. Don’t blindly accept their advice.  Ask stupid questions. Try
to break their assumptions. Stress the system.  Your customer’s not
going to be happy when your excuse for a lagging system is “FANUC said
it would work.”
As with any application, try tomake things easy on the
robot. Optimize both
horizontal and vertical motion. Does the robot really need to go all the
way into that box? Can you use extending and retracting cylinders to
save on some vertical motion? Are they fast enough?
If the system is going to have more than one robot, consider the spacing
between them. Will they interfere with eachother? Notice how moving a
robot upstream or downstream within multiples of your part-length
affects how the robots share work.
This is a big decision, and it depends completely on steps 1, 2 and 3.
If you’re simulating that you are on the very edge of using 1 vs 2 or
using 2 vs 3, you may want to go back and see if you can do something to
give yourself a bit more room. Keep in mind that a single robot doesn’t
have to worry about load balancing, and load balancing is very different
between 2 robots vs. 3, 4, 5, etc. You can’t just say 1 robot can do 100
parts per minute, so 10 can do 1000ppm.
If one delta robot looks like it can barely handle the application, you
may be better off using two articulated arms. The cost will probably be
similar, you’ll probably have a little room to spare, and your gripper
performance becomes less crucial.
Next week I’ll talk about my thoughts on parallel flow vs. counterflow,
hardware requirements, setup and programming. In the meantime, send me
an email or leave a comment if you have any questions.
I email(almost)every Tuesday with the latest insights, tools and techniques for programming FANUC robots. Drop your email in the box below, and I'll send new articles straight to your inbox!
No spam, just robot programming. Unsubscribe any time. No hard feelings!
©2013-2019 ONE Robotics Company LLC. All rights reserved.
Privacy•Terms•RSS Feed

URL: https://www.onerobotics.com/posts/2014/your-first-visual-tracking-application-part-one/

## Citations

- Primary: ONE Robotics Company Blog (keywords: collision detection, collision guard, SRVO-050, sensitivity, torque limit, fault).
- Applicability: FANUC TP Programming, R-30iB Plus.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/articles/ONE_34_FANUC_Collision_Detection_and_Guard.txt`.
- Classification: articles / topic=mastering.

