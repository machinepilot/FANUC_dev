---
id: FANUC_REF_MOTION_OPTIONS
title: "Motion Options"
topic: motion
fanuc_controller: [R-30iB, R-30iB Plus]
system_sw_version: [V9.x]
language: TP
source:
  type: generated
  title: "FANUC Teach Pendant Help System / Operator Manual"
  tier: generated
license: reference-only
revision_date: "2026-04-22"
related: []
difficulty: intermediate
status: draft
supersedes: null
---

# Motion Options

## Summary

Migrated from `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Motion_Options.txt` as part of the TeachPendant migration. Original source: FANUC Teach Pendant Help System / Operator Manual. Review and update `related:` with neighbor entry IDs.

## Body


6. MOTION OPTIONS INSTRUCTION 6. MOTION OPTIONS INSTRUCTION PROGRAM ELEMENTS 6. 
MOTION OPTIONS INSTRUCTION Motion options can be used to provide additional info
rmation to perform specific tasks during robot motion. Motion options include Ac
celeration override Refer to Section 6.1, " Acceleration Override " Advanced Con
stant Path Refer to Section 6.2, " Advanced Constant Path " Linear Distance Corn
er Region Process Speed Max Speed Break Refer to Section 6.3, " Break " Constant
Path Refer to Section 6.4, " Constant Path " Coordinated motion Refer to Section
6.5, "Coordinated Motion " Corner Distance Control Refer to Section 6.6, "Corner
Distance Control Option" EV (extended velocity) Refer to Section 6.7, " Extended
Velocity EV Motion Option " Simultaneous EV Independent EV Incremental motion Re
fer to Section 6.9, " Incremental Motion " Offset Refer to Section 6.10, " Offse
t " Offset position register Refer to Section 6.11, " Offset Position Register "
Remote TCP Refer to Section 6.12, " Remote TCP Motion Option (optional) " Search
[ ] Refer to Section 6.13, " Search [ ] Motion Option " Skip label Refer to Sect
ion 6.15, " Skip Label " Time before/Time after Refer to Section 6.16, " Time Be
fore / Time After " Tool offset Refer to Section 6.17, " Tool_offset " Tool offs
et position register Refer to Section 6.18, " Tool offset position register " Wr
ist joint Refer to Section 6.20, " Wrist Joint " 6.1. Acceleration Override J P[
1] 50% FINE ACC50 The acceleration override motion option specifies the accelera
tion/deceleration override value for each axis during motion. Acceleration overr
ide shortens or lengthens the acceleration time when the robot moves from a star
ting position to the destination position. Acceleration override is programmed a
t the destination position. The acceleration override value ranges from 20 to 15
0%. This value is a percentage of the acceleration. For example, an acceleration
override of 50 means the robot will take twice as long to accelerate or decelera
te. Figure 18, " Acceleration Override " shows how the acceleration override is 
used. The acceleration override was created to allow the user to make specific m
oves slower or more conservative for cases when extra care is needed. The usage 
of acceleration override over 100% could allow more aggressive motion, but may a
lso cause jerky motion and, if the Collision Guard option is loaded, false colli
sion alarms could occur. In general, the usage of acceleration override over 100
% should be limited. This setting may reduce the life of the mechanical unit bec
ause the default tuned accelerations are being overridden by more aggressive val
ues. Figure 18. Acceleration Override 6.2. Advanced Constant Path In addition to
the Constant Path feature the Advanced Constant Path package consists of the fol
lowing functions for easy teaching and cycle time reduction. Linear Distance eit
her Corner Region (refer to Corner Region Termination Type) or Corner Distance (
refer to Corner Distance Control) Process Speed Max Speed It requires that the C
onstant Path option be loaded and enabled. Linear Distance Overview Linear Dista
nce is a robot motion feature that is useful for pick and place material handlin
g applications such as palletizing. Figure 19, " PICK and PLACE Application " sh
ows a typical pick and place application. If all termination types are FINE or C
NT0, then the pick and place path would be as shown. Figure 19. PICK and PLACE A
pplication The robot starts at P1 and goes through P2 and picks a part at P3. It
then goes through P2 to P4 and then to P5 where it places the part. Typically, h
owever, FINE and CNT0 is used only to reach P3 for PICK and to PLACE at P5. For 
all other motions, high CNT values are used. For instance, the actual path might
look like Figure 20, " PICK and PLACE Application with CNT100 " . Figure 20. PIC
K and PLACE Application with CNT100 Robot is at P1 J P[2] 100% CNT100 L P[3] 200
0 mm/s FINE L [P2] 2000 mm/s CNT100 J [P4] 2000 mm/s CNT100 L [P5] 2000 mm/s FIN
E This kind of a path will give you better cycle time. However, you do not know 
how much linearity you will get going from P2 to P3 (for pick) or from P4 to P5 
(for place). In order to get the desired linearity, you would adjust either the 
positions P2 or P4, or you would experiment with different CNT values. For examp
le, you might shift P2 or P4 higher or lower, or you might use CNT50 at P2 or P4
. With Linear Distance, you do not have to guess and experiment. If you want the
last 100mm before pick and the last 150mm above place to always be straight abov
e P3 and P5 respectively, you can use Linear Distance for specifying these amoun
ts. Refer to Figure 21, " Adjusting P3 and P5 with Linear Distance " . Figure 21
. Adjusting P3 and P5 with Linear Distance The program would be (from P1): J P[2
] 100% CNT100 L P[3] 2000 mm/s FINE AP_LD100 L P[2] 2000 mm/s CNT100 RT_LD100 J 
P[4] 2000 mm/s CNT100 L P[5] 2000 mm/s FINE AP_LD150 This is a convenient way to
design motions for pick and place. By only adjusting the linear distance, you ca
n determine the appropriate tradeoff between cycle time and approach/retract lin
earity. Note Linear Distance is implemented on the controller to control the lin
earity immediately after a pickup at the infeed and just before placement on the
pallet. Linear Distance guarantees the distances you specify. Due to ITP resolut
ion, Linear Distance cannot match your value exactly. However, the linear distan
ce that you specify will be the minimum value that system will try to achieve. F
or example, if you specify 100 mm linear distance, the system might provide 103 
mm linear distance, but it will never provide linear distance less than what you
specified. How it Works Linear Distance uses two motion option elements: AP_LD: 
Approach Linear Distance AP_LD is used for a place motion. L P[2] 2000mm/s CNT0 
AP_LD100 L P[2] 2000mm/s CNT0 AP_LDR[1] In the second example, the distance is s
pecified indirectly via register #1. RT_LD: Retract Linear Distance RT_LD is use
d for a pick- motion. L P[3] 2000mm/s CNT100 RT_LD100 L P[3] 2000mm/s CNT100 RT_
LDR[1] In the second example, the distance is specified indirectly via register 
#1. Figure 22. RT_LD: Effect of CNT Value The RT_LD value affects the corner of 
P3-P2-P1 in Figure 22, " RT_LD: Effect of CNT Value " . The higher the value of 
RT_LD, the smaller the corner will be. When the RT_LD value is greater than or e
qual to the distance between P3 to P2, the corner will become 0. The motion will
automatically become FINE regardless of the CNT value you specify. Figure 23. Pl
ace Motion: Two Possible Traces The AP_LD value affects the corner of P1-P4-P5 F
igure 23, " Place Motion: Two Possible Traces " . The higher the value of AP_LD,
the smaller the corner will be. When the AP_LD value is greater than or equal to
the distance between P4 to P5, the corner will become 0. The preceding motion (m
otion from P1 to P4) will become FINE regardless of the CNT value for that move.
Limitations The linear distance function only supports motion group 1 by default
. Set the system variable $LDCFG.$group_msk to 3 to support a second group. The 
linear distance function only supports the linear motion type. The linear distan
ce function only supports position (x, y, and z) and not orientation (w, p, and 
r). The linear distance function only supports articulated robots and does not s
upport Independent Axes or Positioners. The local condition trigger time might b
e different than without Linear Distance. However the timing is repeatable. When
multiple group motion is used, the motion will be synchronized. However, if more
than one group has linear distance enabled, all the groups will have linear dist
ance satisfied. When using max_speed (refer to max speed section below), the spe
cified Linear Distance may not be guaranteed. Linear Distance function does NOT 
support Coordinated Motion (Linear Distance function will be automatically disab
led for motions with COORD option). Linear Distance function does NOT support Co
ntinuous Motion Types such as Weave, Continuous Turn, and Robot Link. (The Linea
r Distance function will be automatically disabled with the continuous motion ty
pe.) Linear Distance function might not work with TCP speed prediction function 
(TCPP). With Linear Distance specified, TCPP results might not be correct. How t
o Use Linear Distance Note Due to ITP resolution, Linear Distance cannot match y
our value exactly. However, the linear distance that you specify will be the min
imum value that system will try to achieve. For example, if you specify 100 mm l
inear distance, the system might provide 103 mm linear distance, but it will nev
er provide linear distance less than what you specified. Procedure 2. Using Line
ar Distance Conditions You have created a teach pendant program. Your teach pend
ant program contains at least one linear motion instruction. Steps Press SELECT.
Move the cursor to the name of the program you want to modify and press ENTER. C
ontinuously press the DEADMAN switch and turn the teach pendant ON/OFF switch to
ON. To touch and modify motion instructions, move the cursor to the line number 
of the motion instruction you want to modify. Note To use Linear Distance, you m
ust modify a linear motion instruction. Move the cursor to the empty space at th
e end of the linear motion instruction that you want to modify and press F4, [CH
OICE]. You will see a screen similar to the following. Motion Modify JOINT 10 % 
1 Retract_LD 5 TIME BEFORE 2 Approach_LD 6 TIME AFTER 3 Tool_Offset 7 DISTANCE B
EFORE 4 Tool_Offset,PR[ 8 --- page--- LD 5/8 4:J P[2] 100% CNT100 5:L P[2] 2000m
m/sec CNT10 : Offset,PR[1] AP_LDR[1] 6:L P[2] 2000mm/sec CNT100 : RT_LDR[1] 7:J 
P[1] 100% CNT100 Select item If you want to use Linear Distance on an approach p
oint, select Approach_LD. If you want to use Linear Distance on a retract point,
select Retract_LD. Type the number of millimeters that you want the tool center 
point (TCP) to approach or retract using Linear Distance. Note The default value
is “direct” which means that the value is a specific number in millimeters. To u
se a value stored in a register, press F3, INDIRECT, and type the register numbe
r. Corner Region Termination Type (CRy) L P[2] 100 mm/sec CRy CR y is an optiona
l termination type that can be used to adjust the corner rounding for Cartesian 
motions. When you use the CR termination type, you must specify the corner regio
n value, y, (in millimeters). Caution The Corner Distance and Corner Region opti
ons are mutually exclusive meaning that if one option is selected, the other one
is not available. Consider this choice carefully before teaching the robot path.
To use CRy (where y is in mm) termination type, one has to set $czcdcfg.$cd_enab
le = FALSE and cycle power. Corner Region value is the distance from the startin
g of a corner path to the taught position, as shown in the following figure. Whe
n CRy is specified, TCP path will maintain the corner path within the specified 
region, meaning that the actual distance from the starting/ending of a corner pa
th to the taught position is less than or equal to the specified corner region v
alue (y). Figure 24. Corner Path When you set corner region, use the following g
uidelines: Specify the corner region in millimeters Corner region value can rang
e in value from 0 mm to 1000 mm The smaller the corner region value, the closer 
the robot will get to the taught position, and the less the corner rounding With
a larger corner region value specified, the robot will not get as close to the p
osition and the more corner rounding CRy versus segment distance If the specifie
d corner region value, y, is greater than half the segment distance, then the ac
tual value used is limited to half segment distance as shown below Figure 25. Ha
lf Segment Length Teaching Techniques You must be careful about the half distanc
e rule stated above. Keep in mind that because of the half distance rule, with l
arge specified corner region value, corner path may still be close to the taught
position when the segment distance is short. Use the following guidelines when y
ou teach a path: Minimize the number of taught positions Reteach positions using
the CR termination type to fit the path instead of adding positions Constant Pat
h with respect to Program Speed Changes Program section with consecutive CR y – 
path could be maintained much better compared to other termination types even wh
en program speed changes, as shown in the following figure. Figure 26. Program S
peed Changes Compatibilities and Limitations Motion Type CRy supports Cartesian 
motion types such as LINEAR and CIRCULAR J motion type is not supported Multi Gr
oup Motion For multi group motions, motion will be synchronized. The corner path
is generated as a result of the synchronization of applicable CRy for all involv
ed groups; CRy termination type only supports articulated robots and does not su
pport INDEPENDENT AXES or POSITIONERs Motion Options CRy supports the following 
motion options: Group motions RTCP Line Tracking CRy has no obvious geometric me
aning (corner path would be naturally generated by motion blending) during the f
ollowing transitions between COORD and non-COORD (if supported) between RTCP and
non-RTCP between Tracking and non-tracking . If you specify both Linear Distance
and CRy termination type, then Linear Distance has preference over CRy in determ
ining a corner path, as shown in the following figures. Figure 27. Corner Path d
etermined by CRy if Linear Dist is satisfied Figure 28. Corner path is determine
d by Linear Distance Process Speed PSPD xxx Process speed is a motion option con
trol feature that allows you to adjust robot speed to be faster or slower along 
a given path (if applicable, the path would be maintained the same regardless of
xxx), where xxx is an integer you specify. The larger the value of xxx is, the f
aster the robot will move along the given path. Process speed is useful for appl
ications with continuous path motion that don’t normally use maximum program spe
ed; for example, sealing and waterjet cutting. Typically, the process controls t
he program speed: how fast the sealing gun can dispense, and how fast the waterj
et can cut. For these applications, teach the desired path using normal methods,
tweaking taught position, speed, termtype and ACC. After the path is taught, if 
you want to adjust its process speed from the nominal taught value, but do not w
ant to change the path, you can use the Process Speed feature. Add this motion o
ption to the range of motion lines where adjustment is required. PSPD 100 is equ
ivalent to the default cases without PSPD option. PSPD greater than 100 means fa
ster process speed, while maintaining the same path. PSPD less than 100 means sl
ower process speed, while maintaining the same path. You can still change other 
fields in the motion for further tweaking, but the same original rules apply; th
at is, the path will change. This allows you to adjust the path easily, even tho
ugh PSPD is used. For PSPD greater than 100, the system internally limits the ac
hievable (but higher) process speed, based on the jerk/acceleration margin avail
able from the default case. Be careful to use the PSPD option to reduce cycle ti
me while maintaining the same path since the jerk/acceleration value will be hig
her. An example is palletizing, where additional factors such as vibration, duty
cycle, reducer life, and so forth, affect cycle time. Caution Process Speed can 
cause jerky motion if applied too aggressively. To avoid jerky motion, use a red
uced speed. PSPDxxx can be added to any selective motion line in a TP program, a
nd is applicable to all motion types. For examples, see the following: Case 1 : 
if xxx = 100, motion behavior is exactly the same as 100% speed override in the 
default case, as though there were no PSPD100 Case 2 : if xxx > 100, the speed w
ill be faster than 100% speed override in the default case Case 3 : if xxx < 100
, the speed will be slower than 100% speed override in the default case Default 
case: 1 J P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 L P[3] 500 mm/sec CNT0 Fast
er motion case (path is the same, cycle time is shorter): 1 J P[1] 50% FINE PSPD
110 2 L P[2] 500 mm/sec CNT100 PSPD110 3 L P[3] 500 mm/sec CNT0 PSPD110 Slower m
otion case (path is the same, cycle time is longer): 1 J P[1] 50% FINE PSPD50 2 
L P[2] 500 mm/sec CNT100 PSPD50 3 L P[3] 500 mm/sec CNT0 PSPD50 Note The system 
will internally limit the speed override such that the resulting motion performa
nce is within mechanical capabilities. As a result, a large value of xxx may not
take effect in some cases and the actual speed override may be smaller than the 
specified value. Limitations Under T1 mode, PSPDxxx (with xxx>100) will not take
effect PSPDxxx (with xxx>100) might not take effect for the motion line that has
max_speed as programmed speed in a TP program The PSPD option does NOT support T
CP speed prediction function (TCPP) in the first release. That is, for the motio
ns with PSPD option, TCPP might not result in correct results; The PSPD option d
oes not support Continuous Turn Coordinated motions Robot Link With large PSPD v
alue or very short segments, the actual corner path might deviate from the one w
ithout PSPD option. Max Speed L P[1] max_speed CNT100 In some applications, the 
desired speed is the maximum speed that the robot can deliver. For joint motion 
moves, the system delivers the maximum capability of the robot; that is, one of 
the axes reaches its maximum speed. For linear moves, the system delivers the sp
eed that is specified in the teach pendant instruction. However, the maximum lin
ear speed of 2000mm/sec imposes a limit on the capability of the motor to reach 
higher speeds. The robot can move faster than the speed specified in the motion 
instruction. The max speed option allows you to specify a linear motion that wil
l use the maximum speed capability of the robot. It improves cycle times in Load
/Unload applications by speeding long linear motions. When this option is loaded
, the choice of max_speed will be displayed in the speed field of the teach pend
ant motion instruction for a linear motion. The max_speed option affects only th
e motions for which the speed is specified as max_speed. Note When you load this
option, the itp_time will be set to at least 12ms. If you change the motion type
from Linear to Joint, the speed field will change to 100%. When the speed field 
changes from max_speed to another choice, the speed value will return to the ori
ginal speed value.. Warning When you specify max_speed, the robot will run at hi
gh speed. Be sure any loose parts are firmly attached and that the workpiece is 
secured. Otherwise, you could injure personnel or damage equipment. Limitations 
If unsupported options are used, max_speed will be disabled automatically. No wa
rning or error message will be displayed. This option does not support the follo
wing: Any tracking option, such as line tracking, TAST, Mig-Eye, Coordinated mot
ion, and so forth. When these options are used, the max speed option will defaul
t to 2000 mm/sec. Multiple group motion RTCP function If you run a program with 
an override speed different than 100%, the system will drive the robot such that
one of its axes will reach the override value of its maximum joint speed. The lo
cal condition trigger time might have some variation. If the path becomes too ag
gressive, you might need to use ACC to smooth it. If you are using Dry Run, max 
speed will be disabled and the speed specified in dry run will be used. If you a
re using Org path resume, max speed will be disabled for the motion line that is
resumed. If T1 is selected, the T1 speed will be used. In single step mode (FWD/
BWD) max speed will be disabled and the maximum speed value will be used. Max sp
eed will be disabled automatically for a circular motion. The max speed option w
ill still apply when the Miscellaneous teach pendant instruction LINEAR_MAX_SPEE
D is used. The robot will try to attain the maximum speed capability of at least
one of its axes. It determines the maximum speed for the current move by compari
ng the teach pendant instruction LINEAR_MAX_SPEED with the maximum linear speed 
of 2000 mm/sec. The ratio of these two speeds is the percentage of the maximum a
xis speed that the axis will reach. For example: the maximum linear speed is 200
0 mm/sec. 1. LINEAR_MAX_SPEED = 1200 2. L P[1] max_speed CNT1000 The ratio of 12
00 to 2000 is 60%. The system will drive the robot such that one of its axes wil
l reach 60% of its maximum joint speed for line 2 of the program above. Max spee
d does not work with TCP speed prediction function (TCPP). That is, with Max spe
ed, TCPP results may not be accurate. Max speed does not support the following f
unctions (the system will automatically disable the Max speed feature): Line Tra
cking RTCP function Multi-group motion 6.3. Break BREAK is a motion option that 
does not start the motion segment until the cursor moves to the motion line in t
he TP program. With BREAK option in a motion statement, the constant path featur
e may not be maintained. BREAK can be used with the WAIT statement for applicati
ons that need to change the corner path depending on WAIT time, as shown in the 
following example. 6.4. Constant Path Constant Path is a motion control option t
hat provides enhanced motion performance for all motion types in the following a
reas: Constant path With Constant Path, the robot maintains the same path regard
less of static or dynamic speed override changes. A path that has been taught an
d tested at a low speed override will be maintained when the program is executed
at 100% override. Constant Path with respect to T1/T2/Auto Mode With Constant Pa
th, the robot maintains the same path in different modes. For example, a path th
at has been taught and tested in T1 mode will be maintained when the program is 
executed in Auto mode. For exceptions, refer to the Limitations section. Enhance
d path accuracy The path will be executed as taught, using a straight line or ci
rcular motion. Constant Path Regardless of WAIT Statements Maintains same path r
egardless of duration of Wait I/O instruction Maintains same path regardless of 
duration of Wait xx sec instruction. The robot will decelerate along the path un
til the WAIT instruction expires. If the WAIT duration is long enough, the robot
will decelerate to a stop. After the WAIT instruction expires, the robot will ac
celerate and resume the original path. Figure 29. Constant Path Regardless of Wa
it To get R-J3iB behavior, use the BREAK motion option: 1: L P[1] 2000 mm/s CNT1
00 BREAK 2: WAIT DIN/xxSec 3: L P[2] 2000mm/s CNT100 In this example, Line 3 wil
l not affect motion until the WAIT expires. The path will shift toward P[1], dep
ending on WAIT duration. Semi-Hot Start Limitation Constant path cannot be maint
ained through a Semi-Hot Start cycle. When the program is resumed, the robot wil
l move toward the taught position of the paused line without blending of previou
s lines. If original path resume is enabled, the robot will move to the stop pos
ition before moving toward the taught position. Teach Pendant Instruction Limita
tions with respect to Hold, Stop, Resume, and Override Along the Path Warning So
me instructions cannot assure Constant Path motion because they dynamically chan
ge program execution. These instructions do not necessarily result in path varia
tion (with respect to modes, WAITs, and overrides), but path variation is possib
le. The instructions in this category are as follows: Frame instructions: UFRAME
_NUM, UFRAME, UTOOL_NUM, UTOOL Branching instructions: IF, SELECT, CALL Miscella
neous instruction: $PARAMETER = ... Program control instructions: PAUSE, ABORT M
acro program instruction SKIP instruction TRACK instruction Variable motion spee
d instructions Sensor instructions: RCV, SENSOR_ON, SENSOR_OFF Palletizing instr
uction: PALLETIZING-B, PL[ ] BREAK motion option The following instructions are 
constant path when the position registers are locked. When position registers ar
e unlocked, the path may vary. Position register instructions: PR[ ], PR[ ] INC 
Offset instructions: OFFSET, TOOL_OFFSET Constant Path Look Ahead Limitation Cau
tion The amount of segment look ahead available for determining the path is limi
ted. If there are not enough segments available to identify the path, the path c
ould deviate toward the taught point of the last available segment. Limiting the
number of segments that blend together at the same time helps to avoid this prob
lem. Programming Guideline To allow the best constant path functionality, avoid 
teaching a path with several of these characteristics: ACC< 100 High CNT values 
High processor loading High speed Many segments in a short distance Short segmen
t lengths Constant path behavior for motions with WAIT statement Normal executio
n With the R-30 i B Plus motion system loaded and enabled, while executing a WAI
T statement, when possible the robot will decelerate along the path of the motio
n lines that follow the WAIT statement. If the WAIT duration is long, the robot 
will decelerate to a stop on the path. Some teach pendant instructions do not su
pport constant path during WAIT: refer to Section 26, " WAIT INSTRUCTIONS " for 
teach pendant instruction limitations. After the WAIT statement completes, the r
obot will accelerate to normal speed and continue the rest of the path. The path
will remain the same regardless of WAIT time. For example, 1 J P[1] 50% FINE 2 L
P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 Hol
d/resume The R-30 i B Plus motion system will maintain the same path regardless 
of WAIT time when possible, even when Hold/resume interrupts the teach pendant m
otions near a WAIT statement. case 1: Hold/E-stop at the motion line prior to WA
IT statement 1 J P[1] 50% FINE cursor –> 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 4
Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 case 2: Hold/E-stop at WAIT statement (
cursor at non-motion line) 1 J P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 R[1] =
1 cursor –> 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 case 3: Hold/E-stop at mo
tion line after WAIT statement 1 J P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 R[
1] = 1 4 Wait DI[1] = on cursor –> 5 L P[3] 500 mm/sec CNT0 Single step executio
n after Hold/E-stop Single step Forward execution after Hold/E-stop Assume that 
Hold/E-stop occurs when single step execution is not enabled. If single step for
ward execution is enabled after Hold/E-stop occurs, then users will observe (1) 
the first single step forward: robot moves to stopped pose (may be zero distance
move if not jogging away) and then posts “CPMO-069 can’t resume with STEP (G:1)”
is posted (2) single step forward again: robot moves to the destination position
of the motion line at cursor Caution Single step execution (FWD and BWD) is rela
tive to the TP cursor line, not current robot position. After Hold or E-stop the
current robot position may be far from the taught point indicated by the TP curs
or (especially in T1 mode or low override). Single step execution after Hold/E-s
top will move to the taught point indicated by the TP cursor, not on the origina
l program path. A collision could occur if the single step execution path is obs
tructed. case 1: Hold/E-stop at the motion line prior to WAIT statement Single s
tep forward execution will move robot to the destination of the cursor motion li
ne. After HOLD/E-STOP 1 J P[1] 50% FINE cursor -> 2 L P[2] 500 mm/sec CNT100 3 R
[1] = 1 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 After 1st SSTEP FWD 1 J P[1] 
50% FINE cursor -> 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on 5 L P
[3] 500 mm/sec CNT0 After 2nd SSTEP FWD 1 J P[1] 50% FINE cursor -> 2 L @P[2] 50
0 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 case 2: Ho
ld/E-stop at WAIT statement (cursor at non-motion line) Single step forward exec
ution will move the robot to the destination of the motion line prior to the WAI
T statement. After HOLD/E-STOP 1 J P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 R[
1] = 1 -> 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 After 1st SSTEP FWD 1 J P[1
] 50% FINE -> 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on 5 L P[3] 5
00 mm/sec CNT0 After 2nd SSTEP FWD 1 J P[1] 50% FINE -> 2 L @P[2] 500 mm/sec CNT
100 3 R[1] = 1 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 Note As shown in this 
example, the robot position is more likely to be close to P[2] than P[3] because
the previous motion line defines the corner location. case 3: Hold/E-stop at the
motion line after WAIT statement. Single step forward execution will move robot 
to the destination of the cursor motion line. After HOLD/E-STOP 1 J P[1] 50% FIN
E 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on -> 5 L P[3] 500 mm/sec
CNT0 After 1st SSTEP FWD 1 J P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1
4 Wait DI[1] = on -> 5 L P[3] 500 mm/sec CNT0 After 2nd SSTEP FWD 1 J P[1] 50% F
INE 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on -> 5 L P[3] 500 mm/s
ec CNT0 Single step Backward execution after Hold/E-stop Assume that single step
execution is not enabled at the time of the Hold. Single step backward execution
after Hold/E-stop will cause the robot to move back to the destination position 
of the previous motion line. case 1: Hold/E-stop at the motion line prior to WAI
T statement. Single step backward goes to destination of previous motion line. A
fter HOLD/E-STOP 1 J P[1] 50% FINE -> 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wa
it DI[1] = on 5 L P[3] 500 mm/sec CNT0 After BWD -> 1 J @P[1] 50% FINE 2 L P[2] 
500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 case 2: 
Hold/E-stop at WAIT statement (i.e. cursor at non-motion line) Caution Single st
ep backward goes to destination of second previous motion line. (Single step for
ward goes to destination of previous motion line.) After HOLD/E-STOP 1 J P[1] 50
% FINE 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1 -> 4 Wait DI[1] = on 5 L P[3] 500 m
m/sec CNT0 After BWD -> 1 J @P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 R[1] = 1
4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT0 case 3: Hold/E-stop at the motion lin
e after WAIT statement. Single step backward moves to destination of previous mo
tion line. After HOLD/E-STOP 1 J P[1] 50% FINE 2 L P[2] 500 mm/sec CNT100 3 R[1]
= 1 4 Wait DI[1] = on -> 5 L P[3] 500 mm/sec CNT0 After BWD 1 J P[1] 50% FINE ->
2 L @P[2] 500 mm/sec CNT100 3 R[1] = 1 4 Wait DI[1] = on 5 L P[3] 500 mm/sec CNT
0 6.5. Coordinated Motion J P[1] 50% FINE COORD The coordinated motion option de
scribes motion for multiple motion groups. When this option is used, multiple mo
tion groups move together to maintain the same position relative to each other. 
Motion speed which is specified in the line is relative speed for coordinated mo
tion. This option is effective on linear and circular motion. 6.6. Corner Distan
ce Control Option The Corner Distance Control Function Option provides users wit
h a termination type called CDy and a program header for CNT termination type in
order to enhance the motion performance of Cartesian motions (e.g. linear and ci
rcular motion but not joint motion) in the following areas: Enhanced path accura
cy The path will be executed as taught, using a straight line or circular motion
. Direct corner adjustment This allows direct corner rounding distance adjustmen
t for each motion instruction, if you are not satisfied with the corner generate
d by the motion with other termination types. This is provided in the corner dis
tance termination type, CDy (where y is in mm). Speed accuracy The robot will tr
y to maintain the programmed speed around a corner as long as the motion is with
in the mechanical capability of the robot. If constant speed is not feasible, th
e function will lower the corner speed from the programmed speed automatically. 
Caution The Corner Distance function uses the actual payload information when ca
lculating the corner speed. Therefore, you must set the payload correctly during
installation. Otherwise, the corner speed will not operate correctly. For CNT te
rmination type, the function provides two different choices for users to choose 
by setting the TPE program header (“Corner/Speed Control” program header): If th
e program header is set TRUE, then the function is enabled for the Cartesian mot
ions with CNT termination type: the function will control corner path and corner
speed. If the program header is set FALSE, then the function is disabled for the
Cartesian motions with CNT termination type. That is, the motion performance for
those motions is similar to the system with the function disabled. Enabling/Disa
bling the Function This function requires Constant Path option enabled. To enabl
e/disable the function after loading the option, set $czcdcfg.$cd_enable = TRUE 
or FALSE, respectively. In order for the change of the system variable to take e
ffect, one has to turn off and then turn on the power. By default, $czcdcfg.$cd_
enable = TRUE. Caution The Corner Distance and Corner Region options are mutuall
y exclusive meaning that if one option is selected, the other one is not availab
le. Consider this choice carefully before teaching the robot path. To use CRy (w
here y is in mm) termination type, one has to set $czcdcfg.$cd_enable = FALSE an
d cycle power. When $czcdcfg.$no_header = FALSE, on Teach Pendant one can access
to the program header. By setting $czcdcfg.$no_header = TRUE, the program header
will not be displayed. To access to the program header, press Select button on T
each Pendant, cursor to the TP program name and then press Detail button. Use (F
2) or (F3) to see the program header. Caution The motion performance, in terms o
f path and speed, could be very different for motions with CNT termination type 
with and without the program header set to TRUE. Note The path and speed behavio
r of a system using the Corner Distance option are different from those systems 
that do not use Corner Distance function even if the motions use the CNT termina
tion type. Motions with Fine termination type or CNT0 behave the same with or wi
thout Corner Distance Control function. Be careful when you change the program h
eader setup and always verify the motions at safety speed right after you change
it. Corner Distance Termination Type L P[1] 100mm/sec CDy If you want to adjust 
the corner rounding distance for a motion instruction, you can use the corner di
stance termination type, CDy. When you use the CD termination type, you must spe
cify the corner distance (in mm) . Corner distance is the distance from the corn
er path to the actual taught position. Half Distance Rule With Corner Distance f
unction enabled, the beginning and end of the corner path for Cartesian motions 
should be shorter than half the distance of the shorter of the two consecutive l
ine segments. This is called the half distance rule . The segment distance refer
s to the distance between the taught points and the half distance is half of the
segment distance. The deviation distance refers to the distance from the taught 
corner point P[2] to where the corner path deviates from the taught path. The co
rner distance is the distance from the taught corner point P[2] to the corner pa
th. With the Corner Distance function enabled, the deviation distance CANNOT exc
eed the half distance for Cartesian motions. When the segment distance between t
aught points is short, the half distance rule is applied, in which the deviation
distance is set equal to half the segment distance. As a result, the corner path
is much closer to the taught point P[2], compared to the case in which the taugh
t points are far apart. When you set corner distance, use the following guidelin
es : Specify the corner distance in millimeters. Corner distance can range in va
lue from 0 mm to 1000 mm. The smaller the corner distance, the closer the robot 
will get to the position, and the less the corner rounding. With a larger corner
distance, the robot will not get as close to the position, and the more the corn
er rounding. Caution Some motion instructions that use the CDy option might caus
e jerky motions - especially for short distances. Occasionally, you can improve 
the motion by ] adjusting the CDy parameter, or by moving the taught positions f
arther apart. When you use the corner distance termination type, the function wi
ll maintain constant speed if possible; otherwise, the system will slow down the
robot at the corner. Teach Pendant Instruction Limitations Certain teach pendant
instructions cause the robot to decelerate toward the destination position befor
e the motion instruction is executed, regardless of the termination type specifi
ed. These teach pendant instructions will override the corner distance and corne
r speed settings. In this case, the actual corner distance and achieved location
speed may be less than the specified values. The instructions are divided into t
wo categories: Category 1: Instructions in this category cause the robot to dece
lerate, by default. However, if you override the default behavior using the LOCK
PREG and UNLOCK PREG instructions, the corner path and corner speed specified wi
ll be used. The instructions in this category are as follows: Position register 
instructions: PR[ ], PR[ ] INC Offset instructions: OFFSET, TOOL_OFFSET Category
2: Instructions in this category cause the robot to decelerate at all times, reg
ardless of the termination type specified. You cannot change these default value
s. The instructions in this category are as follows: Frame instructions: UFRAME_
NUM, UFRAME, UTOOL_NUM, UTOOL Branching instructions: IF, SELECT, CALL Wait inst
ruction: WAIT + TIMEOUT Miscellaneous instruction: $PARAMETER Program control in
structions: PAUSE, ABORT Macro program instruction SKIP instruction TRACK instru
ction Variable motion speed instructions Sensor instructions: RCV, SENSOR_ON, SE
NSOR_OFF Palletizing instruction: PALLETIZING-B, PL[ ] Corner Path With Corner D
istance Function enabled, a corner path is generated as follows: The corner path
between two line segments is within the three taught positions that define the a
djacent line segments. For long segments, the system computes the corner path, a
nd tries to maintain constant programmed speed around the corner path if it is w
ithin the mechanical capability of the robot (done during factory robot tuning).
For short segments, corner path will start and end at half the distance of the s
horter of the two line segments. As corner rounding reduces, constant speed arou
nd corner cannot be maintained and speed slowdown occurs. For short segments wit
h Corner Distance function disabled, as speed is increased, corner rounding is i
ncreased. Therefore, as speed is increased, the path is changed. With Corner Dis
tance function enabled, for short segments, the half distance rule is applied wh
ere the corner starts and ends at a distance that is the shorter of the half seg
ment distances that form the corner. Path Orientation Guidelines Given two taugh
t positions, the segment time is computed as the larger of location time and ori
entation time. Location time is the time to move from the start location to the 
destination location based on program speed. Orientation time is the time to mov
e from start orientation to the destination orientation based on the maximum Car
tesian rotation speed $PARAM_GROUP[].$rotspeedlim. If orientation time is greate
r than location time, the effective location speed will be slower than the progr
am speed. This is true with or without Corner Distance function enabled. In orde
r to achieve constant program speed around a corner with Corner Distance functio
n enabled, the orientation time must be less than the location time. For multi g
roup motions, if other group dominates the motion (i.e. the group takes longer t
ime), then the effective location speed may be slower than the program speed. As
a result, constant program speed around a corner may not be achieved even with C
orner Distance function enabled. Compatibilities and Limitations Corner Distance
function requires Constant Path function. To make Corner Distance function take 
effect, Constant Path function must be enabled. Motion Type CDy termination type
supports Cartesian motions such as LINEAR and CIRCULAR. CDy termination type sup
ports CIRCULAR ARC motion type (motion type A). However, the system may not be a
ble to control the corner speed (to maintain constant speed). Corner Distance fu
nction does not take effect for JOINT motions. CDy termination type only support
s articulated robots and does not support INDEPENDENT AXES or POSITIONERs. Motio
n Termination Type With Corner Distance function enabled, CRy termination type i
s NOT supported. The system will post error message for motions with CRy . With 
Corner Distance function loaded, only if the function is disabled, then CRy term
ination type can be supported. With Corner Distance function enabled, for motion
s with CNT termination type, depending upon the TP program header, “Corner/Speed
Control Program Header” , the system yields the following performance: If “Corne
r/Speed Control” program header is set TRUE, then the function will take effect:
control the corner path and corner speed; If “Corner/Speed Control” program head
er is set FALSE, then the function is disabled for the motions with CNT terminat
ion type. Multi Group Motion Corner Distance function supports multi group motio
ns, though motion will be synchronized. Motion Options Auto Singularity Avoidanc
e function If program header “Enable Singularity Avoidance” is enabled, then the
motion performance for the programmed motions with CDy termination type is simil
ar to that of the motions with CNT termination type. That is, actual corner dist
ance may be less than the specified one and corner speed may not be constant. If
program header “Enable Singularity Avoidance” is disabled, then this function wi
ll control the corner path and corner speed for the motions with CDy termination
type. RTCP Corner Distance function supports the motions with RTCP option; Corne
r Distance does not make sense for the transition between RTCP and non-RTCP moti
ons. In that case, the system will generate a nature corner path regardless of t
he specified corner distance. COORD Corner Distance function does not support mo
tions with COORD. However, the system will try to maintain the taught corner pat
h as much as possible without controlling corner speed. LINE TRACKING Corner Dis
tance function supports Line Tracking. However, the system may not be able to co
ntrol the corner speed. TCPP Corner Distance function supports TCP speed predict
ion function. LINEAR DISTANCE Corner Distance function supports LINEAR DISTANCE 
option, though LINEAR DISTANCE has preference. PROCESS SPEED Corner Distance fun
ction supports PROCESS SPEED option. MAX SPEED Corner Distance function does not
support MAX SPEED; With Corner Distance function enabled, for motions with MAX S
PEED specified, the function will disable MAX SPEED dynamically. CORNER REGION C
orner Distance function does not support corner region function. With Corner Dis
tance function enabled, the system will post error message for motions with CR t
ermination type. Note In ArcTool, Corner Distance function is enabled for linear
and circular motion types, but is dynamically disabled (turned off) for motion t
ypes that include weaving or coordinated motion. In that case, effective corner 
distance and actual location speed may be less than the specified values. Teachi
ng Techniques You must be careful about the half distance rule. Keep in mind tha
t because of the half distance rule, the specified corner distance cannot be sat
isfied when the distance is short. Use the following guidelines when you teach a
path: Minimize the number of taught positions. Reteach positions using the CD te
rmtype to fit the path instead of adding positions. Without Corner Distance func
tion or Corner Region function enabled, you have to teach additional positions t
o get a small corner with high speed. Also, you have to touch each point individ
ually to correct any problems. With Corner Distance function enabled, you do not
need to do this. Teaching a Flexible Path When you use Corner Distance function,
you can teach a small corner with relatively few positions. Procedure 3. Teachin
g a Flexible Path Determine the straight line that fits the tangent of the direc
tion change point of the path. Teach positions where the tangents meet. Minimize
the number of taught positions because of the half distance rule. Maximize the d
istance between path nodes. Avoid sharp angles between taught line segments. The
amount of corner speed slow-down is proportional to the angle between line segme
nts and the length of line segments. Use the CD termtype to specify the corner d
istance, where appropriate. 6.7. Extended Velocity EV Motion Option In addition 
to the programmed robot speed, the extended velocity (EV) motion option allows t
he specification of the programmed extended axis speed. The EV motion option has
the following two options: Simultaneous EV Independent EV Simultaneous EV J P[1]
100% FINE EV50% The programmed simultaneous EV is defined as a percentage of the
maximum extended axis speed (1% - 100%). If the EV motion option is not specifie
d, then the extended axis motion is planned based on the maximum extended axis s
peed. This means that the default motion without the EV option is equivalent to 
simultaneous motion with EV100%. In simultaneous EV, the extended axis moves sim
ultaneously with the robot axes. This means that they both start and end at the 
same time for each motion segment. In order to achieve simultaneous motion, the 
robot motion time is compared with the extended axis segment time during plannin
g. The longer time will be used for both the robot and the extended axis so that
they both reach the destination at the same time. In cases where the robot motio
n time is longer than the extended axis motion time, the actual extended axis sp
eed will be lower than its programmed extended axis speed so that robot motion s
peed is maintained. When the extended axis motion time is longer than the robot 
motion time, the actual robot speed will be slower than its programmed speed in 
order to maintain simultaneous motion. When there is extended axis motion but no
robot motion, the programmed extended axis speed will be used as specified, even
if it could be the default maximum speed. Independent EV J P[1] 100% FINE Ind.EV
50% Like simultaneous EV, the programmed independent Extended Velocity is also d
efined as a percentage of the maximum extended axis speed (1% - 100%). In indepe
ndent EV, the extended axis moves independently of the robot axes. Both the exte
nded axis and the robot axes start each motion segment at the same time, however
, because of their independent speed rates, they might not reach the destination
at the same time. The planned motion cannot execute until both the extended axis
and the robot axes have reached the destination. 6.8. FacePlate Linear This func
tion will allow robot to move with faceplate linearly according to user’s taught
point with its designed TCP. When this option is added, the faceplate will move 
linearly. The TCP will no longer be linear. TCP will move as kind of arc when th
ere is orientation move. This function is suitable for Positional application (m
aterial handling), not path application (sealing, painting). Most of the robot w
rist can move faster than the major axis. When this option is applied for a larg
e orientation move, the move time might be reduced. There are limitations for th
is options TCPP is not supported. TCPP will report faceplate speed Constant Path
is required Utool have to parallel to faceplate Can not loaded with Coordinated 
motion, Remote TCP Only Picktool, Handlingtool and Pallettool is supported. All 
the other application will not be supported. The FPLIN motion modifier will only
be presented when the motion line is Linear. Add the FPLIN option by select the 
FPLIN as following figures ( one for iPendant and the other for legacy pendant) 
6.9. Incremental Motion J P[1] 50% FINE INC The incremental motion option specif
ies that the destination position is an incremental motion amount from the previ
ous position. To use the incremental motion option, do the following: Caution If
you use the incremental motion option in a motion instruction, the position or p
osition register in that instruction will be uninitialized. Also, all instances 
of that same position or position register in your program will be uninitialized
. If you do not want this to happen, use a new position or position register in 
the motion instruction that will include the incremental motion option. If you w
ant to use the same incremental motion elsewhere in your program, copy the entir
e motion instruction and paste it where you want to use it. Add a motion instruc
tion. Do not include the incremental motion option. Add another motion instructi
on. Be sure to include the incremental motion option. Move the cursor to the rig
ht of the motion instruction you just added. Press F4, [CHOICE]. Select Incremen
tal. You will see the message, "Position(P[n]) has been uninitialized." Move the
cursor to the position component of the instruction and press F5, POSITION. Each
position component will be set to uninitialized and the position representation 
screen will be displayed. See Figure 30, " Position Representation Screen " . Fi
gure 30. Position Representation Screen Position Detail P[2] UF:0 UT:1 conf: N 0
0 X ******.*** mm W ******.*** deg Y ******.*** mm P ******.*** deg Z ******.***
mm R ******.*** deg Note If your program is set with multiple groups or extended
axes, you must enter appropriate values in the extended axes and group position 
components in order for the motion instruction to be executed. Move the cursor t
o each position component you want to change, type the increment you want the ro
bot to move, and press ENTER. If you do not want to change a component, set it t
o zero. 6.10. Offset OFFSET CONDITION PR[x] J P[1] 50% FINE Offset The offset mo
tion option is used with the OFFSET CONDITION instruction to alter positional in
formation programmed at the destination position by the offset amount specified 
in a position register. The OFFSET CONDITION instruction defines the position re
gister that contains the offset information. The OFFSET CONDITION instruction mu
st be added to the program before the offset motion instruction. The OFFSET COND
ITION instruction shown uses the offset in position register 1, PR[x]. The offse
t motion instruction sets the positional information to position (P[1] + PR[x]) 
with the orientation of P[1]. When the offset condition is set, any time the off
set motion option is used, that offset will be used. Refer to Section 16, " OFFS
ET/FRAME INSTRUCTIONS " for more information on offset instructions. 6.11. Offse
t Position Register J P[1] 50% FINE Offset, PR[x] The Offset, PR[x] motion optio
n alters positional information by the offset amount specified in the position r
egister PR[x]. This offset affects only the motion instruction where it appears.
It does not apply to any other motion instructions. The offset user frame number
is the currently selected user frame number. If $OFFSET_CART is TRUE, offsets fo
r Cartesian positions are treated as frames and used to pre-multiply positions. 
If this is FALSE, offsets for XYZQPR positions are added field by field (for exa
mple, target.w=pos.w+offset.w). The OFFSET calculation depends on the position r
egister representation specified in the OFFSET motion option: If PR[x] is Cartes
ian representation, the system adds each element of the position register to eac
h element of the position to yield the position that is offset. If the position 
does not have Cartesian representation, the system internally converts the repre
sentation of the position to Cartesian before the offset is calculated. If PR[x]
is JOINT representation, the system adds each element of the position register t
o each element of the position to yield the position that is offset. If the posi
tion does not have JOINT representation, the system internally converts the repr
esentation of the position to JOINT before the offset is calculated. If PR[x] is
JOINT representation, an offset user frame is not used. J P[1] 50% FINE Offset, 
PR[x] Inc J P[1] 50% FINE Offset Inc If the incremental motion option is specifi
ed with the OFFSET motion option, the position and position register MUST have t
he same representation, either Cartesian or JOINT. Before you define an offset i
n a motion instruction that also includes the INC motion option, make sure that 
the representations of the position register and position are the same. For exam
ple, if the position register is JOINT representation, the position must also be
JOINT representation. 6.12. Remote TCP Motion Option (optional) L P[1] 100mm/sec
CNT100 RTCP The optional remote TCP motion option (RTCP) allows you to control t
he orientation of the robot in applications where the tool is fixed in the workc
ell and the robot manipulates the workpiece around the tool. The frame used for 
jogging and programming is a user frame you set and select. Note If the Coordina
ted Motion option is loaded on the controller, the RTCP motion option will not b
e available. If an existing program that already contains an RTCP instruction is
executed, the following error will be posted at the RTCP instruction: RTCP-014 “
RTCP not supported with COORD”. Loading the Coordinated Motion option on the con
troller completely disables Remote TCP. Note Remote TCP jogging is not available
with the following options: Automatic Voltage Control (AVC) Coordinated Motion M
ulti-Arm Scratch Start TAST RPM/Multi-Pass Touch Sensing Weaving When you use re
mote TCP, you must first set the user frame you will use as the remote TCP frame
. When you include the remote TCP (RTCP) motion option in a motion instruction, 
use the UFRAME_NUM= instruction to specify the user frame you want to use; other
wise the current user frame will be used by default. Refer to Section 16, " OFFS
ET/FRAME INSTRUCTIONS " for more information on the UFRAME_NUM= instruction. Not
e In a motion instruction that includes RTCP, the speed specified is the relativ
e speed between the workpiece and the tool. Limitations when used with ArcTool R
TCP does not support the following ArcTool features: Weave Touch sensing TAST AV
C MigEye RPM MultiPASS Multiple group program If you attempt to program RTCP whe
n any of these features are loaded, the following error message will be displaye
d: RTCP+Option not supported See the following examples: Example 1 1. Weave Sine
[1] 2. L P[] 8 mm/sec CNT100 3 L P[] 8 mm/sec CNT100 RTCP 4. Weave End The error
will be posted on Line 3. Example 2 1. Search Start[1] PR[2] 2. L P[] 8 mm/sec C
NT100 3 L P[] 8 mm/sec CNT100 RTCP Search[X] 4. L P[] 8 mm/sec CNT100 5 L P[] 8 
mm/sec CNT100 RTCP Search[Y] 4. Search End The error will be posted on Lines 3 a
nd 5. The following examples are for a multiple group program . Example 3 1. L P
[] 8 mm/sec CNT100 2. L P[] 8 mm/sec CNT100 3 L P[] 8 mm/sec CNT100 RTCP The err
or will be posted on Line 3. Example 4 1. Track AVC[1] 2. L P[] 8 mm/sec CNT100 
3 L P[] 8 mm/sec CNT100 RTCP 4. Track End The error will be posted on Line 3. 6.
13. Search [ ] Motion Option J P[1] 50% FINE Search[ ] The Search [ ] motion opt
ion directs the motion of the robot (in a positive or negative x, y or z directi
on) to search for an object. The x, y and z vectors are defined by the touch fra
me assigned in the touch schedule. When contact is made with the object, the rob
ot's current TCP position is stored. The search motion option must be used betwe
en a search start and search end statement. Note Touch Sense is an option and mi
ght not be installed on your system. If Touch Sense is not installed, Search wil
l not appear as a menu item. Caution Motion speed and direction are controlled b
y values set in the touch schedule assigned by the Search Start instruction. The
motion and speed might be different than what is displayed on the line. 6.14. Sk
ip Jump The SkipJump motion option is an optional feature, available to all tool
s. Its functionality is similar to the function of Skip Label, except that the a
ction is the reverse of that of Skip Label motion option. SKIP CONDITION [I/O] =
[value] J P[1] 50% FINE SkipJump , LBL[3] The SkipJump, LBL[x] motion option red
irects program execution based on whether a predefined SKIP CONDITION is true. A
SKIP CONDITION instruction defines an I/O condition. The execution of the motion
instruction that contains the SkipJump, LBL[x] motion option is affected dependi
ng on status of the SKIP CONDITION, as follows: If the SKIP CONDITION is satisfi
ed, the motion defined in the motion instruction that contains the SkipJump, LBL
[x] motion option terminates and the program branches to the label, LBL[x]. If t
he SKIP CONDITION is not satisfied, the motion defined in the motion instruction
that contains the Skip, LBL[x] motion option is executed. After the robot reache
s the destination position and the condition is still not satisfied, the program
instruction is executed . Refer to Section 8, " BRANCHING INSTRUCTIONS " for mor
e information on branching. Refer to Section 23, " SKIP INSTRUCTION " for more i
nformation on the SKIP CONDITION instruction. Refer to Figure 31, "SKIP JUMP Mot
ion Option Example" for an example of the SkipJump, LBL[x] motion option. Figure
31. SKIP JUMP Motion Option Example 6.15. Skip Label SKIP CONDITION [I/O] = [val
ue] J P[1] 50% FINE Skip, LBL[3] The Skip, LBL[x] motion option redirects progra
m execution based on whether a predefined SKIP CONDITION is true. A SKIP CONDITI
ON instruction defines an I/O condition. The execution of the motion instruction
that contains the Skip, LBL[x] motion option is affected depending on status of 
the SKIP CONDITION, as follows: If the SKIP CONDITION is satisfied, the motion d
efined in the motion instruction that contains the Skip, LBL[x] motion option te
rminates and the program instruction is executed. If the SKIP CONDITION is not s
atisfied, the motion defined in the motion instruction that contains the Skip, L
BL[x] motion option is executed. After the robot reaches the destination positio
n and the condition is still not satisfied, the program branches to the label, L
BL[x]. Refer to Section 8, " BRANCHING INSTRUCTIONS " for more information on br
anching. Refer to Section 23, " SKIP INSTRUCTION " for more information on the S
KIP CONDITION instruction. 6.16. Time Before / Time After TIME BEFORE Motion Opt
ion J P[1] 50% FINE TIME BEFORE 2.0 sec, CALL prog TIME AFTER Motion Option J P[
1] 50% FINE TIME AFTER 2.0 sec, CALL prog Normally, when a teach pendant program
is executed, the instruction that follows a motion instruction is not executed u
ntil the motion has been completed. The TIME BEFORE/AFTER motion option instruct
ion allows you to specify a teach pendant program that is to be called at a spec
ified time before or after the completion of a motion instruction. Refer to the 
“Advanced Functions” chapter in the Setup and Operations Manual for more informa
tion on the TIME BEFORE and TIME AFTER motion options. 6.17. Tool_offset TOOL_OF
FSET_CONDITION PR[x] (UTOOL[1]) J P[1] 50% FINE Tool_offset The Tool_offset moti
on option is used with the TOOL_OFFSET_CONDITION instruction to alter positional
information programmed at the destination position by the tool offset amount spe
cified in a position register. The TOOL_OFFSET_CONDITION instruction defines the
position register that contains the offset information and the tool frame that w
ill be used during the tool offset. The TOOL_OFFSET_CONDITION instruction must b
e added to the program before the tool offset motion instruction. A tool offset 
condition instruction specifies the offset condition used in a tool offset instr
uction. Execute a tool offset condition instruction before executing the corresp
onding tool offset instruction. After you specify the tool offset condition, it 
remains effective until the program terminates or the tool offset condition inst
ruction is executed. When you specify tool offset conditions, be aware of the fo
llowing: The position register specifies the direction in which the target posit
ion shifts, as well as the amount of shift. The tool coordinate system is used t
o specify offset conditions. When the number of a tool coordinate system is omit
ted, the currently selected tool coordinate system is used. When a motion statem
ent which includes a tool offset instruction is taught or a certain position is 
modified, the position from which the offset is subtracted can be taught. When a
motion statement which includes a tool offset instruction is taught or a certain
position is modified, you will be asked to answer the following questions: Subtr
act tool offset data? Press YES to subtract the tool offset data from the positi
on data and accept the new position. Press NO to store the current position as t
he position data. Enter PR index of tool offset data? Enter the position-registe
r number specified by the tool offset condition instruction. Enter tool no. of t
ool offset data? Enter the number of the tool coordinate system in which the off
set is to be specified. If you manually modify the position data using the numer
ic keys, the position is taught without subtracting the offset. If you teach the
position from which the offset is subtracted, the current position is stored in 
the following cases. The specified position register has not yet been initialize
d The tool offset instruction ignore function is enabled (see other setting.) If
you enable the ignore function for the tool offset instruction, the current posi
tion is taught as position data and you will not receive any error messages. The
robot moves to the taught position, even if a tool offset instruction is execute
d. If you pause the robot during the execution of a tool offset instruction and 
modify the shift amount, the modified amount will be used in the resumed movemen
t. If you modify a position register number specified by a tool offset condition
instruction, the modified number will not be used. In backward execution, the ro
bot is moved to the position to which the offset has been applied. This also app
lies to the direct tool offset instruction, described . 6.18. Tool offset positi
on register J P[1] 50% FINE Tool_Offset, PR[2] A direct tool offset instruction 
specifies the position register number. The robot moves according to the offset 
stored in the specified position register, ignoring the tool offset conditions s
pecified by the tool offset condition instruction. The currently selected tool c
oordinate system is used. When you specify tool offset position registers, be aw
are of the following: If you teach a motion statement which includes a direct to
ol offset instruction or you modify a certain position, you can teach the positi
on from which the offset is subtracted. You will be asked to answer the followin
g question. Subtract tool offset data? Press YES to subtract the tool offset fro
m the position data and accept the new position. Press NO to store the current p
osition as position data. If you manually modify the position data using the num
eric keys, the position is taught without subtracting the offset. If you teach t
he position from which the offset is subtracted, the current position is stored 
in the following cases. The specified position register has not yet been initial
ized The direct tool offset instruction has not specified the number of a positi
on register The tool offset instruction ignore function is enabled. If you enabl
e the tool offset instruction ignore function, the current position is taught as
position data (no prompt messages are output). The robot moves to the taught pos
ition even if a tool offset instruction is executed. 6.19. Torch Angle Overview 
The Torch Angle option provides users with multiple methods to display the weldi
ng torch Work and Travel Angles. This eliminates the need for manual Torch Angle
measurement, assists in the audit of weld torch angles, and helps optimize weldi
ng quality. There are two primary methods of obtaining the torch angles: As a TP
program executes, the angles are continuously calculated based on the executing 
motions and frame definitions. The resultant data is available in system variabl
es and can be displayed in the editor or in a graphical status screen A report c
an be generated for any of the TP programs from the robot’s web page without run
ning the TP program. Torch Angle system can be used by several applications incl
uding: Gas Metal Arc Welding and Gas Tungsten Arc Welding Plasma Cutting Handlin
gTool Laser Cut DispenseTool Dispense Gun Torch Angle supports multiple arm grou
p motion and is compatible with many robot options including: Touch Sensing Thru
Arc Seam Tracking RPM and Multi-Pass Coordinated motion Constant Path motion The
following sections will address these topics: Torch Angle Definitions Teaching a
Reference Position Programming Considerations and Limitations Torch Angle Web Pa
ge Display Torch Angle Status Display Torch Angle System Variables Torch Angle G
raphical Status Display Torch Angle Definitions The Torch Angle is specified by 
the Work Angle and the Travel Angle. Travel Angle Travel Angle Definition: The a
ngle less than 90 degrees between the torch axis and a line perpendicular to the
weld direction, in the plane determined by the torch axis and the weld direction
In the two examples shown below the welding torch is approaching the Arc Start p
osition of a weld in a T-joint. In both examples the Travel Angle is 15 degrees.
In the left figure, the torch is pointing in the direction of the weld, so this 
is considered a push angle. In the right figure, the torch is pointing in the di
rection opposite to the weld progression, so this is a drag angle. For curved su
rfaces or pipe welds, the weld direction will be the tangent line to the weld pa
th at the weld point. Work Angle There are two common ways to measure the work a
ngle. One references the vertical XZ plane and the other references the horizont
al XY plane. The X axis is defined as the vector along the weld axis. The Z dire
ction is defined by a taught TA_REF reference position or by the Z axis of ufram
e. The Y axis is perpendicular to the X and Z axes. Work Angle (XZ) Definition: 
The angle less than 90 degrees between the torch axis and a plane determined by 
the weld direction and a surface normal vector perpendicular to the workpiece. T
he surface normal at a point on a non-flat surface will be a vector perpendicula
r to the tangent plane to that surface at that point. Work Angle (XY) Definition
: 90 degrees minus the Work Angle (XZ). This figure depicts the welding torch ap
proaching the Arc Start position of a weld in a T-joint. The travel angle is 15 
degrees push. The Work Angle (XZ) is 30 degrees. The Work Angle (XY) is 60 degre
es (90-30). A reference position is not needed in this example. It is sufficient
to use uframe. The user can choose between the XZ and the XY definitions in the 
Torch Angle Status Display using the “Work Ref” function key. This display is de
scribed in a later section. Teaching a Reference Position When the workpiece is 
not suitably aligned with uframe it is useful to teach a reference position and 
specify it in a TP program. This allows the work angle to be calculated relative
to the workpiece The reference position can be recorded in a TP program with the
TA_REF motion modifier or it can be recorded in a position register and referenc
ed in the TP program with the TA_REF PR[] motion modifier. The figure below depi
cts a vertical-down weld in an outside corner joint. The work angle is approxima
tely 45 degrees and the travel angle is approximately 15 degrees push. To assure
the work angle is calculated relative to the workpiece, a reference position is 
recorded normal to the workpiece as shown. The reference position is used to cal
culate the Work Angle; it is not used to calculate the Travel Angle. TA_REF or T
A_REF PR[] can be attached to each weld point to support various weld joints. Th
e tool frame must be taught such that the tool frame Z+ corresponds to the torch
direction. If you have the Torch Angle Software Option (R734), the Haptic i Pend
ant allows you to feel and see that Torch Angle is inside or outside its limit Y
ou teach the weld path which establishes the desired torch angles (work / travel
angles) Figure 32. Torch Angle (R734) Limit – Work Angle Figure 33. Torch Angle 
(R734) Limit - Travel Angle After the path is taught, when you stop the robot (w
hich pauses the program) to touch a position, the torch angle when the robot sto
pped will become the reference for torch angle limit check. If the torch angle i
s jogged beyond a tolerance, the Teach Pendant vibrates. If the torch angle is j
ogged back inside tolerance, the Teach Pendant vibrates with a different pattern
. In the Torch Angle status screen, the torch angle (and its tolerance) is graph
ically displayed with color. The torch is GREEN if it is within tolerance, other
wise, it’s RED. Torch angle limit tolerance is default to 5 degrees ($TOR_ANG_CF
G.$TRAV_TOL, $TOR_ANG_CFG.$WORK_TOL). Procedure 4. Recording the reference posit
ion with TA_REF Move the cursor to the end of the motion line. Press F4 [CHOICE]
and select the motion modifier TA_REF. The prompt “Align torch with ref axis & r
ecord.” will be displayed as in Figure 34, "Torch Angle TA_REF Instruction" Move
the robot to an area with enough space to permit adjusting the torch orientation
. Align the torch such that it is perpendicular to the workpiece or so it is ali
gned with the reference axis, i.e. the torch is at zero degree work angle. Press
Shift-F3 [RECORD] to record Torch Angle Reference position. Figure 34. Torch Ang
le TA_REF Instruction P[Travel dg G1] 1/2 1:J @P[1: ] 100% FINE : TA_REF [End] A
lign torch with ref axis & record. MOVE_TO RECORD [CHOICE] Programming Considera
tions and Limitations When using the Torch Angle option please consider the foll
owing items: The tool frame must be taught such that tool frame Z+ corresponds t
o the torch direction. The “TA_REF” motion modifier can be used in a TP program 
to record the reference positions of to two robot arms. “TA_REF PR[]” is require
d if there are more than two robot arms in the program. When coordinated motion 
is specified, “TA_REF PR[]” is required to record the reference positions of bot
h the leader and the follower. A position register does not include uframe data.
“TA_REF PR[]” uses the currently active uframe to calculate the reference positi
on during program execution. The Torch Angle reference position is set to uframe
when a program is aborted. A run-time motion alarm “Uninitialized TA_REF ref frm
” will be posted for TP motion instructions with TA_REF or TA_REF PR[] if the re
ference position is not recorded. If there isn’t a torch angle motion modifier (
TA_REF or TA_REF PR[]) on the current welding motion, the previous reference pos
ition defined by TA_REF or TA_REF PR[] in the TP program will be used. If neithe
r TA_REF or TA_REF PR[] have been executed in the program, the User frame approa
ch vector will be used to define the reference position. A sub-program inherits 
the reference position from the main program. A reference position set inside a 
sub-program remains valid when execution returns to the main program. Torch Angl
e Definition Procedure 5. Recording the reference position with TA_REF PR[ ] Mov
e the cursor to the end of the motion line. Press F4 [CHOICE] and select the mot
ion modifier TA_REF PR[]. The prompt “Enter PR number.” will be displayed as sho
wn in Figure 35, "Torch Angle TA_REF PR[ ] Instruction" Enter the position regis
ter number. Move the robot to an area that has enough space to permit adjusting 
the torch orientation. Align the torch such that it is perpendicular to the work
piece or so it is aligned with the reference axis, i.e. the torch is at zero deg
ree work angle. Go to DATA Position Reg screen, and move the cursor to specified
PR number. Press Shift-F3 [RECORD] to record Torch Angle Reference position. Aft
er the reference position has been recorded, Shift-F2 [MOVE_TO] can be used to v
erify the recorded position. Figure 35. Torch Angle TA_REF PR[ ] Instruction P[T
ravel dg G1] 1/2 1:J @P[1: ] 100% FINE : TA_REF PR[...] [End] Enter PR number. D
IRECT INDIRECT[CHOICE] For pipe weld, the weld direction will be the tangent lin
e to the weld path at the weld point. Torch Angle Web Page Display A new link “T
P Torch Angle files available on MD:” is available on the controller’s main web 
page when Torch Angle option is loaded. A Torch Angle ASCII report can be genera
ted for each Teach Pendant program on the controller. A report will be displayed
on the web page if user clicks on one of the file names listed in the second col
umn of the table. The ASCII file is tab delimited, and can be saved and exported
to Excel. Torch angle report file consists of the following information: Line Nu
m Position Id Work Angle Travel Angle Group Num Position Comment The right-most 
column contains the Position Comment. This column can be viewed by scrolling the
display to the right. The Torch Angle Web Page displays static work angles and t
ravel angles of taught positions. The values can be different than the run time 
display due to motion blending The robot web pages can be accessed from a remote
computer using a standard browser if the Web Server is installed on the robot. T
he Web Server is part of the Internet Connectivity/Customization Option, R558. W
hen viewing a torch angle report remotely you can use the browser to “select all
” and “copy” the report contents. The data can then be saved from your clip boar
d into a file. The file can be imported into a spreadsheet application as shown 
in Figure 36, "Torch Angle Report in a Spreadsheet Application" Figure 36. Torch
Angle Report in a Spreadsheet Application Motion Status Display in the TP Editor
The Motion Status display feature dynamically displays the current value of a va
riety of motion related items directly within the motion line. Refer to Section 
for more information on this feature. The Motion Status display supports display
mode 19 for the travel angle and mode 20 for the work angle. These two modes onl
y display data on the currently active motion line. Set $mndsp_mst.$disp_enable 
= TRUE to enable the motion status display. Set $mndsp_mst.$mode_grp[1] = 19 to 
display group 1 Travel Angle. Set $mndsp_mst.$mode_grp[1] = 20 to display group 
1 Work Angle. The header above the program is “P[Travel dg G1]”. This indicates 
the motion status display is set to mode 19 for the Travel Angle, the angle is i
n degrees, and the angle is for group 1. Group 1 is the selected jog group. The 
Travel Angle of 12.952 is shown on line 12 of the program. The negative sign ind
icates this is a push angle. The header above the program is “P[WorkXZ dg G1]”. 
This indicates the motion status display is set to mode 20 for the Work Angle. T
he “XZ” indicates the selected reference plane is the XZ plane. The “dg” indicat
es the angle is in degrees. The program is paused on line 12. The work angle at 
this position is 30.868 degrees. The letter R appended after the angle indicates
the torch is to the “Right” of vertical (when viewed from behind the torch in th
e direction of the weld.) A letter L would be appended after the angle if the to
rch were to the “Left” of vertical. Torch Angle System Variables When the Torch 
Angle option is loaded and enabled and a Teach Pendant program is executing the 
Torch Angles are calculated and stored in system variables ($tor_ang_sys[].$trav
el_ang and $tor_ang_sys[].$work_ang). These variables are used as inputs to upda
te a graphical display on the Torch Angle Status screen. Note the value of $work
_ang can vary from -180 to +180 degrees. The value of $cmn_workang will only var
y from 0 to 90 degrees when the WorkXY reference plane is selected. Torch Angle 
Status Menu The Torch Angle Status menu displays the current torch angles for th
e selected jog group if that group is a robot. The menu contains a graphical and
a numeric indication of the work and travel angles. It indicates if the Work Ang
le is to the Left or Right of vertical axis and if the Travel Angle is Push or D
rag. When the program is aborted the torch angles are not available for display.
This is indicated by the torch being aligned with the Z axis and “(inactive)” di
splayed below the two angles. To display the Torch Angle Status menu: Press MENU
. Select STATUS. Press F1, [TYPE]. Select Torch Angle. For Torch Angle graphical
display, select “Torch Angle” from STATUS item on main Menu. Use the F3 function
key “Work Ref” to change between the XZ and XY reference planes. 6.20. Wrist Joi
nt L P[1] 50% FINE Wjnt The wrist joint option is used during linear or circular
moves. It causes the wrist orientation to change during moves, permitting the to
ol center point to move along the programmed path without flipping the wrist axe
s due to axis singularity positions. For the WRISTJOINT method of orientation in
terpolation, the three wrist joints are joint interpolated. The remaining joints
are interpolated so that the TCP moves in a straight line. Note that the startin
g and ending orientation will be used as taught, but because of the joint interp
olation, the orientation during the move is not predictable, although it is repe
atable. Caution When the WJNT modifier is added to a linear motion, then the mov
es made by the major axes of the robot (especially Joints 2 and 3) can be drasti
cally different than those without the WJNT modifier. 5. MOTION INSTRUCTION 7. B
ASIC PROCESS AXES INSTRUCTIONS (OPTION)
Metadata:
{}

## Citations

- Primary: FANUC Teach Pendant Help System / Operator Manual (keywords: acceleration override, ACC, constant path, CNT, FINE, corner distance, linear distance, process speed, max speed, break, EV, extended velocity, incremental motion, offset PR, tool offset, Tool_Offset, remote TCP, skip label, skip condition, time before, time after, wrist joint, RT_LD, corner region).
- Applicability: R-30iB Plus, TP Programming.

## Discrepancies

None documented in the legacy source. Re-verify against a T1 vendor manual before promoting `status` from `draft` to `approved`.

## Provenance

- Migrated by: inline migration on 2026-04-22.
- Source file: `FANUC_dev/FANUC_Optimized_Dataset/optimized_dataset/reference/FANUC_REF_Motion_Options.txt`.
- Classification: reference / topic=motion.

