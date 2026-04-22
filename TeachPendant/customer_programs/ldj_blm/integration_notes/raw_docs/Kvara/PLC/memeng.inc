* Memorie interne PLC

#defcom %M0.0     Temporary flag

* Segnali cumulativi generali
#defcom %M0.1     All axis referenced
#defcom %M0.2     All channels are initialized
#defcom %M0.3     All channels are in AUT mode
#defcom %M0.4     Axis in alarm presence
#defcom %M0.5     All axes are stopped
#defcom %M0.6     Channel blocked presence
#defcom %M0.7     Calibration cycle completed (for NVEL or read only beam)
#defcom %M0.8     Impulse canopen axes calibration requested
#defcom %M0.9     CanOpen axis presence (progressive)
#defcom %M0.10    CanOpen axis presence (stable)
#defcom %M0.11    All axis in the current step are calibrated
#defcom %M0.12    At least one axis to be calibrated in the current step
#defcom %M0.13    Motorized brackets in parking
#defcom %M0.14    Program running on channel of selected axis

* STATGEN
#defcom %M1.0     Chanel 0 configured
#defcom %M1.1     Chanel 1 configured
#defcom %M1.2     Chanel 2 configured
#defcom %M1.3     Chanel 3 configured
#defcom %M1.4     Chanel 4 configured
#defcom %M1.5     Beam NVEL
#defcom %M1.6     Beam read-only
#defcom %M1.7     Standard conventional press
#defcom %M1.8     Beam read-only or conventional
#defcom %M1.9     Bend completed impulse
#defcom %M1.10    Decompression postponed on pinch point
#defcom %M1.11    Ascent beam condition from BDC to pinch point
#defcom %M1.12    Ascent beam condition from pinch point to TDC
#defcom %M1.13    Keep bend done (reset on step change)
#defcom %M1.14    Keep bend done (reset on end of bend)
#defcom %M1.15    Beam NVEL, read-only or conventional
#defcom %M1.16    Beam to BDC with "stop at BDC" mode active
#defcom %M1.17    Keep BDC reached
#defcom %M1.18    Step change input impulse
#defcom %M1.19    Chanel 5 configured
#defcom %M1.20    Conventional beam with pedal and switches
#defcom %M1.21    Beam NVEL o with switches
#defcom %M1.22    Beam NVEL with 2 cylinders
#defcom %M1.23    Step change switch excluded with beam with pedal and switches
#defcom %M1.24    Retract switch excluded with beam with pedal and switches
#defcom %M1.25    Hand Wheel use in automatic conditions
#defcom %M1.26    Keep rising with steps
#defcom %M1.27    Impulse to start parking motorized bracket axis 

#defcom %M2.0     CNC in automatic
#defcom %M2.1     CNC in semiautomatic
#defcom %M2.2     CNC in manual
#defcom %M2.3     CNC in positioning
#defcom %M2.4     CNC in direct calibration
#defcom %M2.5     CNC in JOG open loop
#defcom %M2.6     CNC in diagnostic
#defcom %M2.7     CNC in autotuning
#defcom %M2.8     Machine in automatic or semiautomatic mode
#defcom %M2.9     Automatic cycle started
#defcom %M2.10    Bending cycle in progress
#defcom %M2.11    Manual descent active
#defcom %M2.12    Manual rise active
#defcom %M2.13    Backgauge cycle ended after retract
#defcom %M2.14    Hand Wheel with encoder enable selector
#defcom %M2.15    Single cylinder selection from Hand Wheel with encoder
#defcom %M2.16    Y2 selection from Hand Wheel with encoder
#defcom %M2.17    Step at BDC mode active
#defcom %M2.18    CNC in beam test page
#defcom %M2.19    CNC in edit page with beam rise enabled
#defcom %M2.20    Beam at absolute TDC (with threshold)
#defcom %M2.21    Beam under mute (without threshold)
#defcom %M2.22    Beam under pinch point (without threshold)
#defcom %M2.23    Beam under BDC (with threshold)
#defcom %M2.24    Beam calculated TDC (with threshold)
#defcom %M2.25    Beam under pinch point (with threshold)
#defcom %M2.26    Beam at absolute TDC NVEL (with inertia)
#defcom %M2.27    Beam at calculated TDC (with inertia)
#defcom %M2.28    Beam under BDC (with inertia)
#defcom %M2.29    Beam under mute (with threshold)

* SEGN_POSASSI
#defcom %M3.0     Fast descent in progress
#defcom %M3.1     Work descent in progress
#defcom %M3.2     Pause at end of bend in progress
#defcom %M3.3     Decompression in progress
#defcom %M3.4     Slow rise to pinch point in progress
#defcom %M3.5     Floating in progress
#defcom %M3.6     Fast ascent in progress
#defcom %M3.7     Recall in progress
#defcom %M3.8     Beam diagnostics in progress
#defcom %M3.9     Beam sizing in progress
#defcom %M3.10    Decompression finished
#defcom %M3.11    Beam ascent for manual Z cycle active

#defcom %M4.0     Machine at TDC
#defcom %M4.1     Machine at mute
#defcom %M4.2     Machine at pinch (after retract)
#defcom %M4.3     Machine at BDC
#defcom %M4.4     Machine at pinch (before retract)
#defcom %M4.5     Keep front arms in parking position
#defcom %M4.6     Axis in position (for all the cycle)
#defcom %M4.7     Axis in position (for starting the bend cycle)
#defcom %M4.8     Axis in position (for beam descent)
#defcom %M4.9     Keep BDC output ON at bending end
#defcom %M4.10    Sync end of bending on C16.6 (not inside pp_move)

* IN_GEN_MONIT
#defcom %M5.0     Emergency from inputs
#defcom %M5.1     Front arm A1 enabled by input
#defcom %M5.2     Front arm A2 enabled by input
#defcom %M5.3     Z manual cycle enabled
#defcom %M5.4     Start command
#defcom %M5.5     Stop command
#defcom %M5.6     + command
#defcom %M5.7     - command
#defcom %M5.8     Descent signal
#defcom %M5.9     Ascent signal
#defcom %M5.10    Bistable Stop command
#defcom %M5.11    Pump off emergency
#defcom %M5.12    Front arms A1 or A2 enabled from input

* GENMAC
#defcom %M6.0     General emergency
#defcom %M6.1     Emergency activated or STOP button
#defcom %M6.2     Start button impulse
#defcom %M6.3     STOP used to latching reset in JOG OPEN
#defcom %M6.4     + command with latching
#defcom %M6.5     - command with latching
#defcom %M6.6     Impulse on descent command
#defcom %M6.7     Start automatic cycle impulse
#defcom %M6.8     Emergency activated or Stop Button (for beam)
#defcom %M6.9     Zero requested for CanOpen axis
#defcom %M6.10    Axis Zero cycle active
#defcom %M6.11    Backgauge zero cycle to execute
#defcom %M6.12    Machine lock before first ascent (beam NVEL)
#defcom %M6.13    Beam NVEL ascent for zeta manual cycle active
#defcom %M6.14    Manual Z cycle enabled
#defcom %M6.15    Manual Zeta cycle active on backgauge
#defcom %M6.16    Keep Step change execution
#defcom %M6.17    Step change active
#defcom %M6.18    Keep Step change received form chanel 0 (conventional press)
#defcom %M6.20    Chanel ready delay at power up
#defcom %M6.21    Safety photocell active
#defcom %M6.22    Beam descent stop
#defcom %M6.23    Keep Working reset
#defcom %M6.24    All channels reset command
#defcom %M6.25    Ascent command impulse with beam stopped on bend
#defcom %M6.26    Thickness out of tolerance alarm from pressure sensor
#defcom %M6.27    First bend of workpiece activated (user PLC)
#defcom %M6.28    Impulse axis selected change
#defcom %M6.29    Beam axis selected
#defcom %M6.30    Step change on pedal selected
#defcom %M6.31    User front arms manual page active

* CYCPEST
#defcom %M7.0     Alarm for maximun unbalance (from input or quote)
#defcom %M7.1     Recall to be done
#defcom %M7.2     Coined bend done with NVEL beam
#defcom %M7.3     Descent phase for bend cycle active
#defcom %M7.4     Descent enabled
#defcom %M7.5     Stop at Mute
#defcom %M7.6     Ascent command active on manual or automatic
#defcom %M7.7     Descent command active on manual
#defcom %M7.8     Bend cycle command
#defcom %M7.9     Keep beam forced rise
#defcom %M7.10    Beam stopped on bend
#defcom %M7.11    Beam and front arms stopped
#defcom %M7.12    Standard Beam unbalance exceeded
#defcom %M7.13    Slow speed descent forced (immediate)
#defcom %M7.14    Keep Decompression waiting after channel reset
#defcom %M7.15    Keep to use calculated TDC
#defcom %M7.16    NVEL beam recall active
#defcom %M7.17    Manual ascent done for NVEL beam
#defcom %M7.18    Recall exclusion (Too many attempts, Recall non possible)
#defcom %M7.19    Stop forced for beam Stopping space check procedure 
#defcom %M7.20    Re-ascent forced after beam stopping space check procedure
#defcom %M7.21    Beam Stopping space check procedure executed OK
#defcom %M7.22    Beam Stopping space check procedure executed KO
#defcom %M7.23    Slow descent forced for beam Stopping space procedure not OK
#defcom %M7.24    Beam (Ram) Stopped - No movement requested
#defcom %M7.25    Beam (Ram) Stopped - No movement requested for 100mS
#defcom %M7.26    Beam test active
#defcom %M7.27    Fast speed selection for beam test
#defcom %M7.28    Beam (Ram) Stopped - Waiting LazerSafe braket positioning

* STATGEN (NVEL beam cycle)
#defcom %M8.0     NVEL beam bend cycle active
#defcom %M8.1     NVEL beam cycle: mute reached
#defcom %M8.2     NVEL beam cycle: pinch point reached in descent
#defcom %M8.3     NVEL beam cycle: bend ended
#defcom %M8.4     NVEL beam cycle: decompression ended
#defcom %M8.5     NVEL beam cycle: pinch point reached in rising
#defcom %M8.6     End impulse on NVEL beam cycle

* GENMAC (Axis calibration sequence)
#defcom %M8.10    Sequence for backgauge reference cycle enabled
#defcom %M8.11    Step 2 for backgauge reference cycle sequence
#defcom %M8.12    Step 3 for backgauge reference cycle sequence
#defcom %M8.13    Step 4 for backgauge reference cycle sequence

* SEGNEND e GESTRISC
#defcom %M10.0    Axes on movement
#defcom %M10.1    Axes in alarm status
#defcom %M10.2    Electric machine lubrication alarm
#defcom %M10.3    Backgauge velocity limited for risk area active
#defcom %M10.4    Transmission program name OK from tandem
#defcom %M10.5    Movement lock for gantry not hooked
#defcom %M10.6    Ref slave gantry axis X requested
#defcom %M10.7    Grant slave gantry axis X requested
#defcom %M10.8    Ref slave gantry axis R requested
#defcom %M10.9    Grant slave gantry axis R requested
#defcom %M10.10   Keep Backgauge velocity limited for risk area
#defcom %M10.11   Imp. back gauge channels reset for SW limits software in positioning
#defcom %M10.12   Back gauge speed limitation from input
#defcom %M10.13   Back gauges independent
#defcom %M10.14   Slowing advance for X3 ramp
#defcom %M10.15   Slowing advance for X4 ramp

* GSTPEST e SEGNPEST
#defcom %M10.21   Keep beam axes calibrated
#defcom %M10.22   End of TDC time for conventional machine
#defcom %M10.23   End of dwell time at BDC
#defcom %M10.24   Beam calibration cycle active
#defcom %M10.25   Beam cycle reset condition
#defcom %M10.26   Calibration cycle done for NVEL or read-only beam
#defcom %M10.27   Valve and pressure, for autotuning cycle
#defcom %M10.28   Set TDC for Autotuning
#defcom %M10.29   Keep descent interrupted memory from photocell exclution for tandem
#defcom %M10.30   Beam proportional valve command for oil filter

* IN_GEN_MONIT (Safety functions)
#defcom %M11.0    Proportional valves direction error
#defcom %M11.1    Relay 20KA1-2-3-4 alarm
#defcom %M11.2    Relay KA3 warning
#defcom %M11.3    Transducers SQ1-SQ2 warning
#defcom %M11.4    Parking A1-A2 axes alarm
#defcom %M11.5    Transducers SQ5-SQ6 warning
#defcom %M11.6    Transducer SQ7 warning
#defcom %M11.7    Proportional valves rest position error
#defcom %M11.8    SD transducer Warning
#defcom %M11.9    MCS Installed and connected
#defcom %M11.10   Change step force at TDC from MCS
#defcom %M11.11   Keep LVDT Y1 transducer alarm
#defcom %M11.12   Keep LVDT Y2 transducer alarm

* TANDEM_ROBOT
#defcom %M12.0    Machine selection in tandem
#defcom %M12.1    Manual descent disabled in tandem
#defcom %M12.2    Valid remote NC status
#defcom %M12.3    Abil. cycle start from remote NC
#defcom %M12.4    remote NC in alarm
#defcom %M12.5    Automatic cycle execution enable from remote NC
#defcom %M12.6    Descent enabled from robot
#defcom %M12.7    Start button from remote NC
#defcom %M12.8    Stop button from remote NC
#defcom %M12.9    Bend pedal from remote NC
#defcom %M12.10   Rise pedal from remote NC
#defcom %M12.11   I'm the machine 1 of the tandem group 
#defcom %M12.12   I'm the machine 2 of the tandem group
#defcom %M12.13   I'm the machine 3 of the tandem group
#defcom %M12.14   I'm the machine 4 of the tandem group
#defcom %M12.15   Machine 1 selected in tandem
#defcom %M12.16   Machine 2 selected in tandem
#defcom %M12.17   Machine 3 selected in tandem
#defcom %M12.18   Machine 4 selected in tandem
#defcom %M12.19   Descent + enable from tandem
#defcom %M12.30   Rising signal from local or from tandem

* BLOCC_UTENSILI
#defcom %M12.20   Tool release selection
#defcom %M12.21   Machine block for unlocked tools
#defcom %M12.22   Unlocked punches
#defcom %M12.23   Unlocked dies
#defcom %M12.24   Manual tool release enable
#defcom %M12.25   Tool locking in progress
#defcom %M12.26   Cycle start lock for tool check request

* GEST_SENSORI
#defcom %M13.2    Bend with DATAM-IRIS sensor
#defcom %M13.7    Activation of the GPS sensor calibration cycle
#defcom %M13.10   Bending cycle NVEL with DATAM sensor
#defcom %M13.11   End of bend NVEL with DATAM sensor
#defcom %M13.12   Select. target NVEL from DATAM sensor
#defcom %M13.13   Dwell on bend NVEL with DATAM sensor
#defcom %M13.14   Bend completed NVEL with DATAM sensor
#defcom %M13.15   Recalculation done NVEL with DATAM sensor
#defcom %M13.16   Impulse end of recalculation with DATAM sensor
#defcom %M13.17   Angle measurement cycle with strain gauge selected
#defcom %M13.18   Floatation done NVEL with DATAM sensor
#defcom %M13.19   Floating in progress NVEL with DATAM sensor
#defcom %M13.20   Remote machine ready for the i-th press
#defcom %M13.21   Remote machine in tolerance during the cycle with DATAM sensor
#defcom %M13.22   Remote machine end-of-cycle with DATAM sensor
#defcom %M13.23   Remote machine has done the measurement/recalculation with DATAM sensor on i-th point
#defcom %M13.24   Angle measurement with DATAM-IRIS sensor cycle selected
#defcom %M13.25   Remote machine ready to rise
#defcom %M13.26   Remote machine at pinch point on rising
#defcom %M13.27   Real time angle measurement cycle selected
#defcom %M13.28   Bend learned by angle sensor cycle selected


* STATGEN
#defcom %M14.0    Axis Y1 configured
#defcom %M14.1    Axis Y2 configured
#defcom %M14.2    Axis X1 configured
#defcom %M14.3    Axis X2 configured
#defcom %M14.4    Axis R1 configured
#defcom %M14.5    Axis R2 configured
#defcom %M14.6    Axis Z1 configured
#defcom %M14.7    Axis Z2 configured
#defcom %M14.8    Axis A1 configured
#defcom %M14.9    Axis A2 configured
#defcom %M14.10   Axis A3 configured
#defcom %M14.11   Axis A4 configured
#defcom %M14.12   Axis A5 configured
#defcom %M14.13   Axis A6 configured
#defcom %M14.14   Axis A7 configured
#defcom %M14.15   Axis A8 configured
#defcom %M14.16   Axis S1 configured
#defcom %M14.17   Axis S2 configured
#defcom %M14.18   Axis S3 configured
#defcom %M14.19   Axis S4 configured
#defcom %M14.20   Axis S5 configured
#defcom %M14.21   Axis S6 configured
#defcom %M14.22   Axis X3 configured
#defcom %M14.23   Axis X4 configured
#defcom %M14.24   Axis R3 configured
#defcom %M14.25   Axis R4 configured
#defcom %M14.26   Axis Z3 configured
#defcom %M14.27   Axis Z4 configured

* USER PLC
#defcom %M15.0    Blocking cycle at mute point
#defcom %M15.1    Blocking cycle at pinch point after retract
#defcom %M15.2    Blocking cycle at BDC before the dwell time
#defcom %M15.3    Blocking cycle at BDC after the dwell time
#defcom %M15.4    Step change lock from user PLC
#defcom %M15.5    Forz. inactive SQ7 status for monitoring
#defcom %M15.6    R-Z axis calibration cycle block
#defcom %M15.7    Automatic cycle start lock
#defcom %M15.8    Recall cycle lock
#defcom %M15.9    Excludes front arm A1 from the Calibration
#defcom %M15.10   Excludes front arm A2 from the Calibration
#defcom %M15.11   Start beam user cycle
#defcom %M15.12   Enable Crowning during thickness search
#defcom %M15.13   Start button lock
#defcom %M15.14   Step Change from External UI
#defcom %M15.15   Front arms unhook cycle forcing
#defcom %M15.16   EX IMG100 cycle end pulse for autoreturn
#defcom %M15.17   Enable Active Crowning during hammered Bend
#defcom %M15.18   Beam position acquisition from the User PLC
#defcom %M15.19   Disable Handwheel Filter from PLC User
#defcom %M15.20   Enable automatic crowning calibration from PLC User
#defcom %M15.21   Disable Sending Robot Mode to PLC Safety from PLC User
#defcom %M15.22   Disable stop beam at BDC for active table from PLC User
#defcom %M15.23   Enable mute from PLC User
#defcom %M15.24   Disable Channels Reset on Enable/Disable front arms from PLC User
#defcom %M15.25   Motorized brackets parking from PLC User
#defcom %M15.26   Manual decompression delay from PLC User
#defcom %M15.27   Disable management of sensors axes in position by user PLC
#defcom %M15.28   Emergency from PLC User
#defcom %M15.30   Field mute forcing from user PLC

* HAMMERLE
#defcom %M16.0    Hammerle press configuration
#defcom %M16.1    Reset pressure for hydraulic cushion (if there is a valve)
#defcom %M16.2    Pressure maintenance for hydraulic cushion (if there is no valve)
#defcom %M16.3    End pressing from hydraulic cushion sensors

* ACTBOMB
#defcom %M16.10   Active table enabled
#defcom %M16.11   Single pump for crowning control
#defcom %M16.12   Beam stop at BDC for active table
#defcom %M16.13   S4 axis automatic calibration request
#defcom %M16.14   Beam stop at BDC for remote active table not in position

* Lazersafe
#defcom %M16.20   Manual commmand on motorized brackets from PCSS active

* VALV_PRESS
#defcom %M17.0    Fast descent valves command
#defcom %M17.1    Slow descent valves command
#defcom %M17.2    Fast ascent valves command
#defcom %M17.3    Slow ascent valves command
#defcom %M17.4    Diagnostic valves command

VAR
DecQuotaEnab AT %M17.6; * To-target decompression enabled
END_VAR

#defcom %M17.7    Keeping command of rising valves
#defcom %M17.8    Slow valves command
#defcom %M17.9    Beam valve command ON
#defcom %M17.10   Fast descent pressure command
#defcom %M17.11   Slow descent pressure command (manual)
#defcom %M17.12   Work descent pressure command
#defcom %M17.13   Slow ascent pressure command (servo)
#defcom %M17.14   Fast ascent pressure command
#defcom %M17.15   Diagnostic main/crowning pressure command
#defcom %M17.16   Pressure for tool servo clamps
#defcom %M17.17   Decompression pressure command
#defcom %M17.18   Tools lock pressure command
#defcom %M17.19   Floating / slow rise pressure command
#defcom %M17.20   Work crowning command
#defcom %M17.21   Crowning command for speed management on conventional Press
#defcom %M17.22   Crowning command for speed management on NVEL beam
#defcom %M17.23   Beam pressure command ON

#defcom %M17.29   Crowning lock for thickness detection
#defcom %M17.30   Maximum valve time alarm

* GENMAC
#defcom %M18.0    Axis Y1 selected
#defcom %M18.1    Axis Y2 selected
#defcom %M18.2    Axis X1 selected
#defcom %M18.3    Axis X2 selected
#defcom %M18.4    Axis R1 selected
#defcom %M18.5    Axis R2 selected
#defcom %M18.6    Axis Z1 selected
#defcom %M18.7    Axis Z2 selected
#defcom %M18.8    Axis A1 selected
#defcom %M18.9    Axis A2 selected
#defcom %M18.10   Axis A3 selected
#defcom %M18.11   Axis A4 selected
#defcom %M18.12   Axis A5 selected
#defcom %M18.13   Axis A6 selected
#defcom %M18.14   Axis A7 selected
#defcom %M18.15   Axis A8 selected
#defcom %M18.16   Axis S1 selected
#defcom %M18.17   Axis S2 selected
#defcom %M18.18   Axis S3 selected
#defcom %M18.19   Axis S4 selected
#defcom %M18.20   Axis S5 selected
#defcom %M18.21   Axis S6 selected
#defcom %M18.22   Axis X3 selected
#defcom %M18.23   Axis X4 selected
#defcom %M18.24   Axis R3 selected
#defcom %M18.25   Axis R4 selected
#defcom %M18.26   Axis Z3 selected
#defcom %M18.27   Axis Z4 selected

* SEGNEND
#defcom %M19      Auxiliary function register

#defcom %M19.0    Function 1
#defcom %M19.1    Function 2 pneumatic flattening die
#defcom %M19.2    Function 3 Z retract
#defcom %M19.3    Function 4 Front arms unhook cycle
#defcom %M19.4    Function 5 Forcing slow descent
#defcom %M19.5    Function 6
#defcom %M19.6    Function 7
#defcom %M19.7    Function 8
#defcom %M19.8    Function 9 change step at BDC
#defcom %M19.9    Function 10
#defcom %M19.10   Function 11
#defcom %M19.11   Function 12 Stop at mute
#defcom %M19.12   Function 13
#defcom %M19.13   Function 14
#defcom %M19.14   Function 15
#defcom %M19.15   Function 16
#defcom %M19.16   Function 17
#defcom %M19.17   Function 18
#defcom %M19.18   Function 19
#defcom %M19.19   Function 20 stop at BDC
#defcom %M19.20   Function 21 change step at TDC
#defcom %M19.21   Function 22 change step on pedal release
#defcom %M19.22   Function 23 retract without beam stopping


* Numerical variables
#defcom %M20      Absolute TDC target - 5mm
#defcom %M21      Calculated TDC target (previous bend)
#defcom %M22      Pinch point target
#defcom %M23      BDC target
#defcom %M24      Beam speed limitation
#defcom %M25      Pressure for active crowning
#defcom %M26      Beam descent inertia
#defcom %M27      Beam rise inertia
#defcom %M28      Absolute TDC target - rising inertia
#defcom %M29      Beam tolerance


* Serial teach pendant management
#defcom %M30.0    Command from handwheel selected
#defcom %M30.1    handwheel to target motion request
#defcom %M30.2    Automatic mode sel. from teach pendant
#defcom %M30.3    Semiautomatic mode sel. from teach pendant
#defcom %M30.4    Manual mode sel. from teach pendant
#defcom %M30.5    Rich. step change to UI from teach pendant
#defcom %M30.6    Rich. axis direct calibration from teach pendant
#defcom %M30.7    Motion request from handwheel
#defcom %M30.8    Beam handwheel control enable in manual mode
#defcom %M30.9    Rising pressure command from handwheel
#defcom %M30.10   Keep control from handwheel on front panel
#defcom %M30.14   Command from handwheel on encoder sel.
#defcom %M30.15   Handwheel with encoder presence
#defcom %M30.16   Beam control from handwheel at BDC
#defcom %M30.17   XHC teach pendant presence
#defcom %M30.18   Handwheel command selection with XHC teach pendant
#defcom %M30.19   Handwheel XHC Enabled
#defcom %M30.20   Channel reset from handwheel stopped
#defcom %M30.21   Mem. channel reset for handwheel reverse

#defcom %M31      Override from handwheel in JOG
#defcom %M32      Selected axis actual position
#defcom %M33      Axis target position for handwheel
#defcom %M34      Selected axis number of decimals
#defcom %M35      Y2 BDC target
#defcom %M36      Handwheel axis counter
#defcom %M37      BDC calculated by DATAM
#defcom %M38      Die function register
#defcom %M39      Beam sampled stopping distance
#defcom %M40      Sampling stopping distance Y1 position begin
#defcom %M41      Sampling stopping distance Y2 position begin
#defcom %M42      PLC-UI TMS correction K
#defcom %M43      PLC-UI TMS with K correction
#defcom %M44      PLC-UI Thickness reader potentiometer (ADC points)

#defcom %M45.0    PLC-FAST Enab. tracking error check for beam anti windup
#defcom %M45.1    PLC-FAST Negative direction for beam anti windup
#defcom %M46      PLC-FAST Tracking error limit (pulses) for beam anti windup

#defcom %M50.0    Step change request from external UI

#defcom %M51.0    Enab. back gauge parking from user PLC
#defcom %M51.1    Lock back gauge axes in parking from user PLC
#defcom %M51.2    Enab. X1 parking from user PLC
#defcom %M51.3    Enab. X2 parking from user PLC
#defcom %M51.4    Enab. R1 parking from user PLC
#defcom %M51.5    Enab. R2 parking from user PLC
#defcom %M51.6    Enab. Z1 parking from user PLC
#defcom %M51.7    Enab. Z2 parking from user PLC
#defcom %M51.8    Enab. X3 parking from user PLC
#defcom %M51.9    Enab. Z3 parking from user PLC
#defcom %M51.10   Dis. MCS thickness acquire from user PLC
#defcom %M51.11   Enab. beam rise in edit page from user PLC
#defcom %M51.12   Enab. beam override from user PLC
#defcom %M51.13   Enab. back gauge override from user PLC
#defcom %M51.14   Enab. acquire pinch point from user PLC
#defcom %M51.15   Enab. handwheel at mute from user PLC
#defcom %M51.16   Dis. valve at startup with decomp. excluded in manual from user PLC
#defcom %M51.17   Allow beam rise in emergency from user PLC
#defcom %M51.18   Selec. S1 sensor for calibration from user PLC
#defcom %M51.19   Selec. S2 sensor for calibration from user PLC
#defcom %M51.20   Selec. S3 sensor for calibration from user PLC
#defcom %M51.21   Selec. S4 sensor for calibration from user PLC
#defcom %M51.22   Selec. S5 sensor for calibration from user PLC
#defcom %M51.23   Selec. S6 sensor for calibration from user PLC
#defcom %M51.24   Disab. use of descent pedal for slow upward from user PLC

#defcom %M52      Beam override from user PLC (0-100)
#defcom %M53      Back gauge override from user PLC (0-100)
#defcom %M54      Working speed DAC voltage limit from user PLC (mV)
#defcom %M55      Handwheel configurable step length from user PLC (um)
#defcom %M56      Free
#defcom %M57      First register displayed in the MAN / SAUTO / AUTO numeric pages
#defcom %M58      Second register which is displayed in the numerical pages of MAN / SAUTO / AUTO
#defcom %M59      Safety speed DAC voltage limit from user PLC (mV)

* Channel specific variables
#defcom %rgc0.0      Present axis in alarm in the channel
#defcom %rgc0.1      Channel axes stopped
#defcom %cn0.rgc0.1  Axes stopped on channel 0
#defcom %rgc0.2      Axis selected in the channel
#defcom %rgc0.3      Feed hold from the channel to the axes
#defcom %rgc0.4      Selected axis with potentiometer
#defcom %rgc0.5      Channel axes in ISO null status
#defcom %rgc0.6      Emergency from the channel to the axes

* Variables from M64 to M255 reserved for user plc

VAR
RegPressione AT %M256; * % requested pressure (0-1000)
RegBombatura AT %M257; * % requested crowning (0-1000)
DacPressReq AT %M258; * DAC requested pressure (0-1000)
DacBombReq AT %M259; * DAC requested crowning (0-1000)

ForceSensCalibCyc AT %M260.0; * Force sensors calibration cycle in progress
PressEnSGCalib AT %M260.1; * Pressure command enable by force sensors calibration
PressLinSGCalib AT %M260.2; * Pressure linearization enable by force sensors calibration

PressSGCalib AT %M261; * % pressure requested for strain gauge calibration (0-1000)
WorkPress AT %M262; * Working pressure (0-1000)
VelLimXArea AT %M263; * X axes quote for X-R-Z axes speed limiting

END_VAR


