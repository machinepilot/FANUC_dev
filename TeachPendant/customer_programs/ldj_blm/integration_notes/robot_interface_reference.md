---
scope: customer_specific
customer: ldj_blm
canonical: false
status: evolving
supersedes: FANUC_dev/LDJ/robot_interface_reference.md
source:
  type: onsite_notes
  acquired_from: The Way Automation LLC
  acquired_date: "2026-04-22"
---

# robot interface reference

> CONTEXT, NOT CANON. This is customer-specific integration material. If it contradicts `fanuc_dataset/normalized/`, canon wins. Raise conflicts under `task_state.conflicts[]`.
# BLM Press-Brake â†” Robot Interface Reference
**Document:** BLM Press-Brake Interface ver. 4.0  
**Purpose:** Complete signal reference for PLC/Robot integration with press brake  
**Connectors Covered:** XC2F (Power + I/O), XC3M (Safety), XC4M (Tooling + Program)

---

## WIRING FUNDAMENTALS

| Parameter | Value |
|---|---|
| Logic Voltage | 24 VDC, supplied **by the press-brake** |
| Common Reference | All robot I/O signals referenced to XC2F Pin 1 (0 VDC PRESS) |
| Power Source | XC2F Pin 2 (24 VDC PRESS) â€” press supplies power to robot I/O cards |
| Galvanic Isolation | All power lines are galvanically separated |
| Safety Contacts | Dry contacts (not 24V logic) on XC3M |

> **âš ï¸ Critical:** The press-brake **supplies** the 24 VDC reference for all I/O. The robot does not source power for these signals â€” it sinks/sources relative to the press-brake rail. Do not connect a robot-side 24V supply to these pins.

---

## CONNECTOR XC2F â€” POWER + STATUS I/O
**Press-side connector:** WeidmÃ¼ller 1745850000 + WeidmÃ¼ller 121240000 (or equivalent)

### Power Pins
| Pin | Signal Name | Direction | Description |
|---|---|---|---|
| 1 | 0 VDC PRESS | â€” | Press-brake 0V reference. Common for all I/O cards. |
| 2 | 24 VDC PRESS | â€” | Press-brake 24V supply. Powers robot I/O interface cards. |
| 20â€“24 | PE | â€” | Earth / protective ground connection |

---

### XC2F Input Signals (Press â†’ Robot PLC)
*All signals are 24V logic, referenced to Pin 1 (0 VDC PRESS)*

| Pin | PLC Address | Signal Name | Active State | Detailed Description |
|---|---|---|---|---|
| 3 | E20.0 | PRESS IN AUTOMATIC MODE | HIGH = Auto | Connected to a selector on the press-brake. HIGH when press is in "with robot" / automatic operating mode. Robot must check this before initiating any cycle. |
| 4 | E20.1 | BEAM AT MUTE POINT | HIGH = at mute | Ram has reached the speed-change position (mute point). Speed transitions from fast to slow descent here. Signal is used to gate robot actions at this position. |
| 5 | E20.2 | BEAM AT UPPER DEAD POINT (UDP) | HIGH = at UDP | Ram is at the fully retracted upper position for the **current bending step**. This is the primary "safe to enter" signal for robot loading/unloading. |
| 6 | E20.3 | BEAM AT CLAMPING POINT (CP) | HIGH = at CP | Ram has made contact with the sheet (pinch/clamping point). Sheet is now gripped between punch and die. Robot must have released part before this goes HIGH. |
| 7 | E20.4 | BEAM AT LOWER DEAD POINT (LDP) | HIGH = at LDP | Ram has reached the programmed bottom position for the current bend step. **Remains HIGH until robot sends RESET END BEND** (XC3M Pin 24). Only clears when beam begins moving upward. |
| 8 | E20.5 | PRESS-BRAKE IN END OF BEND | HIGH = bend done | Bend step fully completed â€” includes spring-back and angle measurement. **Remains HIGH until the complete ending of the step (i.e., until UDP is reached on the way back up).** This is the trigger for robot to know bending is done and part is ready for retrieval after beam clears. |
| 9 | E20.6 | AXIS IN POSITION | HIGH = in position | Back gauge axes (X1, X2, Z1, Z2, R1, R2, angle control, etc.) are in position for the bending step. **Timing:** Goes ON at UDP â†’ lost during descent â†’ restored again after pushback at clamping â†’ goes OFF again until next step change. |
| 10 | E20.7 | ANGLE CONTROL OK | HIGH = angle OK | The angle measurement device has confirmed the bend angle is within tolerance. Goes active after angle measurement completes at LDP. |
| 11 | E21.0 | SENSOR ON FINGER 1 | HIGH = contact | Sheet is in contact with back gauge finger 1 (left side). All assigned finger sensors must be HIGH before robot releases part and allows bending. |
| 12 | E21.1 | SENSOR ON FINGER 2 | HIGH = contact | Sheet contact with back gauge finger 2 (right side, or next finger if configured). |
| 13 | E21.2 | SENSOR ON FINGER 3 | HIGH = contact | Sheet contact with back gauge finger 3. |
| 14 | E21.3 | SENSOR ON FINGER 4 | HIGH = contact | Sheet contact with back gauge finger 4. |
| 15 | E21.4 | FIRST BEND ACTIVE | HIGH = first bend | The first bending step in the program is currently active on the press-brake. Used by robot to confirm program position synchronization. |
| 16â€“17 | E21.6 | PRESS DEVICES OUT OF WORKING ROBOT AREA | HIGH = clear | CNC console, safety laser beams, side door, and other press-brake devices have moved out of the robot's working envelope. Collision avoidance signal. Robot must not move into press zone unless this is HIGH. |
| 18â€“19 | E22.3 | ANGLE CONTROL ACTIVE ON BEND | HIGH = measuring | The angle control device is actively measuring the bend angle during the current bending step. |

---

## CONNECTOR XC3M â€” SAFETY SIGNALS
**Press-side connector:** WeidmÃ¼ller 1745790000 + WeidmÃ¼ller 121240000 (or equivalent)

> **âš ï¸ All pins 1â€“16 are DRY CONTACTS â€” not 24V logic signals.** These are galvanically isolated safety relay contacts. They must be wired into the appropriate safety relay / safety PLC inputs on both sides. Do not apply 24V logic directly without proper safety relay interface.

### XC3M Safety Input Contacts (Press â†’ Robot, dry contact)
| Pins | PLC Address | Signal Name | Contact Type | Description |
|---|---|---|---|---|
| 1â€“2 | A175.0 | EMERGENCY FROM PRESS-BRAKE CH1 | Normally Closed (NC) | Opens when press-brake is in emergency state (any e-stop pressed, back door open, gate or light curtain triggered). **Must NOT be affected by robot-side emergencies (Pins 5â€“8).** Two-channel (CH1 + CH2) for safety category compliance. |
| 3â€“4 | A175.0 | EMERGENCY FROM PRESS-BRAKE CH2 | Normally Closed (NC) | Second channel of press-brake emergency contact. Both CH1 and CH2 must be monitored independently by robot safety relay for dual-channel integrity. |

### XC3M Safety Input Contacts (Robot â†’ Press, dry contact)
| Pins | PLC Address | Signal Name | Contact Type | Description |
|---|---|---|---|---|
| 5â€“6 | â€” | EMERGENCY FROM ROBOT CH1 | Normally Closed (NC) | Robot cell e-stop chain CH1, fed INTO the press-brake safety circuit. Opens on any robot-side emergency. Press-brake safety controller monitors this to stop ram. |
| 7â€“8 | â€” | EMERGENCY FROM ROBOT CH2 | Normally Closed (NC) | Robot cell e-stop chain CH2. Second channel for dual-channel integrity on robot â†’ press direction. |
| 9â€“10 | E169.0 | ENABLE FROM ROBOT CH1 | Normally Open (NO) | Closes when robot safety conditions are verified. **This contact enables downward beam movement.** Both CH1 and CH2 must be closed for beam down to be permitted. |
| 11â€“12 | E169.0 | ENABLE FROM ROBOT CH2 | Normally Open (NO) | Second channel of robot enable. Closes when robot safety verified. Both channels required for beam-down permission. |
| 13â€“14 | E169.4 | FENCE FROM ROBOT CH1 | Normally Open (NO) | Closes when the robot cell safety fences are closed and restored. **When this contact is OPEN, the beam must only move downward slowly (reduced speed / muted mode).** |
| 15â€“16 | E169.4 | FENCE FROM ROBOT CH2 | Normally Open (NO) | Second channel of fence signal. Both channels must be closed for full-speed operation. When open â†’ forced slow speed on beam descent. |

### XC3M Output Signals (Robot PLC â†’ Press, 24V logic)
*Referenced to XC2F Pin 1 (0 VDC PRESS)*

| Pin | PLC Address | Signal Name | Direction | Detailed Description |
|---|---|---|---|---|
| 17 | A20.0 | BEAM UPWARDS | Robot â†’ Press | Commands the beam to move upward. **Must be usable at any time** â€” no safety pre-conditions required. Use to abort a bend or retract beam from any position. |
| 18 | A20.1 | BEAM DOWNWARDS | Robot â†’ Press | Commands beam downward movement. **Note: This signal is only accepted by the press-brake after all safety conditions are verified** (XC3M Pins 9â€“12, Enable From Robot, must be closed). Commanding this without safety chain closed will be ignored. |
| 19 | A20.4 | CHANGE BENDING STEP | Robot â†’ Press | Commands the press-brake to advance to the next bending step in the program. Only valid after the previous step is fully complete (END OF BEND signal active). |
| 20 | A20.6 | PRESS PUMP SHUT-DOWN | Robot â†’ Press | When HIGH, commands the hydraulic pump to shut down. Use at end of production run, on cycle timeout, or on safe stop condition. |
| 21 | A20.7 | START FROM FIRST BEND | Robot â†’ Press | Forces the press-brake to activate/return to the first bending step of the program. Used to re-synchronize at start of new part cycle. |
| 22 | A21.0 | RESET MUTE POINT | Robot â†’ Press | The beam stops automatically at the mute point and waits for this signal before continuing downward. **Can be sent continuously from the start of CHANGE STEP to avoid the machine pausing** at the mute point during normal production. |
| 23 | A21.1 | RESET CLAMPING POINT | Robot â†’ Press | The beam stops automatically at the clamping point and waits for this signal before continuing downward. **Can be sent continuously from CHANGE STEP** to avoid machine pause at CP. Used to confirm robot has released the part before full clamping pressure is applied. |
| 24 | A21.2 | RESET END BEND | Robot â†’ Press | The beam stops at the end of the bend (after angle measured OK and spring-back complete) and waits for this signal. Sending this causes the beam to begin moving upward and **E20.4 (LDP) to go LOW.** Only send after robot has confirmed it is safe for beam to retract. |

### XC3M â€” Full Safety Architecture Diagram
```
PRESS-BRAKE SIDE                    ROBOT SIDE
â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€                   â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

Press E-Stop chain â”€â”€[NC DRY]â”€â”€â†’  Robot safety relay monitors
  (Pins 1-2: CH1)                   A175.0 = press emergency status
  (Pins 3-4: CH2)                   Both channels independently monitored

                    â†â”€â”€[NC DRY]â”€â”€ Robot E-Stop chain
  Press safety               (Pins 5-6: CH1)
  controller monitors        (Pins 7-8: CH2)
  robot e-stop state         NB: Must NOT include press emergencies

Robot ENABLE  â”€â”€â”€â”€â”€â”€[NO DRY]â”€â”€â†’  Beam DOWN permitted only when closed
  (Pins 9-10: CH1)                  E169.0 = enable CH1
  (Pins 11-12: CH2)                 E169.0 = enable CH2

Robot FENCE   â”€â”€â”€â”€â”€â”€[NO DRY]â”€â”€â†’  Beam SLOW SPEED ONLY when open
  (Pins 13-14: CH1)                 E169.4 = fence CH1
  (Pins 15-16: CH2)                 E169.4 = fence CH2
                                    Open fence â†’ forced slow descent
```

**Safety Rule â€” Beam Down Permission Logic (derived from document):**
```
BEAM DOWN ALLOWED =
    ENABLE_FROM_ROBOT_CH1 (closed)
    AND ENABLE_FROM_ROBOT_CH2 (closed)
    AND NOT EMERGENCY_FROM_PRESS_CH1 (open = emergency)
    AND NOT EMERGENCY_FROM_PRESS_CH2 (open = emergency)
    AND NOT EMERGENCY_FROM_ROBOT_CH1 (open = emergency)
    AND NOT EMERGENCY_FROM_ROBOT_CH2 (open = emergency)

BEAM DOWN AT FULL SPEED =
    BEAM_DOWN_ALLOWED
    AND FENCE_FROM_ROBOT_CH1 (closed)
    AND FENCE_FROM_ROBOT_CH2 (closed)

BEAM DOWN AT SLOW SPEED ONLY =
    BEAM_DOWN_ALLOWED
    AND (FENCE_CH1 open OR FENCE_CH2 open)
```

---

## CONNECTOR XC4M â€” TOOLING & PROGRAM CONTROL
**Press-side connector:** WeidmÃ¼ller 1745780000 + WeidmÃ¼ller 1208600000 (or equivalent)

### XC4M Input Signals (Press â†’ Robot PLC)
| Pin | PLC Address | Signal Name | Active State | Description |
|---|---|---|---|---|
| 1 | E22.0 | DIE CLAMPING CLOSED | HIGH = closed | Lower tool (die) clamping is locked. Robot must see this HIGH before trusting the tooling setup is secure for bending. |
| 2 | E22.1 | PUNCH CLAMPING CLOSED | HIGH = closed | Upper tool (punch) clamping is locked. Robot must see this HIGH before trusting the tooling setup is secure for bending. |

### XC4M Output Signals (Robot PLC â†’ Press)
| Pins | PLC Address | Signal Name | Description |
|---|---|---|---|
| 3â€“7 | A22.0 | COMMAND CHANGE TOOLS CYCLE | Bypasses the safety pressure control of upper AND lower tool clamping systems. During tool change, the beam is held at clamping position (CP) until the change cycle completes. **Must only be activated during deliberate tool change sequence.** |
| 8 | A22.1 | UNLOCK DIE | Commands opening of the lower tool clamping. **Must only be activated AFTER A22.0 (COMMAND CHANGE TOOLS CYCLE) is active (Pin 7 condition ON).** |
| 9 | A22.2 | UNLOCK PUNCH | Commands opening of the upper tool clamping. **Must only be activated AFTER A22.0 (COMMAND CHANGE TOOLS CYCLE) is active (Pin 7 condition ON).** |
| 10 | A22.3 | EDITING MODE SELECTION | Activates editing mode in the press-brake CNC. Used during a change-bending-program cycle to allow program modification. |
| 11 | A22.4 | AUTOMATIC MODE SELECTION | Activates automatic mode on the press-brake CNC. Used at the end of a program-change cycle to return to production. |
| 12 | A22.5 | PROGRAM SELECTION BIT 1 (LSB) | Binary program select â€” least significant bit. Together with Bit 2 selects the bending program to load. |
| 13 | A22.6 | PROGRAM SELECTION BIT 2 (MSB) | Binary program select â€” most significant bit. |

**Program Selection Binary Encoding (2-bit, expandable):**
| A22.6 (Bit 2) | A22.5 (Bit 1) | Program Selected |
|---|---|---|
| 0 | 0 | Program 0 |
| 0 | 1 | Program 1 |
| 1 | 0 | Program 2 |
| 1 | 1 | Program 3 |

> **Note:** Only 2 bits are defined in this version (ver. 4.0). Additional bits may exist in extended implementations via optional signal pins 14â€“16.

**Tool Change Sequence (required order):**
```
1. Robot commands beam to CP (Clamping Point)
2. Robot sends A22.0 HIGH (COMMAND CHANGE TOOLS CYCLE) â€” bypasses pressure safety
3. Beam holds at CP
4. Robot sends A22.1 HIGH (UNLOCK DIE) â†’ lower tool releases
5. Robot sends A22.2 HIGH (UNLOCK PUNCH) â†’ upper tool releases
6. Robot performs physical tool swap
7. Robot sends A22.1/A22.2 LOW â†’ tools re-clamp
8. Robot waits for E22.0 HIGH (DIE CLAMPING CLOSED) AND E22.1 HIGH (PUNCH CLAMPING CLOSED)
9. Robot sends A22.0 LOW (exits tool change mode)
10. Continue bending cycle
```

---

## COMPLETE PIN SUMMARY TABLE

### XC2F â€” All Pins
| Pin | Address | Name | Dir | Type |
|---|---|---|---|---|
| 1 | â€” | 0 VDC PRESS | PWR | Power |
| 2 | â€” | 24 VDC PRESS | PWR | Power |
| 3 | E20.0 | Press in Automatic Mode | Pressâ†’Robot | 24V DO |
| 4 | E20.1 | Beam at Mute Point | Pressâ†’Robot | 24V DO |
| 5 | E20.2 | Beam at Upper Dead Point | Pressâ†’Robot | 24V DO |
| 6 | E20.3 | Beam at Clamping Point | Pressâ†’Robot | 24V DO |
| 7 | E20.4 | Beam at Lower Dead Point | Pressâ†’Robot | 24V DO |
| 8 | E20.5 | Press-Brake in End of Bend | Pressâ†’Robot | 24V DO |
| 9 | E20.6 | Axis in Position | Pressâ†’Robot | 24V DO |
| 10 | E20.7 | Angle Control OK | Pressâ†’Robot | 24V DO |
| 11 | E21.0 | Sensor on Finger 1 | Pressâ†’Robot | 24V DO |
| 12 | E21.1 | Sensor on Finger 2 | Pressâ†’Robot | 24V DO |
| 13 | E21.2 | Sensor on Finger 3 | Pressâ†’Robot | 24V DO |
| 14 | E21.3 | Sensor on Finger 4 | Pressâ†’Robot | 24V DO |
| 15 | E21.4 | First Bend Active | Pressâ†’Robot | 24V DO |
| 16â€“17 | E21.6 | Press Devices Out of Robot Area | Pressâ†’Robot | 24V DO |
| 18â€“19 | E22.3 | Angle Control Active on Bend | Pressâ†’Robot | 24V DO |
| 20â€“24 | PE | Earth | â€” | GND |

### XC3M â€” All Pins
| Pin | Address | Name | Dir | Type |
|---|---|---|---|---|
| 1â€“2 | A175.0 | Emergency from Press-Brake CH1 | Pressâ†’Robot | Dry NC |
| 3â€“4 | A175.0 | Emergency from Press-Brake CH2 | Pressâ†’Robot | Dry NC |
| 5â€“6 | â€” | Emergency from Robot CH1 | Robotâ†’Press | Dry NC |
| 7â€“8 | â€” | Emergency from Robot CH2 | Robotâ†’Press | Dry NC |
| 9â€“10 | E169.0 | Enable from Robot CH1 | Robotâ†’Press | Dry NO |
| 11â€“12 | E169.0 | Enable from Robot CH2 | Robotâ†’Press | Dry NO |
| 13â€“14 | E169.4 | Fence from Robot CH1 | Robotâ†’Press | Dry NO |
| 15â€“16 | E169.4 | Fence from Robot CH2 | Robotâ†’Press | Dry NO |
| 17 | A20.0 | Beam Upwards | Robotâ†’Press | 24V DI |
| 18 | A20.1 | Beam Downwards | Robotâ†’Press | 24V DI |
| 19 | A20.4 | Change Bending Step | Robotâ†’Press | 24V DI |
| 20 | A20.6 | Press Pump Shut-Down | Robotâ†’Press | 24V DI |
| 21 | A20.7 | Start from First Bend | Robotâ†’Press | 24V DI |
| 22 | A21.0 | Reset Mute Point | Robotâ†’Press | 24V DI |
| 23 | A21.1 | Reset Clamping Point | Robotâ†’Press | 24V DI |
| 24 | A21.2 | Reset End Bend | Robotâ†’Press | 24V DI |
| PE | â€” | Earth | â€” | GND |

### XC4M â€” All Pins
| Pin | Address | Name | Dir | Type |
|---|---|---|---|---|
| 1 | E22.0 | Die Clamping Closed | Pressâ†’Robot | 24V DO |
| 2 | E22.1 | Punch Clamping Closed | Pressâ†’Robot | 24V DO |
| 3â€“7 | A22.0 | Command Change Tools Cycle | Robotâ†’Press | 24V DI |
| 8 | A22.1 | Unlock Die | Robotâ†’Press | 24V DI |
| 9 | A22.2 | Unlock Punch | Robotâ†’Press | 24V DI |
| 10 | A22.3 | Editing Mode Selection | Robotâ†’Press | 24V DI |
| 11 | A22.4 | Automatic Mode Selection | Robotâ†’Press | 24V DI |
| 12 | A22.5 | Program Selection Bit 1 (LSB) | Robotâ†’Press | 24V DI |
| 13 | A22.6 | Program Selection Bit 2 (MSB) | Robotâ†’Press | 24V DI |
| 14â€“16 | â€” | Optional / Spare | â€” | â€” |
| PE | â€” | Earth | â€” | GND |

---

## BENDING CYCLE TIMING & SIGNAL SEQUENCE

This section documents the full automated bending cycle derived from the timing diagram (pages 4â€“5 of the interface document), including a 3-bend sequence covering muted, angle-controlled, and unmuted bends.

---

### PHASE 0 â€” STARTUP / FIRST BEND INITIALIZATION
```
PRECONDITIONS:
  Press in Automatic Mode (E20.0 HIGH)
  Die Clamping Closed (E22.0 HIGH)
  Punch Clamping Closed (E22.1 HIGH)
  Press Devices Out of Robot Area (E21.6 HIGH)
  Enable from Robot CH1+CH2 (XC3M Pins 9-12 closed)
  Fence from Robot CH1+CH2 (XC3M Pins 13-16 closed)
  No emergency on either side (Pins 1-8 all healthy)

ROBOT ACTIONS:
  â†’ Send A20.7 HIGH (START FROM FIRST BEND) â€” forces press to step 1
  â† Wait for E21.4 HIGH (FIRST BEND ACTIVE) â€” confirms step 1 loaded
  â†’ Send A22.4 HIGH (AUTOMATIC MODE SELECTION) â€” confirm auto mode
  â† Confirm E20.0 HIGH (PRESS IN AUTOMATIC MODE)
```

---

### PHASE 1 â€” PART POSITIONING (Robot loads part to back gauge)
```
PRECONDITIONS: Beam at UDP (E20.2 HIGH)

PRESS SIGNALS:
  E20.2 HIGH  â€” Beam at Upper Dead Point (safe zone)
  E20.6 HIGH  â€” Axis in Position (backgauge ready)
  E21.4 HIGH  â€” First Bend Active

ROBOT ACTIONS:
  â†’ Robot arm enters press zone
  â†’ Robot presents part to back gauge fingers
  â† Wait for E21.0 HIGH (Finger 1 contact)
  â† Wait for E21.1 HIGH (Finger 2 contact)  [if assigned]
  â† Wait for E21.2 HIGH (Finger 3 contact)  [if assigned]
  â† Wait for E21.3 HIGH (Finger 4 contact)  [if assigned]
  â†’ All required finger sensors HIGH = part correctly positioned
  â†’ Robot releases gripper / switches to guiding mode
  â†’ Robot clears to safe position (or stays to guide sheet)
```

---

### PHASE 2 â€” BEND 1 (with Mute Point stop â€” typical first bend)
```
STEP 2a â€” INITIATE DESCENT:
  ROBOT â†’ A20.1 HIGH (BEAM DOWNWARDS)
  ROBOT â†’ A21.0 HIGH (RESET MUTE POINT) â€” can be pre-sent to avoid pause
  ROBOT â†’ A21.1 HIGH (RESET CLAMPING POINT) â€” can be pre-sent

  PRESS: Beam descends at FAST SPEED
  E20.2 goes LOW (left UDP)

STEP 2b â€” MUTE POINT:
  â† E20.1 goes HIGH (BEAM AT MUTE POINT)
  If A21.0 (RESET MUTE) was already HIGH â†’ beam continues without pause
  If A21.0 was LOW â†’ beam STOPS at mute, waits for A21.0 to go HIGH
  PRESS: Beam transitions to SLOW SPEED descent

STEP 2c â€” CLAMPING POINT:
  â† E20.3 goes HIGH (BEAM AT CLAMPING POINT)
  Sheet is now pinched between punch and die
  PRESS: Back gauge pushback begins (axes retract)
  E20.6 goes LOW (Axis in Position lost â€” axes moving)
  If A21.1 (RESET CLAMPING) was already HIGH â†’ beam continues
  If A21.1 was LOW â†’ beam STOPS, waits for A21.1 HIGH
  ROBOT: Must have confirmed clear of sheet path by now

STEP 2d â€” BENDING:
  â† E20.6 goes HIGH again (Axis in Position restored after pushback)
  Press continues descent to programmed lower dead point
  â† E22.3 goes HIGH (ANGLE CONTROL ACTIVE ON BEND) [if angle ctrl configured]

STEP 2e â€” LOWER DEAD POINT & END OF BEND:
  â† E20.4 goes HIGH (BEAM AT LOWER DEAD POINT â€” LDP)
    â””â”€ Remains HIGH until robot sends RESET END BEND
  â† E20.7 goes HIGH (ANGLE CONTROL OK) [if angle device active]
  â† E20.5 goes HIGH (PRESS-BRAKE IN END OF BEND)
    â””â”€ Remains HIGH until beam returns to UDP

  ROBOT: Confirms bend done, prepares for next action
  ROBOT â†’ A21.2 HIGH (RESET END BEND) â€” commands beam to retract
  E20.4 goes LOW (LDP clears as beam begins moving up)

STEP 2f â€” BEAM RETURN:
  Beam moves upward (decompression â†’ press opening â†’ UDP)
  â† E20.2 goes HIGH (BEAM AT UPPER DEAD POINT)
  â† E20.5 goes LOW (End of Bend clears at UDP)
  â† E20.6 goes HIGH (Axis in Position at UDP)
  ROBOT â†’ A21.2 LOW (RESET END BEND released)
```

---

### PHASE 3 â€” CHANGE BENDING STEP
```
TRIGGERED WHEN: Bend N complete and more bends remain

  ROBOT â†’ A20.4 HIGH (CHANGE BENDING STEP)
    â””â”€ Sent after E20.5 (END OF BEND) was HIGH AND after RESET END BEND sent
  PRESS: Loads next bending step parameters
  PRESS: Back gauge repositions for next bend
  â† E20.6 goes LOW during repositioning
  â† E21.4: only HIGH if returning to step 1
  â† E20.6 goes HIGH again when axes in position for next step
  ROBOT: Repositions part for next bend location
  ROBOT â†’ A20.4 LOW (release CHANGE STEP signal)

  âš ï¸ AXIS IN POSITION (E20.6) TIMING DETAIL:
    - HIGH at UDP (axes ready for loading)
    - Goes LOW when descending (lost during motion)
    - Goes HIGH again at Clamping Point after pushback completes
    - Goes OFF again until next CHANGE STEP repositioning complete
```

---

### PHASE 4 â€” BEND 2 (with Angle Control â€” same sequence as Bend 1 but angle device active)
```
Additional signals active vs. Bend 1:
  â† E22.3 HIGH during bending (ANGLE CONTROL ACTIVE ON BEND)
  â† E20.7 HIGH when measurement confirmed (ANGLE CONTROL OK)

ROBOT RULE: Do NOT send RESET END BEND (A21.2) until BOTH:
  E20.5 HIGH (END OF BEND) AND E20.7 HIGH (ANGLE CONTROL OK)
  If angle is not OK â†’ press may request re-bend â†’ wait for new E20.7 HIGH
```

---

### PHASE 5 â€” BEND 3 (no Mute Point â€” fast full-speed descent)
```
Identical to Bend 1 EXCEPT:
  - No mute point for this step (step programmed without mute)
  - E20.1 (BEAM AT MUTE POINT) does NOT go HIGH
  - Beam descends at full speed directly to Clamping Point
  - E20.3 (CLAMPING POINT) is first intermediate stop
  - A21.0 (RESET MUTE) irrelevant for this step

ROBOT: Must still pre-send A21.1 (RESET CLAMPING) to avoid CP pause
```

---

### PHASE 6 â€” PART UNLOAD
```
AFTER FINAL BEND:
  â† E20.2 HIGH (Beam at UDP)
  â† E20.5 LOW (End of Bend cleared)
  ROBOT â†’ A20.0 HIGH (BEAM UPWARDS) [if needed to ensure full retraction]
  ROBOT: Arm enters to grip finished part
  ROBOT: Removes part from press zone
  ROBOT â†’ A20.7 HIGH (START FROM FIRST BEND) [if cycling same program]
  OR
  ROBOT â†’ A20.4 HIGH (CHANGE BENDING STEP) [to advance to next part program]
  OR
  ROBOT â†’ A22.3 HIGH (EDITING MODE SELECTION) + new program bits [to change program]
```

---

### FULL SIGNAL STATE TABLE (by machine phase)

| Signal | Addr | Load | Fastâ†“ | Mute | Slowâ†“ | Clamp | Bending | LDP | Retractâ†‘ | UDP | Change Step |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Press in Auto | E20.0 | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ |
| Beam at UDP | E20.2 | âœ“ | â€” | â€” | â€” | â€” | â€” | â€” | â€” | âœ“ | âœ“ |
| Beam at Mute | E20.1 | â€” | â€” | âœ“ | â€” | â€” | â€” | â€” | â€” | â€” | â€” |
| Beam at CP | E20.3 | â€” | â€” | â€” | â€” | âœ“ | â€” | â€” | â€” | â€” | â€” |
| Beam at LDP | E20.4 | â€” | â€” | â€” | â€” | â€” | â€” | âœ“* | â€” | â€” | â€” |
| End of Bend | E20.5 | â€” | â€” | â€” | â€” | â€” | â€” | âœ“* | â€” | â€” | â€” |
| Axis in Position | E20.6 | âœ“ | â€” | â€” | â€” | âœ“ | â€” | â€” | â€” | âœ“ | varies |
| Angle Ctrl OK | E20.7 | â€” | â€” | â€” | â€” | â€” | â€” | âœ“ | â€” | â€” | â€” |
| Fingers OK | E21.0â€“3 | âœ“ | â€” | â€” | â€” | â€” | â€” | â€” | â€” | â€” | â€” |
| First Bend | E21.4 | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | â€” |
| Devices Clear | E21.6 | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ | âœ“ |
| Angle Ctrl Active | E22.3 | â€” | â€” | â€” | â€” | â€” | âœ“ | âœ“ | â€” | â€” | â€” |

*\* Remains HIGH until RESET END BEND (A21.2) is sent by robot*

---

## CRITICAL RULES & INTERLOCKS

### Robot MUST verify before commanding Beam Down (A20.1):
1. **E20.0 HIGH** â€” Press in Automatic Mode
2. **E21.6 HIGH** â€” Press devices clear of robot work area
3. **XC3M Pins 9â€“12 CLOSED** â€” Enable from Robot (both channels)
4. **XC3M Pins 1â€“4 CLOSED** â€” No press-brake emergency active
5. **E22.0 HIGH** â€” Die clamping confirmed (if relevant to step)
6. **E22.1 HIGH** â€” Punch clamping confirmed (if relevant to step)

### Robot MUST verify before entering press zone:
1. **E20.2 HIGH** â€” Beam at UDP
2. **E20.6 HIGH** â€” Axes in position (not moving)
3. **E21.6 HIGH** â€” Press devices clear

### Robot MUST release part/gripper before:
1. **E20.3 (CP)** â€” Before clamping point is reached (sheet will be pinched)

### Robot MUST NOT send RESET END BEND (A21.2) until:
1. **E20.5 HIGH** â€” End of Bend confirmed
2. **E20.7 HIGH** â€” Angle Control OK (if angle device is active on that step)

### When Fence is open (E169.4 contact open):
- Beam descends at SLOW SPEED ONLY regardless of other commands
- This is a hardware enforcement via the PCSS, not just a PLC rule

### RESET signals (A21.0, A21.1, A21.2) behavior:
- Can be sent as a **continuous HIGH** from the start of CHANGE STEP to prevent any pause at mute/clamping/end positions
- Used in production mode where robot is clear and pauses are not needed
- When set LOW at the right time, they create deliberate hold points for robot synchronization

---

## PROGRAM CHANGE CYCLE (XC4M-based)

When the robot needs to change the bending program between parts:

```
1. Complete all bends on current part (beam at UDP, E20.5 cleared)
2. Robot â†’ A22.3 HIGH (EDITING MODE SELECTION)
   â””â”€ Press CNC enters editing/manual mode
3. Robot â†’ A22.5 / A22.6 to binary-encode desired program number
4. Robot â†’ A22.3 LOW, then A22.4 HIGH (AUTOMATIC MODE SELECTION)
   â””â”€ Press CNC loads selected program and returns to auto
5. Robot â†’ A20.7 HIGH (START FROM FIRST BEND)
   â””â”€ Press resets to step 1 of new program
6. â† Confirm E21.4 HIGH (FIRST BEND ACTIVE)
7. Begin new part cycle
```

---

## CONNECTOR PART NUMBERS SUMMARY

| Connector | Function | Press-Side Connector Part # |
|---|---|---|
| XC2F | Power + Status I/O | WeidmÃ¼ller 1745850000 + 121240000 |
| XC3M | Safety (dry contacts + command outputs) | WeidmÃ¼ller 1745790000 + 121240000 |
| XC4M | Tooling + Program Selection | WeidmÃ¼ller 1745780000 + 1208600000 |

---

*Document Source: BLM Press-Brake Interface ver. 4.0 â€” 5 pages*  
*Reference compiled for PLC/Robot integration controls narrative development*

