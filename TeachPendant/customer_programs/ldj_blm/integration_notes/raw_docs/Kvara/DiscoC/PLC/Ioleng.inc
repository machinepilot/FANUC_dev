* Logic I/O

* Special signals for PLC

#defcom %PLCFLAGS.0                      Always OFF
#defcom %PLCFLAGS.1                      Always ON
#defcom %PLCFLAGS.8                      On at first plc scan
#defcom %PLCFLAGS.15                     Timelock warning

* Registers from UI to PLC  (and to PP)

#defcom %C0.0     UI-PLC Editing mode from GUI
#defcom %C0.1     UI-PLC Automatic mode from GUI
#defcom %C0.2     UI-PP-PLC Semi-Automatic mode from GUI
#defcom %C0.3     UI-PP-PLC Positioning mode from GUI
#defcom %C0.4     UI-PLC Manual mode from GUI
#defcom %C0.5     UI-PLC Axes/beam test page
#defcom %C0.6     UI-PLC Direct calibration mode from GUI
#defcom %C0.8     UI-PLC Diagnostic page (not used)
#defcom %C0.9     UI-PP-PLC Potentiometer calibration mode from GUI
#defcom %C0.10    UI-PLC Autotuning mode from GUI

#defcom %C0.14    UI-PP Confirm program change performed
#defcom %C0.15    UI-PLC Request program change by operator

#defcom %C0.16    UI-PP-PLC Programs list mode from GUI
#defcom %C0.17    UI-PP-PLC Tool list mode from GUI
#defcom %C0.18    UI-PP-PLC Corrections page from GUI

#defcom %C0.25    UI-PLC Direct calibration quota check OK
#defcom %C0.26    UI-PLC Positioning quota check OK

#defcom %C2.0     UI-PLC Confirm Step Change Acquired
#defcom %C2.1     UI-PLC Program modified by operator
#defcom %C2.2     UI-PLC Check program OK
#defcom %C2.3     UI-PLC Check program NOT OK
#defcom %C2.5     UI-PLC ACK quota acquisition done
#defcom %C2.6     UI-PLC Confirm BDC recalculated after floating (SER sensor)
#defcom %C2.7     UI-PLC Bend with use of SER/LC angle sensor
#defcom %C2.8     UI-PLC Bending calculation error after floating (SER sensor)
#defcom %C2.9     UI-PLC Target Calc. from LC sensor: OK
#defcom %C2.10    UI-PLC Target Calc. from LC sensor: error
#defcom %C2.11    UI-PLC Target Calc. from LC sensor: bend completed
#defcom %C2.12    UI-PLC Double-stroke bend
#defcom %C2.13    UI-SLAPPG Stop of floating from UI
#defcom %C2.14    SA-PLC Real time angle in tolerance or wrong, bend completed
#defcom %C2.15    UI-SA Scan Angle from UI
#defcom %C2.16    UI-PLC Received angle 180 from LC in the front angle
#defcom %C2.17    UI-PLC Received angle 180 from LC in the back angle
#defcom %C2.18    UI-PLC Received angle 180 from LC in the right front angle
#defcom %C2.19    UI-PLC Received angle 180 from LC in the right back angle

#defcom %C3.0     UI-PLC Repeat calibration
#defcom %C3.1     UI-PP Negative potentiometer calibration
#defcom %C3.2     UI-PP Positive potentiometer calibration
#defcom %C3.3     UI-PP List execution mode (0-single, 1-circular)
#defcom %C3.4     UI-PP Last program in the list
#defcom %C3.5     UI-PP Execution mode (0-program, 1-list)
#defcom %C3.6     UI-SA Start Continuous Measure from UI
#defcom %C3.7     UI-PLC TOS BOS page Active
#defcom %C3.8     UI-PLC Special Cycle Maximum skew Micro Alignment

#defcom %C4.0     SA-PLC Start of floating from SER angle sensor
#defcom %C4.1     SA-PLC End of angle writing from SER sensor angle
#defcom %C4.2     SA-PLC End of bend form angle sensor SER
#defcom %C4.3     SA-PLC Error from angle sensor SER

#defcom %C5.0     UI-PLC START button from UI
#defcom %C5.1     UI-PLC STOP button from UI
#defcom %C5.2     UI-PLC PLUS Button from UI
#defcom %C5.3     UI-PLC MINUS Button from UI

#defcom %C6       UI-PP Number of pieces made for each cycle
#defcom %C7       SLAPPG-UI Value received from angle right sensor real time measurement in descent command
#defcom %C8       SLAPPG-PLC Dynamic Correction BDC Y1 for Angle Measurement
#defcom %C9       SLAPPG-PLC Dynamic Correction BDC Y2 for Angle Measurement
#defcom %C10      UI-PLC Crowning correction index (for bend and attempt)
#defcom %C11      SLAPPG-UI Value received from angle right sensor real time measurement in floating command
#defcom %C12      SLAPPG-UI Value received from angle real time measurement in descent command
#defcom %C13      SLAPPG-UI Value received from angle real time measurement in floating command

#defcom %C14.7    PLC - PP Crowning calibration started
#defcom %C14.8    PLC - PLC Impulse for crowning calibration cycle start
#defcom %C14.9    PLC - UI Conditions for enabling the crowning test key
#defcom %C14.10   PLC - PLC Enable automatic force sensors calibration

#defcom %C15.0    UI(UIPL) Req. general hour counter preset (Test)
#defcom %C15.1    UI(UIPL) Req. pump hour counter preset (Test)
#defcom %C15.2    UI(UIPL) Req. work hour counter preset (Test)
#defcom %C15.3    UI(UIPL) Req. beam cycle counter presets (Test)

#defcom %C15.6    UI(UIPL) Req. Beam parking in Manual
#defcom %C15.7    PLC - PP Crowning calibration started
#defcom %C15.10   PLC - PLC Enable automatic sensor calibration
#defcom %C15.11   UI(UIPL) Button tool unloading start
#defcom %C15.12   UI(UIPL) Button loader start
#defcom %C15.13   UI(UIPL) Button automatic tool changer enable

#defcom %C15.16   UI (UIPL) Button UP Y1 test page
#defcom %C15.17   UI (UIPL) Button DOWN Y1 test page
#defcom %C15.18   UI (UIPL) Button UP Y2 test page
#defcom %C15.19   UI (UIPL) Button DOWN Y2 test page
#defcom %C15.20   UI (UIPL) Button UP Y1-Y2 test page
#defcom %C15.21   UI (UIPL) Button DOWN Y1-Y2 test page
#defcom %C15.22   UI (UIPL) Sel. Fast valves test page
#defcom %C15.23   UI (UIPL) Enable "advanced" test page
#defcom %C15.24   UI (UIPL) Button Beam sel. on test page
#defcom %C15.25   UI (UIPL) Button Axes sel. on test page

#defcom %selasse                         UI-PP-PLC Axis selected

#defcom %robotnam                        UI-PLC Program code for robot
#defcom %robotnam.0                      UI-PLC Program code for robot bit 0
#defcom %robotnam.1                      UI-PLC Program code for robot bit 1
#defcom %robotnam.2                      UI-PLC Program code for robot bit 2
#defcom %robotnam.3                      UI-PLC Program code for robot bit 3
#defcom %robotnam.4                      UI-PLC Program code for robot bit 4

#defcom %pstp0                           UI-PLC Pressure for rapid descent in DAC points
#defcom %pstp1                           UI-PLC Pressure for manual slow descent in DAC points
#defcom %pstp2                           UI-PLC Pressure for fast rise in DAC points
#defcom %pstp3                           UI-PLC Pressure for slow rise in DAC points

#defcom %valvd                           UI-PLC Valve conf. for diagnostic

#defcom %Uipl.Page                       UI-PLC Current UIPL page ID

#defcom %ui16.10                         UI-PLC Single block active from channel monitor
#defcom %ui16.15                         UI-PLC Simulated execution by channel monitor
#defcom %ui16.16                         UI-PLC Jog open selection by channel monitor
#defcom %ui17                            UI-PLC Channel selected by channel monitor
#defcom %ui23                            UI-PLC JOG OPEN voltage by channel monitor
#defcom %ui24.0                          UI-PLC DEBUG mode enabled by channel monitor

#defcom %tensap                          UI-PLC Main Pressure set in diagnostics (Volt)
#defcom %tenscp                          UI-PLC Crowning Pressure set in diagnostics (Volt)

* Registers from UI to PP

#defcom %tensaa                          UI-PP Y1 Voltage set in diagnostics
#defcom %tensab                          UI-PP Y2 Voltage set in diagnostics

#defcom %tara                            UI-PP-PLC Direct calibration quota
#defcom %posi                            UI-PLC Axis positioning quota

#defcom %nmaxp                           UI-PP-PLC Bend total number in the program

* Program data from UI to PLC or PP

* NB: they are arrays of 80 elements, so from the PLC it is better to read the data
* directly in shared memory rather than refreshing them at each scan.
VAR_IN_OUT

PIEGA_CORR AT %np;                       * PP-UI-PLC Current bend number
AXIS_SEL_REG AT %selasse;                * UI-PP-PLC Axis selected from PLC forcing

* Struttura %PestQ[%np]
DP_PCL AT %pcl;                          * UI-PLC-PP Current bend pinch quota
DP_PCV AT %pcv;                          * UI-PLC-PP Current bend mute quota
DP_PMS_CAL AT %pmsc;                     * UI-PLC-PP Current bend TDC quota

* Struttura %progc[%np]
DP_TDISC AT %tdisc;                      * UI-PLC-PP Pressure descent time
DP_TDECO AT %tdeco;                      * UI-PLC-PP Decompression time
DP_PRES AT %pres;                        * UI-PLC Current bend main pressure (DAC points)
DP_BOMB AT %cpres;                       * UI-PLC Current bend crowning pressure (DAC points)
#defcom %progc[%np].pramp                  UI-PP Pressure ramp time

* Struttura %prog[%np]
DP_PMS_IMP AT %pms;                      * UI-PLC Set value TDC current bend
DP_PMI AT %ya;                           * UI-PLC-PP Y1 axis target quota
DP_PMIY2 AT %yb;                         * UI-PLC-PP Y2 axis target quota
DP_PMIYB AT %dSc;                        * UI-PLC-PP YB axis target quota (A3)
DP_X1 AT %xa;                            * UI-PLC-PP X1 axis target quota
DP_X2 AT %xb;                            * UI-PLC-PP X2 axis target quota
DP_X3 AT %xc;                            * UI-PLC-PP X3 axis target quota
DP_X4 AT %xd;                            * UI-PLC-PP X4 axis target quota
DP_COR_X1 AT %corxa;                     * UI-PLC-PP X1 axis correction value
DP_COR_X2 AT %corxb;                     * UI-PLC-PP X2 axis correction value
DP_COR_X3 AT %corxc;                     * UI-PLC-PP X3 axis correction value
DP_COR_X4 AT %corxd;                     * UI-PLC-PP X4 axis correction value
DP_RINC_X1 AT %rinxa;                    * UI-PLC X1 axis retract distance
DP_RINC_X2 AT %rinxb;                    * UI-PLC X2 axis retract distance
DP_RINC_X3 AT %rinxc;                    * UI-PLC X3 axis retract distance
DP_RINC_X4 AT %rinxd;                    * UI-PLC X4 axis retract distance
DP_RINCG_X1 AT %rinca;                   * UI-PLC X1 axis global retract distance
DP_RINCG_X2 AT %rincb;                   * UI-PLC X2 axis global retract distance
DP_RINCG_X3 AT %rincc;                   * UI-PLC X3 axis global retract distance
DP_RINCG_X4 AT %rincd;                   * UI-PLC X4 axis global retract distance
DP_R1 AT %ara;                           * UI-PLC-PP R1 axis target quota
DP_R2 AT %arb;                           * UI-PLC-PP R2 axis target quota
DP_R3 AT %ar_c;                          * UI-PLC-PP R3 axis target quota
DP_R4 AT %ard;                           * UI-PLC-PP R4 axis target quota
DP_VELW AT %velw;                        * UI-PP-PLC Work descent speed
#defcom %prog[%np].coraya                  UI-PP Work descent gain Y1
#defcom %prog[%np].corayb                  UI-PP Work descent gain Y2
DP_FUN_AUX AT %fun;                      * UI-PLC Program auxiliary functions
DP_TYPEBEND AT %type;                    * UI-PLC-PP Bend type (normal, coined, etc.)
DP_DWELL_TIME AT %tbend;                 * UI-PLC Dwell time at the end of the bend
DP_ACCOM_VEL AT %accomp;                 * UI-PP-PLC Slow rise to pinch point speed (0 = excluded)
DP_THICKNESS AT %thick;                  * UI-PP-PLC Sheet thickness
DP_CHSTEP_TIME AT %tcp;                  * UI-PLC Step change time
DP_STEP_RIPET AT %rip;                   * UI-PP-PLC Number of step repetitions (0 = simulated)
DP_SENS1 AT %bySensA;                    * UI-PLC Active sensor 1 on bend
DP_SENS2 AT %bySensB;                    * UI-PLC Active sensor 2 on bend
DP_SENS3 AT %bySensC;                    * UI-PLC Active sensor 3 on bend
DP_SENS4 AT %bySensD;                    * UI-PLC Active sensor 4 on bend
DP_SENS5 AT %bySensE;                    * UI-PLC Active sensor 5 on bend
DP_SENS6 AT %bySensF;                    * UI-PLC Active sensor 6 on bend
DP_METODO AT %metodo;                    * UI-PLC Active method on bend
DP_CON_SENS AT %byConSe;                 * UI-PLC Active sensor on bend
DP_QUOTA_ACC1 AT %aa;                    * UI-PLC-PP Front arm A1 target
DP_QUOTA_ACC2 AT %ab;                    * UI-PLC-PP Fornt arm A2 target
DP_QUOTA_ACC3 AT %ac;                    * UI-PLC-PP Auxiliary axis A3 target
DP_QUOTA_ACC4 AT %ad;                    * UI-PLC-PP Auxiliary axis A4 target
DP_QUOTA_ACC5 AT %ae;                    * UI-PLC-PP Auxiliary axis A5 target
DP_QUOTA_S1 AT %dSa;                     * UI-PLC-PP Sensor S1 target
DP_QUOTA_S2 AT %dSb;                     * UI-PLC-PP Sensor S2 target
DP_QUOTA_S3 AT %dSc;                     * UI-PLC-PP Sensor S3 target
DP_QUOTA_S4 AT %dSd;                     * UI-PLC-PP Sensor S4 target
DP_QUOTA_S5 AT %dSe;                     * UI-PLC-PP Sensor S5 target
DP_QUOTA_S6 AT %dSf;                     * UI-PLC-PP Sensor S6 target
DP_ALETTA AT %altaletta;                 * UI-PLC Fin height quota for photocells
DP_AT_QTAMAX AT %at_dat.QtaMax;          * PLC-PAR Maximum quota for Autotuning
DP_AT_QTAMIN AT %at_dat.QtaMin;          * PLC-PAR Minimum quota for Autotuning
DP_STATION AT %byNumSt;                  * UI-PP-PLC Work Station number selected
DP_NMETODO AT %nMetodo;                  * UI-PP-PLC Bending method programmed
DP_ANGYA AT %angya;                      * UI-PP Y1 target angle
DP_DBOMB_YBB AT %IMG.tp0.dBomb_YBB;      * UI-PLC-PP Crowning correction from angle sensor (mm)
DP_IMG_METODO AT %DatiIMG.nMetodo;       * UI-PLC-PP Type of Bend
DP_NEWPA AT %newpa;                      * UI-PLC Value Function New 2
DP_NEWPB AT %newpb;                      * UI-PLC Value Function New 3
DP_CHSTEP_TYP AT %bPiegaE;               * UI-PLC Type step change (0-5, 10-15)
DP_DIST_DECOM AT %dPiegaD;               * UI-PP-PLC Decompression distance

* Structure %dap[%np]
DP_DIMPOST AT %dimp;                     * UI-PLC Die rear dimension
DP_LARGC AT %largc;                      * UI-PLC Quarry Width
DP_H_DIEHOLD AT %altDieHolder;           * UI-PLC Die holder Height
DP_H_INTERMED AT %altIntermediate;       * UI-PLC Intermediate Height
DP_H_DIE AT %altm;                       * UI-PP Die height

* Tandem press I / O registers on CAN
TNDATAQ1 AT %Tandem.TnData2;             * Machine 1 output register on CAN
TNDATAI1 AT %Tandem.TnData3;             * Input register from machine 1 on CAN
TNDATAQ2 AT %Tandem.TnData10;            * Machine 2 output register on CAN
TNDATAI2 AT %Tandem.TnData11;            * Input register from machine 2 on CAN
TNDATAQ3 AT %Tandem.TnData18;            * Machine 3 output register on CAN
TNDATAI3 AT %Tandem.TnData19;            * Input register from machine 3 on CAN
TNDATAQ4 AT %Tandem.TnData26;            * Machine 4 output register on CAN
TNDATAI4 AT %Tandem.TnData27;            * Input register from machine 4 on CAN
TNDATA5  AT %Tandem.TnData5;             * Quota Y2 from machine 1 on CAN
TNDATA13 AT %Tandem.TnData13;            * Quota Y2 from machine 2 on CAN
TNDATA21 AT %Tandem.TnData21;            * Quota Y2 from machine 3 on CAN
TNDATA29 AT %Tandem.TnData29;            * Quota Y2 from machine 4 on CAN
#defcom TNDATAI1.10                        Machine 1 selected in tandem
#defcom TNDATAI2.10                        Machine 2 selected in tandem
#defcom TNDATAI3.10                        Machine 3 selected in tandem
#defcom TNDATAI4.10                        Machine 4 selected in tandem

ErrCodes0 AT %PilzSrv.PilzErrCodes0;     * Register 0 alarms from Pilz
ErrCodes1 AT %PilzSrv.PilzErrCodes1;     * Register 1 alarms from Pilz

AP_FWERRY1 AT %ax0.pa5;                  * parameter tracking error Y1
AP_FWERRY2 AT %ax1.pa5;                  * parameter tracking error Y2

* DATAM sensor for ram NVEL

CMD_DATAM AT %C255.0;                    * PLC-SA Angle acquisition and recalculation command (BDC reached)
LON_DATAM AT %C255.5;                    * PLC-SA Laser switch on
NUM_PRES AT %byNumPres;                  * Angle sensor pressing counting
PMI1_DATAM AT %dPMI;                     * BDC1 calculated by DATAM
PMI2_DATAM AT %dPMI_YB;                  * BDC2 calculated by DATAM
NRET_DATAM AT %nRet;                     * Return code DATAM (2 = photo not accurate)
PR0_DATAM AT %IMG.tp0.dPMI;
PR1_DATAM AT %IMG.tp1.dPMI;
PR2_DATAM AT %IMG.tp2.dPMI;
PR3_DATAM AT %IMG.tp3.dPMI;
PR4_DATAM AT %IMG.tp4.dPMI;
PR5_DATAM AT %IMG.tp5.dPMI;
PR6_DATAM AT %IMG.tp6.dPMI;
PR7_DATAM AT %IMG.tp7.dPMI;
PR8_DATAM AT %IMG.tp8.dPMI;
PR9_DATAM AT %IMG.tp9.dPMI;

* Program name for tandem
PNOrigin AT %npr; * Program name source string for tandem
PNDestination AT %cn0.StrPgm; * Program name destination string for tandem

END_VAR

* Registers from part program to PLC (and to PP or UI)

#defcom %C16.0    PP-PLC Command request CH0 from PLC
#defcom %C16.1    PP-PLC Automatic beam cycle in progress
#defcom %C16.2    PP-PLC Fast descent in progress
#defcom %C16.3    PP-PLC Descent between mute and pinch in progress
#defcom %C16.4    PP-PLC Stop on pinch point for retract
#defcom %C16.5    PP-PLC Work descent in progress
#defcom %C16.6    PP-PLC Stop at the end of the bend
#defcom %C16.7    PP-PLC Floating in progress
#defcom %C16.8    PP-PLC Bend completed
#defcom %C16.9    PP-PLC Beam at pinch point in rising
#defcom %C16.10   PP-PLC End of beam cycle at TDC
#defcom %C16.11   PP-PLC End to-target decompression command
#defcom %C16.12   PP-PLC Enable Dynamic target correction for Realtime Angle Measurement
#defcom %C16.17   PP-SLAPPG Discrimination between pressure sensors and strain gauges
#defcom %C16.20   PP-PLC Decompression in progress
#defcom %C16.21   PP-PLC Decompression completed
#defcom %C16.22   PP-PLC Stop at BDC mode active
#defcom %C16.23   PP-PLC Start of front arms not synchronized descent
#defcom %C16.24   PP-PLC rise from pinch point in progress (step change)
#defcom %C16.25   PP-PLC Request data from LC sensor (unused)
#defcom %C16.26   PP-PLC External crowning positioning request
#defcom %C16.27   PP-PLC Angle Measurement Cycle in Progress
#defcom %C16.28   PP-PLC Prebending done
#defcom %C16.29   PP-PLC Tandem machine ready for the n-th press
#defcom %C16.30   PP-PLC End-of-cycle tandem machine with angle sensor
#defcom %C16.31   PP-PLC Tandem machine has completed the (measurement/recalculation) with angle sensor on the n-th point

#defcom %C17.0    PP-PLC CH1 command request from PLC
#defcom %C17.1    PP-PLC Back gauge cycle started
#defcom %C17.2    PP-PLC Start step change time
#defcom %C17.3    PP-PLC End step change time
#defcom %C17.4    PP-PLC Step change done
#defcom %C17.5    PP-PLC Back gauges positioning in progress
#defcom %C17.6    PP-PLC First G0 release on CH3-CH5
#defcom %C17.7    PP-PLC Second G0 release on CH3-CH5
#defcom %C17.8    PP-PLC Third G0 release on CH3-CH5
#defcom %C17.9    PP-PLC Axes in position on CH1
#defcom %C17.10   PP-PLC Positioning for retract started
#defcom %C17.11   PP-PLC Back gauges end of cycle (retract done)
#defcom %C17.12   PP-PLC Retract Z before X terminated CH1
#defcom %C17.13   PP-PLC Retract X before Z terminated CH1
#defcom %C17.14   PP-PLC Back gauge target wrong CH1
#defcom %C17.20   PP-PLC End of manual zeta cycle
#defcom %C17.21   PP-PLC Workpiece Finished
#defcom %C17.22   PP-PLC Update repetitions on UI
#defcom %C17.25   PP-PLC Bend number reset done
#defcom %C17.27   PP-PLC Calculation of Automatic Retract DataM in Progress
#defcom %C17.28   PP-PLC First step unlock on 611 cycle
#defcom %C17.29   PP-PLC Second step unlock on 611 cycle

#defcom %C18.0    PP-PLC-UI Program change request
#defcom %C18.10   PP-PLC-UI Calibration done on selected axis
#defcom %C18.12   PP-PLC-UI End of potentiometer calibration procedure
#defcom %C18.13   PP-PLC CH4 command request from PLC
#defcom %C18.14   PP-PLC Sensors calibration done
#defcom %C18.15   PP-PLC Single axis positioning cycle done
#defcom %C18.16   PP-PLC End of RAM INIT cycle
#defcom %C18.25   PP-PLC Sync for beam incremental movements at BDC
#defcom %C18.26   PP-PLC Automatic Calibration Sensors in progress

#defcom %C19.0    PP-PLC CH2 command request from PLC
#defcom %C19.1    PP-PLC Front arms cycle in progress
#defcom %C19.2    PP-PLC Front arms rise completed
#defcom %C19.3    PP-PLC Front arms rise for unhook in progress
#defcom %C19.4    PP-PLC End unhook cycle
#defcom %C19.5    PP-PLC-PP Front arms descent in progress
#defcom %C19.6    PP-PLC Front arms descent in gearing finished
#defcom %C19.7    PP-PLC-PP Front arms descent done
#defcom %C19.8    PP-PLC Front arms speed error
#defcom %C19.9    PP-PLC Front arms ready at the beginning of the cycle
#defcom %C19.10   PP-PLC Front arms cycle started
#defcom %C19.16   PP-PLC Front arms parking in progress
#defcom %C19.17   PP-PLC End of Front arms parking cycle
#defcom %C19.30   PP-PLC Front arms descent in positioning

#defcom %C20.0    PP-PLC CH3 command request from PLC
#defcom %C20.1    PP-PLC First G0 release on CH1
#defcom %C20.2    PP-PLC Second G0 release on CH1
#defcom %C20.3    PP-PLC Third G0 release on CH1
#defcom %C20.4    PP-PLC Axes in position on channel 3
#defcom %C20.5    PP-PLC Crowning table in position
#defcom %C20.6    PP-PLC Camera positioning done
#defcom %C20.7    PP-PLC Camera parking done

#defcom %C21.0    PP-PLC Mechanical stops positioning cycle
#defcom %C21.1    PP-PLC Mechanical stops in position
#defcom %C21.2    PP-PLC Alarm for mechanical stops positioning not possible
#defcom %C21.3    PP-PLC Manual descent in progress
#defcom %C21.4    PP-PLC Manual rise in progress
#defcom %C21.5    PP-PLC Calibration in progress
#defcom %C21.6    PP-PLC Recall in progress
#defcom %C21.7    PP-PP-PLC Beam diagnostic in progress
#defcom %C21.8    PP-PLC End of manual rise cycle
#defcom %C21.9    PP-PLC Manual zeta cycle active
#defcom %C21.10   PP-PLC End rise for manual zeta cycle
#defcom %C21.11   PP-PLC End of the recall cycle
#defcom %C21.12   PP-PLC Beam calibration end cycle
#defcom %C21.13   PP-PLC Beam user cycle ON
#defcom %C21.14   PP-PLC Prop. Command cycle for oil filtering
#defcom %C21.15   PP-PLC Beam ready to start rising
#defcom %C21.16   PP-PLC Angle error alarm
#defcom %C21.17   PP-PLC Mute exact stop reached
#defcom %C21.18   PP-PLC Pressure sensor out of tolerance alarm at pinch point
#defcom %C21.20   PP-PLC Req. stop on pinch point for pressure sensor
#defcom %C21.21   PP-PLC Recalculation with pressure sensor data done
#defcom %C21.22   PP-PLC Crowning pos. request from pressure sensor
#defcom %C21.23   PP-PLC Autotuning cycle active
#defcom %C21.24   PP-PLC Positioning started for the autotuning cycle
#defcom %C21.25   PP-PLC Positioning completed for autotuning cycle
#defcom %C21.26   PP-PLC Waiting finished for set Fast descent valves
#defcom %C21.27   PP-PLC Camera positioning request
#defcom %C21.29   PP-PLC Preclosing in progress

#defcom %C22.0    PP-PLC CH5 command request from PLC
#defcom %C22.1    PP-PLC First G0 unlock on CH1 from CH5
#defcom %C22.2    PP-PLC Second G0 release on CH1 from CH5
#defcom %C22.3    PP-PLC Third G0 release on CH1 from CH5
#defcom %C22.4    PP-PLC Axes in position channel 5
#defcom %C22.12   PP-PLC Retract Z before X terminated CH5
#defcom %C22.13   PP-PLC Retract X before Z terminated CH5
#defcom %C22.28   PP-PLC Confirm first step on 611 cycle done
#defcom %C22.29   PP-PLC Confirm second step on 611 cycle done
#defcom %C22.30   PP-PLC Confirm third step on 611 cycle done

#defcom %C23.0    SLAPPG StopGalleggiamento() terminated
#defcom %C23.1    SLAPPG End flotation from C36.0
#defcom %C23.2    SLAPPG End flotation from pressure sensors
#defcom %C23.3    SLAPPG End flotation from strain gauge
#defcom %C23.4    SLAPPG End flotation from digital input
#defcom %C23.5    SLAPPG End flotation from GPS angle sensor
#defcom %C23.6    SLAPPG End flotation from C2.13
#defcom %C23.7    SLAPPG End flotation from real time angle measure


#defcom %C24.0    PLC-UI (UIPL) Pump On Bit

#defcom %C25.0    UI(UIPL)-UserPLC Pump Start button
#defcom %C25.1    UI(UIPL)-UserPLC Pump Stop Button
#defcom %C25.3    UI(UIPL)-PLC Led Bar Button Full ON
#defcom %C25.4    UI(UIPL)-UserPLC Start Pressure Curve Test
#defcom %C25.5    UI(UIPL)-UserPLC Foot Mode Button
#defcom %C25.6    UI(UIPL)-UserPLC Foot Foot Button
#defcom %C25.7    UI(UIPL)-UserPLC Laser On Button
#defcom %C25.8    UI(UIPL)-UserPLC Power Off Button
#defcom %C25.9    UI(UIPL)-UserPLC Button rise to TDC with rise pedal
#defcom %C25.10   UI(UIPL)-UserPLC Enable External Hand Wheel

* Lazersafe motorized brackets
#defcom %C25.11   UI(UIPL)-PLC Lzs Photocel switch on
#defcom %C25.12   UI(UIPL)-PLC Lzs Photocel req homing
#defcom %C25.13   UI(UIPL)-PLC Lzs Photocel left fast up
#defcom %C25.14   UI(UIPL)-PLC Lzs Photocel left slow up
#defcom %C25.15   UI(UIPL)-PLC Lzs Photocel left slow down
#defcom %C25.16   UI(UIPL)-PLC Lzs Photocel left fast down
#defcom %C25.17   UI(UIPL)-PLC Lzs Photocel rigth fast up
#defcom %C25.18   UI(UIPL)-PLC Lzs Photocel rigth slow up
#defcom %C25.19   UI(UIPL)-PLC Lzs Photocel rigth slow down
#defcom %C25.20   UI(UIPL)-PLC Lzs Photocel rigth fast down
#defcom %C25.21   UI(UIPL)-PLC Lzs Photocel store requeset
#defcom %C25.22   UI(UIPL)-PLC Lzs Photocel POSITIONING requeset
#defcom %C25.23   UI(UIPL)-PLC Lzs Photocel beam movement disable

#defcom %C25.24   UI(UIPL)-PLC Die opening command
#defcom %C25.25   UI(UIPL)-PLC Punch opening command
#defcom %C25.26   UI(UIPL)-PLC Intermediate opening command

#defcom %C26.0    UI(UIPL)-UserPLC Handwheel selection in hundredths
#defcom %C26.1    UI(UIPL)-UserPLC Handwheel selection in tenths
#defcom %C26.2    UI(UIPL)-UserPLC Handwheel selection in mm
#defcom %C26.3    UI(UIPL)-UserPLC Selection of acquisition of beam value in the bend
#defcom %C26.4    UI(UIPL)-UserPLC Selection manual Hand Wheel
#defcom %C26.8    UI(UIPL)-UserPLC Enab. handwheel at mute

#defcom %C27.0    UI - PLC - PP Enable crowning test cycle
#defcom %C27.1    UI - PLC - PP Key for automatic calibration of shoulder correction sensors

#defcom %C100     UI (UIPL) Free
#defcom %C101     UI (UIPL) Preset general minute counter (Test)
#defcom %C102     UI (UIPL) Preset general hour counter (Test)
#defcom %C103     UI (UIPL) Preset work minute conuter (Test)
#defcom %C104     UI (UIPL) Preset work hour counter (Test)
#defcom %C105     UI (UIPL) Preset pump minute counter (Test)
#defcom %C106     UI (UIPL) Preset pump hour counter (Test)
#defcom %C107     UI (UIPL) Preset beam cycle counter (Test)

#defcom %C110     SLAPPG Gearing Error Y1
#defcom %C111     SLAPPG Gearing Error Y2
#defcom %C112     SLAPPG Gearing Error Front arm A1
#defcom %C113     SLAPPG Gearing Error Front arm A2
#defcom %C114     SLAPPG Gearing Target Slave Axis
#defcom %C115     SLAPPG Gearing Target Master Axis
#defcom %C116     PP-SLAPPG Front arms filter value Cutoff frequency FIR (x10)

#defcom %C120     PLC-SLAPPG Quota for fast TDC output
#defcom %C121     PLC-SLAPPG Quota for fast MUTE output
#defcom %C122     PLC-SLAPPG Quota for fast pinch output before retract
#defcom %C123     PLC-SLAPPG Quota for fast pinch output after retract
#defcom %C124     PLC-SLAPPG Quota for fast BDC output
#defcom %C125     PLC-SLAPPG Quota for fast rise stop
#defcom %C126     PLC-SLAPPG Quota for slow rise stop
#defcom %C127     PLC-SLAPPG Quota for fast descent stop
#defcom %C128     PLC-SLAPPG Quota for slow descent stop
#defcom %C129     PLC-SLAPPG Quota for very slow descent stop
#defcom %C130     PLC-SLAPPG Quota for very slow descent stop Y2

#defcom %C131     AX_PLC Difference between Y1 and Y2

#defcom %cn0.vl52 Work speed from ISO in mm / min
#defcom %cn0.vl53 Decompression target

* From PLC to Slappg

#defcom %SLAPPG0.0  PLC-Slave Enable target correction
#defcom %SLAPPG0.1  PLC-Slave Adaptive Enable (Tracking Error)
#defcom %SLAPPG0.2  PLC-Slave Enable beam feed Reduction on saturation. Not used
#defcom %SLAPPG0.3  PLC-Slave Enable Exponential Balancing Gain (Enable SLAPPG15)
#defcom %SLAPPG0.4  PLC-Slave Enable Integrative speed gain on balance (Enable SLAPPG12)
#defcom %SLAPPG0.5  PLC-Slave Enable Estimate Insensitivity
#defcom %SLAPPG0.6  PLC-Slave Enable Estimate Saturation
#defcom %SLAPPG0.7  PLC-Slave Enable Estimate Saturation New
#defcom %SLAPPG0.12 PLC-Slave Enab. forcing of voltage DAC Y1
#defcom %SLAPPG0.13 PLC-Slave Enab. forcing of voltage DAC Y2
#defcom %SLAPPG0.14 PLC-Slave DAC sign reversal Y1
#defcom %SLAPPG0.15 PLC-Slave DAC sign reversal Y2
#defcom %SLAPPG0.16 PLC-Slave Exclude sync on C16-C36 (first version)
#defcom %SLAPPG0.17 PLC-Slave Sync request at beam end of motion

#defcom %SLAPPG1.0  PLC-Slave Freeze beam position generator

#defcom %SLAPPG2  PLC-Slave Y1 target correction (micron)
#defcom %SLAPPG3  PLC-Slave Y2 target correction (micron)
#defcom %SLAPPG4  PLC-Slave Simulated beam axis, disturbance added to the encoder quota Y1
#defcom %SLAPPG5  PLC-Slave Simulated beam axis, disturbance added to the encoder quota Y2
#defcom %SLAPPG6  PLC-Slave Simulated beam axis, delay Y1
#defcom %SLAPPG7  PLC-Slave Simulated beam axis, delay Y2
#defcom %SLAPPG8  PLC-Slave Simulated beam axis, actuator insensitivity threshold Y1
#defcom %SLAPPG9  PLC-Slave Simulated beam axis, actuator insensitivity threshold Y2
#defcom %SLAPPG10 PLC-Slave Integration gain of beam axes
#defcom %SLAPPG11 PLC-Slave Integration gain of beam axis limit
#defcom %SLAPPG12 PLC-Slave Integrative speed gain on the balance
#defcom %SLAPPG13 PLC-Slave Limitation Acceleration Balance dwLimAccSbil
#defcom %SLAPPG14 PLC-Slave Integral speed gain of each axis
#defcom %SLAPPG15 PLC-Slave Exponential Gain Balancing (1000 = 1)
#defcom %SLAPPG16 PLC-Slave Actuator with DAC Hysteresis
#defcom %SLAPPG17 PLC-Slave Actuator with Stand Still DAC
#defcom %SLAPPG18 PLC-Slave Actuator pulsemag_dac
#defcom %SLAPPG19 PLC-Slave Actuator pulsedecay_tau
#defcom %SLAPPG20 PLC-Slave Threshold actuator
#defcom %SLAPPG21 PLC-Slave Actuator OutputVelGainAdjustKp
#defcom %SLAPPG22 PLC-Slave Y1 Kd derivative
#defcom %SLAPPG23 PLC-Slave Y2 Kd derivative
#defcom %SLAPPG24 PLC-Slave Derivative limitation
#defcom %SLAPPG25 PLC-Slave Vmax Y1 [mm / min] for tracking error
#defcom %SLAPPG26 PLC-Slave Vmax Y2 [mm / min] for tracking error
#defcom %SLAPPG27 PLC-Slave Threshold for tracking error error during acceleration [um]
#defcom %SLAPPG28 PLC-Slave Kp filter to extract acc / cruise / dec bit [Hz] x 1000
#defcom %SLAPPG29 PLC-Slave Voltage forcing DAC Y1 (mV)
#defcom %SLAPPG30 PLC-Slave Voltage forcing DAC Y2 (mV)
#defcom %SLAPPG31 PLC-Slave Front arms gearing reference filter [ms]

* From Slappg to PLC

#defcom %SLAPPG128     Slave-PLC Beam axis, Bits used for diagnostics
#defcom %SLAPPG128.0   Slave-PLC Beam Axis, Acceleration in progress
#defcom %SLAPPG128.1   Slave-PLC Beam Axis, Deceleration in progress
#defcom %SLAPPG128.2   Slave-PLC Beam axis, Motion in progress
#defcom %SLAPPG128.3   Slave-PLC Beam axis, Tolerance check in progress
#defcom %SLAPPG128.4   Slave-PLC Beam axis, Y1 fall direction for tolerance check
#defcom %SLAPPG128.5   Slave-PLC Beam axis, Y2 fall direction for tolerance check
#defcom %SLAPPG128.6   Slave-PLC Beam axis, target reached
#defcom %SLAPPG128.7   Slave-PLC Beam axis, feed hold
#defcom %SLAPPG129     Slave-PLC Beam Axis, Variable Gain Contribution Monitor Y1 (mV)
#defcom %SLAPPG130     Slave-PLC Beam Axis, Variable Gain Contribution Monitor Y2 (mV)
#defcom %SLAPPG131     Slave-PLC Beam Axis, Variable Gain Contribution Monitor (mV)
#defcom %SLAPPG132     Slave-PLC Beam Axis, Integrative Gain Contribution Monitor (mV)
#defcom %SLAPPG133     Slave-PLC Beam Axis, Variable Gain Monitor (Kpcnt) Debug
#defcom %SLAPPG134     Slave-PLC Beam Axis, Variable Gain Monitor (Kpt) Debug
#defcom %SLAPPG135     Slave-PLC Beam Axis, Variable Gain Monitor (KpNew) Debug
#defcom %SLAPPG136     Slave-PLC deltaEpsY1 for tracking error
#defcom %SLAPPG137     Slave-PLC deltaEpsY2 for tracking error
#defcom %SLAPPG138     Slave-PLC deltaMaxEpsY1 for tracking error
#defcom %SLAPPG139     Slave-PLC deltaMaxEpsY2 for tracking error
#defcom %SLAPPG140     Slave-PLC Output voltage DAC Y1 (mV)
#defcom %SLAPPG141     Slave-PLC Output voltage DAC Y2 (mV)

* Variables shared between PP and UI (both write to them)

#defcom %np                      PP-UI-PLC Current bend number
#defcom %nrip                    PP-UI Number of repetitions current bend

#defcom %pieceflista             PP-UI Remaining pieces on the list
#defcom %piecedlista             PP-UI Pieces made on the list
#defcom %head.piecef             PP-UI Remaining pieces on single program
#defcom %head.pieced             PP-UI Pieces made on a single program

#defcom %head.Tooling0.dInPun    UI-PLC Position Start Station 1 Punch
#defcom %head.Tooling1.dInPun    UI-PLC Position Start Station 2 Punch
#defcom %head.Tooling2.dInPun    UI-PLC Position Start Station 3 Punch
#defcom %head.Tooling3.dInPun    UI-PLC Position Start Station 4 Punch
#defcom %head.Tooling0.dLungPun  UI-PLC Station 1 Punch Length
#defcom %head.Tooling1.dLungPun  UI-PLC Station 2 Punch Length
#defcom %head.Tooling2.dLungPun  UI-PLC Station 3 Punch length
#defcom %head.Tooling3.dLungPun  UI-PLC Station 4 Punch length

* Variables from PP to UI

#defcom %DebValue.dRealPosSensA[%byNumPres] PP-UI Quota reached sensor 1 in descent
#defcom %DebValue.dRealPosSensB[%byNumPres] PP-UI Quota reached sensor 2 in descent
#defcom %DebValue.dRealPosYA[%byNumPres]    PP-UI Quota reached Y1 axis in descent
#defcom %DebValue.dRealPosYB[%byNumPres]    PP-UI Quota reached Y2 axis in descent

#defcom %DebStop.dRealPosSensA[%byNumPres]  PP-UI Quota reached sensor 1 in rise
#defcom %DebStop.dRealPosSensB[%byNumPres]  PP-UI Quota reached sensor 2 in rise
#defcom %DebStop.dRealPosYA[%byNumPres]     PP-UI Quota reached Y1 axis in rise
#defcom %DebStop.dRealPosYB[%byNumPres]     PP-UI Quota reached Y2 axis in rise

* Variables from PP to SLAPPG

#defcom %byNumPres           PP-SLAPPG Number of sensor read attempts



* Registers from PLC to part program (or UI or internal PLC)

#defcom %C32.0    PLC-PLC-PP Valid signals from CH0
#defcom %C32.1    PLC-PP Select calculated TDC usage (0 = absolute TDC)
#defcom %C32.2    PLC-PP Confirm end of cycle manual rise or calibration
#defcom %C32.3    PLC-PLC-PP Slow manual rise enabled
#defcom %C32.4    PLC-PLC-PP Press with mechanical stops
#defcom %C32.5    PLC-PLC-PP Read-only or NVEL beam
#defcom %C32.6    PLC-PP Single-cylinder proportional press
#defcom %C32.7    PLC-PP Bend with hydraulic cushion
#defcom %C32.8    PLC-PP Synchronized tandem press
#defcom %C32.9    PLC-PP Confirm retract end cycle
#defcom %C32.10   PLC-PP Step change for CH0 tradit.
#defcom %C32.11   PLC-PP Confirm end of tradit. press cycle
#defcom %C32.12   PLC-PP Excludes mute stop
#defcom %C32.13   PLC-PP Confirm end of beam INIT cycle
#defcom %C32.14   PLC-PP Command from handwheel in "stop at BDC" mode
#defcom %C32.15   PLC-PP Handwheel configured
#defcom %C32.16   PLC-PP-UI Axes in motion
#defcom %C32.18   PLC-UI Back gauges axes calibrated
#defcom %C32.19   PLC-UI Beam axes calibrated
#defcom %C32.20   PLC-UI Confirm repeat calibration received
#defcom %C32.21   PLC-PP Crowning table in position
#defcom %C32.22   PLC-PP Work speed limitation active
#defcom %C32.23   PLC-PP enables insens. thresholds on all movements
#defcom %C32.24   PLC-PLC-PP Decompression excluded
#defcom %C32.25   PLC-PP Excl. mechanical stops pos. check with respect to the beam
#defcom %C32.26   PLC-PP Change Step Required at End of bend
#defcom %C32.27   PLC-PP enables separate deceleration for fast descent in Closed Loop
#defcom %C32.28   PLC-PP enables separate deceleration for fast rise in Closed Loop
#defcom %C32.29   PLC-PP Remote machine waiting to start the n-th press
#defcom %C32.30   PLC-PP Remote machine in tolerance during the bending cycle with DATAM sensor
#defcom %C32.31   PLC-PP Remote machine waiting for rise at the end of the cycle with DATAM sensor

#defcom %C33.0    PLC-PLC-PP Valid signals from CH1
#defcom %C33.1    PLC-PP End of step change time
#defcom %C33.2    PLC-PP Start after workpiece finished
#defcom %C33.3    PLC-PP Unlock group 1 position. axes CH1
#defcom %C33.4    PLC-PP Unlock group 2 position. axes CH1
#defcom %C33.5    PLC-PP Unlock group 3 position. axes CH1
#defcom %C33.6    PLC-PP Enable retract from channel 0
#defcom %C33.7    PLC-PP Enable step change
#defcom %C33.8    PLC-PP Back gauges end of cycle confirm
#defcom %C33.9    PLC-PP Retract Z required before X-R
#defcom %C33.10   PLC-PP Retract Z required after X-R
#defcom %C33.11   PLC-PLC-PP Retract required in the cycle CH1-5
#defcom %C33.12   PLC-UI Restarted channels after program change by operator
#defcom %C33.13   PLC-PP Movement request from handwheel in JOG
#defcom %C33.14   PLC-PP Movem. from handwheel in reverse direction
#defcom %C33.15   PLC-PP Movem. from handwheel to independent axes
#defcom %C33.16   PLC-PP Enable retract X after Z CH1
#defcom %C33.17   PLC-PP Enable retract Z after X CH1
#defcom %C33.18   PLC-PP Axes parking for tool change request CH1
#defcom %C33.22   PLC-PP Manual Zeta cycle disabled
#defcom %C33.23   PLC-PP Confirm direct calibration done by UI
#defcom %C33.24   PLC-PP Updates information current bend from UI
#defcom %C33.25   PLC-PP Confirm axis positioning cycle done
#defcom %C33.26   PLC-PP Confirm autotuning cycle done
#defcom %C33.27   PLC-PP Remote machine waiting to continue the cycle after (measurement/recalculation) with DATAM sensor on point n-th
#defcom %C33.28   PLC-PP Enable end of first step on cycle 211
#defcom %C33.29   PLC-PP Enable end of second step on cycle 211



#defcom %C34.0    PLC-PLC-PP Valid signals from CH2
#defcom %C34.1    PLC-PP Front arm 1 enable
#defcom %C34.2    PLC-PP Front arm 2 enable
#defcom %C34.3    PLC-PP Front arms enable
#defcom %C34.4    PLC-PP Front arms rise enable
#defcom %C34.5    PLC-PP Front arms rise gearing disable
#defcom %C34.6    PLC-PP Front arms descent enable
#defcom %C34.7    PLC-PP Front arms descent enable after unhook cycle
#defcom %C34.8    PLC-PP Front arms end of cycle confirm
#defcom %C34.9    PLC-PP Step change for channel 2
#defcom %C34.10   PLC-PP Unhook cycle enabled
#defcom %C34.12   PLC-PP Front arms descent gearing enable
#defcom %C34.13   PLC-PP Front arms rise gearing enable
#defcom %C34.15   PLC-PP Beam gearing engaged confirm
#defcom %C34.17   PLC-PP Front arms in position confirm

#defcom %C35.0    PLC-PLC-PP Valid signals from CH3
#defcom %C35.1    PLC-PP Unlock group 1 position. CH3 axes
#defcom %C35.2    PLC-PP Unlock group 2 position. CH3 axes
#defcom %C35.3    PLC-PP Unlock group 3 position. CH3 axes
#defcom %C35.4    PLC-PP Step change for channel 3
#defcom %C35.5    PLC-PP Presence of Z3 axis
#defcom %C35.6    PLC-PP Crowning axis presence on A2 or A3
#defcom %C35.7    PLC-PP Crowning axis presence on A3
#defcom %C35.8    PLC-PP Crowning axis positioning enable
#defcom %C35.9    PLC-PP Camera axis positioning enable
#defcom %C35.10   PLC-PP Waiting data reading from camera CH3
#defcom %C35.11   PLC-PP Axes parking for tool change request CH3
#defcom %C35.12   PLC-PP Camera axis A8 parking request CH3

#defcom %C36.0    PLC-SLAPPG End pressed (Hammerle press)
#defcom %C36.1    PLC-PP Beam regulator enable on BDC
#defcom %C36.2    PLC-PLC-PP Slow down forced (delayed)
#defcom %C36.3    PLC-PP Enable mute synchronization
#defcom %C36.4    PLC-PP Continuation of the cycle from mute
#defcom %C36.5    PLC-PLC-PP Retract required in cycle CH0
#defcom %C36.6    PLC-PP Retract done
#defcom %C36.7    PLC-PP Enable pinch synchronization after retract
#defcom %C36.8    PLC-PP Continuation of the cycle from the pinch after retract
#defcom %C36.9    PLC-PP Enable synchronization at BDC
#defcom %C36.10   PLC-PP Continuation of the cycle from BDC
#defcom %C36.11   PLC-PP Enable STEP mode at BDC
#defcom %C36.12   PLC-PP Rise pedal pressed in "stop at BDC" mode
#defcom %C36.13   PLC-PP Key + pressed in "stop at BDC" mode
#defcom %C36.14   PLC-PP Key - pressed in "stop at BDC" mode
#defcom %C36.15   PLC-PP START key pressed in "stop at BDC" mode
#defcom %C36.16   PLC-PP Postponed decompression to pinch point
#defcom %C36.17   PLC-PP Rise at pinch with front arms gearing request
#defcom %C36.18   PLC-PP Front arms descent gearing disable
#defcom %C36.19   PLC-PP Enable synchronization to the pinch point in rise
#defcom %C36.20   PLC-PP Slow rise with work descent valves
#defcom %C36.21   PLC-PP Slow rise to pinch point enabled
#defcom %C36.22   PLC-PP Slow rise to pinch point with work descent valves
#defcom %C36.23   PLC-PP Unlocking of the beam rise to the pinch point
#defcom %C36.24   PLC-PP Fast rise to the pinch point enable
#defcom %C36.25   PLC-PP Beam bending end of cycle confirm
#defcom %C36.26   PLC-PP Enab. beam quick stop with pedal release
#defcom %C36.27   PLC-PP beam over the mute point
#defcom %C36.28   PLC-PP beam over the pinch point
#defcom %C36.29   PLC-PP Selection of work pressure discharge
#defcom %C36.30   PLC-PLC-PP Enab. thickness detection
#defcom %C36.31   PLC-PLC-PP Enab. width detection

#defcom %C37.0    PLC-PP Valid signals from CH4
#defcom %C37.1    PLC-PP Sensor direct calibration done
#defcom %C37.3    PLC-PP Sensor 1 active on bend
#defcom %C37.4    PLC-PP Sensor 2 active on bend
#defcom %C37.6    PLC-PP GPS sensor active
#defcom %C37.7    PLC-PP Sensor in simulated
#defcom %C37.8    PLC-PP Beam calibration to upper stop
#defcom %C37.9    PLC-PP Completion of beam calibration to upper stop
#defcom %C37.10   PLC-PP Completion of beam calibration in two phases
#defcom %C37.20   PLC-PP S1 axis to be calibrated
#defcom %C37.21   PLC-PP S2 axis to be calibrated
#defcom %C37.22   PLC-PP S3 axis to be calibrated
#defcom %C37.23   PLC-PP S4 axis to be calibrated
#defcom %C37.24   PLC-PP S5 axis to be calibrated
#defcom %C37.25   PLC-PP S6 axis to be calibrated

#defcom %C38.0    PLC-PLC-PP Coined or hammered bend
#defcom %C38.1    PLC-SLAPPG PLC started
#defcom %C38.2    PLC-PP Bend with serial angle sensor
#defcom %C38.3    PLC-PP Bend with angle sensor LC
#defcom %C38.4    PLC-PP External crowning in position
#defcom %C38.5    PLC-PP Bend with angle sensor LS
#defcom %C38.6    PLC-PP Confirm cameras in position
#defcom %C38.7    PLC-PP Bend with angle sensor LC-LS
#defcom %C38.8    PLC-PP Bend with angle sensor LC1
#defcom %C38.10   PLC-PP Confirm beam user cycle terminated
#defcom %C38.11   PLC-PP Fast descent lock for pumps pre-loading from user PLC
#defcom %C38.12   PLC-PP Fast rising lock for pumps pre-loading from user PLC
#defcom %C38.13   PLC-PP End to-target decompression enable
#defcom %C38.14   PLC-PP Beam test page active
#defcom %C38.15   PLC-PP Negative direction for beam test page
#defcom %C38.16   PLC-PP Command Y1 on beam test page
#defcom %C38.17   PLC-PP Command Y2 on beam test page
#defcom %C38.18   PLC-PP Hold Beam up movement after Decompression from User plc
#defcom %C38.19   PLC-PP User decompression enable
#defcom %C38.20   PLC-PP User decompression done
#defcom %C38.21   PLC-PP Enab. beam rise after bending done
#defcom %C38.22   PLC-PP Exact stop on mute
#defcom %C38.23   PLC-PP Enab. beam torque at mute

#defcom %C39.0    PLC-PLC-PP Valid signals from CH5
#defcom %C39.1    PLC-PP Unlock group 1 position. CH5 axes
#defcom %C39.2    PLC-PP Unlock group 2 position. CH5 axes
#defcom %C39.3    PLC-PP Unlock group 3 position. CH5 axes
#defcom %C39.4    PLC-PP Step change for channel 5
#defcom %C39.16   PLC-PP Retract X after Z activation CH5
#defcom %C39.17   PLC-PP Retract Z after X activation CH5
#defcom %C39.28   PLC-PP First step in progress on cycle 211
#defcom %C39.29   PLC-PP Second step in progress on cycle 211

#defcom %C50                 PLC-PP Channel 0 cycle requested
#defcom %C51                 PLC-PP Channel 1 cycle requested
#defcom %C52                 PLC-PP Channel 2 cycle requested
#defcom %C53                 PLC-PP Channel 3 cycle requested
#defcom %C54                 PLC-PP Channel 4 cycle requested
#defcom %C55                 PLC-PP Beam last stop position
#defcom %C56                 PLC-PP Maximum quota between Y1 and Y2
#defcom %C57                 PLC-PP Minimum quota between Y1 and Y2
#defcom %C58                 PLC-PP Calculated TDC position
#defcom %C59                 PLC-PP Channel 5 cycle requested

#defcom %C90                 PLC-PP Axes direct calibration quota
#defcom %C91                 PLC-PP Axes positioning quota
#defcom %C92                 PLC-PLC-PP Mute point position

#defcom %vg0                 PLC-PP Minimum beam limit
#defcom %vg1                 PLC-PLC-PP Maximum beam limit

* Registers from PLC to UI

#defcom %C40.4    PLC-UI Step change request
#defcom %C40.5    PLC-UI Program change request
#defcom %C40.6    PLC-UI Strobe acquire pinch point
#defcom %C40.7    PLC-UI Enable correction editing
#defcom %C40.8    PLC-UI Request program check
#defcom %C40.9    PLC-UI Selection setting page from PLC
#defcom %C40.10   PLC-UI Sel. Automatic page + program sel. from PLC
#defcom %C40.11   PLC-UI Enable detected thickness acquisition (from user PLC)
#defcom %C40.12   PLC-UI Manual page selection from PLC
#defcom %C40.13   PLC-UI Semi-automatic page selection from PLC
#defcom %C40.14   PLC-UI Automatic page selection from PLC
#defcom %C40.15   PLC-UI Strobe to select axis from PLC
#defcom %C40.16   PLC-UI Strobe acquire selected axis quota
#defcom %C40.17   PLC-UI Strobe acquire beam axes quota
#defcom %C40.18   PLC-UI Enables only BDC recalculation if thickness from PLC
#defcom %C40.19   PLC-UI Enable BDC recalculation from SER angle sensor
#defcom %C40.20   PLC-UI Rich. first target to LC angle sensor
#defcom %C40.21   PLC-UI Rich. subsequent targets to LC angle sensor
#defcom %C40.22   PLC-UI Lazersafe Front lower ray
#defcom %C40.23   PLC-UI Lazersafe Central lower ray
#defcom %C40.24   PLC-UI Lazersafe Rear lower ray
#defcom %C40.25   PLC-UI Lazersafe Front upper Ray
#defcom %C40.26   PLC-UI Lazersafe Central upper Ray
#defcom %C40.27   PLC-UI Lazersafe Rear upper Ray
#defcom %C40.28   PLC-UI Tool loader connected (from user PLC)
#defcom %C40.29   PLC-UI The tool locks have been opened
#defcom %C40.30   PLC-UI The tool locks are open now
#defcom %C40.31   PLC-UI Tool loader selected (from user PLC)

#defcom %C41      PLC-UI Program number selected by robot
#defcom %C42      PLC-UI Thickness detected (from user PLC)
#defcom %C43      PLC-UI Axis number selected by PLC

#defcom %C44.0    PLC-UI START button light
#defcom %C44.1    PLC-UI STOP button light
#defcom %C44.2    PLC-UI Vis. cycle status stopped to the TDC
#defcom %C44.3    PLC-UI Vis. cycle status fast descent
#defcom %C44.4    PLC-UI Vis. cycle status stop at mute
#defcom %C44.5    PLC-UI Vis. cycle status slow descent
#defcom %C44.6    PLC-UI Vis. cycle status stop at pinch point
#defcom %C44.7    PLC-UI Vis. cycle status working descent
#defcom %C44.8    PLC-UI Vis. cycle status stop at BDC
#defcom %C44.9    PLC-UI Vis. cycle status decompression
#defcom %C44.10   PLC-UI Vis. cycle status slow rise
#defcom %C44.11   PLC-UI Vis. cycle status fast rise
#defcom %C44.12   PLC-UI Descent on pressing cycle in progress

#defcom %C45      PLC-ISO Mute point correction value from PLC User

#defcom %R10      PLC-UI General timer
#defcom %R11      PLC-UI General counter
#defcom %R12      PLC-UI Job counter
#defcom %R13      PLC-UI Job timer
#defcom %R14      PLC-UI Working hour counter
#defcom %R15      PLC-UI Pump timer
#defcom %R16      PLC-UI Pump hour meter
#defcom %R17      PLC-UI Bending counter for S4 axis calibration
#defcom %R19      PLC-UI Beam cycle counter

#defcom %R25.0    UI (UIPL) -PLC Led Bar Button Off

#defcom %R30      UI-PP Beam parking quota
#defcom %R31      UI-PP Beam parking quota for skew switch alignment
#defcom %R32      UI-PP Delta Y2 parking quota for skew switch alignment

#defcom %R35.0    UI-PLC Disable Shoulder Correction from User UIPL Page

#defcom %C140     PLC-UI measured speed Y1 descent
#defcom %C141     PLC-UI measured speed Y2 descent
#defcom %C142     PLC-UI measured speed Y1 rise
#defcom %C143     PLC-UI measured speed Y2 rise
*C144-C161 free

#defcom %C162     PLC-UI Axis position in test page
#defcom %C163     PLC-UI Speed forward axis in test page
#defcom %C164     PLC-UI Speed back axis in test page
#defcom %C165     PLC-UI Main pressure in bar
#defcom %C166     PLC-UI Crowning pressure in bar

#defcom %C179.0   PLC-UI Y1 axis in position
#defcom %C179.1   PLC-UI Y2 axis in position
#defcom %C179.2   PLC-UI X1 Axis in position
#defcom %C179.3   PLC-UI X2 axis in position
#defcom %C179.4   PLC-UI R1 axis in position
#defcom %C179.5   PLC-UI R2 axis in position
#defcom %C179.6   PLC-UI Z1 axis in position
#defcom %C179.7   PLC-UI Z2 axis in position
#defcom %C179.8   PLC-UI A1 axis in position
#defcom %C179.9   PLC-UI A2 Axis in position
#defcom %C179.10  PLC-UI A3 axis in position
#defcom %C179.11  PLC-UI A4 axis in position
#defcom %C179.12  PLC-UI A5 Axis in position
#defcom %C179.13  PLC-UI A6 Axis in position
#defcom %C179.14  PLC-UI A7 Axis in position
#defcom %C179.15  PLC-UI A8 Axis in position
#defcom %C179.16  PLC-UI S1 axis in position
#defcom %C179.17  PLC-UI S2 axis in position
#defcom %C179.18  PLC-UI S3 axis in position
#defcom %C179.19  PLC-UI S4 axis in position
#defcom %C179.20  PLC-UI S5 axis in position
#defcom %C179.21  PLC-UI S6 axis in position
#defcom %C179.22  PLC-UI X3 axis in position
#defcom %C179.23  PLC-UI X4 axis in position
#defcom %C179.24  PLC-UI R3 axis in position
#defcom %C179.25  PLC-UI R4 axis in position
#defcom %C179.26  PLC-UI Z3 axis in position
#defcom %C179.27  PLC-UI Z4 axis in position


#defcom %C200     UI Used by UI
#defcom %C201.0   UI Select Axes TAB on test page
#defcom %C202.0   UI Select beam TAB on test page

#defcom %PLCVERS             Plc program version
#defcom %PLCREL              Plc program release

* PLC messages

#defcom %PLCmsg0.0           PLCMSG Press Start
#defcom %PLCmsg0.1           PLCMSG Press down to bend
#defcom %PLCmsg0.2           PLCMSG Beam calibration: press up
#defcom %PLCmsg0.3           PLCMSG Photocells inhibited
#defcom %PLCmsg0.4           PLCMSG Finished parts! START = continue
#defcom %PLCmsg0.7           PLCMSG Recall in progress
#defcom %PLCmsg0.8           PLCMSG Pump not started
#defcom %PLCmsg0.9           PLCMSG Slowdown selector required
#defcom %PLCmsg0.10          PLCMSG Auxiliaries emergency
#defcom %PLCmsg0.11          PLCMSG Side gate open
#defcom %PLCmsg0.12          PLCMSG Beam not calibrated
#defcom %PLCmsg0.13          PLCMSG Select manual Z cycle
#defcom %PLCmsg0.14          PLCMSG Beam rise requested
#defcom %PLCmsg0.15          PLCMSG Axes not calibrated Press START
#defcom %PLCmsg0.16          PLCMSG Gantry X not active
#defcom %PLCmsg0.17          PLCMSG Gantry R not active
#defcom %PLCmsg0.18          PLCMSG Overrun beam OK
#defcom %PLCmsg0.19          PLCMSG Back gauge in Demo mode (exhibition)
#defcom %PLCmsg0.20          PLCMSG Force sensors cycle calibration done
#defcom %PLCmsg0.21          PLCMSG Force sensors cycle calibration in progress
#defcom %PLCmsg0.22          PLCMSG Tool check requested

#defcom %PLCmsg2.0           PLCMSG Manual mode via button panel activated
#defcom %PLCmsg2.1           PLCMSG Panel hand wheel activated
#defcom %PLCmsg2.2           PLCMSG External hand wheel activated

* PLC Alarms

#defcom %PLCerr0.0           PLCERR General emergency
#defcom %PLCerr0.1           PLCERR Photocell intervention
#defcom %PLCerr0.2           PLCERR Maximum Unbalance
#defcom %PLCerr0.3           PLCERR Remote NC in alarm
#defcom %PLCerr0.4           PLCERR Invalid remote NC status
#defcom %PLCerr0.5           PLCERR Incorrect beam position
#defcom %PLCerr0.6           PLCERR Channel locked
#defcom %PLCerr0.7           PLCERR Pressure command timeout
#defcom %PLCerr0.8           PLCERR Recall not possible
#defcom %PLCerr0.9           PLCERR Gantry X alignment not possible
#defcom %PLCerr0.10          PLCERR Gantry R alignment not possible
#defcom %PLCerr0.11          PLCERR Transducer alarm LVDT Y1
#defcom %PLCerr0.12          PLCERR Transducer alarm LVDT Y2
#defcom %PLCerr0.13          PLCERR Invalid program with robot
#defcom %PLCerr0.14          PLCERR Wait OK program name
#defcom %PLCerr0.15          PLCERR Waiting OK automatic exit
#defcom %PLCerr0.16          PLCERR Back gauge target wrong
#defcom %PLCerr0.18          PLCERR Sensor out of tolerance
#defcom %PLCerr0.20          PLCERR Unbalance limit exceeded
#defcom %PLCerr0.21          PLCERR Air Failure
#defcom %PLCerr0.26          PLCERR Request for lubrication of screws
#defcom %PLCerr0.27          PLCERR Angle error
#defcom %PLCerr0.28          PLCERR Thickness error
#defcom %PLCerr0.29          PLCERR Pinch point error
#defcom %PLCerr0.30          PLCERR External mode selection not allowed
#defcom %PLCerr0.31          PLCERR Reduce beam speed

#defcom %PLCerr1.0           PLCERR Remote NC not to TDC
#defcom %PLCerr1.1           PLCERR Remore NC axes not in position
#defcom %PLCerr1.2           PLCERR Wait PLC Initialization
#defcom %PLCerr1.3           PLCERR Emergency button pressed or protections open
#defcom %PLCerr1.4           PLCERR Fast EV Malfunction
#defcom %PLCerr1.5           PLCERR Beam or axes out of limits
#defcom %PLCerr1.6           PLCERR Internal Error, Press RESET
#defcom %PLCerr1.7           PLCERR Clogged Oil Filter
#defcom %PLCerr1.8           PLCERR Malfunctioning proportional valves
#defcom %PLCerr1.9           PLCERR Malfunctioning aspiration valves
#defcom %PLCerr1.10          PLCERR Malfunc. Work Mode selector
#defcom %PLCerr1.11          PLCERR Optical Barrier Intervention
#defcom %PLCerr1.12          PLCERR Punch Unlocked Emergency
#defcom %PLCerr1.13          PLCERR Pressure Recovery Punch lock
#defcom %PLCerr1.14          PLCERR Pump Thermal Intervention
#defcom %PLCerr1.15          PLCERR X axis drive: Malfunction
#defcom %PLCerr1.16          PLCERR R axis drive: Malfunction
#defcom %PLCerr1.17          PLCERR Z1 axis drive: Malfunction
#defcom %PLCerr1.18          PLCERR Z2 axis drive: Malfunction
#defcom %PLCerr1.19          PLCERR Clogged Oil Filter
#defcom %PLCerr1.20          PLCERR Upper locks open
#defcom %PLCerr1.21          PLCERR Lower locks open
#defcom %PLCerr1.22          PLCERR Maximum unbalance input
#defcom %PLCerr1.23          PLCERR Error in proportional valves direction
#defcom %PLCerr1.24          PLCERR Start of machine (descent emergency)
#defcom %PLCerr1.25          PLCERR Fast descent not allowed - check relay 20KA1-2-3-4
#defcom %PLCerr1.26          PLCERR Parking error A1
#defcom %PLCerr1.27          PLCERR Parking error A2
#defcom %PLCerr1.28          PLCERR Check transducer SQ1
#defcom %PLCerr1.29          PLCERR Check transducer SQ2
#defcom %PLCerr1.30          PLCERR Incorrect robot program
#defcom %PLCerr1.31          PLCERR Check relay status KA3

#defcom %PLCerr2.0           PLCERR Hydraulic cushion sensors active
#defcom %PLCerr2.1           PLCERR Punches unlocked
#defcom %PLCerr2.2           PLCERR Die unlocked
#defcom %PLCerr2.3           PLCERR STOP active
#defcom %PLCerr2.4           PLCERR Check transducer SQ5
#defcom %PLCerr2.5           PLCERR Check transducer SQ6
#defcom %PLCerr2.6           PLCERR Autotuning cycle error
#defcom %PLCerr2.7           PLCERR Check transducer SQ7
#defcom %PLCerr2.8           PLCERR Error on proportional rest position
#defcom %PLCerr2.9           PLCERR Check SD transducer
#defcom %PLCerr2.10          PLCERR Beam excessive overrun
#defcom %PLCerr2.11          PLCERR Timelock 10 days before block (SYSTEM ERROR PID LIMIT)
#defcom %PLCerr2.31          PLCERR Servo drives not ready

#defcom %PLCerr6             PLCERR User alarm log used for the Fiessler

* Parameters for PLC (and PP)

#defcom %outdv               PAR-PLC Conf. Solenoid valve fast descent
#defcom %outdl               PAR-PLC Conf. Solenoid valve slow descent
#defcom %outsv               PAR-PLC-PP Conf. Solenoid valves fast rise
#defcom %outsl               PAR-PLC-PP Conf. Slow rising solenoid valves

#defcom %pargene.bgn.0       PAR-PLC Mandatory Axis Calibration
#defcom %pargene.bgn.1       PAR-PLC Enable potentiometer pedal
#defcom %pargene.bgn.2       PAR-PLC Electrical machine
#defcom %pargene.bgn.3       PAR-PLC Pressure Redirection (crowning exclusion)
#defcom %pargene.bgn.4       PAR-PLC Manual tool release
#defcom %pargene.bgn.5       PAR-PLC External crowning board enable
#defcom %pargene.bgn.6       PAR-PLC Enab. waiting step change by robot
#defcom %pargene.bgn.7       PAR-PLC Synchronized tandem press
#defcom %pargene.bgn.8       PAR-PLC Reversing Photocells excluded signal
#defcom %pargene.bgn.9       PAR-PLC Start axis with descent pedal
#defcom %pargene.bgn.10      PAR-PLC Reversing motors alarms
#defcom %pargene.bgn.11      PAR-PLC Enab. servo pressure during bending time
#defcom %pargene.bgn.12      PAR-PLC Enab. manual Z cycle
#defcom %pargene.bgn.13      PAR-PLC Enab. analog out S500
#defcom %pargene.bgn.14      PAR-PP Enab. tolerance check (on trad. press)
#defcom %pargene.bgn.15      PAR-PLC Enab. robot management at pinch with OPS

#defcom %pargene.dwgn0       PAR-PLC Sensor tolerance S1 to pinch
#defcom %pargene.dwgn1       PAR-PLC Sensor tolerance S2 to pinch
#defcom %pargene.dwgn3       PAR-PLC Minimum potentiometer value
#defcom %pargene.dwgn4       PAR-PLC Maximum potentiometer value
#defcom %pargene.dwgn5       PAR-PLC Z-axis retract distance
#defcom %pargene.dwgn6       PAR-PLC Minimum beam opening for axis start
#defcom %pargene.dwgn8       PAR-PLC Normal unbalance value
#defcom %pargene.dwgn9       PAR-PP balance gain for synch tandem
#defcom %pargene.dwgn10      PAR-PLC Enab. automatic bend repetition
#defcom %pargene.dwgn11      PAR-PP height axis R above die for Z manual
#defcom %pargene.dwgn12      PAR-PLC Working hours
#defcom %pargene.dwgn13      PAR-PLC Beam rise speed (traditional)
#defcom %pargene.dwgn14      PAR-PP Floating start waiting time
#defcom %pargene.dwgn15      PAR-PLC X position for speed limitation (operator safety)
#defcom %pargene.dwgn16      PAR-PLC Time for driver enable

#defcom %parspec.bsp.0       PAR-PLC Enab. request for back gauge calibration
#defcom %parspec.bsp.1       PAR-PLC Enab. syncro control
#defcom %parspec.bsp.2       PAR-PLC Enab. self-retaining function aux. 11-15
#defcom %parspec.bsp.3       PAR-PLC Enab. BDCE output set after bend time
#defcom %parspec.bsp.4       PAR-PLC Enab. Slow rise to pinch point with slow valve
#defcom %parspec.bsp.5       PAR-PLC Enab. front arms torque in the cycle
#defcom %parspec.bsp.6       PAR-PLC Enab. alarms on external code
#defcom %parspec.bsp.7       PAR-PLC Enab. self-retaining function aux. 1-10
#defcom %parspec.bsp.8       PAR-PLC Enab. front arms gearing for descent
#defcom %parspec.bsp.9       PAR-PLC Enab. front arms gearing for rise
#defcom %parspec.bsp.10      PAR-PLC Enab. electric front arms
#defcom %parspec.bsp.11      PAR-PLC Enab. fast descent pressure at mute
#defcom %parspec.bsp.12      PAR-PLC Enab. front arms rise not synchronized
#defcom %parspec.bsp.13      PAR-PLC Disab. photocell interv. with pedals together
#defcom %parspec.bsp.14      PAR-PLC Excl. rise pedal at the end of the bend (go to calc. TDC)
#defcom %parspec.bsp.15      PAR-PLC Enab. beam quick stop with pedal release

#defcom %parspec.dwsp5       PAR-PLC Active table initial gain
#defcom %parspec.dwsp6       PAR-PLC Active table initial gain use time
#defcom %parspec.dwsp8       PAR-PP Recall gain for Hoerbiger valves (0 = disab)
#defcom %parspec.dwsp9       PAR-PP Beam speed in very slow descent
#defcom %parspec.dwsp10      PAR-PP Length of very slow descent
#defcom %parspec.dwsp11      PAR-PLC Active table initial gain use threshold
#defcom %parspec.dwsp12      PAR-PLC K Max for active table gain
#defcom %parspec.dwsp13      PAR-PLC Pressure Ramp
#defcom %parspec.dwsp14      PAR-PP Rising pressure delay after decompression
#defcom %parspec.dwsp18      PAR-PP Y1 axis following gain
#defcom %parspec.dwsp19      PAR-PP Y2 axis following gain
#defcom %parspec.dwsp20.0    PAR-UI Enable Direct Calibration with Password
#defcom %parspec.dwsp20.1    PAR-PLC Enable Decompression on rise, after slow descent forced
#defcom %parspec.dwsp20.2    PAR-PLC Enable Adaptive Algorithm (SLAPPG0.1)
#defcom %parspec.dwsp20.3    PAR-PLC Enable Press Pressure between mute and pinch
#defcom %parspec.dwsp20.4    PAR-UI Enable horizontal graphic mirror
#defcom %parspec.dwsp20.5    PAR-UI Enable vertical graphic mirror
#defcom %parspec.dwsp20.6    PAR-PLC Enable Adaptive Algorithm (SLAPPG0.1) during work descent
#defcom %parspec.dwsp20.7    PAR-UI Enable automatic loading of the program on the slave machine in tandem
#defcom %parspec.dwsp20.8    PAR-UI Enable user level password
#defcom %parspec.dwsp20.9    PAR-PLC Disable Anti-repeater with descent excluded photocells
#defcom %parspec.dwsp20.10   PAR-ISO Enable Acquisition Thickness at 2mm from the Material
#defcom %parspec.dwsp20.11   PAR-UI Enable Pump Button
#defcom %parspec.dwsp20.12   PAR-UI Enable calculation of crowning linear with force
#defcom %parspec.dwsp20.13   PAR-UI Enable manual / semiautomatic / automatic entry with password
#defcom %parspec.dwsp20.14   PAR-UI Enable display M57 register in numeric pages in Manual / Semiautomatic / Automatic
#defcom %parspec.dwsp20.15   PAR-UI Enable display M58 register in numeric pages in Manual / Semiautomatic / Automatic
#defcom %parspec.dwsp20.16   PAR-UI Enable Operator Access management
#defcom %parspec.dwsp20.17   PAR-PLC Re-enable valves delay on pedal release

#defcom %parspec.dwsp21      PAR-PLC Integrative gain Fast descent to reach target
#defcom %parspec.dwsp22      PAR-PLC Integrative gain Fast rise to reach target
#defcom %parspec.dwsp23      PAR-PLC Integrative gain Work descent to reach target
#defcom %parspec.dwsp24      PAR-PLC Proportional speed Gain on Balancing
#defcom %parspec.dwsp25      PAR-PLC Exponential Balancing Gain
#defcom %parspec.dwsp26      PAR-PLC Minimum Pressure in DAC points for Arrival at TDC

#defcom %pargen_due.bgn.0    PAR-PLC Opt. stopping space management procedure
#defcom %pargen_due.bgn.1    PAR-PLC Opt. upper locking management
#defcom %pargen_due.bgn.2    PAR-PLC Opt. lower locking management
#defcom %pargen_due.bgn.3    PAR-PLC Opt. upper locking management 2
#defcom %pargen_due.bgn.4    PAR-PLC Opt. Fiessler management
#defcom %pargen_due.bgn.5    PAR-PLC Opt. double pedal board management
#defcom %pargen_due.bgn.6    PAR-PLC Opt. pneumatic locking management
#defcom %pargen_due.bgn.7    PAR-PLC Opt. self-retaining on rise pedal above mute
#defcom %pargen_due.bgn.8    PAR-UI Tinsmith machine
#defcom %pargen_due.bgn.9    PAR-UI Crowning -100 + 100
#defcom %pargen_due.bgn.10   PAR-PLC Enab. recharge pedal at pinch and BDC without robots
#defcom %pargen_due.bgn.11   PAR-PLC Enab. jump on simulated bend
#defcom %pargen_due.bgn.12   PAR-PLC Enab. bistable STOP button
#defcom %pargen_due.bgn.13   PAR-PLC Excludes beam calibration cycle
#defcom %pargen_due.bgn.14   PAR-PLC Enab. beam rise at the end of calibration
#defcom %pargen_due.bgn.15   PAR-PLC Enab. gantry calibration setup cycle

#defcom %pargen_due.dgn0     PAR-UI Maximum pressure Hydraulic cushion
#defcom %pargen_due.dgn1     PAR-UI Hammered bend force coefficient
#defcom %pargen_due.dgn2     PAR-PLC-SLAPPG Very slow speed distance
#defcom %pargen_due.dgn3     PAR-PLC Slowdown rising distance for read-only or NVEL beam
#defcom %pargen_due.dgn4     PAR-PLC Drop pressure and OFF rise valves delay
#defcom %pargen_due.dgn5     PAR-UI-PP Crowning full scale
#defcom %pargen_due.dgn6     PAR-UI Disable back gauge collision check
#defcom %pargen_due.dgn7     PAR-PP Beam fast descent deceleration OL
#defcom %pargen_due.dgn8     PAR-PP Maximum integral gain Y1
#defcom %pargen_due.dgn9     PAR-PP Maximum integral gain Y2
#defcom %pargen_due.dgn10    PAR-PP Maximum voltage limit for integral gain in slow descent
#defcom %pargen_due.dgn11    PAR-PP Constant time for trapezoidal decompression
#defcom %pargen_due.dgn12    PAR-PP DAC filter cutoff frequency Y1 work descent
#defcom %pargen_due.dgn13    PAR-PP DAC filter cutoff frequency Y2 work descent
#defcom %pargen_due.dgn14    PAR-PP Maximum voltage in slow descent (mVolt)
#defcom %pargen_due.dgn15    PAR-PP Maximum voltage in fast descent (mVolt)
#defcom %pargen_due.dgn16    PAR-PP Accel. for thickness sampling with pressure sensor
#defcom %pargen_due.dgn17    PAR-PLC K Gain for active table
#defcom %pargen_due.dgn18    PAR-PLC Single Pump for active table
#defcom %pargen_due.dgn19    PAR-PP Initial delay for pressure sensor sampling
#defcom %pargen_due.dgn20    PAR-PP Beam fast descent deceleration
#defcom %pargen_due.dgn21    PAR-PP Beam fast rise deceleration
#defcom %pargen_due.dgn22    PAR-PP Insensitivity Neg. fast descent Y1
#defcom %pargen_due.dgn23    PAR-PP Insensitivity Neg. fast descent Y2
#defcom %pargen_due.dgn24    PAR-PP Insensitivity Pos. fast rise Y1
#defcom %pargen_due.dgn25    PAR-PP Insensitivity Pos. fast rise Y2
#defcom %pargen_due.dgn26    PAR-PP Max. voltage limit for integral gain in fast rise or descent
#defcom %pargen_due.dgn27    PAR-PP Tolerance time in fast descent
#defcom %pargen_due.dgn28    PAR-PP Pinch point correction
#defcom %pargen_due.dgn29    PAR-PP Maximum beam general tracking error
#defcom %pargen_due.dgn30    PAR-PP Maximum fast rise tracking error
#defcom %pargen_due.dgn31    PAR-PP Minimum Decompression distance
#defcom %pargen_due.dgn32    PAR-PP Balance gain in fast rise
#defcom %pargen_due.dgn33    PAR-PP Minimum decompression force
#defcom %pargen_due.dgn34    PAR-PP Maximum Angular Speed during the bend
#defcom %pargen_due.dgn35    PAR-PLC Fast down valve activation delay
#defcom %pargen_due.dgn36    PAR-PLC Fast down valve deactivation delay
#defcom %pargen_due.dgn37    PAR-UI Front arms offset angle
#defcom %pargen_due.dgn38    PAR-PLC Maximum voltage on rising (mV)
#defcom %pargen_due.dgn39    PAR-PLC Maximum voltage for safety speed (mV)
#defcom %pargen_due.dgn40    PAR-PLC Threshold for tracking error limiter (%)
#defcom %pargen_due.dgn41    PAR-PP Beam offset for rising with front arms
#defcom %pargen_due.dgn42    PAR-PLC DAC filter on fast descent (Hz)
#defcom %pargen_due.dgn43    PAR-PLC DAC filter on fast rise (Hz)
#defcom %pargen_due.dgn44    PAR-UI Margin to add to the theoretical force (%)
#defcom %pargen_due.dgn45    PAR-UI X1 center of rotation, Z position
#defcom %pargen_due.dgn46    PAR-UI X2 center of rotation, Z position
#defcom %pargen_due.dgn47    PAR-UI Distance between finger stop and bar
#defcom %pargen_due.dgn48    PAR-PP Decompression to target speed (m / min)
#defcom %pargen_due.dgn49    PAR-PP Decompression to target tolerance time (s)
#defcom %pargen_due.dgn50    PAR-PP Decompression to target max voltage (V)
#defcom %pargen_due.dgn51    PAR-PP Decompression to target gain (DAC steps / encoder pulses)
#defcom %pargen_due.dgn52    PAR-UI Reserved zfw conical
#defcom %pargen_due.dgn53    PAR-PP Maximum Decompression distance
#defcom %pargen_due.dgn54    PAR-UI Minimum distance between stations
#defcom %pargen_due.dgn55    PAR-PP X axis base safety area
#defcom %pargen_due.dgn56    PAR-PP R axis base safety area
#defcom %pargen_due.dgn57    PAR-PLC Beam parking position for automatic tool changer
#defcom %pargen_due.dgn58    PAR-UI Minimum station position
#defcom %pargen_due.dgn59    PAR-UI Maximum station position
#defcom %pargen_due.dgn60    PAR-UI Dynamic prebend angle

#defcom %pargen_due.dwgn0    PAR-PLC Check prop valves direction delay
#defcom %pargen_due.dwgn1    PAR-PLC Check relay 20KA1-2-3-4 delay
#defcom %pargen_due.dwgn2    PAR-PLC Check front arms descent valves delay
#defcom %pargen_due.dwgn3    PAR-PLC Check relay KA3 delay
#defcom %pargen_due.dwgn4    PAR-PLC Check locking pressure switch delay
#defcom %pargen_due.dwgn5    PAR-PLC Check safety valves delay
#defcom %pargen_due.dwgn6    PAR-PLC Pulse for hydraulic cushion pressure time
#defcom %pargen_due.dwgn7    PAR-PLC Punch release pressure
#defcom %pargen_due.dwgn8    PAR-PLC Die release pressure
#defcom %pargen_due.dwgn9    PAR-PLC K Pressure drop delay and OFF Descent valves (1000 = tdeco)
#defcom %pargen_due.dwgn10   PAR-PLC Delay activation pressure after OFF descent valves
#defcom %pargen_due.dwgn11   PAR-PLC LazerSafe work mode: 0-2 = Station A, 3-5 = Station A + B, 8-10 = Station.B
#defcom %pargen_due.dwgn13   PAR-PLC Decompression pressure (DAC steps)
#defcom %pargen_due.dwgn12   PAR-UI-PLC Internal shoulder zero distance
#defcom %pargen_due.dwgn14   PAR-PLC Decompression pressure deactivation advance
#defcom %pargen_due.dwgn15   PAR-UI Aluminum Angle Coefficient
#defcom %pargen_due.dwgn16   PAR-UI Iron Angle Coefficient
#defcom %pargen_due.dwgn17   PAR-UI Steel Angle Coefficient
#defcom %pargen_due.dwgn18   PAR-PP Tandem fast descent balance gain

#defcom %pargen_due.dwgn19.0 PAR-PLC Enab. manual descent pressure at mute
#defcom %pargen_due.dwgn19.1 PAR-PP Enab. manual descent speed from mute to pinch
#defcom %pargen_due.dwgn19.2 PAR-PLC Enab. beam rise with emergency
#defcom %pargen_due.dwgn19.3 PAR-PLC LazerSafe: stop at mute
#defcom %pargen_due.dwgn19.4 PAR-PLC TDC output driving with syncro control
#defcom %pargen_due.dwgn19.5 PAR-PLC Force step change at TDC
#defcom %pargen_due.dwgn19.6 PAR-PLC Enab. rise to TDC with pedal release in fast descent
#defcom %pargen_due.dwgn19.7 PAR-PLC Excl. decompression in manual
#defcom %pargen_due.dwgn19.8 PAR-PLC Control SQ1 and 2 with Valve command
#defcom %pargen_due.dwgn19.9 PAR-PLC Photocells intervention only in Fast mode
#defcom %pargen_due.dwgn19.10 PAR-PLC Photocell intervention No Auto Open
#defcom %pargen_due.dwgn19.11 PAR-PLC Emergency from auxiliaries
#defcom %pargen_due.dwgn19.12 PAR-PLC Sel. beam calibration cycle to upper stop
#defcom %pargen_due.dwgn19.13 PAR-PLC Force Step Change at End of Bend (BDC)
#defcom %pargen_due.dwgn19.14 PAR-PLC OUT TDC with stationary beam
#defcom %pargen_due.dwgn19.15 PAR-PLC Tandem on ring 0
#defcom %pargen_due.dwgn19.16 PAR-PLC Enab. handwheel on the front panel
#defcom %pargen_due.dwgn19.17 PAR-PLC Enab. dynamic crowning
#defcom %pargen_due.dwgn19.18 PAR-PLC Enab. handwheel on front panel in following
#defcom %pargen_due.dwgn19.19 PAR-PP Enable decompression for electric press
#defcom %pargen_due.dwgn19.20 PAR-PLC Sel. Two-steps beam calibration cycle
#defcom %pargen_due.dwgn19.21 PAR-PLC Enab. unbalance control in calibration
#defcom %pargen_due.dwgn19.22 PAR-PLC Pressure discharge on pedal release
#defcom %pargen_due.dwgn19.23 PAR-PLC Enable beam calibration with START
#defcom %pargen_due.dwgn19.24 PAR-UI Reset general parameters with new program on S525
#defcom %pargen_due.dwgn19.25 PAR-PLC Electric press decompression with slow descent valves
#defcom %pargen_due.dwgn19.26 PAR-PLC High-resolution crowning force
#defcom %pargen_due.dwgn19.27 PAR-PLC Enable BDC correction with strain gauge
#defcom %pargen_due.dwgn19.28 PAR-PLC Enables back gauge in exhibition mode
#defcom %pargen_due.dwgn19.29 PAR-PLC Enable step rise mode
#defcom %pargen_due.dwgn19.30 PAR-UI Enable Access Manual Page with Password
#defcom %pargen_due.dwgn19.31 PAR-PLC Enable INC mode to BDC without aligning Y1 and Y2 (Conical mode)

#defcom %pargen_due.dwgn20   PAR-PLC Slow descent advance distance on mute
#defcom %pargen_due.dwgn21   PAR-UI Minimum distance Z1-Z3
#defcom %pargen_due.dwgn22   PAR-UI Minimum distance Z3-Z4
#defcom %pargen_due.dwgn23   PAR-UI Minimum distance Z4-Z2
#defcom %pargen_due.dwgn24   PAR-UI Minimum distance Z3-Z2
#defcom %pargen_due.dwgn25   PAR-PP Delay On Valves-> On Proportional on fast descent
#defcom %pargen_due.dwgn26   PAR-PP Beam descent safety Speed
#defcom %pargen_due.dwgn27   PAR-PP Advance distance on mute
#defcom %pargen_due.dwgn28   PAR-PP Active crowning proportional gain
#defcom %pargen_due.dwgn29   PAR-PLC 2nd mute point height
#defcom %pargen_due.dwgn30   PAR-PLC Datam angle sensor reading delay
#defcom %pargen_due.dwgn31   PAR-PLC NVEL beam floating time with Datam sensor
#defcom %pargen_due.dwgn32   PAR-PLC Maximum pressure command time
#defcom %pargen_due.dwgn33   PAR-PLC Oil filtering voltage (mV)
#defcom %pargen_due.dwgn34   PAR-PLC Beam stop space check distance
#defcom %pargen_due.dwgn35   PAR-PLC Pressure descent Time on Pedal release in bending (0 = 2000)
#defcom %pargen_due.dwgn36   PAR-PLC Floating rise balance gain (0 = 1000)
#defcom %pargen_due.dwgn37   PAR-PLC Maximum Floating distance for angle measurement with Strain Gauge
#defcom %pargen_due.dwgn38   PAR-PLC Rise voltage before fast descent (mV)
#defcom %pargen_due.dwgn39   PAR-PLC Rise time before fast descent (ms)
#defcom %pargen_due.dwgn40   PAR-PLC Force decompression gain switching (%) (special hybrid)
#defcom %pargen_due.dwgn41   PAR-PLC Decompression gain with low force (special hybrid)
#defcom %pargen_due.dwgn42   PAR-PLC Decompression gain with high force (special hybrid)
#defcom %pargen_due.dwgn43   PAR-PLC Number of bends for automatic sensor S4 reset
#defcom %pargen_due.dwgn44   PAR-PLC VMAX for Tracking Error mm-min Fast Descent
#defcom %pargen_due.dwgn45   PAR-PLC VMAX for Tracking Error mm-min Slow Descent
#defcom %pargen_due.dwgn46   PAR-PLC VMAX for Tracking Error mm-min Fast rise
#defcom %pargen_due.dwgn47   PAR-PLC Threshold for tracking error during acceleration [um]. Normally 5
#defcom %pargen_due.dwgn48   PAR-PLC Kp filter to extract acc / cruise / dec bit [Hz] x 1000. Normally 5 Hz (5000)
#defcom %pargen_due.dwgn49   PAR-PLC Kd Y1
#defcom %pargen_due.dwgn50   PAR-PLC Kd Y2
#defcom %pargen_due.dwgn51   PAR-PLC Limitation Kd (ImpulseEncoder / t.reg)
#defcom %pargen_due.dwgn52   PAR-PLC Back gauge retract advance (%)
#defcom %pargen_due.dwgn53   PAR-PLC WILA LED bar length (mm)
#defcom %pargen_due.dwgn54   PAR-PLC Second Mute Point Before Standard Mute (mm)
#defcom %pargen_due.dwgn55   UI-UI Percentage Z deviation
#defcom %pargen_due.dwgn56   UI-UI Delay to change layout EDI MAN SAUTO AUTO
#defcom %pargen_due.dwgn57   UI-UI X axes Safety position for D.folding
#defcom %pargen_due.dwgn58   PAR-PLC Pressure command time for crowning calibration
#defcom %pargen_due.dwgn59   PAR-PLC % pressure for crowning calibration
#defcom %pargen_due.dwgn60   PAR-PLC Crowning relaxation time
#defcom %pargen_due.dwgn61   PAR-PP Calibration value S3
#defcom %pargen_due.dwgn62   PAR-PP Calibration value S4
#defcom %pargen_due.dwgn63   PAR-UI Hybrid type

#defcom %pargen_due.dwgn64.0 UI-UI Disable copying of angle correction Y1 to Y2
#defcom %pargen_due.dwgn64.1 UI-UI Hides the entries in the menu in Manual / SAUTO / AUTO to open the user and special UIPL pages
#defcom %pargen_due.dwgn64.2 PAR-PLC Enab. Esa hybrid
#defcom %pargen_due.dwgn64.3 PAR-PLC Enab. front arms movements at BDC with handwheel
#defcom %pargen_due.dwgn64.4 PAR-UI Recalculation R1 with angle modification X1-X2
#defcom %pargen_due.dwgn64.5 PAR-PLC Step change at pedal release
#defcom %pargen_due.dwgn64.6 PAR-PLC Enables retract without beam stop
#defcom %pargen_due.dwgn64.7 PAR-PLC Reserved parameter B10
#defcom %pargen_due.dwgn64.8 PAR-UI Conic bar fulcrum is on the left
#defcom %pargen_due.dwgn64.9 PAR-UI Enable Calculation Conic Bar
#defcom %pargen_due.dwgn64.10 PAR-UI Conic bar debug enable
#defcom %pargen_due.dwgn64.11 PAR-UI Do not recalculate crowning if force is changed manually
#defcom %pargen_due.dwgn64.12 PAR-UI Parameter to not request the insertion of a new step
#defcom %pargen_due.dwgn64.13 PAR-UI Parameter to save the program to the change of state and START button pressure
#defcom %pargen_due.dwgn64.14 PAR-UI Custom UI Configuration 1
#defcom %pargen_due.dwgn64.15 PAR-PLC Enab. camera management from PCSS
#defcom %pargen_due.dwgn64.16 PAR-PLC Enab. JOG limiter
#defcom %pargen_due.dwgn64.17 PAR-PLC Decompression mode (0 = standard, 1 = to target)
#defcom %pargen_due.dwgn64.18 PAR-UI Enab. zone compensation
#defcom %pargen_due.dwgn64.19 PAR-PLC-PP Enab. front arms start/end positions managment
#defcom %pargen_due.dwgn64.20 PAR-PLC Enab. 2nd LED bar on die
#defcom %pargen_due.dwgn64.21 PAR-PLC Enab. camera parking before front arms descent
#defcom %pargen_due.dwgn64.22 PAR-UI Disab. sending command Extended Tool Info to LaserCheck
#defcom %pargen_due.dwgn64.23 PAR-PLC Disab. thickness acquire for MCS
#defcom %pargen_due.dwgn64.24 PAR-UI Enab. use command to read front and back angles from LaserCheck
#defcom %pargen_due.dwgn64.25 PAR-PLC Reserved
#defcom %pargen_due.dwgn64.26 PAR-UI Enab. collision check during piece execution
#defcom %pargen_due.dwgn64.27 PAR-PLC Enab. servo pressure from mute to pinch (electrical)
#defcom %pargen_due.dwgn64.29 PAR-PLC Automatic tool changer (ATC) presence
#defcom %pargen_due.dwgn64.30 PAR-PLC Enab. BDC target correction on bending
#defcom %pargen_due.dwgn64.31 PAR-UI Enab. method 5 angle sensors

#defcom %pargen_due.dwgn65   PAR-PLC Fast descent pre-charge pressure (bar)
#defcom %pargen_due.dwgn66   PAR-PLC Fast descent Y1 pre-charge speed (mV)
#defcom %pargen_due.dwgn67   PAR-PLC Fast descent pre-charge holding speed (mV)
#defcom %pargen_due.dwgn68   PAR-PLC Fast rise pre-charge pressure (bar)
#defcom %pargen_due.dwgn69   PAR-PLC Fast rise Y1 pre-charge speed (mV)
#defcom %pargen_due.dwgn70   PAR-PLC Fast rise Y2 pre-charge speed  (mV)
#defcom %pargen_due.dwgn71   PAR-PLC Fast rise pre-charge holding speed (mV)
#defcom %pargen_due.dwgn72   PAR-PLC Minimum cylinder pressure (bar)
#defcom %pargen_due.dwgn73   PAR-PLC Minimum accumulator pressure (bar)
#defcom %pargen_due.dwgn74   PAR-PLC Support closing time (ms)
#defcom %pargen_due.dwgn75   PAR-PLC Decompression pressure descent ramp (s)
#defcom %pargen_due.dwgn76   PAR-UI Wila TIPS_Config
#defcom %pargen_due.dwgn77   PAR-PLC Max descent work on accumulator (mm)
#defcom %pargen_due.dwgn78   PAR-PLC Brackets homing offset for PCSS
#defcom %pargen_due.dwgn79   PAR-PLC Maximum accumulator pressure (bar)
#defcom %pargen_due.dwgn80   PAR-PLC Main pressure sensor full scale (bar)
#defcom %pargen_due.dwgn81   PAR-PLC Crowning pressure sensor full scale (bar)
#defcom %pargen_due.dwgn82   PAR-PLC Rising valve opening time (ms)
#defcom %pargen_due.dwgn83   PAR-UI Enable user DLL server
#defcom %pargen_due.dwgn84   PAR-PLC Front arms following filter (ms)
#defcom %pargen_due.dwgn85   PAR-PLC Fast descent Y2 pre-charge speed (mV)
#defcom %pargen_due.dwgn86   PAR-PLC Minimum voltage limit for slow speed (mV)
#defcom %pargen_due.dwgn87   PAR-PLC Minimum voltage limit for safety speed (mV)
#defcom %pargen_due.dwgn88   PAR-UI Selection ATC file sending mode

#defcom %pargen_due.dwgn89.0 PAR-UI Enab. method 8 as the default copied bend
#defcom %pargen_due.dwgn89.1 PAR-UI Enab. springback measurement with method 6
#defcom %pargen_due.dwgn89.2 PAR-UI Enab. workpiece width limitation to the machine width
#defcom %pargen_due.dwgn89.3 PAR-UI Disable Warning on zero angle
#defcom %pargen_due.dwgn89.4 PAR-UI Automatic saving of pieces made and pieces to do

#defcom %UsrDll1.bDllEnable.0 PAR-PLC Ability auxiliary push-button DLL
#defcom %UsrDll2.bDllEnable.0 PAR-PLC LazerSafe DLL Skill
#defcom %UsrDll4.bDllEnable.0 PAR-PLC Fiessler DLL Skill
#defcom %UsrDll6.bDllEnable.0 PAR-PLC MCS DLL Skill

* Basic channel parameters used by PLC

#defcom %cn0.cc1             PAR-PLC axes mask configured in channel 0
#defcom %cn1.cc1             PAR-PLC axes mask configured in channel 1
#defcom %cn2.cc1             PAR-PLC axes mask configured in channel 2
#defcom %cn3.cc1             PAR-PLC axes mask configured in channel 3
#defcom %cn4.cc1             PAR-PLC axes mask configured in channel 4
#defcom %cn5.cc1             PAR-PLC axes mask configured in channel 5
#defcom %cn7.cc1             PAR-PLC axes mask configured in channel 7

* Basic axis parameters used by PLC

#defcom %ax0.pa2             PAR-PLC coarse tolerance axis Y1 (NVEL)
#defcom %ax0.pa10            PAR-PLC minimum axis quota Y1 (NVEL)
#defcom %ax0.pa11            PAR-PLC maximum axis quota Y1 (NVEL)
#defcom %ax0.pa17            PAR-PLC Y1 axis slow down position (NVEL)
#defcom %ax0.pa28            PAR-PLC backward inertia Y1 (NVEL)

#defcom %ax1.pa2             PAR-PLC coarse tolerance axis Y2 (NVEL)
#defcom %ax1.pa10            PAR-PLC minimum axis quota Y2 (NVEL)
#defcom %ax1.pa11            PAR-PLC maximum axis quota Y2 (NVEL)
#defcom %ax1.pa17            PAR-PLC Y2 axis slow down position (NVEL)
#defcom %ax1.pa28            PAR-PLC backward inertia Y2 (NVEL)

#defcom %ax2.pa3.25          PAR-PLC Gantry axis X1-X2 enabled
#defcom %ax4.pa3.25          PAR-PLC Gantry axis R1-R2 enabled

#defcom %ax2.pa9             PAR-PLC speed maximum axis X1
#defcom %ax3.pa9             PAR-PLC speed maximum axis X2
#defcom %ax4.pa9             PAR-PLC speed maximum axis R1
#defcom %ax5.pa9             PAR-PLC speed maximum axis R2
#defcom %ax6.pa9             PAR-PLC speed maximum axis Z1
#defcom %ax7.pa9             PAR-PLC speed maximum axis Z2

#defcom %ax18.pa2            PAR-PLC S3 axis tolerance (NVEL)
#defcom %ax18.pa10           PAR-PLC minimum axis quota S3 (NVEL)

#defcom %pa0                 PAR-PLC axis type (1-4 = prop, 20 = NVEL, 30 = pest)
#defcom %pa9                 PAR-PLC maximum axis speed
#defcom %pa64                PAR-PLC value for torque reduction (1000 = 100%)
#defcom %nvel3               PAR-PLC type of encoder (pest.), 3 = potenziom. 16 bits
#defcom %nvel6               PAR-PLC type of encoder (prop.), 2 = potenziom.
#defcom %nvel10              PAR-PLC type of encoder (NVEL), 2 = potenziom.
#defcom %nvel11              PAR-PLC type of drive, 4 = Canopen positioning

* Axis configuration parameters used by the PLC

#defcom %dt1                 PAR-PLC motor type (1 = beam hydr.)
#defcom %dt2                 PAR-PLC Calibration type (9 = disab)
#defcom %dt5                 PAR-PLC Number of decimals
#defcom %dt6.0               PAR-PLC Backward calibration direction
#defcom %dt7.0               PAR-PLC Axis normally in torque
#defcom %dt32.0              PAR-PLC Calibration cycle enabled in step 1
#defcom %dt32.1              PAR-PLC Calibration cycle enabled in step 2
#defcom %dt32.2              PAR-PLC Calibration cycle enabled in step 3
#defcom %dt32.3              PAR-PLC Calibration cycle enabled in step 4

#defcom %cax0.dt0            PAR-PLC axis Y1 present
#defcom %cax0.dt1            PAR-PLC type of motor Y1
#defcom %cax0.dt6            PAR-PLC Backward calibration direction Y1
#defcom %cax0.dt26.0         PAR-PLC Y1 axis simulated
#defcom %cax0.dt27           PAR-PLC Y1 axis operating mode

#defcom %cax1.dt0            PAR-PLC axis Y2 present
#defcom %cax1.dt1            PAR-PLC type of motor Y2
#defcom %cax1.dt6            PAR-PLC Backward calibration direction Y2
#defcom %cax1.dt27           PAR-PLC Y2 axis operating mode

#defcom %cax2.dt0            PAR-PLC axis X1 presence
#defcom %cax2.dt6            PAR-PLC Backward calibration direction X1
#defcom %cax2.dt32.0         PAR-PLC Calibration cycle X1 in step 1
#defcom %cax2.dt32.1         PAR-PLC Calibration cycle X1 in step 2
#defcom %cax2.dt32.2         PAR-PLC Calibration cycle X1 in step 3
#defcom %cax2.dt32.3         PAR-PLC Calibration cycle X1 in step 4

#defcom %cax3.dt0            PAR-PLC axis X2 present
#defcom %cax3.dt6            PAR-PLC Backward calibration direction X2
#defcom %cax3.dt27           PAR-PLC X2 axis operating mode (7 = incremental)

#defcom %cax4.dt0            PAR-PLC axis R1 present
#defcom %cax4.dt6            PAR-PLC Back calibration direction R1

#defcom %cax5.dt0            PAR-PLC axis R2 present
#defcom %cax5.dt6            PAR-PLC Back calibration direction R2

#defcom %cax6.dt0            PAR-PLC axis Z1 present
#defcom %cax6.dt6            PAR-PLC Backward calibration direction Z1

#defcom %cax7.dt0            PAR-PLC axis Z2 present
#defcom %cax7.dt6            PAR-PLC Back calibration direction Z2

#defcom %cax8.dt0            PAR-PLC axis A1 present
#defcom %cax8.dt1            PAR-PLC motor type A1
#defcom %cax8.dt6            PAR-PLC Back calibration direction A1
#defcom %cax8.dt27           PAR-PLC A1 axis operating mode (6 = Z3 axis)

#defcom %cax9.dt0            PAR-PLC axis A2 present
#defcom %cax9.dt27           PAR-PLC A2 axis operating mode (4 = crowning)

#defcom %cax10.dt0           PAR-PLC axis A3 present
#defcom %cax10.dt27          PAR-PLC A3 axis operating mode (4 = crowning)

#defcom %cax11.dt0           PAR-PLC A4 axis present
#defcom %cax11.dt27          PAR-PLC A4 axis operating mode (11 = bracket)

#defcom %cax12.dt0           PAR-PLC axis A5 present
#defcom %cax13.dt0           PAR-PLC axis A6 present
#defcom %cax14.dt0           PAR-PLC axis A7 present
#defcom %cax15.dt0           PAR-PLC axis A8 present

#defcom %cax16.dt0           PAR-PLC S1 axis present
#defcom %cax17.dt0           PAR-PLC S2 axis present
#defcom %cax18.dt0           PAR-PLC S3 axis present
#defcom %cax19.dt0           PAR-PLC S4 axis present
#defcom %cax20.dt0           PAR-PLC S5 axis present
#defcom %cax21.dt0           PAR-PLC S6 axis present

#defcom %cax18.dt27          PAR-PLC Function mode axis S3 (4 = active crowning)
#defcom %cax19.dt27          PAR-PLC Function mode axis S4 (5 = beam sensor for active crowning)

#defcom %cax16.dt26.0        PAR-PLC axis S1 in simulated
#defcom %cax17.dt26.0        PAR-PLC S2 axis in simulated

#defcom %cax22.dt0           PAR-PLC axis X3 present
#defcom %cax23.dt0           PAR-PLC axis X4 present
#defcom %cax24.dt0           PAR-PLC axis R3 present
#defcom %cax25.dt0           PAR-PLC axis R4 present
#defcom %cax26.dt0           PAR-PLC axis Z3 present
#defcom %cax27.dt0           PAR-PLC axis Z4 present

* I / O configuration parameters

#defcom %ConfigIO2.byNReg     PAR-PLC Photocell activation input card
#defcom %ConfigIO5.byNReg     PAR-PLC Photocell inhibited input card
#defcom %ConfigIO6.byNReg     PAR-PLC General emergency input card
#defcom %ConfigIO8.byNReg     PAR-PLC Automatic Remote Status input card
#defcom %ConfigIO9.byNReg     PAR-PLC Semi-automatic Remote Status input card
#defcom %ConfigIO13.byNReg    PAR-PLC Operation with robot input card
#defcom %ConfigIO28.byNReg    PAR-PLC Step change input card
#defcom %ConfigIO29.byNReg    PAR-PLC Retract switch input card
#defcom %ConfigIO30.byNReg    PAR-PLC TDC switch input card
#defcom %ConfigIO37.byNReg    PAR-PLC Pump thermal relay input card
#defcom %ConfigIO38.byNReg    PAR-PLC X axis drive alarm input card
#defcom %ConfigIO39.byNReg    PAR-PLC R axis drive alarm input card
#defcom %ConfigIO40.byNReg    PAR-PLC Z1 axis drive alarm input card
#defcom %ConfigIO41.byNReg    PAR-PLC Z2 axis drive alarm input card
#defcom %ConfigIO45.byNReg    PAR-PLC Front arm 2 enable selector input card
#defcom %ConfigIO46.byNReg    PAR-PLC No air input card NC
#defcom %ConfigIO47.byNReg    PAR-PLC Button enab. handwheel from encoder input card
#defcom %ConfigIO48.byNReg    PAR-PLC Force back gauge Safety speed input card NC
#defcom %ConfigIO73.byNReg    PAR-PLC Program selection code bit 0 output card
#defcom %ConfigIO107.byNReg   PAR-PLC Cycle lock from robot input card
#defcom %ConfigIO108.byNReg   PAR-PLC Upper tool lock pressure switch input card
#defcom %ConfigIO109.byNReg   PAR-PLC Lower tool lock pressure switch input card
#defcom %ConfigIO113.byNReg   PAR-PLC Reset pinch and BDC input card
#defcom %ConfigIO100.byNReg   PAR-PLC Maximum skew switch input card
#defcom %ConfigIO101.byNReg   PAR-PLC EV direction Y1 upward input card
#defcom %ConfigIO102.byNReg   PAR-PLC EV direction Y2 upward input card
#defcom %ConfigIO103.byNReg   PAR-PLC EV direction Y1 descent input card
#defcom %ConfigIO104.byNReg   PAR-PLC EV direction Y2 descent input card
#defcom %ConfigIO105.byNReg   PAR-PLC Manual selector input card
#defcom %ConfigIO110.byNReg   PAR-PLC Relay 20KA1,2,3,4 monitor input card
#defcom %ConfigIO114.byNReg   PAR-PLC Pump ON input card
#defcom %ConfigIO116.byNReg   PAR-PLC Transducer monitoring SQ1 input card
#defcom %ConfigIO117.byNReg   PAR-PLC Transducer monitoring SQ2 input card
#defcom %ConfigIO125.byNReg   PAR-PLC Drives OK input card
#defcom %ConfigIO126.byNReg   PAR-PLC End of pressing switch 1 input card
#defcom %ConfigIO128.byNReg   PAR-PLC Mute input card
#defcom %ConfigIO129.byNReg   PAR-PLC Stop at mute input card
#defcom %ConfigIO131.byNReg   PAR-PLC EV DiscVel SQ5 monitor input card
#defcom %ConfigIO132.byNReg   PAR-PLC EV DiscVel SQ6 monitor input card
#defcom %ConfigIO133.byNReg   PAR-PLC User Alarm 1 input Card
#defcom %ConfigIO134.byNReg   PAR-PLC User Alarm 2 input card
#defcom %ConfigIO135.byNReg   PAR-PLC User Alarm 3 input Card
#defcom %ConfigIO136.byNReg   PAR-PLC User message 1 input card
#defcom %ConfigIO137.byNReg   PAR-PLC User message 2 input card
#defcom %ConfigIO138.byNReg   PAR-PLC EV monitor SQ7 prefills input card
#defcom %ConfigIO139.byNReg   PAR-PLC EV Y1 monitor at rest input card
#defcom %ConfigIO140.byNReg   PAR-PLC EV Y2 monitor at rest input card
#defcom %ConfigIO141.byNReg   PAR-PLC EV DiscLen SD monitor input card
#defcom %ConfigIO143.byNReg   PAR-PLC NVEL or read-only beam calibration switch input card
#defcom %ConfigIO153.byNReg   PAR-PLC EV pressure hydraulic cushion output card
#defcom %ConfigIO161.byNReg   PAR-PLC Stopping space management procedure output card
#defcom %ConfigIO189.byNReg   PAR-PLC EV Tool clamping output card

* Parameters from UI to PP

#defcom %parspec.dsp8        PAR-PP Front arms speed for unhook cycle
#defcom %parspec.dsp13       PAR-PP Beam return speed for front arms
#defcom %parspec.dsp14       PAR-PP Front arms return speed
#defcom %parspec.dsp15       PAR-PP tolerance timer for recall cycle
#defcom %parspec.dsp16       PAR-PP Front arms overdistance for unhook cycle
#defcom %parspec.dsp17       PAR-PP A1 axis following gain
#defcom %parspec.dsp18       PAR-PP A2 axis following gain
#defcom %parspec.dsp19       PAR-PP Front arms filter value
#defcom %parspec.dsp20       PAR-PP Balance gain in slow descent
#defcom %parspec.dsp21       PAR-PP gain balance in fast descent
#defcom %parspec.dsp22       PAR-PP Feed Forward Y1 in fast descent
#defcom %parspec.dsp23       PAR-PP Feed Forward Y2 in fast descent
#defcom %parspec.dsp24       PAR-PP Feed Forward Y1 in fast rise
#defcom %parspec.dsp25       PAR-PP Feed Forward Y2 in fast rise
#defcom %parspec.dsp28       PAR-PP Feed Forward Y1 in slow descent
#defcom %parspec.dsp29       PAR-PP Feed Forward Y2 in slow descent

#defcom %pst0                PAR-PLC Beam lower limit
#defcom %pst1                PAR-PLC Beam upper limit
#defcom %pst2                PAR-PP Y1 axis calibration quota
#defcom %pst3                PAR-PP Y2 axis calibration quota
#defcom %pst4                PAR-PP Beam tolerance quota
#defcom %pst5                PAR-PLC Unbalance correction
#defcom %pst6                PAR-PP-PLC Maximum unbalance
#defcom %pst7                PAR-PP Beam conversion factor
#defcom %pst8                PAR-PP-PLC Stop time for coining
#defcom %pst13               PAR-PLC Crowning 0 voltage
#defcom %pst16               PAR-PP Fast descent in closed loop enable
#defcom %pst18               PAR-PP Fast descent acceleration
#defcom %pst19               PAR-PP Fast descent speed
#defcom %pst20               PAR-PP Minimum fast descent voltage OL
#defcom %pst21               PAR-PP Voltage OL or gain CL Y1 fast descent
#defcom %pst22               PAR-PP Voltage OL or gain CL Y2 fast descent
#defcom %pst23               PAR-PP Fast descent slowdown advance OL
#defcom %pst24               PAR-PLC Speed change time
#defcom %pst25               PAR-PP Manual descent pressure
#defcom %pst26               PAR-PP-PLC Manual descent speed
#defcom %pst27               PAR-PP Slow descent acceleration
#defcom %pst28               PAR-PP Slow descent Y1 gain
#defcom %pst29               PAR-PP Slow descent Y2 gain
#defcom %pst30               PAR-PP Descent tolerance time
#defcom %pst35               PAR-PP Y1 decompression voltage
#defcom %pst36               PAR-PP Y2 decompression voltage
#defcom %pst37               PAR-PP-PLC Pressure descent time
#defcom %pst38               PAR-PP-PLC Decompression time
#defcom %pst40               PAR-PP Fast rise speed
#defcom %pst41               PAR-PP Fast rise acceleration
#defcom %pst42               PAR-PP Fast rise Y1 gain
#defcom %pst43               PAR-PP Fast rise Y2 gain
#defcom %pst44               PAR-PP Fast rise tolerance time
#defcom %pst45               PAR-PP Fast rise initial wait
#defcom %pst47               PAR-PP Slow rise speed
#defcom %pst48               PAR-PP Slow rise acceleration
#defcom %pst49               PAR-PP Slow rise Y1 gain
#defcom %pst50               PAR-PP Slow rise Y2 gain
#defcom %pst51               PAR-PP Slow rise tolerance time
#defcom %pst52               PAR-PP Slow rise initial wait
#defcom %pst53               PAR-PP Recall speed
#defcom %pst54               PAR-PP Maximum tracking error

#defcom %pstt0               PAR-PP Fast descent pressure ramp time
#defcom %pstt1               PAR-PP Slow descent pressure ramp time
#defcom %pstt2               PAR-PP Fast rising pressure ramp time
#defcom %pstt3               PAR-PP Slow rising pressure ramp time

#defcom %gen0                PAR-PP X Safety Area
#defcom %gen1                PAR-PP R Safety Area
#defcom %gen2                PAR-PP Anti-collision method
#defcom %gen4                PAR-UI-PLC Minimum distance between Z
#defcom %gen7                PAR-PLC Mute correction
#defcom %gen8                PAR-PLC Machine Width
#defcom %gen9                PAR-PP Maximum strength

#defcom %GPS                 PAR-PLC GPS sensor present

#defcom %ap0.pt4             PAR-PP Y1 axis tolerance quota

#defcom %ap2.pt0             PAR-PP Minimum X1 axis quota
#defcom %ap3.pt0             PAR-PP Minimum X2 axis quota

#defcom %ap4.pt1             PAR-PP Maximum R1 axis quota
#defcom %ap5.pt1             PAR-PP Maximum R2 axis quota

#defcom %ap16.pt2            PAR-PP S1 axis calibration quota
#defcom %ap16.pt4            PAR-PP S1 axis tolerance
#defcom %ap16.pt11           PAR-PP S1 axis gain

#defcom %ap17.pt2            PAR-PP S2 axis calibration quota
#defcom %ap17.pt4            PAR-PP S2 axis tolerance
#defcom %ap17.pt11           PAR-PP S2 axis gain

#defcom %ap18.pt2            PAR-PP S3 axis calibration quota
#defcom %ap19.pt2            PAR-PP S4 axis calibration quota
#defcom %ap20.pt2            PAR-PP S5 axis calibration quota
#defcom %ap21.pt2            PAR-PP S6 axis calibration quota


* Variables from CFC anti-collision back gauge 1-2

#defcom %faseaxa             CFC-PP X1 Axis quota phase 1 anticoll.
#defcom %faseaxb             CFC-PP X2 axis quota phase 1 anticoll.
#defcom %faseara             CFC-PP R1 axis quota phase 1 anticoll.
#defcom %fasearb             CFC-PP R2 axis quota phase 1 anticoll.
#defcom %faseaza             CFC-PP Z1 axis quota phase 1 anticoll.
#defcom %faseazb             CFC-PP Z2 axis quota phase 1 anticoll.

#defcom %fasebxa             CFC-PP X1 Axis quota phase 2 anticoll.
#defcom %fasebxb             CFC-PP X2 axis quota phase 2 anticoll.
#defcom %fasebra             CFC-PP R1 axis quota phase 2 anticoll.
#defcom %fasebrb             CFC-PP R2 axis quota phase 2 anticoll.
#defcom %fasebza             CFC-PP Z1 axis quota phase 2 anticoll.
#defcom %fasebzb             CFC-PP Z2 axis quota phase 2 anticoll.

#defcom %fasecxa             CFC-PP X1 Axis quota phase 3 anticoll.
#defcom %fasecxb             CFC-PP X2 axis quota phase 3 anticoll.
#defcom %fasecra             CFC-PP R1 axis quota phase 3 anticoll.
#defcom %fasecrb             CFC-PP R2 Axis quota phase 3 anticoll.
#defcom %fasecza             CFC-PP Z1 axis quota phase 3 anticoll.
#defcom %faseczb             CFC-PP Z2 axis quota phase 3 anticoll.

#defcom %rinca               CFC-PP X1 axis retract quota
#defcom %rincb               CFC-PP X2 axis retract quota

#defcom %C80                 CFC-PP Mask for Disab/Enab backlash back gauge 1-2

#defcom %FeedfaseaXa         CFC-PP Override X1 phase 1 anticoll.
#defcom %FeedfasebXa         CFC-PP Override X1 phase 2 anticoll.
#defcom %FeedfasecXa         CFC-PP Override X1 phase 3 anticoll.

* Variables from CFC anti-collision back gauge 3-4

#defcom %faseaxc             CFC-PP X3 axis quota phase 1 anticoll.
#defcom %faseaxd             CFC-PP X4 axis quota phase 1 anticoll.
#defcom %fasearc             CFC-PP R3 axis quota phase 1 anticoll.
#defcom %faseard             CFC-PP R4 axis quota phase 1 anticoll.
#defcom %faseazc             CFC-PP Z3 axis quota phase 1 anticoll.
#defcom %faseazd             CFC-PP Z4 axis quota phase 1 anticoll.

#defcom %fasebxc             CFC-PP X3 Axis quota phase 2 anticoll.
#defcom %fasebxd             CFC-PP X4 axis quota phase 2 anticoll.
#defcom %fasebrc             CFC-PP R3 axis quota phase 2 anticoll.
#defcom %fasebrd             CFC-PP R4 Axis quota phase 2 anticoll.
#defcom %fasebzc             CFC-PP Z3 axis quota phase 2 anticoll.
#defcom %fasebzd             CFC-PP Z4 axis quota phase 2 anticoll.

#defcom %fasecxc             CFC-PP X3 axis quota phase 3 anticoll.
#defcom %fasecxd             CFC-PP X4 axis quota phase 3 anticoll.
#defcom %fasecrc             CFC-PP R3 axis quota phase 3 anticoll.
#defcom %fasecrd             CFC-PP R4 axis quota phase 3 anticoll.
#defcom %faseczc             CFC-PP Z3 axis quota phase 3 anticoll.
#defcom %faseczd             CFC-PP Z4 axis quota phase 3 anticoll.

#defcom %rincc               CFC-PP X3 axis retract quota
#defcom %rincd               CFC-PP X4 axis retract quota

#defcom %C81                 CFC-PP Mask for Disab/Enab backlash back gauge 3-4

* Variables from front arms CFCs

#defcom %vaccas              CFC-PP Speed front arm 1 rise in interpolation
#defcom %vaccbs              CFC-PP Speed front arm 2 rise in interpolation
#defcom %accasal             CFC-PP Quota front arm 1 rise in interpolation
#defcom %accbsal             CFC-PP Quota front arm 1 rise in interpolation

* Variables from CFC auxiliary axes

#defcom %posaa               CFC-PP A1 axis quota phase 1 anticoll.
#defcom %posab               CFC-PP A2 axis quota phase 1 anticoll.
#defcom %posac               CFC-PP A3 axis quota phase 1 anticoll.
#defcom %posad               CFC-PP A4 axis quota phase 1 anticoll.
#defcom %posae               CFC-PP A5 axis quota phase 1 anticoll.
#defcom %posaf               CFC-PP A6 Axis quota phase 1 anticoll.
#defcom %posag               CFC-PP A7 Axis quota phase 1 anticoll.
#defcom %posah               CFC-PP A8 Axis quota phase 1 anticoll.

#defcom %posba               CFC-PP A1 axis quota phase 2 anticoll.
#defcom %posbb               CFC-PP A2 axis quota phase 2 anticoll.
#defcom %posbc               CFC-PP A3 axis quota phase 2 anticoll.
#defcom %posbd               CFC-PP A4 axis quota phase 2 anticoll.
#defcom %posbe               CFC-PP A5 axis quota phase 2 anticoll.
#defcom %posbf               CFC-PP A6 Axis quota phase 2 anticoll.
#defcom %posbg               CFC-PP A7 Axis quota phase 2 anticoll.
#defcom %posbh               CFC-PP A8 Axis quota phase 2 anticoll.

#defcom %posca               CFC-PP A1 axis quota phase 3 anticoll.
#defcom %poscb               CFC-PP A2 axis quota phase 3 anticoll.
#defcom %poscc               CFC-PP A3 axis quota phase 3 anticoll.
#defcom %poscd               CFC-PP A4 axis quota phase 3 anticoll.
#defcom %posce               CFC-PP A5 axis quota phase 3 anticoll.
#defcom %poscf               CFC-PP A6 Axis quota phase 3 anticoll.
#defcom %poscg               CFC-PP A7 Axis quota phase 3 anticoll.
#defcom %posch               CFC-PP A8 Axis quota phase 3 anticoll.

* Variables from CFC calculation of BDC for sensor

#defcom %sensore             CFC-PP Sensor target Y1
#defcom %sensoreb            CFC-PP Sensor target Y2

* Variables for cycle with LC-LS angle sensor

#defcom %C210                SLAPPG-UI First correction contribution during bend with real time angle measurement
#defcom %C211                SLAPPG-UI Second correction contribution during bend with real time angle measurement
#defcom %C212                SLAPPG-UI First correction contribution on Y2 during bend with real time angle measurement
#defcom %C213                SLAPPG-UI Second correction contribution on Y2 during bend with real time angle measurement

#defcom %C240                SLAPPG Reserved sensor IRIS debug

#defcom %C255.0              PP-SA Angle acquisition and recalculation command (BDC reached)
#defcom %C255.1              SA- Angle reading in progress
#defcom %C255.2              SA-PP Acquired angle out of tolerance, goes to the next pressing
#defcom %C255.3              SA-PP Acquired angle in tolerance or wrong, bend completed
#defcom %C255.4              SA-PP The crowning must be performed
#defcom %C255.5              PP-SA Laser switch on
#defcom %C255.6              PP-SLAPPG Real-time measurement angle by floating phase
#defcom %C255.7              -SA Angle reading from plc
#defcom %C255.8              SA-PP Laser ignition OK
#defcom %C255.9              SA-PP Laser ignition KO
#defcom %C255.10             SA-PP Start measurement real-time angle OK
#defcom %C255.11             SA-PP Start measurement real-time angle KO
#defcom %C255.12             SA-PP Stop measurement real-time angle OK
#defcom %C255.13             SA-PP Stop measurement real-time angle KO
#defcom %C255.14             PP-SA Real-time measurement angle by bend phase
#defcom %C255.15             PP-SA Command for reading current positions Y1, Y2
#defcom %C255.16             SA-PP Current positions reading Y1, Y2 OK
#defcom %C255.17             SA-PP Current positions reading Y1, Y2 KO
#defcom %C255.18             SA-PP Does not do the real time measurement during the bending phase

* Variables for cycle with pressure sensor

#defcom %dwFlagPressione.1     SLAPPG-PLC-PP Enab. search for maximum pressure
#defcom %dwFlagPressione.2     SLAPPG-PLC-PP Enab. thickness detection
#defcom %dwFlagPressione.4     SLAPPG-PLC Thickness detected out of tolerance
*#defcom %dwFlagPressione.6    SLAPPG-PLC Maximum pressure detected
#defcom %dwFlagPressione.7     SLAPPG-PLC Thickness detected
#defcom %dwFlagPressione.8     SLAPPG-PLC Initialization of the pressure sensor cycle
#defcom %dwFlagPressione.9     SLAPPG-PLC Enable active table

#defcom %parpres.dQtaRicBomb   PAR-PLC Crown value calculated with pressure sensor
#defcom %parpres.dRicPress     PAR-PLC Pressure value calculated with pressure sensor
#defcom %parpres.dQtaGallegg   PAR-PP Floating target
#defcom %parpres.dQtaRicYa     PAR-PP Target Y1 calculated with pressure sensor
#defcom %parpres.dQtaRicYb     PAR-PP Target Y2 calculated with pressure sensor
#defcom %parpres.dForzaImp     PAR-PP Force set in tons
#defcom %parpres.dLargImp      PAR-PLC Bend width

#defcom %parpres.dAltPunz      PAR-PLC Punch height
#defcom %parpres.dAltMat       PAR-PLC Die height

#defcom %parpres.byModoCiclo.0 PLC-SLAPPG Search phase with sensor: 0 = thickness, 1 = width
#defcom %parpres.byModoCiclo.1 PLC-SLAPPG Stop request after thickness detection

* Channel command registers

#defcom %rc0.0           PLC-CN Reset channel CN
#defcom %rc0.1           PLC-CN Channel emergency
#defcom %rc0.2           PLC-CN Start CN channel
#defcom %rc0.5           PLC-CN Confirm function M received channel
#defcom %rc0.8           PLC-CN Select REF mode (calibration) channel
#defcom %rc0.9           PLC-CN Select JOG mode (manual) channel
#defcom %rc0.12          PLC-CN Select AUT mode (automatic) channel
#defcom %rc0.13          PLC-CN Step channel
#defcom %rc0.14          PLC-CN Step IN channel
#defcom %rc0.17          PLC-CN Enable single channel step execution
#defcom %rc0.22          PLC-CN Enable jog open channel execution
#defcom %rc0.23          PLC-CN Step OUT channel
#defcom %rc0.25          PLC-CN Cancel channel residual path

#defcom %rc1             PLC-CN Number of part program channel
#defcom %rc2             PLC-CN Feed-rate channel
#defcom %rc5             PLC-CN Voltage jog open loop channel

#defcom %rc86.0          PLC-CN Enable software limits from plc

* Channel status registers

#defcom %rc8.0               CN-PLC Program running
#defcom %rc8.1               CN-PLC Program interrupted
#defcom %rc8.2               CN-PLC Channel ready
#defcom %rc8.3               CN-PLC Channel alarm
#defcom %rc8.9               CN-PLC Residual path canceled

#defcom %rc63                CN-PLC Channel status (0 = IDLE)

#defcom %cn2.rc8.3           CN-PLC Channel 2 alarm

#defcom %cn0.rc8.2           CN-PLC Ready channel 0
#defcom %cn1.rc8.2           CN-PLC Ready channel 1
#defcom %cn2.rc8.2           CN-PLC Ready channel 2
#defcom %cn3.rc8.2           CN-PLC Ready channel 3
#defcom %cn4.rc8.2           CN-PLC Ready channel 4

* Axis command registers

#defcom %ra0.0               PLC-AX Axis close loop
#defcom %ra0.1               PLC-AX Axis feed hold
#defcom %ra0.8               PLC-AX Command + axis
#defcom %ra0.9               PLC-AX Command - axis
#defcom %ra0.13              PLC-AX Axis calibration limit switch
#defcom %ra0.15              PLC-AX Axis alarm reset

#defcom %ra1                 PLC-AX axis override
#defcom %ra35.1              PLC-AX Enable software limits from plc
#defcom %ra64                PLC-AX Minimum limit value from plc
#defcom %ra65                PLC-AX Maximum limit value from plc
#defcom %ra82                PLC-AX Axis torque limitation (1000 = 100%)

#defcom %ax8.ra0.0           PLC-AX Axis close loop A1
#defcom %ax8.ra0.8           PLC-AX Command + axis A1
#defcom %ax8.ra0.9           PLC-AX Command - axis A1

#defcom %ax9.ra0.0           PLC-AX Axis close loop A2
#defcom %ax9.ra0.8           PLC-AX Command + axis A2
#defcom %ax9.ra0.9           PLC-AX Command - axis A2

* Axes status registers

#defcom %ra3.0               AX-PLC Theoretical standstill axis
#defcom %ra3.2               AX-PLC Forward axis direction
#defcom %ra3.10              AX-PLC Closed loop confirm
#defcom %ra3.13              AX-PLC Axis motion order
#defcom %ra3.14              AX-PLC Axis calibrated
#defcom %ra3.15              AX-PLC Axis Y1 in alarm
#defcom %ra8.7               AX-PLC Axis in stop due to alarm in progress
#defcom %ra19.0              AX-PLC Axis in null ISO status
#defcom %ra19.2              AX-PLC Axis calibration in progress
#defcom %ra19.4              AX-PLC Axis in ISO status alarm

#defcom %ra4                 AX-PLC Current axis position
#defcom %ra5                 AX-PLC Current axis speed (micron / s)

#defcom %ax0.ra3.0           AX-PLC Theoretical axis stop Y1
#defcom %ax0.ra3.2           AX-PLC Axis direction Y1 forward
#defcom %ax0.ra3.10          AX-PLC Closed loop confirm Y1 axis
#defcom %ax0.ra4             AX-PLC Current axis Y1 quota
#defcom %ax0.ra5             AX-PLC Current speed Y1 axis
#defcom %ax0.ra6.9           AX-PLC Alarm due to Y1 axis tracking error
#defcom %ax0.ra8.14          AX-PLC Y1 axis coupled on gearing
#defcom %ax0.ra18            AX-PLC RefDac Y1 axis
#defcom %ax0.ra16            AX-PLC Distance to Go Register Y1 Axis
#defcom %ax0.pa7             AX-PLC Fine tolerance quota Y1 axis

#defcom %ax1.ra3.0           AX-PLC Theoretical Y2 axis stop
#defcom %ax1.ra3.2           AX-PLC Y2 axis direction forward
#defcom %ax1.ra3.10          AX-PLC Closed loop confirm Y2 axis
#defcom %ax1.ra4             AX-PLC Current axis Y2 quota
#defcom %ax1.ra5             AX-PLC Current speed Y2 axis
#defcom %ax1.ra6.9           AX-PLC Alarm for Y2 axis following error
#defcom %ax1.ra8.14          AX-PLC Y2 axis coupled on gearing
#defcom %ax1.ra18            AX-PLC RefDac Y2 Axis
#defcom %ax1.ra16            AX-PLC Distance to Go Register Y2 Axis
#defcom %ax1.pa7             AX-PLC Fine tolerance quota Y2 axis

#defcom %ax2.ra4             AX-PLC Current X1 axis quota
#defcom %ax2.ra5             AX-PLC X1 axis measured speed
#defcom %ax2.ra16            AX-PLC Distance to Go register X1 axis
#defcom %ax2.pa7             AX-PLC Tolerance end fine Axis X1
#defcom %ax2.ra3.0           AX-PLC Theoretical axis X1 stops

#defcom %ax3.ra4             AX-PLC Current X2 axis quota
#defcom %ax3.ra5             AX-PLC X2 axis measured speed
#defcom %ax3.ra16            AX-PLC Distance to Go Register X2 Axis
#defcom %ax3.pa7             AX-PLC Fine tolerance axis X2
#defcom %ax3.ra3.0           AX-PLC Theoretical X2 axis stop

#defcom %ax4.ra5             AX-PLC Current speed axis R1
#defcom %ax4.ra16            AX-PLC Distance to Go Register Axis R1
#defcom %ax4.pa7             AX-PLC End of tolerance fine Axis R1
#defcom %ax4.ra3.0           AX-PLC Theoretical axis stop R1

#defcom %ax5.ra5             AX-PLC Current speed axis R2
#defcom %ax5.ra16            AX-PLC Distance to Go Register Axis R2
#defcom %ax5.pa7             AX-PLC End of tolerance fine Axis R2
#defcom %ax5.ra3.0           AX-PLC Theoretical R2 axis stop

#defcom %ax6.ra5             AX-PLC Z1 axis measured speed
#defcom %ax6.ra16            AX-PLC Distance to Go register Axis Z1
#defcom %ax6.pa7             AX-PLC End of tolerance fine Axis Z1
#defcom %ax6.ra3.0           AX-PLC Theoretical Z1 axis stop

#defcom %ax7.ra5             AX-PLC Z2 axis measured speed
#defcom %ax7.ra16            AX-PLC Distance to Go Register Axis Z2
#defcom %ax7.pa7             AX-PLC End of tolerance fine Axis Z2
#defcom %ax7.ra3.0           AX-PLC Theoretical Z2 axis stop

#defcom %ax8.ra3.0           AX-PLC Theoretical A1 axis stop
#defcom %ax8.ra3.2           AX-PLC A1 axis direction forward
#defcom %ax8.ra4             AX-PLC Current axis A1 quota
#defcom %ax8.ra5             AX-PLC Current speed A1 axis
#defcom %ax8.ra8.14          AX-PLC Axis coupled on gearing A1
#defcom %ax8.ra16            AX-PLC Distance to Go Register Axis A1
#defcom %ax8.pa7             AX-PLC Tolerance end fine A1 axis

#defcom %ax9.ra3.0           AX-PLC Theoretical axis stop A2
#defcom %ax9.ra3.2           AX-PLC A2 axis direction forward
#defcom %ax9.ra4             AX-PLC Current axis A2 quota
#defcom %ax9.ra5             AX-PLC Current speed axis A2
#defcom %ax9.ra8.14          AX-PLC Axis coupled on gearing A2
#defcom %ax9.ra16            AX-PLC Distance to Go Register Axis A2
#defcom %ax9.pa7             AX-PLC End of tolerance A2 axis

#defcom %ax10.ra5            AX-PLC Current speed A3 axis
#defcom %ax10.ra16           AX-PLC Distance to Go Register A3 Axis
#defcom %ax10.pa7            AX-PLC Tolerance end fine A3 axis
#defcom %ax10.ra3.0          AX-PLC Theoretical axis A3 stopped

#defcom %ax11.ra16           AX-PLC Distance to Go Register A4 Axis
#defcom %ax11.pa7            AX-PLC Tolerance end fine A4 axis
#defcom %ax11.ra3.0          AX-PLC Theoretical A4 axis stop

#defcom %ax12.ra16           AX-PLC Distance to Go Register Axis A5
#defcom %ax12.pa7            AX-PLC Tolerance end fine A5 axis
#defcom %ax12.ra3.0          AX-PLC Theoretical A5 axis stop

#defcom %ax13.ra16           AX-PLC Distance to Go Register Axis A6
#defcom %ax13.pa7            AX-PLC Fine tolerance axis A6
#defcom %ax13.ra3.0          AX-PLC Theoretical axis A6 is still

#defcom %ax14.ra16           AX-PLC Distance to Go Register Axis A7
#defcom %ax14.pa7            AX-PLC Fine tolerance axis A7
#defcom %ax14.ra3.0          AX-PLC Theoretical axis stop A7

#defcom %ax15.ra16           AX-PLC Distance to Go Register Axis A8
#defcom %ax15.pa7            AX-PLC Fine tolerance axis A8
#defcom %ax15.ra3.0          AX-PLC Theoretical axis stop A8

#defcom %ax16.ra4            AX-PLC Current axis size S1
#defcom %ax16.ra16           AX-PLC Distance to Go Register Axis S1
#defcom %ax16.pa7            AX-PLC Tolerance end fine Axis S1
#defcom %ax16.ra3.0          AX-PLC Theoretical S1 axis stop

#defcom %ax17.ra4            AX-PLC Current axis S2 quota
#defcom %ax17.ra16           AX-PLC Distance to Go Register Axis S2
#defcom %ax17.pa7            AX-PLC Tolerance end fine Axis S2
#defcom %ax17.ra3.0          AX-PLC Theoretical S2 axis stop

#defcom %ax18.ra4            AX-PLC Current axis S3 quota
#defcom %ax18.ra16           AX-PLC Distance to Go Register Axis S3
#defcom %ax18.pa7            AX-PLC Tolerance end fine Axis S3
#defcom %ax18.ra3.0          AX-PLC Theoretical S3 axis stop

#defcom %ax19.ra4            AX-PLC Current axis S4 quota
#defcom %ax19.ra16           AX-PLC Distance to Go Register Axis S4
#defcom %ax19.pa7            AX-PLC Tolerance end fine Axis S4
#defcom %ax19.ra3.0          AX-PLC Theoretical S4 axis stop

#defcom %ax20.ra4            AX-PLC Current axis S5 quota
#defcom %ax20.ra16           AX-PLC Distance to Go Register Axis S5
#defcom %ax20.pa7            AX-PLC Tolerance end fine Axis S5
#defcom %ax20.ra3.0          AX-PLC Theoretical S5 axis stop

#defcom %ax21.ra4            AX-PLC Current axis S6 quota
#defcom %ax21.ra16           AX-PLC Distance to Go Register Axis S6
#defcom %ax21.pa7            AX-PLC Tolerance end fine Axis S6
#defcom %ax21.ra3.0          AX-PLC Theoretical S6 axis stop

#defcom %ax22.pa7            AX-PLC Fine tolerance axis X3
#defcom %ax22.ra4            AX-PLC Current X3 axis quota
#defcom %ax22.ra16           AX-PLC Distance to Go Register Axis X3
#defcom %ax22.ra3.0          AX-PLC Theoretical X3 axis stop

#defcom %ax23.ra4            AX-PLC Current X4 axis quota
#defcom %ax23.ra16           AX-PLC Distance to Go Register Axis X4
#defcom %ax23.pa7            AX-PLC Fine tolerance axis X4
#defcom %ax23.ra3.0          AX-PLC Theoretical X4 axis stop

#defcom %ax24.ra16           AX-PLC Distance to Go Register Axis R3
#defcom %ax24.pa7            AX-PLC End of tolerance fine Axis R3
#defcom %ax24.ra3.0          AX-PLC Theoretical R3 axis stop

#defcom %ax25.ra16           AX-PLC Distance to Go Register Axis R4
#defcom %ax25.pa7            AX-PLC End of tolerance fine Axis R4
#defcom %ax25.ra3.0          AX-PLC Theoretical R4 axis stop

#defcom %ax26.ra16           AX-PLC Distance to Go Register Axis Z3
#defcom %ax26.pa7            AX-PLC End of tolerance fine Axis Z3
#defcom %ax26.ra3.0          AX-PLC Theoretical Z3 axis stop

#defcom %ax27.ra16           AX-PLC Distance to Go Register Axis Z4
#defcom %ax27.pa7            AX-PLC Tolerance end fine Z4 axis
#defcom %ax27.ra3.0          AX-PLC Theoretical Z4 axis stop


* Input registers from push-button panel

#defcom %IPuls0.1            PULS-PLC Left arrow key pressed
#defcom %IPuls0.17           PULS-PLC Right arrow key pressed

#defcom %IPuls1              PULS-PLC Quote from handwheel (0-65535)

#defcom %IPuls2.0            PULS-PLC Basic page
#defcom %IPuls2.1            PULS-PLC State selection page
#defcom %IPuls2.2            PULS-PLC Special selection page
#defcom %IPuls2.3            PULS-PLC Enable movement from push-button panel
#defcom %IPuls2.4            PULS-PLC Confirm axis calibration (toggle)
#defcom %IPuls2.5            PULS-PLC Confirm selection status (toggle)
#defcom %IPuls2.6            PULS-PLC Confirm acquire axis quota (toggle)

#defcom %IPuls3.0            PULS-PLC Select manual status
#defcom %IPuls3.1            PULS-PLC Select automatic status
#defcom %IPuls3.2            PULS-PLC Select semi-automatic status
#defcom %IPuls3.3            PULS-PLC Select manual status with independent axes
#defcom %IPuls3.4            PULS-PLC Select manual status from CN
#defcom %IPuls3.5            PULS-PLC Select manual status with calibration

#defcom %IPuls5              PULS-PLC Axis selected by push-button panel
#defcom %IPuls6              PULS-PLC Calibration value from push-button panel

#defcom %FUNCBTN.5           FP-PLC Handwheel button on the front
#defcom %EncAPos             FP-PLC Front-panel handwheel counter (0-65535)

#defcom %XhcApp.Xhc_Puls.0   PULS-PLC Stop from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.2   PULS-PLC Start from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.3   PULS-PLC Next bend (feed-) from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.4   PULS-PLC Previous bend (feed+) from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.7   PULS-PLC F1 Mode selection from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.8   PULS-PLC F2 Axis selection from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.10  PULS-PLC F4 Acquire pinch point from XHC teach pendant
#defcom %XhcApp.Xhc_Puls.11  PULS-PLC F5 Acquire axis quote enable from XHC teach pendant
#defcom %XhcApp.Xhc_Connect  PULS-PLC Connection status from XHC teach pendant
#defcom %XhcApp.Xhc_AxisData PULS-PLC Axis selection from XHC teach pendant
#defcom %XhcApp.Xhc_RatioData PULS-PLC Ratio selection from XHC teach pendant
#defcom %XhcApp.Xhc_MPGData  PULS-PLC Handwheel quote from XHC teach pendant

* Outputs register to the push-button panel

#defcom %QPuls0.2            PLC-PULS LED F1 key
#defcom %QPuls0.6            PLC-PULS LED F2 key

#defcom %QPuls1.0            PLC-PULS Manual status from pushb. with calibration
#defcom %QPuls1.1            PLC-PULS Manual status from pushb. with independent axes
#defcom %QPuls1.2            PLC-PULS Manual standard status from pushb. active

#defcom %QPuls2              PLC-PULS Mask configured axes

#defcom %XhcApp.Xhc_LineIdx0 PLC-PULS # visual. on line 1 XHC teach pendant
#defcom %XhcApp.Xhc_LineIdx1 PLC-PULS # visual. on line 2 XHC teach pendant
#defcom %XhcApp.Xhc_LineIdx2 PLC-PULS # visual. on line 3 XHC teach pendant
#defcom %XhcApp.Xhc_LineIdx3 PLC-PULS # visual. on line 4 XHC teach pendant
#defcom %QPuls3              PLC-PULS Current bend number to XHC teach pendant

* Inputs logs from Lazersafe

#defcom %LazerSafe.PCSSReplay.0      LZS-CNC Package successfully transmitted
#defcom %LazerSafe.PCSSReplay.1      LZS-CNC Package transmitted with error
#defcom %LazerSafe.PCSSReplay.2      LZS-CNC Communication with Lazersafe active

#defcom %LazerSafe.PCSSMutePosition  LZS-CNC Mute calculated by Lazersafe

* Output registers to Lazersafe

#defcom %LazerSafe.CncCmd.0              PLC-LZS Send power-up data to Lazersafe
#defcom %LazerSafe.CncCmd.1              PLC-LZS Sending program data to Lazersafe
#defcom %LazerSafe.CncCmd.2              PLC-LZS Send bending data to Lazersafe

#defcom %LazerSafe.CncOperationalMode.0  PLC-LZS CNC in normal mode
#defcom %LazerSafe.CncOperationalMode.1  PLC-LZS CNC in tray mode
#defcom %LazerSafe.CncOperationalMode.2  PLC-LZS Stop at mute
#defcom %LazerSafe.CncOperationalMode.4  PLC-LZS Select second station
#defcom %LazerSafe.CncOperationalMode.5  PLC-LZS Mode 1 foot - 1 foot
#defcom %LazerSafe.CncOperationalMode.6  PLC-LZS Mode 2 hand - 1 foot
#defcom %LazerSafe.CncOperationalMode.7  PLC-LZS Mode 2 hand - 2 hand
#defcom %LazerSafe.CncOperationalMode.8  PLC-LZS Mode 2 foot - 2 foot
#defcom %LazerSafe.CncOperationalMode.9  PLC-LZS Mode 4 hand - 2 foot
#defcom %LazerSafe.CncOperationalMode.10 PLC-LZS Mode 4 hand - 4 hand
#defcom %LazerSafe.CncOperationalMode.11 PLC-LZS Beam calibrated
#defcom %LazerSafe.CncOperationalMode.12 PLC-LZS Function with robot
#defcom %LazerSafe.CncOperationalModb.0  PLC-LZS Guard Only
#defcom %LazerSafe.CncOperationalModb.1  PLC-LZS Single Break Mode
#defcom %LazerSafe.CncOperationalModb.2  PLC-LZS Double Break Mode
#defcom %LazerSafe.CncOperationalModb.4  PLC-LZS BSM management
#defcom %LazerSafe.CncOperationalModb.6  PLC-LZS Programming Mode
#defcom %LazerSafe.CncOperationalModb.7  PLC-LZS Manual Mode
#defcom %LazerSafe.CncOperationalModb.8  PLC-LZS Semiautomatic Mode
#defcom %LazerSafe.CncOperationalModb.9  PLC-LZS Automatic Mode

#defcom %LazerSafe.CncDieBHeight         PLC-LZS Quarry width

* Lazersafe motorized brackets
VAR
PCSSY1   AT %LazerSafe.PCSSgA_out0; * LazerSafe.PCSSgA_out0 actual position of y1 bracket
PCSSY2   AT %LazerSafe.PCSSgA_out1; * LazerSafe.PCSSgA_out1 actual position of y2 bracket
PCSSOffset AT %LazerSafe.PCSSgA_in0; * LazerSafe.PCSSgA_in0 homing offset for the brackets
PCSSQuota  AT %LazerSafe.PCSSgA_in5; * LazerSafe.PCSSgA_in5 quota to be reached for the brackets %

PCSSY1_FASTUP    AT %LazerSafe.PCSSgD_in0.0; * LazerSafe.PCSSgD_in0.0 bracket Y1 fast up jog request
PCSSY1_SLOWUP    AT %LazerSafe.PCSSgD_in0.1; * LazerSafe.PCSSgD_in0.1 bracket Y1 slow up jog request
PCSSY1_SLOWDOWN  AT %LazerSafe.PCSSgD_in0.2; * LazerSafe.PCSSgD_in0.2 bracket Y1 slow down jog request
PCSSY1_FASTDOWN  AT %LazerSafe.PCSSgD_in0.3; * LazerSafe.PCSSgD_in0.3 bracket Y1 fast down jog request
PCSSY2_FASTUP    AT %LazerSafe.PCSSgD_in0.4; * LazerSafe.PCSSgD_in0.0 bracket Y2 fast up jog request
PCSSY2_SLOWUP    AT %LazerSafe.PCSSgD_in0.5; * LazerSafe.PCSSgD_in0.1 bracket Y2 slow up jog request
PCSSY2_SLOWDOWN  AT %LazerSafe.PCSSgD_in0.6; * LazerSafe.PCSSgD_in0.2 bracket Y2 slow down jog request
PCSSY2_FASTDOWN  AT %LazerSafe.PCSSgD_in0.7; * LazerSafe.PCSSgD_in0.3 bracket Y2 fast down jog request
PCSS_STORE       AT %LazerSafe.PCSSgD_in0.8; * LazerSafe.PCSSgD_in0.8 bracket store request
PCSS_homing      AT %LazerSafe.PCSSgD_in0.9; * LazerSafe.PCSSgD_in0.9 bracket homing request
PCSS_GOTOQUOTA   AT %LazerSafe.PCSSgD_in0.10; * LazerSafe.PCSSgD_in0.10 braket positioning request
PCSS_LAZER_ALIGN AT %LazerSafe.PCSSgD_in0.11; * LazerSafe.PCSSgD_in0.11 Alignement Request

PCSS_OY1_LIMITUP    AT %LazerSafe.PCSSgD_out0.0; * LazerSafe.PCSSgD_out0.0 transmitter bracket is on upper limit switch
PCSS_OY1_ATHOME     AT %LazerSafe.PCSSgD_out0.1; * LazerSafe.PCSSgD_out0.1 transmitter bracket is in home position
PCSS_OY1_ONQUOTA    AT %LazerSafe.PCSSgD_out0.2; * LazerSafe.PCSSgD_out0.2 transmitter bracket is in position
PCSS_OY1_MOVINGUP   AT %LazerSafe.PCSSgD_out0.3; * LazerSafe.PCSSgD_out0.3 transmitter bracket is moving up
PCSS_OY1_MOVINGDOWN AT %LazerSafe.PCSSgD_out0.4; * LazerSafe.PCSSgD_out0.4 transmitter bracket is moving down
PCSS_OY1_STALLED    AT %LazerSafe.PCSSgD_out0.5; * LazerSafe.PCSSgD_out0.5 transmitter bracket STALLED
PCSS_OY1_TIMEOUT    AT %LazerSafe.PCSSgD_out0.6; * LazerSafe.PCSSgD_out0.6 transmitter bracket TIMEOUT
PCSS_OY1_ENC_PF     AT %LazerSafe.PCSSgD_out0.7; * LazerSafe.PCSSgD_out0.7 transmitter bracket encoder power fail
PCSS_OY1_MAIN_PF    AT %LazerSafe.PCSSgD_out0.8; * LazerSafe.PCSSgD_out0.8 transmitter bracket main power fail
PCSS_OY1_EEPROM_OK  AT %LazerSafe.PCSSgD_out0.9; * LazerSafe.PCSSgD_out0.9 transmitter bracket eeprom ok
PCSS_OY1_LIMITDOWN  AT %LazerSafe.PCSSgD_out0.10; * LazerSafe.PCSSgD_out0.10 transmitter bracket AT LOWER limit
PCSS_OY1_POSFAULT   AT %LazerSafe.PCSSgD_out0.11; * LazerSafe.PCSSgD_out0.11 transmitter bracket positionig error
PCSS_OY1_POSGOOD    AT %LazerSafe.PCSSgD_out0.12; * LazerSafe.PCSSgD_out0.12 transmitter bracket positioning done

PCSS_OY2_LIMITUP    AT %LazerSafe.PCSSgD_out0.16; * LazerSafe.PCSSgD_out0.16 receiver bracket is on upper limit switch
PCSS_OY2_ATHOME     AT %LazerSafe.PCSSgD_out0.17; * LazerSafe.PCSSgD_out0.17 receiver bracket is in home position
PCSS_OY2_ONQUOTA    AT %LazerSafe.PCSSgD_out0.18; * LazerSafe.PCSSgD_out0.18 receiver bracket is in position
PCSS_OY2_MOVINGUP   AT %LazerSafe.PCSSgD_out0.19; * LazerSafe.PCSSgD_out0.19 receiver bracket is moving up
PCSS_OY2_MOVINGDOWN AT %LazerSafe.PCSSgD_out0.20; * LazerSafe.PCSSgD_out0.20 receiver bracket is moving down
PCSS_OY2_STALLED    AT %LazerSafe.PCSSgD_out0.21; * LazerSafe.PCSSgD_out0.21 receiver bracket STALLED
PCSS_OY2_TIMEOUT    AT %LazerSafe.PCSSgD_out0.22; * LazerSafe.PCSSgD_out0.22 receiver bracket TIMEOUT
PCSS_OY2_ENC_PF     AT %LazerSafe.PCSSgD_out0.23; * LazerSafe.PCSSgD_out0.23 receiver bracket encoder power fail
PCSS_OY2_MAIN_PF    AT %LazerSafe.PCSSgD_out0.24; * LazerSafe.PCSSgD_out0.24 receiver bracket main power fail
PCSS_OY2_EEPROM_OK  AT %LazerSafe.PCSSgD_out0.25; * LazerSafe.PCSSgD_out0.25 receiver bracket eeprom ok
PCSS_OY2_LIMITDOWN  AT %LazerSafe.PCSSgD_out0.26; * LazerSafe.PCSSgD_out0.26 receiver bracket AT LOWER limit
PCSS_OY2_POSFAULT   AT %LazerSafe.PCSSgD_out0.27; * LazerSafe.PCSSgD_out0.27 receiver bracket positionig error
PCSS_OY2_POSGOOD    AT %LazerSafe.PCSSgD_out0.28; * LazerSafe.PCSSgD_out0.28 receiver bracket positioning done
PCSS_ALIGNMENT_DONE AT %LazerSafe.PCSSgD_out0.30; * LazerSafe.PCSSgD_out0.30 Alignment Done timeout 10S
END_VAR

* Autotuning input registers

#defcom %at_sinc.out_reg.0      AT-PLC Slow rising pressure from autotuning
#defcom %at_sinc.out_reg.1      AT-PLC Fast rising pressure from autotuning
#defcom %at_sinc.out_reg.2      AT-PLC Slow descent pressure from autotuning
#defcom %at_sinc.out_reg.3      AT-PLC Fast descent pressure from autotuning
#defcom %at_sinc.out_reg.4      AT-PLC Descent (and rise) valves slow from autotuning
#defcom %at_sinc.out_reg.5      AT-PLC Fast descent valves for autotuning
#defcom %at_sinc.out_reg.6      AT-PLC Fast rising valves for autotuning
#defcom %at_sinc.out_reg.20     AT-PLC Autotuning cycle in progress
#defcom %at_sinc.out_reg.21     AT-PLC Autotuning cycle completed OK
#defcom %at_sinc.out_reg.22     AT-PLC Autotuning cycle terminated with error

#defcom %at_dat.atFlags.0       PAR-PLC Enable autotuning simulation
#defcom %at_dat.atFlags.1       PAR-PLC Enable IMIN search
#defcom %at_dat.atFlags.2       PAR-PLC Enable IMAX search
#defcom %at_dat.atdummy_d.0     PAR-PLC Disables AutoTuning with Tools

#defcom %at_dat.FsCorrente      AT-PLC Full Scale Full Current Driver Proportional Valves Y1 and Y2, fixed at 2800mA
#defcom %at_dat.IMinD_a         AT-PLC Minimum current Y1 down from autotuning
#defcom %at_dat.IMinD_b         AT-PLC Minimum current Y2 down from autotuning
#defcom %at_dat.IMinS_a         AT-PLC Minimum current Y1 rising from autotuning
#defcom %at_dat.IMinS_b         AT-PLC Minimum current Y2 rising from autotuning
#defcom %at_dat.IMaxD_a         AT-PLC Maximum current Y1 down from autotuning
#defcom %at_dat.IMaxD_b         AT-PLC Maximum current Y2 down from autotuning
#defcom %at_dat.IMaxS_a         AT-PLC Maximum current Y1 rising from autotuning
#defcom %at_dat.IMaxS_b         AT-PLC Maximum current Y2 rising from autotuning
#defcom %at_dat.atdummy_c       PAR-PLC PWM frequency pressure and crowning

#defcom %at_dat.atdummy_d.1     PAR-PLC Enable Closed Loop Spool Valves without control but with Emergency OK

* Output registers for autotuning

#defcom %at_sinc.in_reg.0       PLC-AT Enable autotuning cycle
#defcom %at_sinc.in_reg.1       PLC-AT Start step up / down autotuning
#defcom %at_sinc.in_reg.2       PLC-AT Positioning of the axes started by autotuning
#defcom %at_sinc.in_reg.3       PLC-AT Active simulation for autotuning
#defcom %at_sinc.in_reg.6       PLC-AT Axis positioning terminated for autotuning

* Input registers for LC angle sensor

#defcom %dwFlagCOPRA_LC.0             PAR-PLC Enable LC-LS angle sensor
#defcom %dwFlagCOPRA_LC.1             PAR-PLC Standard angle sensor LC mode
#defcom %dwFlagCOPRA_LC.2             PAR-PLC Enable LS angle sensor
#defcom %dwFlagCOPRA_LC.3             PAR-PLC Multiple photo mode LC angle sensor
#defcom %dwFlagCOPRA_LC.4             PAR-PLC Enable LC1 angle sensor
#defcom %parsensLC.nNumeroTentativiLC PAR-PLC Number of angle sensor attempts LC

* Input logs from Fiessler

#defcom %Fpsc.OutputRegister0         FPSC-PLC Alarms 0-15 from Fiessler
#defcom %Fpsc.OutputRegister1         FPSC-PLC Alarms 16-31 from Fiessler

* Led Bar Logs

#defcom %WilaObjectList0.WilaObjLength    Station width 1
#defcom %WilaObjectList1.WilaObjLength    Station width 2
#defcom %WilaObjectList2.WilaObjLength    Station width 3
#defcom %WilaObjectList3.WilaObjLength    Station width 4
#defcom %WilaObjectList4.WilaObjLength    Station width 5
#defcom %WilaObjectList5.WilaObjLength    Station width 6
#defcom %WilaObjectList6.WilaObjLength    Station width 7
#defcom %WilaObjectList7.WilaObjLength    Station width 8
#defcom %WilaObjectList8.WilaObjLength    Piece Width
#defcom %WilaObjectList9.WilaObjLength    Maximum width of the LED bar
#defcom %WilaGroupListA0.WilaGrpObjNumber PLC-DLL Index of graphic object 1 to be combined
#defcom %WilaGroupListA1.WilaGrpObjNumber PLC-DLL Index of graphic object 2 to be combined
#defcom %WilaGroupListA2.WilaGrpObjNumber PLC-DLL Index of graphic object 3 to be combined
#defcom %WilaGroupListA3.WilaGrpObjNumber PLC-DLL Index of graphic object 4 to be combined
#defcom %WilaGroupListA4.WilaGrpObjNumber PLC-DLL Index of graphic object 5 to be combined
#defcom %WilaGroupListA5.WilaGrpObjNumber PLC-DLL Index of graphic object 6 to be combined
#defcom %WilaGroupListA6.WilaGrpObjNumber PLC-DLL Index of graphic object 7 to be combined
#defcom %WilaGroupListA7.WilaGrpObjNumber PLC-DLL Index of graphic object 8 to be combined
#defcom %WilaGroupListA8.WilaGrpObjNumber PLC-DLL Index of graphic object 9 to be combined
#defcom %WilaGroupListA9.WilaGrpObjNumber PLC-DLL Index of graphic object 10 to be combined
#defcom %WilaGroupListA0.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 1
#defcom %WilaGroupListA1.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 2
#defcom %WilaGroupListA2.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 3
#defcom %WilaGroupListA3.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 4
#defcom %WilaGroupListA4.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 5
#defcom %WilaGroupListA5.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 6
#defcom %WilaGroupListA6.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 7
#defcom %WilaGroupListA7.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 8
#defcom %WilaGroupListA8.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 9
#defcom %WilaGroupListA9.WilaGrpStartPos  PLC-DLL Starting position of the graphic object 10
#defcom %WilaObjectList0.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList1.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList2.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList3.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList4.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList5.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList6.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList7.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList8.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaObjectList9.WilaObjType      PLC-DLL Type of display 0 = OFF 1 = ON 2 = FRONT 3 = BACK 4 = BLINKING 5 = NUMBER
#defcom %WilaAckState                     Acknowledge LED bar
#defcom %WilaReqState                     LED Bar Status requested
#defcom %WilaError                        LED Bar Error Code

* Registers for communication with Moses

#defcom %moses.PlcToUiMoses.0             PLC-UI On the rising edge UI send to MOSES the message of machine in RUN - On the descent edge UI send to MOSES the message of machine in STANDBY
#defcom %moses.PlcToUiMoses.1             PLC-UI On the rising edge UI send to MOSES the message of bend done

#defcom %moses.UiToPlcMoses.0             UI-PLC Set to 1 when the Moses START button is pressed, set to 0 when is released
#defcom %moses.UiToPlcMoses.1             UI-PLC Set to 1 when the Moses STOP button is pressed, set to 0 when is released

* User options

#defcom %CNInfo.UserOptions.27 Esa LED bar option enabled
#defcom %CNInfo.UserOptions.28 Wila LED bar option enabled
#defcom %CNInfo.UserOptionsExt.9 Motorized brackets option enabled

