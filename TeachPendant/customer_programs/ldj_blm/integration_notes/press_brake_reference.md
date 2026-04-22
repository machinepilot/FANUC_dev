---
scope: customer_specific
customer: ldj_blm
canonical: false
status: evolving
supersedes: FANUC_dev/LDJ/press_brake_reference.md
source:
  type: onsite_notes
  acquired_from: The Way Automation LLC
  acquired_date: "2026-04-22"
---

# press brake reference

> CONTEXT, NOT CANON. This is customer-specific integration material. If it contradicts `fanuc_dataset/normalized/`, canon wins. Raise conflicts under `task_state.conflicts[]`.
# Press Brake Electrical Diagram â€” Engineering Reference
**Project:** CN ESA â€“ 420-200 TON  
**Commission:** 04-2021 / PE0122  
**Customer:** BLM Group  
**Date:** 20/04/2021  
**Panel Maker:** UNIELECTRIC S.R.L.  
**Source Document:** 34-page electrical diagram  

---

## 1. SYSTEM OVERVIEW

### Machine Identity
- **Machine Type:** CNC Press Brake
- **Capacity:** 420-200 TON
- **CNC Controller:** ESA (Rack ESA + Touch Control ESA)
- **Safety System:** Lazersafe PCSS (Programmable Control Safety System)
- **Special Options:** Wila Clamping, Wila Crowning, Double Pedalboard, LED Strip, Sheet Follower

### Electrical Ratings
| Parameter | Value |
|---|---|
| Nominal Voltage | 380 VAC (3-phase) / Black wiring |
| Auxiliary Voltage | 24 VDC / Blue â€” 220 VAC / Grey |
| Frequency | 50â€“60 Hz |
| Nominal Current | 63 A |
| Total Power | 25 KW |
| Short Circuit Interruption Rate | 10 KA |
| Regulations | CEI 17-113 / CEI 17-114 |

---

## 2. POWER ARCHITECTURE (Pages 1â€“3)

### 2.1 Main Power Feed
| Diagram ID | Component | Brand/Model | Specs | Function |
|---|---|---|---|---|
| Q1.1 | Main Switch | Lovato GA063A | 3-pole, 63A | Main disconnector |
| F1.1 | Main Fuse Holder | Lovato FB03A3P | 3-pole, Delayed, 22Ã—58 / 50A | Main fuse protection |
| FLR1.1 | Drives Filter | Schaffner FN3270H-50-34 | 3-pole, 50A | EMI filter for Y1+Y2 drives |
| IND1.1 | Inductance â€“ Drive Y1 | Tecnocablaggi | 32A | Line inductance for AZ8.1 |
| IND1.2 | Inductance â€“ Drive Y2 | Tecnocablaggi | 32A | Line inductance for AZ8.2 |
| RT1.1 | Drive Y1 Switch | Lovato SM1R2500 | 3-pole, 20â€“25A | Motor protector for Y1 drive |
| RT1.2 | Drive Y2 Switch | Lovato SM1R2500 | 3-pole, 20â€“25A | Motor protector for Y2 drive |
| KSC3.1 | Phase Sequence Monitor | Lovato PMV10A440 | Voltage Monitoring | Prevents wrong phase sequence |

**Power Bus Labels (cross-reference notation):**
- `1-1L1L2L3` â†’ Main bus after Q1.1
- `1-2L1L2L3` â†’ Bus to filter / transformer feeds
- `1-7L1/L2/L3` â†’ Feed to Drive Y1 (AZ8.1)
- `1-8L1/L2/L3` â†’ Feed to Drive Y2 (AZ8.2)

### 2.2 Transformer & Secondary Power Distribution (Page 2)
| Diagram ID | Component | Model | Primary | Secondary | Function |
|---|---|---|---|---|---|
| TR2.1 | Back Gauge Transformer | Tecnocablaggi | 380 VAC Ã—3 / 2A | 230 VAC Ã—3, 1500VA / 3.5A | Feeds back gauge servo system |
| TR2.2 | Brakes Transformer | Italweber CFM00160CC15 | 380 VAC Ã—2 | 230 VAC Ã—2 / 160VA | Powers Y-axis motor brakes |
| TR2.3 | Sheet Follower Transformer | Exom SD17S5AP24HWB | 380 VAC Ã—3 / 2A | 230 VAC Ã—3, 1500VA / 3.5A | Feeds sheet follower servo |

**Associated Fuse Holders (Lovato FB01F3P / FB01F2P â€” Delayed):**
| Diagram ID | Poles | Rating | Protected Circuit |
|---|---|---|---|
| F2.1 | 3 | 4A / 10.3Ã—38 | 24 VDC Power Supply |
| F2.2 | 3 | 4A / 10.3Ã—38 | Back Gauge Transformer |
| F2.3 | 3 | 6A / 10.3Ã—38 | Back Gauge Power Supply |
| F2.4 | 2 | 2A / 10.3Ã—38 | Brakes Transformer |
| F2.5 | 2 | 2A / 10.3Ã—38 | Brakes Power Source |
| F2.6 | 3 | 4A / 10.3Ã—38 | Sheet Follower Transformer |
| F2.7 | 3 | 6A / 10.3Ã—38 | Sheet Follower Power Supply |

### 2.3 Crowning & Clamping Motor Power (Page 3)
| Diagram ID | Component | Brand/Model | Rating | Function |
|---|---|---|---|---|
| RT3.1 | Crowning Motor Protector | Lovato SM1P0160 | 3-pole, 1â€“1.6A | Protects M3.1 crowning motor |
| RT3.2 | Clamping Motor Protector | Lovato SM1P0160 | 3-pole, 1â€“1.6A | Protects M3.2 clamping motor |
| M3.1 | Crowning Motor | ATB-Motors SFA | 3-phase | Wila crowning table motor |
| M3.2 | Clamping Motor | ATB-Motors SFA | 3-phase | Wila clamping motor |
| K7.1 | Crowning Contactor (+) | Lovato LOVBF09100D024 | â€” | Forward direction crowning |
| K7.2 | Crowning Contactor (â€“) | Lovato LOVBF09100D024 | â€” | Reverse direction crowning |
| K7.3 | Clamping Contactor | Lovato LOVBF09100D024 | â€” | Clamping motor contactor |
| FLR3.1 | Crowning Motor Filter | â€” | â€” | Motor RFI filter |
| FLR3.2 | Clamping Motor Filter | â€” | â€” | Motor RFI filter |

**Main Power Contactors (controlled by PCSS â€” Page 13):**
| Diagram ID | Lovato Model | Controlled Circuit |
|---|---|---|
| K13.1 | LOVBFX1031 | Axis Y1 / Y2 power contactor |
| K13.2 | LOVBF3200D024 | Back Gauge power contactor |
| K13.3 | LOVBF3200D024 | Sheet Follower power contactor |
| K13.4 | LOVBF09100D024 | Emergency Offset Circuit contactor |

---

## 3. 24 VDC POWER SUPPLY ARCHITECTURE (Page 4 â€“ 4B)

### 3.1 Primary 24 VDC Supply
| Diagram ID | Component | Brand/Model | Specs |
|---|---|---|---|
| AL4.1 | 24 VDC Power Supply | WeidmÃ¼ller WD 1469550000 | In: 380VAC / 1.4A â€” Out: 24VDC / 20A |
| FE4.1 | Electronic Fuse Block | WeidmÃ¼ller WD 1527980000 | 8-channel, 24 VDC input |

**FE4.1 Channel Map (24 VDC Outputs):**
| Channel | Max Current | Destination | Cross-ref |
|---|---|---|---|
| 4-1 | 2A | Cabinet Cooling Fans | â€” |
| 4-2 | 6A | CN ESA Controller | 6.A0 |
| 4-3 | 4A | Limit Switches & Proximity Sensors | 11.E0 |
| 4-4 | 6A | Lubrification Unit | 5.E0 |
| 4-5 | 4A | Lighting (Cabinet/Machine) | 5.E0 |
| 4-6 | 6A | Robot Interface & Clamping | 7.E0 |
| 4-7 | 6A | UPS Y1 (AL4.2 input) | 4A.B2 |
| 4-8 | 6A | UPS Y2 (AL4.3 input) | 4A.B5 |
| K4.1 | â€” | Electronic Fuse Alarm relay | â€” |

> **âš ï¸ PLC/Robot Integration Note:** Channel **4-6** (6A, cross-ref 7.E0) is the 24 VDC supply powering the robot interface and clamping control circuit. Any shared I/O to/from the robot must be compatible with this 24 VDC rail.

### 3.2 Y-Axis UPS Supplies (Page 4A)
Two independent WeidmÃ¼ller UPS modules provide battery-backed 24 VDC for the servo drives, maintaining safe state during power loss.

| Diagram ID | Component | Model | Specs | Powers |
|---|---|---|---|---|
| AL4.2 | UPS â€“ Y1 Drive | WeidmÃ¼ller WD 1370050010 | In: 24VDC/1.2A â€” Out: 24VDC/5A | AZ8.1 (Drive Y1) |
| BAT4.2 | Battery â€“ Y1 | WeidmÃ¼ller WD 1406930000 | 24 VDC / 1.3 Ah | Backup for AL4.2 |
| K4.2 | Battery Alarm â€“ Y1 | â€” | NO/NC contacts | BAT4.2 fault signal |
| AL4.3 | UPS â€“ Y2 Drive | WeidmÃ¼ller WD 1370050010 | In: 24VDC/1.2A â€” Out: 24VDC/5A | AZ8.2 (Drive Y2) |
| BAT4.3 | Battery â€“ Y2 | WeidmÃ¼ller WD 1406930000 | 24 VDC / 1.3 Ah | Backup for AL4.3 |
| K4.3 | Battery Alarm â€“ Y2 | â€” | NO/NC contacts | BAT4.3 fault signal |

### 3.3 Drive Auxiliary Supply (Page 4B)
| Diagram ID | Component | Model | Specs |
|---|---|---|---|
| DR4.1 | Diode Redundancy Module | WeidmÃ¼ller WD 2486080000 | 5â€“48VDC 10A In / 5â€“48VDC 20A Out |
| FE4.2 | Electronic Fuse â€“ Drives | WeidmÃ¼ller WD 2081880000 | 4-channel, 24 VDC |

**FE4.2 Channel Map (Drive-Side 24 VDC):**
| Channel | Max Current | Destination | Cross-ref |
|---|---|---|---|
| 4-13 | 6A | Drive Y1 (AZ8.1) auxiliary power | 8.A0 |
| 4-14 | 6A | Drive Y2 (AZ8.2) auxiliary power | 8A.A0 |
| 4-15 | 4A | PCSS Lazersafe controller | 14.E0 |
| 4-16 | 2A | Not Used | â€” |
| K4.4 | â€” | Electronic Fuse Alarm relay | â€” |

---

## 4. Y-AXIS SERVO DRIVES (Pages 8 â€“ 8A)

The press brake uses two identical servo drive axes (Y1 left, Y2 right) for synchronized ram movement.

### 4.1 Drive Y1 â€” AZ8.1 AXIS Y1 (Page 8)
| Parameter | Value |
|---|---|
| Drive Model | Exom F150MR (OPDE B-110A / Tdemacno) |
| Diagram ID | AZ8.1 |
| Motor | M8.1 â€” Unimec MTRI 500-450-075-470-1380-750 SP UM |
| Motor Brake | BRK8.1 â€” Intorq BFK458-14N |
| Braking Resistance | RF8.1 â€” IRE HPR20010R |
| Brake Relay | K11.1 â€” Y1 Brake Command |
| Drive Enable Relay | K10.1 (Torque Enable) |
| Drive OK Relay | K8.2 |
| Linear Scale | Heidenhain â€” CN12 / ENC1 IN â€“ PCSS (9-pin Male) |

**Drive Y1 Signal Map:**
| Signal | Wire/Terminal | Source / Destination | Description |
|---|---|---|---|
| 24 VDC Power | 4-13 / OV4-12 | FE4.2 ch.4-13 | Drive auxiliary power |
| Enable Analog | 15-26 | PCSS output | Analog speed reference enable |
| Input Enable | 14-31 | PCSS output | Drive enable command |
| Analog + | 8-2 White | ESA Analog OUT PIN 1 (+) | Speed reference signal |
| Analog â€“ | 8-3 Brown | ESA Analog OUT PIN 9 (â€“) | Speed reference reference |
| DC BUS Alarm | 8X20 | â†’ 14.C8 | DC bus fault feedback |
| Bend Strength | 5-1 | From ESA (5.D0) | Bend force reference |
| Torque Enable | 8-4 | K10.1 coil | Enable torque output |
| STO Circuit + | 13Y01H | PCSS CN1 Y01H | Safe Torque Off positive |
| STO Circuit â€“ | 13Y01L | PCSS CN1 Y01L | Safe Torque Off negative |
| Thermal Pad + | 8-10 (Blue M1-85) | â†’ K8.2 monitoring | Motor thermal protection input |
| Thermal Pad â€“ | 8-11 (Black M1-86) | â†’ K8.2 monitoring | Motor thermal protection return |
| Motor Phases | 1-7L1, 1-7L2, 1-7L3 | From RT1.1 | 3-phase motor power |
| Brake Command | K11.1 â†’ 11.C5 | To brake coil | Y1 motor holding brake |

### 4.2 Drive Y2 â€” AZ8.2 AXIS Y2 (Page 8A)
| Parameter | Value |
|---|---|
| Drive Model | Exom F150MR (OPDE B-110A / Tdemacno) |
| Diagram ID | AZ8.2 |
| Motor | M8.2 â€” Unimec MTRI 500-450-075-470-1380-750 SP UM |
| Motor Brake | BRK8.2 â€” Intorq BFK458-14N |
| Braking Resistance | RF8.2 â€” IRE HPR20010R |
| Brake Relay | K11.2 â€” Y2 Brake Command |
| Drive Enable Relay | K8.4 |
| Linear Scale | Heidenhain â€” CN14 / ENC2 IN â€“ PCSS (9-pin Male) |

**Drive Y2 Signal Map (mirrors Y1):**
| Signal | Wire/Terminal | Source / Destination | Description |
|---|---|---|---|
| 24 VDC Power | 4-14 / OV4-12 | FE4.2 ch.4-14 | Drive auxiliary power |
| Enable Analog | 15-26 | PCSS output | Analog speed reference enable |
| Input Enable | 14-31 | PCSS output | Drive enable command |
| Analog + | 8-6 White | ESA Analog OUT PIN 3 (+) | Speed reference signal |
| Analog â€“ | 8-7 Brown | ESA Analog OUT PIN 11 (â€“) | Speed reference return |
| DC BUS Alarm | 8X20 | â†’ 14.C9 | DC bus fault feedback |
| Bend Strength | 5-1 | From ESA (5.D1) | Bend force reference |
| Torque Enable | 8-4 | K8.4 coil | Enable torque output |
| STO Circuit + | 13Y01H | PCSS CN1 Y01H | Safe Torque Off positive (shared Y1/Y2) |
| STO Circuit â€“ | 13Y01L | PCSS CN1 Y01L | Safe Torque Off negative (shared Y1/Y2) |
| Thermal Pad + | 8-20 (Blue M1-87) | â†’ K8.4 monitoring | Motor thermal protection input |
| Thermal Pad â€“ | 8-21 (Black M1-88) | â†’ K8.4 monitoring | Motor thermal protection return |
| Motor Phases | 1-8L1, 1-8L2, 1-8L3 | From RT1.2 | 3-phase motor power |
| Brake Command | K11.2 â†’ 11.C6 | To brake coil | Y2 motor holding brake |

### 4.3 Linear Encoder Wiring (Pages 21â€“22)
Heidenhain linear scales feed position data to the PCSS for safety and to the Rack ESA for motion control.

**Pin Assignment â€” 9-pin Male connectors (CN12/CN14 to PCSS):**
| Pin | Signal | Wire Color |
|---|---|---|
| 1 | +5V | Blue+Green/Brown |
| 5 | â€“0V | White+White/Green |
| 7 | A/ | Green |
| 2 | A | Brown |
| 8 | B/ | Pink |
| 3 | B | Grey |
| 6 | 0/ | Black |
| 1 | 0 | Red |

**Connections:**
- Linear Scale Y1 â†’ CN12 (ENC1 IN â€“ PCSS) and ENC1/ENC2 Rack ESA (CN11)
- Linear Scale Y2 â†’ CN14 (ENC2 IN â€“ PCSS) and ENC1/ENC2 Rack ESA (CN13)
- PCSS CN11/CN13 (ENC1/2 OUT) â†’ Rack ESA encoder inputs via 9-pin Female

---

## 5. CONTROL SYSTEM ARCHITECTURE (Page 17)

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚                    CONTROL HIERARCHY                         â”‚
â”‚                                                             â”‚
â”‚  ESA Touch Control (HMI) â†â”€â”€ Ethernet/Network â”€â”€â†’ MOXA    â”‚
â”‚           â”‚                                                 â”‚
â”‚      CAN Bus (CAN1)                                         â”‚
â”‚           â”‚                                                 â”‚
â”‚      Rack ESA (CNC Controller)                              â”‚
â”‚      â”œâ”€â”€ I/O Rack (M.OUT1/2, M.IN1/2)                     â”‚
â”‚      â”œâ”€â”€ CAN1 â†’ Back Gauge Power Supply (AL6.1)            â”‚
â”‚      â”œâ”€â”€ CAN1 â†’ Sheet Follower Power Supply (AL6.2)        â”‚
â”‚      â”œâ”€â”€ ENC1/ENC2 (encoder pass-through to PCSS)          â”‚
â”‚      â””â”€â”€ COM1 (RS232 â†’ PCSS CN9/COM2)                     â”‚
â”‚                                                             â”‚
â”‚      PCSS Lazersafe (Safety Controller)                     â”‚
â”‚      â”œâ”€â”€ CN1: Y00H/Y00L (Power contactors STO)             â”‚
â”‚      â”œâ”€â”€ CN1: Y01H/Y01L (STO Drive Y1/Y2)                  â”‚
â”‚      â”œâ”€â”€ CN2: Motion outputs (LEDs, analog enable)          â”‚
â”‚      â”œâ”€â”€ CN3: Motion inputs (speed modes, CNC OK)           â”‚
â”‚      â”œâ”€â”€ CN4: Proximity & safety sensors                    â”‚
â”‚      â”œâ”€â”€ CN5/CN6: Safety I/O (gates, e-stops)              â”‚
â”‚      â”œâ”€â”€ ENC1 IN / ENC2 IN (Heidenhain encoders)           â”‚
â”‚      â””â”€â”€ Photocell TX/RX (light curtain)                    â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

### 5.1 Communication Links
| Link | From | To | Protocol |
|---|---|---|---|
| CAN1 | Rack ESA | Back Gauge (AL6.1) | CANbus |
| CAN1 | Rack ESA | Sheet Follower (AL6.2) | CANbus |
| CAN1 â€“ ED2PW | PCSS | Rack ESA | CANbus (9-pin Male: pins 2=CAN-L, 3=CAN-GND, 6=GND, 7=CAN-H) |
| COM2 / COM1 | PCSS CN9 | Rack ESA | RS232 Serial (9-pin Female: TX, RX, 0V) |
| Ethernet/LAN1 | Touch Control ESA | Cabinet Network (MOXA) | Ethernet (SFTP Crossover 10m Molded) |
| LAN2 | MOXA | External Network | Ethernet (FTP 10m Molded) |
| ENC1 IN | Heidenhain Y1 Scale | PCSS CN12 | Differential encoder (9-pin) |
| ENC2 IN | Heidenhain Y2 Scale | PCSS CN14 | Differential encoder (9-pin) |
| ENC1/2 OUT | PCSS CN11/CN13 | Rack ESA | Differential encoder pass-through |

---

## 6. ESA RACK I/O MAP (Pages 9â€“12)

The ESA Rack provides the motion I/O between the CNC controller and field devices. All signals are 24 VDC referenced to OV4.

### 6.1 ESA M.OUT 1 â€” Digital Outputs (Page 9)
| ESA Output | Signal Name | Destination / Cross-ref |
|---|---|---|
| QW 1.6 | CNC OK Signal | â†’ 15.D4 (PCSS input CN3 X07) |
| QW 1.8 | Lubrification Unit Command | K9.1 relay coil |
| QW 1.10 | Internal Lamp Command | K9.2 relay coil |
| QW 1.12 | On/Off Clamping Command | â†’ 7A.B6 (Clamping circuit) |
| QW 1.13 | Open Clamping Alarm | â†’ 15.D6 (PCSS input) |
| QW 1.14 | Crowning + Command | â†’ 7.A1 (K7.1/K7.2 coil) |
| QW 1.15 | Crowning â€“ Command | â†’ 7.A3 (K7.3 coil) |
| QW 1.18 | (24V supply rail) | Power bus 4-2 |
| QW 1.19 | (24V supply rail) | Power bus 4-2 |

### 6.2 ESA M.OUT 2 â€” Digital Outputs (Page 10)
| ESA Output | Signal Name | Destination / Cross-ref |
|---|---|---|
| QW 2.0 | Slow Down Movement | â†’ 15.D2 (PCSS) |
| QW 2.1 | Fast Down Movement | â†’ 15.D3 (PCSS) |
| QW 2.2 | Up Movement | â†’ 15.D3 (PCSS) |
| QW 2.3 | Decompression | â†’ 15.D3 (PCSS) |
| QW 2.4 | Upper Dead Point | â†’ 15.D4 (PCSS) |
| QW 2.5 | Torque Enable Command | K10.1 relay (Drive Y1/Y2 torque) â†’ 8.D2 |
| QW 2.18 | (24V supply rail) | Power bus 4-2 |
| QW 2.19 | (24V supply rail) | Power bus 4-2 |

### 6.3 ESA M.IN 1 â€” Digital Inputs (Page 11)
| ESA Input | Signal Name | Source / Cross-ref |
|---|---|---|
| IW 0.4 | Sheet Follower 1 Abilitation | S11.1 selector + L11.2 lamp |
| IW 0.5 | Sheet Follower 2 Abilitation | S11.2 selector + L11.3 lamp |
| IW 0.6 | Sheet Follower 1 Limit Switch Proximity | PX11.3 |
| IW 0.7 | Sheet Follower 2 Limit Switch Proximity | PX11.4 |
| IW 0.8 | High Ram Proximity + Emergency Contact | PX11.1 / PX11.2 + emergency chain |
| IW 0.9 | (M1-112 / M2-11A) | Ram area signal |
| IW 0.10 | Brake Command Y1 | K11.1 â†’ 14.C6 |
| IW 0.11 | Brake Command Y2 | K11.2 â†’ 8A.D8 |
| IW 0.12 | Drive OK Signal | K8.2 / K8.4 â†’ 14.C6 |
| IW 0.13 | Enable Descent | â†’ 15.D5 |
| IW 0.14 | Slow Speed Photocell Excluded | â†’ 15.D4 |
| IW 0.15 | Out of Grease Signal | â†’ 5.A6 |
| IW 0.15 | Lubrification Control | â†’ 5.A7 |
| IW 0.16 | Pedalboard 1 Up Movement (PS11.1) | â†’ 4-3 |
| IW 0.16 | Pedalboard 2 Up Movement (PS11.2) | â†’ 4-3 |

### 6.4 ESA M.IN 2 â€” Digital Inputs (Page 12)
| ESA Input | Signal Name | Source / Cross-ref |
|---|---|---|
| IW 3.0 | Enable from Y1â€“Y2 Brakes | M1-121 / BRK8.1/8.2 contacts |
| IW 3.12 | Crowning Thermal Release | RT3.1 contact |
| IW 3.13 | Clamping Thermal Release | RT3.2 contact |
| IW 3.14 | Phases Sequence OK | KSC3.1 + K12.2 / K12.3 / K12.4 |
| IW 3.15 | Crowning Enabler | K4.1 (Electronic Fuse Alarm) |
| IW 3.16 | Clamping Enabler + Power Loss Contact | K4.4 alarm |
| IW 3.15 | Offset Circuit | PX12.1 / PX12.2 (proximity sensors) |
| IW 3.16 | Arm in Safety for Sheet Followers | PX12.3 proximity â†’ K12.5 |

---

## 7. PCSS LAZERSAFE I/O MAP (Pages 13â€“16)

The PCSS is the safety controller governing all protective functions. It communicates with the ESA rack via CANbus and serial, and directly controls the STO (Safe Torque Off) of both servo drives.

### 7.1 PCSS Power Contactor Control (Page 13)
| PCSS Connector | Signal | Controlled Device | Function |
|---|---|---|---|
| CN5 X24 | Contactors Circuit | â€” | 24V enable to contactor circuit |
| CN6 P24 | 13P24 | K13.1/K13.2/K13.3 common | Power contactor bus |
| CN1 Y00H | Power Contactor Y1/Y2 | K13.1 coil | Enables Y axis drive power |
| CN1 Y00L | Power Contactor Back Gauge | K13.2 coil | Enables back gauge power |
| CN1 Y00H (2) | Power Contactor Sheet Follower | K13.3 coil | Enables sheet follower power |
| CN1 Y01H | STO + Circuit Drive Y1â€“Y2 | Drive AZ8.1 + AZ8.2 STO+ | Safe Torque Off positive rail |
| CN1 Y01L | STO â€“ Circuit Drive Y1â€“Y2 | Drive AZ8.1 + AZ8.2 STOâ€“ | Safe Torque Off negative rail |
| K13.4 | Emergency Offset Circuit | PX13.1 / PX13.2 sensors | Triggered in emergency |

### 7.2 PCSS Outputs â€” CN2 (Motion Status to ESA) (Page 15)
| PCSS Connector | Signal | ESA Cross-ref | Description |
|---|---|---|---|
| CN2 Y08 | Control Light Pedalboard 2 Active | â†’ 8A.B0 | LED indicator pedalboard 2 |
| CN2 Y07 | Control Light Pedalboard 1 Active | â†’ 8.B0 | LED indicator pedalboard 1 |
| CN2 Y06 | Muting Red LED Command | K15.1 coil | Red muting lamp control |
| CN2 Y11 | Slow Speed Photocell Excluded | â†’ 11.D7 (IW 0.14) | Speed mode status |
| CN2 Y09 | Down Movement Enable | â†’ 11.D6 (IW 0.15) | Allows downward ram motion |

### 7.3 PCSS Outputs â€” CN1 Analog (Page 15)
| PCSS Connector | Signal | Destination | Description |
|---|---|---|---|
| CN1 Y02H | Analog Enable (+) | â†’ AZ8.1 / AZ8.2 enable | Analog reference enable |
| CN1 Y02L | Analog Enable (â€“) | Return | Analog reference return |

### 7.4 PCSS Inputs â€” CN3 (Motion Commands from ESA) (Page 15)
| PCSS Connector | Signal | ESA Source | Description |
|---|---|---|---|
| CN3 X02 | Slow Down Movement | QW 2.0 / â†’ 10.D2 | ESA commands slow approach |
| CN3 X03 | Fast Down Movement | QW 2.1 / â†’ 10.D2 | ESA commands fast approach |
| CN3 X04 | Up Movement | QW 2.2 / â†’ 10.D3 | ESA commands ram return |
| CN3 X06 | Upper Dead Point | QW 2.4 / â†’ 10.D4 | Ram at top position |
| CN3 X05 | Decompression | QW 2.3 / â†’ 10.D4 | Decompression phase signal |
| CN3 X07 | CNC OK Signal | QW 1.6 / â†’ 9.D1 | CNC ready status to PCSS |
| CN3 X08 | Down Movement Enable (Foot Pedal 1 NO) | KP16.7 | Foot pedal board 1 â€“ NO contact |
| CN3 X09 | Down Movement Enable (Foot Pedal 2 NO) | KP16.8 | Foot pedal board 2 â€“ NO contact |
| CN3 X00 | NC Contact Down Movement (Foot Pedal 1) | KP16.7 | Foot pedal board 1 â€“ NC contact |
| CN3 X01 | NC Contact Down Movement (Foot Pedal 2) | KP16.8 | Foot pedal board 2 â€“ NC contact |
| CN3 X10 | NO Contact Down Movement Foot Pedalboard 2 | KP16.2 | Second pedalboard NO |

### 7.5 PCSS Inputs â€” CN4 (Safety & Proximity Sensors) (Page 15)
| PCSS Connector | Signal | Device | Description |
|---|---|---|---|
| CN4 X14 | Offset Circuit Contact | K12.4 (12.B4) | Back gauge offset position sensor |
| CN4 X16 | Offset Circuit Reset Selector | â€” | Reset back gauge offset |
| CN4 X15 | Safety Accumulator Pressure Switch | PR15.1 | Hydraulic safety pressure OK |
| CN4 X22 | Emergency High Ram Proximity Y1 | PX15.1 / PX15.2 (Balluff) | Ram Y1 upper limit emergency |
| CN4 X23 | Emergency High Ram Proximity Y2 | PX15.3 / PX15.4 (Balluff) | Ram Y2 upper limit emergency |
| CN4 X17 | Cabinet Door | P16.1 / P16.2 / P16.3 | Cabinet safety door switches |

### 7.6 PCSS Inputs â€” CN5 / CN6 (Gate Limit Switches & E-Stops) (Page 14)
| PCSS Connectors | Device | Model | Function |
|---|---|---|---|
| CN6 P29 / CN5 X29 | Left Gate Limit Switch | FC14.1 â€“ Elesa CFSW.110-6-2NO+2NC | Left safety gate |
| CN6 P28 / CN5 X28 | Right Gate Limit Switch | FC14.2 â€“ Elesa | Right safety gate |
| CN6 P27 / CN5 X27 | Rear Gate Limit Switch | FC14.4 â€“ Elesa | Rear safety gate |
| CN6 P25 / CN6 P26 | Emergency Pushbutton Pedalboard 1 CH1/CH2 | KE14.2 â€“ Pizzato E21PER24531 | E-stop on pedalboard 1 |
| CN5 X25 / CN5 X26 | Emergency Pushbutton Sheet Follower 2 CH1/CH2 | KE14.5 | E-stop on sheet follower 2 |
| CN5 X32 / CN6 P32 | Panic Pedal CH1 Pedalboard 1 | KP16.1 â€“ Lovato KXB502 | Panic/anti-trip foot pedal 1 |
| CN5 X33 / CN6 P33 | Panic Pedal CH2 Pedalboard 1 | KP16.2 â€“ Lovato KXB511 | Panic/anti-trip foot pedal 1 |
| CN5 X35 / CN6 P35 | Panic Pedal CH1 Pedalboard 2 | KP16.3 | Panic/anti-trip foot pedal 2 |
| CN5 X30 | Cabinet Door | S15.1 â€“ Pizzato E21SC2DV A11AE | Control cabinet door switch |

### 7.7 PCSS Inputs â€” Drive Status (Page 14)
| PCSS Connector | Signal | Source | Description |
|---|---|---|---|
| CN3 X11 | Drive OK Signal | K8.2 (8.D3) + K8.4 (8A.D3) | Both drives ready feedback |
| CN3 X11 | K13.1 contact | 13.D2 | Power contactor confirmation |
| CN4 X20 | DC BUS Alarm Drive Y1/Y2 | 8X20 from drives | Drive DC bus fault |
| CN4 X20 | RT1.1 / RT1.2 thermal | 1.A6 / 1.A7 | Motor protector trips |
| CN4 X20 | K4.2 / K4.3 battery alarms | 4A.C3 / 4A.C6 | UPS battery faults |

---

## 8. CLAMPING CIRCUIT (Page 7 â€“ 7A)

| Diagram ID | Device | Model | Function |
|---|---|---|---|
| S7.1 | Clamping Selector NO | Pizzato E21SUIAVD41AB | Clamping mode select on CN panel |
| S7.2 | Clamping Selector NC | Pizzato E21SUIAVD41AB | Clamping mode select (NC contact) |
| EV7.1 | Unload Valve | Hydac 3000249-08/19 | Opens clamping pressure |
| EV7.2 | Load Valve | Hydac 3000249-08/19 | Closes clamping pressure |
| TRS7.1 | Clamping Transductor | IFM PUS402 | Pressure transducer |
| K7.3 | Clamping Contactor | Lovato LOVBF09100D024 | Clamping power switch |
| K12.3 | Clamping enable relay | â€” | Interlock from ESA |

**Clamping Logic:**
- Selector S7.1/S7.2 on CN panel selects mode
- ESA output QW1.12 (On/Off Clamping Command) controls EV7.2 (Load Valve) via K7.3
- EV7.1 (Unload Valve) releases clamping
- K12.3 (from ESA, 12.B4) gates the load valve enable
- Clamping open alarm â†’ ESA input QW1.13 / PCSS input 15.D6

---

## 9. CROWNING CIRCUIT (Page 3, Page 9)

| Component | Function |
|---|---|
| M3.1 (ATB-Motors SFA) | Crowning table motor (3-phase) |
| K7.1 | Crowning motor contactor â€” positive direction |
| K7.2 | Crowning motor contactor â€” negative direction |
| FLR3.1 | Motor RFI filter |
| RT3.1 (Lovato SM1P0160) | Motor protector, 1â€“1.6A |
| KSC3.1 (Lovato PMV10A440) | Phase sequence and voltage monitor |

**Crowning Logic:**
- ESA output QW 1.14 â†’ Crowning + Command â†’ K7.1 coil
- ESA output QW 1.15 â†’ Crowning â€“ Command â†’ K7.3 / K7.2 coil
- RT3.1 thermal trip â†’ ESA input IW 3.12
- Phase sequence fault (KSC3.1) â†’ ESA input IW 3.14

---

## 10. SAFETY CIRCUIT SUMMARY

### 10.1 Emergency Stop Chain
All E-stops are dual-channel (CH1/CH2) fed into the PCSS Lazersafe. PCSS controls the STO (Safe Torque Off) of both servo drives and drops power contactors K13.1/K13.2/K13.3.

| E-Stop Source | Device | PCSS Channels |
|---|---|---|
| Emergency Pushbutton on CN Panel | KE14.1 (Pizzato E21PER24531) | CH1: M1-147/148 / CH2: M1-14A/14B |
| Emergency Pushbutton Pedalboard 1 | KE14.2 (Pizzato E21PER24531) | CH1/CH2 â†’ CN6 P25/P26, CN5 X25/X26 |
| Emergency Pushbutton Pedalboard 2 | KE14.3 | CH1/CH2 â†’ Pedalboard 2 wiring |
| Emergency Pushbutton Sheet Follower 2 | KE14.5 | CH1/CH2 â†’ PCSS |
| Left Gate | FC14.1 (Elesa CFSW.110-6-2NO+2NC) | CN6 P29 / CN5 X29 |
| Right Gate | FC14.2 (Elesa) | CN6 P28 / CN5 X28 |
| Rear Gate | FC14.4 (Elesa) | CN6 P27 / CN5 X27 |
| Cabinet Door | S15.1 (Pizzato) | CN5 X30 |
| Emergency High Ram Proximity Y1 | PX15.1/PX15.2 (Balluff BES-M08EE-POC15B) | CN4 X22 |
| Emergency High Ram Proximity Y2 | PX15.3/PX15.4 (Balluff) | CN4 X23 |

### 10.2 STO (Safe Torque Off) Path
```
PCSS CN1 Y01H â”€â”€â†’ 13Y01H â”€â”€â†’ AZ8.1 STO+ & AZ8.2 STO+ (shared)
PCSS CN1 Y01L â”€â”€â†’ 13Y01L â”€â”€â†’ AZ8.1 STOâ€“ & AZ8.2 STOâ€“ (shared)
```
Both Y1 and Y2 drives share the same STO circuit â€” either drive fault or any E-stop will remove torque from both axes simultaneously.

### 10.3 Muting & Speed Modes
| Condition | PCSS Output | Result |
|---|---|---|
| Normal Operation | â€” | Full safety active |
| Slow Speed Muting | CN2 Y11 â†’ IW 0.14 | Photocell excluded, slow speed only |
| Red LED Muting Active | CN2 Y06 â†’ K15.1 | Visual warning on CN panel |
| Photocell light curtain | PX Photocell TX/RX | PCSS monitors continuously |

---

## 11. FOOT PEDALBOARD WIRING (Page 17A)

Two independent pedalboards (M3 and M3A) provide redundant operator control. Each has panic pedals (anti-tie-down), down-movement NO/NC contacts, and emergency pushbutton.

### Pedalboard 1 (M3) â€” Wire-by-Wire Map
| Wire # | Terminal | Signal | Component |
|---|---|---|---|
| 1 | OV4 | Common 0V | â€” |
| 2 | 4-5 | 24V Power | â€” |
| 3 | 4-3 | 24V Control | â€” |
| 4 | M1-167 | Down Movement NO Contact | KP16.7 |
| 5 | M1-165 | Down Movement NC Contact | KP16.5 |
| 6 | M2-16C | â€” | â€” |
| 7 | M1-163 | Panic Pedal NC (CH1) | KP16.3 |
| 8 | M2-16B | â€” | â€” |
| 9 | M1-161 | Panic Pedal NC | KP16.1 |
| 10 | M2-16A | Panic Pedal NC (CH2) | KP16.1 |
| 11 | M1-113 | Up Movement NO Contact | PS11.1 |
| 12 | M2-14A | E-Stop CH1 | KE14.2 |
| 13 | M2-14C | E-Stop CH1 return | KE14.2 |
| 14 | M2-14B | E-Stop CH2 | KE14.2 |
| 15 | M2-14D | E-Stop CH2 return | KE14.2 |
| 16 | M1-151 | Pedalboard 1 Active LED | L15.1 |

### Pedalboard 2 (M3A) â€” Wire-by-Wire Map
| Wire # | Terminal | Signal | Component |
|---|---|---|---|
| 1 | OV4 | Common 0V | â€” |
| 2 | 4-5 | 24V Power | â€” |
| 3 | 4-3 | 24V Control | â€” |
| 4 | M1-168 | Down Movement NO Contact | KP16.8 |
| 5 | M2-16C | Down Movement NC | KP16.6 |
| 6 | M1-166 | Down Movement NC | KP16.6 |
| 7 | M2-16B | Panic Pedal NC (CH1) | KP16.4 |
| 8 | M1-164 | Panic Pedal NC | KP16.4 |
| 9 | M2-16A | Panic Pedal NC (CH2) | KP16.2 |
| 10 | M1-162 | Panic Pedal | KP16.2 |
| 11 | M1-113 | Up Movement NO Contact | PS11.2 |
| 12 | M2-14C | E-Stop CH1 | KE14.3 |
| 13 | M2-14E | E-Stop CH1 return | KE14.3 |
| 14 | M2-14D | E-Stop CH2 | KE14.3 |
| 15 | M2-14F | E-Stop CH2 return | KE14.3 |
| 16 | M1-155 | Pedalboard 2 Active LED | L15.2 |

### CN Panel Controls â€” Wire-by-Wire Map
| Wire # | Terminal | Signal | Component |
|---|---|---|---|
| 1 | 4-3 | 24V Control | â€” |
| 2 | M1-169 | NO Reset Button | P16.1 |
| 3 | M1-1610 | Rear Gate Reset Button | P16.2/P16.3 |
| 4 | OV4 | E-Stop LED 0V | â€” |
| 5 | M1-151 | Pedalboard Active Light | L15.1 |
| 6 | M1-147 | E-Stop CH1 | KE14.1 |
| 7 | M1-148 | E-Stop CH1 return | KE14.1 |
| 8 | M1-14B | E-Stop CH2 | KE14.1 |
| 9 | M1-14A | E-Stop CH2 return | KE14.1 |
| 10 | OV4 | Green LED Clamping 0V | â€” |
| 11 | M1-1411 | Clamping Operating Light | L17.3 |
| 12 | 4-6 | Clamping Contact Light | â€” |
| 13 | M2-7 | NC Selector Clamping | S7.2 |
| 14 | M1-711 | NO Selector Clamping | S7.1 |

---

## 12. TERMINAL BLOCK REFERENCE (Page 24)

### Terminal Block M1 â€” Key Assignments
| Terminal | Description | Component |
|---|---|---|
| R-S-T | Main Power Input | Q1.1 |
| M1-31/32/33 | Clamping Motor | M3.1 |
| OV4 | Main Negative 24V | â€” |
| 4-1 to 4-6 | Various 24V Positive | â€” |
| 4-15 / OV4-12 | UPS 24V for PCSS, AZ8.1, AZ8.2 | â€” |
| M1-51/52 | Carter Lamp | L5.1 |
| M1-53/54 | Muting Red LED | L5.2 |
| M1-55 | Internal Lamp | L5.3 |
| M1-56 | Lubrification Unit | ILC-MAX |
| M1-57 | Out of Grease Signal | â€” |
| M1-58 | Grease Distributor | PX5.1 |
| M1-71 | Clamping Selector | S7.1 |
| M1-72/73 | Clamping Load Valve | EV7.2 |
| M1-74 | Clamping Transductor | TRS7.1 |
| M1-81/82 | Y1 Motor Brake | RDZ8.1 |
| M1-83/84 | Y2 Motor Brake | RDZ8.2 |
| M1-85/86 | Y1 Motor Thermal Pad | â€” |
| M1-87/88 | Y2 Motor Thermal Pad | â€” |
| M1-111 | High Ram Proximity | PX11.1/11.2 |
| M1-112 | Green LED Cover | L11.1 |
| M1-113 | Pedalboard Up Movement | PS11.1 |
| M1-121 | Enable From Motors Brakes | BRK8.1/8.2 |
| M1-122 | Offset Circuit | PX12.1/12.2 |
| M1-131 | Emergency Offset Circuit | PX13.1/13.2 |
| M1-141/142 | Left Gate | FC13.1 |
| M1-143/144 | Right Gate | FC13.2 |
| M1-145/146 | Rear Gate Circuit | FC13.3/13.4 |
| M1-147/149 | Emergency Pushbutton CH1 | KE14.1/14.2 |
| M1-148/1410 | Emergency Pushbutton CH2 | KE14.1/14.2 |
| M1-1411 | Operating Light on CN | L14.1 |
| M1-151 | Pedalboard Active Light | L15.1 |
| M1-152 | Safety Accumulator Pressure Switch | PR15.1 |
| M1-153 | Emergency High Ram Proximity | PX15.1/15.2 |
| M1-154 | Low Ram Proximity | PX15.3/15.4 |
| M1-161/162 | Panic Pedal CH1 | KP16.1/16.2 |
| M1-163/164 | Panic Pedal CH2 | KP16.3/16.4 |
| M1-165/166 | NO Contact Down Movement | KP16.5/16.6 |
| M1-167 | NC Contact Down Movement | KP16.7/16.8 |
| M1-168 | NO Reset Contact on CN | P16.1 |
| M1-169 | NC Reset Contact on CN | P16.2 |
| M1-1610 | Rear Gate Reset Button | P16.3 |
| M1-161/162 | Panic Pedal CH1 | KP16.1/16.2 |

### Terminal Block M2 â€” Key Assignments
| Terminal | Description | Component |
|---|---|---|
| M2-7 | Selector and Unload Valve | S7.2 / EV7.1 |
| M2-11 | High Ram Proximity | PX11.1/11.2 |
| M2-12A | Enable From Motors Brakes | BRK8.1/8.2 |
| M2-12B | Offset Circuit | FC12.1/12.2 |
| M2-13 | Emergency Offset Circuit | FC13.1/13.2 |
| M2-14A | Emergency Pushbutton CH1 | KE14.1/14.2 |
| M2-14B | Emergency Pushbutton CH2 | KE14.1/14.2 |
| M2-15A | Emergency High Ram Proximity | PX15.1/15.2 |
| M2-15B | Low Ram Proximity | PX15.3/15.4 |

---

## 13. ROBOT / PLC INTEGRATION SIGNALS

This section identifies all signals relevant to integrating an external PLC that interfaces with a robot cell. These signals must be shared between the press brake control system and the robot controller.

### 13.1 Signals the Robot/PLC Must Receive FROM the Press Brake

| Signal | Source | Terminal/Channel | ESA/PCSS Ref | Type | Notes |
|---|---|---|---|---|---|
| CNC OK / Machine Ready | ESA QW 1.6 | â†’ 15.D4 / PCSS CN3 X07 | QW 1.6 | 24V DO | Machine is in auto, no fault |
| Ram at Upper Dead Point | ESA QW 2.4 | â†’ 10.D4 / PCSS CN3 X06 | QW 2.4 | 24V DO | Ram fully retracted â€” safe to enter zone |
| Clamping Status (Open) | ESA QW 1.13 | â†’ 15.D6 | QW 1.13 | 24V DO | Clamping open alarm / status |
| Clamping Operating Light | 4-6 / M1-1411 | M1-1411 | â€” | 24V DO | Clamping currently engaged |
| Drive OK | K8.2 / K8.4 | IW 0.12 / 14.C6 | IW 0.12 | 24V DI | Both Y1 + Y2 drives healthy |
| Pedalboard Active | M1-151 | L15.1 / L15.2 | â€” | 24V DO | Operator has pedalboard enabled |
| Out of Grease | â€” | M1-57 / IW 0.15 | IW 0.15 | 24V DI | Lubrification fault |
| Safety Gate Status | FC14.1/FC14.2/FC14.4 | M1-141 to M1-146 | PCSS CN5/CN6 | Safety | Gate open = interlock |
| Up Movement Active | PCSS CN2 Y09 | â†’ IW 0.13/0.15 | IW 0.13 | 24V DO | Ram moving up |
| Down Movement Enable | PCSS CN2 Y09 | 11.D6 | â€” | 24V DO | PCSS allowing downward motion |

### 13.2 Signals the Robot/PLC Must SEND to the Press Brake

| Signal | Destination | Terminal/Channel | Method | Notes |
|---|---|---|---|---|
| Robot Cell Clear / Safe | ESA input or PCSS input | Recommend tie into gate logic (FC14.x) or spare PCSS input | 24V DI | Robot confirms part loaded, arm clear |
| Inhibit Down Movement | PCSS or ESA | Interrupt QW 2.0/2.1 or gate CN3 X02/X03 | 24V relay interlock | Prevents downward ram while robot is in zone |
| Clamping Command | ESA QW 1.12 | Via 4-6 rail / 7.E0 rail | 24V relay | Can mirror ESA output or override |
| E-Stop (Robot fault) | PCSS CH1/CH2 | Add to KE14.x chain or dedicated PCSS safety input | Dual-channel 24V safety | Must be 2-channel for PLd compliance |
| Part Present Signal | ESA M.IN or spare PCSS input | Available spare on PCSS CN3/CN4 | 24V DI | Confirm part is positioned |

> **âš ï¸ Critical Integration Note:** The **24V DC rail labeled 4-6** (fed from FE4.1 channel 4-6, cross-ref 7.E0) is designated for "Robot and Clamping" â€” this is the intended integration point for robot 24V I/O signals per the original diagram design.

### 13.3 Motion Handshake Sequence (Derived from Diagram)
```
NORMAL AUTO CYCLE â€” Press Brake + Robot:

1.  Machine READY: ESA QW 1.6 HIGH (CNC OK to PCSS)
2.  Ram UP: ESA QW 2.4 HIGH (Upper Dead Point)
3.  â†’ Robot: "Safe to Load" â€” arm enters, loads part
4.  Robot: "Part Loaded / Arm Clear" â†’ PLC to gate foot pedal or send enable
5.  Operator presses foot pedal (KP16.7/KP16.8 NO contact)
    OR Robot PLC issues Down Movement Enable (gate CN3 X02/X03)
6.  PCSS verifies: STO OK, gates closed, no E-stop
7.  ESA commands: Slow Down (QW 2.0) â†’ Fast Down (QW 2.1) â†’ Slow Down
8.  Bend occurs at programmed force (TRS7.1 transductor feedback)
9.  ESA commands Up Movement (QW 2.2) â†’ Ram returns to top
10. ESA QW 2.4 HIGH again (Upper Dead Point)
11. â†’ Robot: "Safe to Unload" â€” arm enters, removes part
12. Repeat
```

---

## 14. COMPONENT MANUFACTURERS & MODELS (Pages 25â€“26)

| Diagram Code | Item Code | Brand | Function |
|---|---|---|---|
| Q1.1/Q1.3 | SD204/25 | ABB | Main switch |
| Q1.1 | LOVGAX66 / LOVGAX60B / WVGAX7200A / LOVGAX84 / LOV GA063A | Lovato | Isolator/disconnector components |
| F1.1 | LOVFB02A3P | Lovato | Main fuse holder |
| F2.1/F2.2/F2.3 | LOVFB01F3P | Lovato | 3-pole fuse holders |
| F2.4/F2.5 | LOVFB01F2P | Lovato | 2-pole fuse holders |
| KSC3.1 | LOVPMV10A44 | Lovato | Phase sequence/voltage monitor |
| K13.2/K7.1/K7.2/K7.3 | LOVBF09100D024 | Lovato | 9A contactors |
| K13.1 | LOVBFX1031 | Lovato | Contactor |
| K13.3/K7.1/K7.2 | LOVBFX1011 | Lovato | Contactor |
| RT1.1/RT1.2 | LOVSM1P2500 | Lovato | Motor protector (drives) |
| RT3.1/RT3.2 | LOVSM1P0160 | Lovato | Motor protector (clamping/crowning) |
| RT1.1â€“RT3.2 | LOV11SMX1211 | Lovato | Auxiliary contact block |
| K13.1/K13.2 | LOVBF3200D024 | Lovato | 32A contactor |
| IND1.1 | 70000056-002 | Tecnocablaggi | Line inductance |
| TR2.1 | 91001500-085 | Tecnocablaggi | Transformer |
| TR2.2 | CFM00160CC15 | Italweber | Transformer |
| TR2.3 (AL4.x) | SD17S5AP24HWB | Exom | Power supply |
| DR4.1 | MG154 | Exom | Diode redundancy module |
| AZ8.1/AZ8.2 | F150MR / OPDE B-110A | Exom / Tdemacno | Y-axis servo drives |
| ILC5.1 | XGN13035CG / 40-2-24DC-FST-G | Exom / ILC | ILC controller module |
| FLR1.1 | FN3270H-50-34 | Schaffner | EMI filter |
| EXP17.1 | Expansion Adapter Module | Lazerfafe | PCSS expansion |
| PCSS | PCSS-A | Lazerfafe | Safety controller |
| RACK-ESA | S640N.R174 | ESA Utomotion | CNC rack controller |
| AL6.1 | AZM005.500 | ESA Utomotion | Back gauge power supply |
| K9.1/K9.2 | WD 7760056364 / WD 7760056315 | WeidmÃ¼ller | Output relays |
| K11.1/K11.2/K15.1 | WD 7760056362 | WeidmÃ¼ller | Brake command relays |
| K4.1-2-3-4/K8.2-4/K10.1/K12.1-2/K13.3 | WD 1122880000 / WD 4060120000 / WD 7760056015 | WeidmÃ¼ller | Coupling relays |
| AL4.1 | WD 1469550000 | WeidmÃ¼ller | 24VDC PSU 20A |
| AL4.2/AL4.3 | WD 1370050010 | WeidmÃ¼ller | 24VDC UPS modules |
| BAT4.2/BAT4.3 | WD 1406930000 | WeidmÃ¼ller | UPS batteries |
| FE4.1 | WD 1527980000 | WeidmÃ¼ller | Electronic fuse block |
| FE4.2 | WD 2081880000 | WeidmÃ¼ller | Electronic fuse block |
| M8.1/M8.2 | MTRI 500-450-075-470-1380-750 SP UM | Unimec | Y-axis servo motors |
| BRK8.1/BRK8.2 | BFK458-14N | Intorq | Motor holding brakes |
| RF8.1/RF8.2 | HPR20010R | I.R.E. | Braking resistors |
| RDZ8.1/RDZ8.2 | BEG-561-255-D30 | Intorq | Brake rectifiers |
| EV7.1/EV7.2 | 3000249-08/19 | Hydac | Clamping solenoid valves |
| TRS7.1 | PUS402 | IFM | Pressure transducer |
| M3.1 | SFA | ATB-Motors | Crowning motor |
| PX11.1-2/PX12.1-2/PX13.1-2 | BES-M08EE-POC15B | Balluff | Proximity sensors |
| FC14.1/14.2/14.3/14.4 | CFSW.110-6-2NO+2NC | Elesa | Safety gate switches |
| FC14.1-14.4 (connector) | SACC-M12FS-8CON-PG9-M | Phoenix Contact | M12 8-pin safety connector |
| PX11-13 (alternate) | XZCP06661.5 | XZCP0666L5 | Proximity switches |
| KP16.1-2-3-4 | PCAOPI | GS. Elettromeccanica | Pedalboard foot switches |
| KP16.3/KP16.4 | KXB511 | Lovato | Pedalboard contacts |
| KP16.1/KP16.2 | KXB502 | Lovato | Pedalboard contacts |
| PS11.1/PS11.2 | FAK-S/KC11/1 | Eaton | Up movement foot switch |
| KE14.1/KE14.2 | E21PER24531 | Pizzato | E-stop pushbuttons |
| P16.1/P16.2/P16.3 | E21PU2R2210 | Pizzato | Reset pushbuttons |
| S15.1 | E21SC2DV A11AE | Pizzato | Cabinet door switch |
| L15.1 | E61IL1A2110 | Pizzato | Pedalboard LED indicator |
| S7.1/S7.2 | E21SUIAVD41AB | Pizzato | Clamping selector |

---

## 15. WIRE COLOR & VOLTAGE CONVENTIONS

| Color | Voltage / Function |
|---|---|
| Black | 380 VAC (Nominal / 3-phase power) |
| Grey | 220 VAC (Auxiliary AC) |
| Blue | 24 VDC (Positive) |
| â€” | 24 VDC negative = OV4 (0V reference rail) |
| White | Analog signal (+) |
| Brown | Analog signal (â€“) |
| Green | CAN-GND / Encoder signals |
| Red | CAN-H / Encoder signals |
| Blue+Green/Brown | Encoder +5V |
| White+White/Green | Encoder â€“0V |

---

## 16. PANEL LAYOUT OVERVIEW (Page 23)

Panel dimensions: **2700 mm wide Ã— 900 mm tall**

Left-to-right layout:
1. AZ8.1 (Y1 Drive) | AZ8.2 (Y2 Drive)
2. TR2.3 | TR2.1 (Transformers)
3. FLR1.1 (Main EMI Filter) | IND1.2 | IND1.1 (Inductances)
4. Q1.1 (Main Switch)
5. K13.1 | AL4.1 | AL4.2 | AL4.3 | DR4.1 | BAT4.2 | BAT4.3
6. FE4.1 | FE4.2 | F2.1â€“F2.8 (Fuse Holders)
7. K7.1 | K7.2 | K7.3 | RT1.1 | RT1.2 | RT3.1 | RT3.2
8. K13.2 | K13.3 | TR2.2 | FLR5.1 | MX5.1
9. RACK ESA | PCSS
10. M1 Terminal Block | M2 | M4 (Terminal blocks â€” far right)

---

*End of Reference Document â€” Generated from 34-page BLM Group Press Brake Electrical Diagram (Commission 04-2021/PE0122)*

