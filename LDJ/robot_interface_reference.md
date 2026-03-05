# BLM Press-Brake ↔ Robot Interface Reference
**Document:** BLM Press-Brake Interface ver. 4.0  
**Purpose:** Complete signal reference for PLC/Robot integration with press brake  
**Connectors Covered:** XC2F (Power + I/O), XC3M (Safety), XC4M (Tooling + Program)

---

## WIRING FUNDAMENTALS

| Parameter | Value |
|---|---|
| Logic Voltage | 24 VDC, supplied **by the press-brake** |
| Common Reference | All robot I/O signals referenced to XC2F Pin 1 (0 VDC PRESS) |
| Power Source | XC2F Pin 2 (24 VDC PRESS) — press supplies power to robot I/O cards |
| Galvanic Isolation | All power lines are galvanically separated |
| Safety Contacts | Dry contacts (not 24V logic) on XC3M |

> **⚠️ Critical:** The press-brake **supplies** the 24 VDC reference for all I/O. The robot does not source power for these signals — it sinks/sources relative to the press-brake rail. Do not connect a robot-side 24V supply to these pins.

---

## CONNECTOR XC2F — POWER + STATUS I/O
**Press-side connector:** Weidmüller 1745850000 + Weidmüller 121240000 (or equivalent)

### Power Pins
| Pin | Signal Name | Direction | Description |
|---|---|---|---|
| 1 | 0 VDC PRESS | — | Press-brake 0V reference. Common for all I/O cards. |
| 2 | 24 VDC PRESS | — | Press-brake 24V supply. Powers robot I/O interface cards. |
| 20–24 | PE | — | Earth / protective ground connection |

---

### XC2F Input Signals (Press → Robot PLC)
*All signals are 24V logic, referenced to Pin 1 (0 VDC PRESS)*

| Pin | PLC Address | Signal Name | Active State | Detailed Description |
|---|---|---|---|---|
| 3 | E20.0 | PRESS IN AUTOMATIC MODE | HIGH = Auto | Connected to a selector on the press-brake. HIGH when press is in "with robot" / automatic operating mode. Robot must check this before initiating any cycle. |
| 4 | E20.1 | BEAM AT MUTE POINT | HIGH = at mute | Ram has reached the speed-change position (mute point). Speed transitions from fast to slow descent here. Signal is used to gate robot actions at this position. |
| 5 | E20.2 | BEAM AT UPPER DEAD POINT (UDP) | HIGH = at UDP | Ram is at the fully retracted upper position for the **current bending step**. This is the primary "safe to enter" signal for robot loading/unloading. |
| 6 | E20.3 | BEAM AT CLAMPING POINT (CP) | HIGH = at CP | Ram has made contact with the sheet (pinch/clamping point). Sheet is now gripped between punch and die. Robot must have released part before this goes HIGH. |
| 7 | E20.4 | BEAM AT LOWER DEAD POINT (LDP) | HIGH = at LDP | Ram has reached the programmed bottom position for the current bend step. **Remains HIGH until robot sends RESET END BEND** (XC3M Pin 24). Only clears when beam begins moving upward. |
| 8 | E20.5 | PRESS-BRAKE IN END OF BEND | HIGH = bend done | Bend step fully completed — includes spring-back and angle measurement. **Remains HIGH until the complete ending of the step (i.e., until UDP is reached on the way back up).** This is the trigger for robot to know bending is done and part is ready for retrieval after beam clears. |
| 9 | E20.6 | AXIS IN POSITION | HIGH = in position | Back gauge axes (X1, X2, Z1, Z2, R1, R2, angle control, etc.) are in position for the bending step. **Timing:** Goes ON at UDP → lost during descent → restored again after pushback at clamping → goes OFF again until next step change. |
| 10 | E20.7 | ANGLE CONTROL OK | HIGH = angle OK | The angle measurement device has confirmed the bend angle is within tolerance. Goes active after angle measurement completes at LDP. |
| 11 | E21.0 | SENSOR ON FINGER 1 | HIGH = contact | Sheet is in contact with back gauge finger 1 (left side). All assigned finger sensors must be HIGH before robot releases part and allows bending. |
| 12 | E21.1 | SENSOR ON FINGER 2 | HIGH = contact | Sheet contact with back gauge finger 2 (right side, or next finger if configured). |
| 13 | E21.2 | SENSOR ON FINGER 3 | HIGH = contact | Sheet contact with back gauge finger 3. |
| 14 | E21.3 | SENSOR ON FINGER 4 | HIGH = contact | Sheet contact with back gauge finger 4. |
| 15 | E21.4 | FIRST BEND ACTIVE | HIGH = first bend | The first bending step in the program is currently active on the press-brake. Used by robot to confirm program position synchronization. |
| 16–17 | E21.6 | PRESS DEVICES OUT OF WORKING ROBOT AREA | HIGH = clear | CNC console, safety laser beams, side door, and other press-brake devices have moved out of the robot's working envelope. Collision avoidance signal. Robot must not move into press zone unless this is HIGH. |
| 18–19 | E22.3 | ANGLE CONTROL ACTIVE ON BEND | HIGH = measuring | The angle control device is actively measuring the bend angle during the current bending step. |

---

## CONNECTOR XC3M — SAFETY SIGNALS
**Press-side connector:** Weidmüller 1745790000 + Weidmüller 121240000 (or equivalent)

> **⚠️ All pins 1–16 are DRY CONTACTS — not 24V logic signals.** These are galvanically isolated safety relay contacts. They must be wired into the appropriate safety relay / safety PLC inputs on both sides. Do not apply 24V logic directly without proper safety relay interface.

### XC3M Safety Input Contacts (Press → Robot, dry contact)
| Pins | PLC Address | Signal Name | Contact Type | Description |
|---|---|---|---|---|
| 1–2 | A175.0 | EMERGENCY FROM PRESS-BRAKE CH1 | Normally Closed (NC) | Opens when press-brake is in emergency state (any e-stop pressed, back door open, gate or light curtain triggered). **Must NOT be affected by robot-side emergencies (Pins 5–8).** Two-channel (CH1 + CH2) for safety category compliance. |
| 3–4 | A175.0 | EMERGENCY FROM PRESS-BRAKE CH2 | Normally Closed (NC) | Second channel of press-brake emergency contact. Both CH1 and CH2 must be monitored independently by robot safety relay for dual-channel integrity. |

### XC3M Safety Input Contacts (Robot → Press, dry contact)
| Pins | PLC Address | Signal Name | Contact Type | Description |
|---|---|---|---|---|
| 5–6 | — | EMERGENCY FROM ROBOT CH1 | Normally Closed (NC) | Robot cell e-stop chain CH1, fed INTO the press-brake safety circuit. Opens on any robot-side emergency. Press-brake safety controller monitors this to stop ram. |
| 7–8 | — | EMERGENCY FROM ROBOT CH2 | Normally Closed (NC) | Robot cell e-stop chain CH2. Second channel for dual-channel integrity on robot → press direction. |
| 9–10 | E169.0 | ENABLE FROM ROBOT CH1 | Normally Open (NO) | Closes when robot safety conditions are verified. **This contact enables downward beam movement.** Both CH1 and CH2 must be closed for beam down to be permitted. |
| 11–12 | E169.0 | ENABLE FROM ROBOT CH2 | Normally Open (NO) | Second channel of robot enable. Closes when robot safety verified. Both channels required for beam-down permission. |
| 13–14 | E169.4 | FENCE FROM ROBOT CH1 | Normally Open (NO) | Closes when the robot cell safety fences are closed and restored. **When this contact is OPEN, the beam must only move downward slowly (reduced speed / muted mode).** |
| 15–16 | E169.4 | FENCE FROM ROBOT CH2 | Normally Open (NO) | Second channel of fence signal. Both channels must be closed for full-speed operation. When open → forced slow speed on beam descent. |

### XC3M Output Signals (Robot PLC → Press, 24V logic)
*Referenced to XC2F Pin 1 (0 VDC PRESS)*

| Pin | PLC Address | Signal Name | Direction | Detailed Description |
|---|---|---|---|---|
| 17 | A20.0 | BEAM UPWARDS | Robot → Press | Commands the beam to move upward. **Must be usable at any time** — no safety pre-conditions required. Use to abort a bend or retract beam from any position. |
| 18 | A20.1 | BEAM DOWNWARDS | Robot → Press | Commands beam downward movement. **Note: This signal is only accepted by the press-brake after all safety conditions are verified** (XC3M Pins 9–12, Enable From Robot, must be closed). Commanding this without safety chain closed will be ignored. |
| 19 | A20.4 | CHANGE BENDING STEP | Robot → Press | Commands the press-brake to advance to the next bending step in the program. Only valid after the previous step is fully complete (END OF BEND signal active). |
| 20 | A20.6 | PRESS PUMP SHUT-DOWN | Robot → Press | When HIGH, commands the hydraulic pump to shut down. Use at end of production run, on cycle timeout, or on safe stop condition. |
| 21 | A20.7 | START FROM FIRST BEND | Robot → Press | Forces the press-brake to activate/return to the first bending step of the program. Used to re-synchronize at start of new part cycle. |
| 22 | A21.0 | RESET MUTE POINT | Robot → Press | The beam stops automatically at the mute point and waits for this signal before continuing downward. **Can be sent continuously from the start of CHANGE STEP to avoid the machine pausing** at the mute point during normal production. |
| 23 | A21.1 | RESET CLAMPING POINT | Robot → Press | The beam stops automatically at the clamping point and waits for this signal before continuing downward. **Can be sent continuously from CHANGE STEP** to avoid machine pause at CP. Used to confirm robot has released the part before full clamping pressure is applied. |
| 24 | A21.2 | RESET END BEND | Robot → Press | The beam stops at the end of the bend (after angle measured OK and spring-back complete) and waits for this signal. Sending this causes the beam to begin moving upward and **E20.4 (LDP) to go LOW.** Only send after robot has confirmed it is safe for beam to retract. |

### XC3M — Full Safety Architecture Diagram
```
PRESS-BRAKE SIDE                    ROBOT SIDE
─────────────────                   ──────────────

Press E-Stop chain ──[NC DRY]──→  Robot safety relay monitors
  (Pins 1-2: CH1)                   A175.0 = press emergency status
  (Pins 3-4: CH2)                   Both channels independently monitored

                    ←──[NC DRY]── Robot E-Stop chain
  Press safety               (Pins 5-6: CH1)
  controller monitors        (Pins 7-8: CH2)
  robot e-stop state         NB: Must NOT include press emergencies

Robot ENABLE  ──────[NO DRY]──→  Beam DOWN permitted only when closed
  (Pins 9-10: CH1)                  E169.0 = enable CH1
  (Pins 11-12: CH2)                 E169.0 = enable CH2

Robot FENCE   ──────[NO DRY]──→  Beam SLOW SPEED ONLY when open
  (Pins 13-14: CH1)                 E169.4 = fence CH1
  (Pins 15-16: CH2)                 E169.4 = fence CH2
                                    Open fence → forced slow descent
```

**Safety Rule — Beam Down Permission Logic (derived from document):**
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

## CONNECTOR XC4M — TOOLING & PROGRAM CONTROL
**Press-side connector:** Weidmüller 1745780000 + Weidmüller 1208600000 (or equivalent)

### XC4M Input Signals (Press → Robot PLC)
| Pin | PLC Address | Signal Name | Active State | Description |
|---|---|---|---|---|
| 1 | E22.0 | DIE CLAMPING CLOSED | HIGH = closed | Lower tool (die) clamping is locked. Robot must see this HIGH before trusting the tooling setup is secure for bending. |
| 2 | E22.1 | PUNCH CLAMPING CLOSED | HIGH = closed | Upper tool (punch) clamping is locked. Robot must see this HIGH before trusting the tooling setup is secure for bending. |

### XC4M Output Signals (Robot PLC → Press)
| Pins | PLC Address | Signal Name | Description |
|---|---|---|---|
| 3–7 | A22.0 | COMMAND CHANGE TOOLS CYCLE | Bypasses the safety pressure control of upper AND lower tool clamping systems. During tool change, the beam is held at clamping position (CP) until the change cycle completes. **Must only be activated during deliberate tool change sequence.** |
| 8 | A22.1 | UNLOCK DIE | Commands opening of the lower tool clamping. **Must only be activated AFTER A22.0 (COMMAND CHANGE TOOLS CYCLE) is active (Pin 7 condition ON).** |
| 9 | A22.2 | UNLOCK PUNCH | Commands opening of the upper tool clamping. **Must only be activated AFTER A22.0 (COMMAND CHANGE TOOLS CYCLE) is active (Pin 7 condition ON).** |
| 10 | A22.3 | EDITING MODE SELECTION | Activates editing mode in the press-brake CNC. Used during a change-bending-program cycle to allow program modification. |
| 11 | A22.4 | AUTOMATIC MODE SELECTION | Activates automatic mode on the press-brake CNC. Used at the end of a program-change cycle to return to production. |
| 12 | A22.5 | PROGRAM SELECTION BIT 1 (LSB) | Binary program select — least significant bit. Together with Bit 2 selects the bending program to load. |
| 13 | A22.6 | PROGRAM SELECTION BIT 2 (MSB) | Binary program select — most significant bit. |

**Program Selection Binary Encoding (2-bit, expandable):**
| A22.6 (Bit 2) | A22.5 (Bit 1) | Program Selected |
|---|---|---|
| 0 | 0 | Program 0 |
| 0 | 1 | Program 1 |
| 1 | 0 | Program 2 |
| 1 | 1 | Program 3 |

> **Note:** Only 2 bits are defined in this version (ver. 4.0). Additional bits may exist in extended implementations via optional signal pins 14–16.

**Tool Change Sequence (required order):**
```
1. Robot commands beam to CP (Clamping Point)
2. Robot sends A22.0 HIGH (COMMAND CHANGE TOOLS CYCLE) — bypasses pressure safety
3. Beam holds at CP
4. Robot sends A22.1 HIGH (UNLOCK DIE) → lower tool releases
5. Robot sends A22.2 HIGH (UNLOCK PUNCH) → upper tool releases
6. Robot performs physical tool swap
7. Robot sends A22.1/A22.2 LOW → tools re-clamp
8. Robot waits for E22.0 HIGH (DIE CLAMPING CLOSED) AND E22.1 HIGH (PUNCH CLAMPING CLOSED)
9. Robot sends A22.0 LOW (exits tool change mode)
10. Continue bending cycle
```

---

## COMPLETE PIN SUMMARY TABLE

### XC2F — All Pins
| Pin | Address | Name | Dir | Type |
|---|---|---|---|---|
| 1 | — | 0 VDC PRESS | PWR | Power |
| 2 | — | 24 VDC PRESS | PWR | Power |
| 3 | E20.0 | Press in Automatic Mode | Press→Robot | 24V DO |
| 4 | E20.1 | Beam at Mute Point | Press→Robot | 24V DO |
| 5 | E20.2 | Beam at Upper Dead Point | Press→Robot | 24V DO |
| 6 | E20.3 | Beam at Clamping Point | Press→Robot | 24V DO |
| 7 | E20.4 | Beam at Lower Dead Point | Press→Robot | 24V DO |
| 8 | E20.5 | Press-Brake in End of Bend | Press→Robot | 24V DO |
| 9 | E20.6 | Axis in Position | Press→Robot | 24V DO |
| 10 | E20.7 | Angle Control OK | Press→Robot | 24V DO |
| 11 | E21.0 | Sensor on Finger 1 | Press→Robot | 24V DO |
| 12 | E21.1 | Sensor on Finger 2 | Press→Robot | 24V DO |
| 13 | E21.2 | Sensor on Finger 3 | Press→Robot | 24V DO |
| 14 | E21.3 | Sensor on Finger 4 | Press→Robot | 24V DO |
| 15 | E21.4 | First Bend Active | Press→Robot | 24V DO |
| 16–17 | E21.6 | Press Devices Out of Robot Area | Press→Robot | 24V DO |
| 18–19 | E22.3 | Angle Control Active on Bend | Press→Robot | 24V DO |
| 20–24 | PE | Earth | — | GND |

### XC3M — All Pins
| Pin | Address | Name | Dir | Type |
|---|---|---|---|---|
| 1–2 | A175.0 | Emergency from Press-Brake CH1 | Press→Robot | Dry NC |
| 3–4 | A175.0 | Emergency from Press-Brake CH2 | Press→Robot | Dry NC |
| 5–6 | — | Emergency from Robot CH1 | Robot→Press | Dry NC |
| 7–8 | — | Emergency from Robot CH2 | Robot→Press | Dry NC |
| 9–10 | E169.0 | Enable from Robot CH1 | Robot→Press | Dry NO |
| 11–12 | E169.0 | Enable from Robot CH2 | Robot→Press | Dry NO |
| 13–14 | E169.4 | Fence from Robot CH1 | Robot→Press | Dry NO |
| 15–16 | E169.4 | Fence from Robot CH2 | Robot→Press | Dry NO |
| 17 | A20.0 | Beam Upwards | Robot→Press | 24V DI |
| 18 | A20.1 | Beam Downwards | Robot→Press | 24V DI |
| 19 | A20.4 | Change Bending Step | Robot→Press | 24V DI |
| 20 | A20.6 | Press Pump Shut-Down | Robot→Press | 24V DI |
| 21 | A20.7 | Start from First Bend | Robot→Press | 24V DI |
| 22 | A21.0 | Reset Mute Point | Robot→Press | 24V DI |
| 23 | A21.1 | Reset Clamping Point | Robot→Press | 24V DI |
| 24 | A21.2 | Reset End Bend | Robot→Press | 24V DI |
| PE | — | Earth | — | GND |

### XC4M — All Pins
| Pin | Address | Name | Dir | Type |
|---|---|---|---|---|
| 1 | E22.0 | Die Clamping Closed | Press→Robot | 24V DO |
| 2 | E22.1 | Punch Clamping Closed | Press→Robot | 24V DO |
| 3–7 | A22.0 | Command Change Tools Cycle | Robot→Press | 24V DI |
| 8 | A22.1 | Unlock Die | Robot→Press | 24V DI |
| 9 | A22.2 | Unlock Punch | Robot→Press | 24V DI |
| 10 | A22.3 | Editing Mode Selection | Robot→Press | 24V DI |
| 11 | A22.4 | Automatic Mode Selection | Robot→Press | 24V DI |
| 12 | A22.5 | Program Selection Bit 1 (LSB) | Robot→Press | 24V DI |
| 13 | A22.6 | Program Selection Bit 2 (MSB) | Robot→Press | 24V DI |
| 14–16 | — | Optional / Spare | — | — |
| PE | — | Earth | — | GND |

---

## BENDING CYCLE TIMING & SIGNAL SEQUENCE

This section documents the full automated bending cycle derived from the timing diagram (pages 4–5 of the interface document), including a 3-bend sequence covering muted, angle-controlled, and unmuted bends.

---

### PHASE 0 — STARTUP / FIRST BEND INITIALIZATION
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
  → Send A20.7 HIGH (START FROM FIRST BEND) — forces press to step 1
  ← Wait for E21.4 HIGH (FIRST BEND ACTIVE) — confirms step 1 loaded
  → Send A22.4 HIGH (AUTOMATIC MODE SELECTION) — confirm auto mode
  ← Confirm E20.0 HIGH (PRESS IN AUTOMATIC MODE)
```

---

### PHASE 1 — PART POSITIONING (Robot loads part to back gauge)
```
PRECONDITIONS: Beam at UDP (E20.2 HIGH)

PRESS SIGNALS:
  E20.2 HIGH  — Beam at Upper Dead Point (safe zone)
  E20.6 HIGH  — Axis in Position (backgauge ready)
  E21.4 HIGH  — First Bend Active

ROBOT ACTIONS:
  → Robot arm enters press zone
  → Robot presents part to back gauge fingers
  ← Wait for E21.0 HIGH (Finger 1 contact)
  ← Wait for E21.1 HIGH (Finger 2 contact)  [if assigned]
  ← Wait for E21.2 HIGH (Finger 3 contact)  [if assigned]
  ← Wait for E21.3 HIGH (Finger 4 contact)  [if assigned]
  → All required finger sensors HIGH = part correctly positioned
  → Robot releases gripper / switches to guiding mode
  → Robot clears to safe position (or stays to guide sheet)
```

---

### PHASE 2 — BEND 1 (with Mute Point stop — typical first bend)
```
STEP 2a — INITIATE DESCENT:
  ROBOT → A20.1 HIGH (BEAM DOWNWARDS)
  ROBOT → A21.0 HIGH (RESET MUTE POINT) — can be pre-sent to avoid pause
  ROBOT → A21.1 HIGH (RESET CLAMPING POINT) — can be pre-sent

  PRESS: Beam descends at FAST SPEED
  E20.2 goes LOW (left UDP)

STEP 2b — MUTE POINT:
  ← E20.1 goes HIGH (BEAM AT MUTE POINT)
  If A21.0 (RESET MUTE) was already HIGH → beam continues without pause
  If A21.0 was LOW → beam STOPS at mute, waits for A21.0 to go HIGH
  PRESS: Beam transitions to SLOW SPEED descent

STEP 2c — CLAMPING POINT:
  ← E20.3 goes HIGH (BEAM AT CLAMPING POINT)
  Sheet is now pinched between punch and die
  PRESS: Back gauge pushback begins (axes retract)
  E20.6 goes LOW (Axis in Position lost — axes moving)
  If A21.1 (RESET CLAMPING) was already HIGH → beam continues
  If A21.1 was LOW → beam STOPS, waits for A21.1 HIGH
  ROBOT: Must have confirmed clear of sheet path by now

STEP 2d — BENDING:
  ← E20.6 goes HIGH again (Axis in Position restored after pushback)
  Press continues descent to programmed lower dead point
  ← E22.3 goes HIGH (ANGLE CONTROL ACTIVE ON BEND) [if angle ctrl configured]

STEP 2e — LOWER DEAD POINT & END OF BEND:
  ← E20.4 goes HIGH (BEAM AT LOWER DEAD POINT — LDP)
    └─ Remains HIGH until robot sends RESET END BEND
  ← E20.7 goes HIGH (ANGLE CONTROL OK) [if angle device active]
  ← E20.5 goes HIGH (PRESS-BRAKE IN END OF BEND)
    └─ Remains HIGH until beam returns to UDP

  ROBOT: Confirms bend done, prepares for next action
  ROBOT → A21.2 HIGH (RESET END BEND) — commands beam to retract
  E20.4 goes LOW (LDP clears as beam begins moving up)

STEP 2f — BEAM RETURN:
  Beam moves upward (decompression → press opening → UDP)
  ← E20.2 goes HIGH (BEAM AT UPPER DEAD POINT)
  ← E20.5 goes LOW (End of Bend clears at UDP)
  ← E20.6 goes HIGH (Axis in Position at UDP)
  ROBOT → A21.2 LOW (RESET END BEND released)
```

---

### PHASE 3 — CHANGE BENDING STEP
```
TRIGGERED WHEN: Bend N complete and more bends remain

  ROBOT → A20.4 HIGH (CHANGE BENDING STEP)
    └─ Sent after E20.5 (END OF BEND) was HIGH AND after RESET END BEND sent
  PRESS: Loads next bending step parameters
  PRESS: Back gauge repositions for next bend
  ← E20.6 goes LOW during repositioning
  ← E21.4: only HIGH if returning to step 1
  ← E20.6 goes HIGH again when axes in position for next step
  ROBOT: Repositions part for next bend location
  ROBOT → A20.4 LOW (release CHANGE STEP signal)

  ⚠️ AXIS IN POSITION (E20.6) TIMING DETAIL:
    - HIGH at UDP (axes ready for loading)
    - Goes LOW when descending (lost during motion)
    - Goes HIGH again at Clamping Point after pushback completes
    - Goes OFF again until next CHANGE STEP repositioning complete
```

---

### PHASE 4 — BEND 2 (with Angle Control — same sequence as Bend 1 but angle device active)
```
Additional signals active vs. Bend 1:
  ← E22.3 HIGH during bending (ANGLE CONTROL ACTIVE ON BEND)
  ← E20.7 HIGH when measurement confirmed (ANGLE CONTROL OK)

ROBOT RULE: Do NOT send RESET END BEND (A21.2) until BOTH:
  E20.5 HIGH (END OF BEND) AND E20.7 HIGH (ANGLE CONTROL OK)
  If angle is not OK → press may request re-bend → wait for new E20.7 HIGH
```

---

### PHASE 5 — BEND 3 (no Mute Point — fast full-speed descent)
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

### PHASE 6 — PART UNLOAD
```
AFTER FINAL BEND:
  ← E20.2 HIGH (Beam at UDP)
  ← E20.5 LOW (End of Bend cleared)
  ROBOT → A20.0 HIGH (BEAM UPWARDS) [if needed to ensure full retraction]
  ROBOT: Arm enters to grip finished part
  ROBOT: Removes part from press zone
  ROBOT → A20.7 HIGH (START FROM FIRST BEND) [if cycling same program]
  OR
  ROBOT → A20.4 HIGH (CHANGE BENDING STEP) [to advance to next part program]
  OR
  ROBOT → A22.3 HIGH (EDITING MODE SELECTION) + new program bits [to change program]
```

---

### FULL SIGNAL STATE TABLE (by machine phase)

| Signal | Addr | Load | Fast↓ | Mute | Slow↓ | Clamp | Bending | LDP | Retract↑ | UDP | Change Step |
|---|---|---|---|---|---|---|---|---|---|---|---|
| Press in Auto | E20.0 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Beam at UDP | E20.2 | ✓ | — | — | — | — | — | — | — | ✓ | ✓ |
| Beam at Mute | E20.1 | — | — | ✓ | — | — | — | — | — | — | — |
| Beam at CP | E20.3 | — | — | — | — | ✓ | — | — | — | — | — |
| Beam at LDP | E20.4 | — | — | — | — | — | — | ✓* | — | — | — |
| End of Bend | E20.5 | — | — | — | — | — | — | ✓* | — | — | — |
| Axis in Position | E20.6 | ✓ | — | — | — | ✓ | — | — | — | ✓ | varies |
| Angle Ctrl OK | E20.7 | — | — | — | — | — | — | ✓ | — | — | — |
| Fingers OK | E21.0–3 | ✓ | — | — | — | — | — | — | — | — | — |
| First Bend | E21.4 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — |
| Devices Clear | E21.6 | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ |
| Angle Ctrl Active | E22.3 | — | — | — | — | — | ✓ | ✓ | — | — | — |

*\* Remains HIGH until RESET END BEND (A21.2) is sent by robot*

---

## CRITICAL RULES & INTERLOCKS

### Robot MUST verify before commanding Beam Down (A20.1):
1. **E20.0 HIGH** — Press in Automatic Mode
2. **E21.6 HIGH** — Press devices clear of robot work area
3. **XC3M Pins 9–12 CLOSED** — Enable from Robot (both channels)
4. **XC3M Pins 1–4 CLOSED** — No press-brake emergency active
5. **E22.0 HIGH** — Die clamping confirmed (if relevant to step)
6. **E22.1 HIGH** — Punch clamping confirmed (if relevant to step)

### Robot MUST verify before entering press zone:
1. **E20.2 HIGH** — Beam at UDP
2. **E20.6 HIGH** — Axes in position (not moving)
3. **E21.6 HIGH** — Press devices clear

### Robot MUST release part/gripper before:
1. **E20.3 (CP)** — Before clamping point is reached (sheet will be pinched)

### Robot MUST NOT send RESET END BEND (A21.2) until:
1. **E20.5 HIGH** — End of Bend confirmed
2. **E20.7 HIGH** — Angle Control OK (if angle device is active on that step)

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
2. Robot → A22.3 HIGH (EDITING MODE SELECTION)
   └─ Press CNC enters editing/manual mode
3. Robot → A22.5 / A22.6 to binary-encode desired program number
4. Robot → A22.3 LOW, then A22.4 HIGH (AUTOMATIC MODE SELECTION)
   └─ Press CNC loads selected program and returns to auto
5. Robot → A20.7 HIGH (START FROM FIRST BEND)
   └─ Press resets to step 1 of new program
6. ← Confirm E21.4 HIGH (FIRST BEND ACTIVE)
7. Begin new part cycle
```

---

## CONNECTOR PART NUMBERS SUMMARY

| Connector | Function | Press-Side Connector Part # |
|---|---|---|
| XC2F | Power + Status I/O | Weidmüller 1745850000 + 121240000 |
| XC3M | Safety (dry contacts + command outputs) | Weidmüller 1745790000 + 121240000 |
| XC4M | Tooling + Program Selection | Weidmüller 1745780000 + 1208600000 |

---

*Document Source: BLM Press-Brake Interface ver. 4.0 — 5 pages*  
*Reference compiled for PLC/Robot integration controls narrative development*
