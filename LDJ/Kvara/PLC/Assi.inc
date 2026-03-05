* Definizione simboli per blocchi gestione assi da PLC

BCO_GRANTPLC    AT %cnfb24.28; * cnfb24.28 conferma processo gestito da PLC
BCO_PEXEC       AT %cnfb24.29; * cnfb24.29 Exec procedura attivo da slave
BCO_CNREQ       AT %cnfb24.30; * cnfb24.30 processo richiesto dal canale

BCI_PLCREQ      AT %cnfb23.28; * cnfb23.28 Richiesta gestione processo da PLC
BCI_PSTART      AT %cnfb23.29; * cnfb23.29 Esecuzione comando impostato da PLC
BCI_HALT        AT %cnfb23.30; * cnfb23.30 Abort comando impostato da PLC

BAI_SETALARM    AT %ra0.27; * ra0.27 Richiesta allarme asse
BAI_START       AT %ra0.29; * ra0.29 Esecuzione comando impostato da PLC
BAI_HALT        AT %ra0.30; * ra0.30 Abort comando impostato da PLC
BAI_VOLTS       AT %ra0.31; * ra0.31 Rotaz. speed in Volts (JOG open mandrino)

BAO_ALRM        AT %ra8.2;  * ra8.2 arresto per allarme terminato
BAO_ARUN        AT %ra8.7;  * ra8.7 arresto per allarme in corso

CO_ANGM19       AT %rc38; * rc38 Angolo orientamento mandrino M19
AI_SPEED        AT %ra32; * ra32 Velocità rotazione al mandrino (rpm)

* Registri FB asse
FB_CODE         AT %fb0; * fb0 Codice Operativo comando
FB_QUOTA        AT %fb1; * fb1 Quota target assoluta (0.001 mm)
FB_QUOTADEG     AT %fb1; * fb1 Quota target assoluta (0.1 deg)
FB_TOOL         AT %fb1; * fb1 Numero utensile corrente 1-12
FB_VEL          AT %fb2; * fb2 Velocita' posizionamento (mm/min)
FB_VELRPM       AT %fb2; * fb2 Velocita' posizionamento (rpm)
FB_VMAX         AT %fb3; * fb3 Velocita' massima (mm/min)
FB_VMAXRPM      AT %fb3; * fb3 Velocita' massima (rpm)
FB_VSTOP        AT %fb3; * fb3 Velocita' arresto mandrino (rpm)
FB_ACCEL        AT %fb4; * fb4 Accelerazione (msec o mm/s2)
FB_ACCELREV     AT %fb4; * fb4 Accelerazione (msec o rev/s2)
FB_DECEL        AT %fb5; * fb5 Decelerazione (msec o mm/s2)
FB_DECELREV     AT %fb5; * fb5 Decelerazione (msec o rev/s2)
FB_RAMPES       AT %fb6; * fb6 Tempo Rampe S (msec o mm/s3)
FB_RAMPESREV    AT %fb6; * fb6 Tempo Rampe S (msec o rev/s3)
FB_TOLLP        AT %fb7; * fb7 Tolleranza (0.001 mm)
FB_TOLLDEG      AT %fb7; * fb7 Tolleranza (0.1 deg)
FB_GAINP        AT %fb8; * fb8 Guadagno P (0.001 DAC/pulses o 0.001 sec-1)
FB_GAINV        AT %fb9; * fb9 Feed forward (0.001 DAC/(pulses/sec) o 0.1 %)
FB_FLWERREV     AT %fb9; * fb9 Errore inseguimento limite (pulses o 0.001 rev)
FB_TARGR        AT %fb10; * fb10 Numero utensile target (1-12)
FB_EFS          AT %fb11; * fb11 Tensione di fondo scala (mV)

FB_ERRCODE      AT %fb14; * fb14 Codice errore procedura
FB_STCTRL       AT %fb16; * fb16 Stato controlli AX_CONTROLS

* Registri FB processo ausiliario
CNFB_CODE       AT %cnfb0; * cnfb0 Codice Operativo comando
CNFB_MPROC      AT %cnfb1; * cnfb1 Processo principale comando
CNFB_PAR2       AT %cnfb2; * cnfb2 Parametro 2 FB processo aux
CNFB_PAR3       AT %cnfb3; * cnfb3 Parametro 3 FB processo aux
CNFB_PAR4       AT %cnfb4; * cnfb4 Parametro 4 FB processo aux
CNFB_PAR5       AT %cnfb5; * cnfb5 Parametro 5 FB processo aux
CNFB_PAR6       AT %cnfb6; * cnfb6 Parametro 6 FB processo aux
CNFB_PAR7       AT %cnfb7; * cnfb7 Parametro 7 FB processo aux
CNFB_PAR8       AT %cnfb8; * cnfb8 Parametro 8 FB processo aux
CNFB_PAR9       AT %cnfb9; * cnfb9 Parametro 9 FB processo aux

CNFB_ERRCODE    AT %cnfb25; * cnfb25 Codice errore procedura

CC_MAINPROC     AT %cc15; * cc15 Processo principale canale
CP_VELMAX       AT %pc8; * pc8 Velocità massima canale

* Parametri assi-mandrini

AP_AXTYPE       AT %pa0; * pa0 Tipo asse
AP_ACCEL        AT %pa1; * pa1 Accelerazione massima
AP_DECEL        AT %pa2; * pa2 Decelerazione massima
AP_TOLLERG      AT %pa6; * pa6 Quota tolleranza grossolana
AP_VELMAX       AT %pa9; * pa9 Velocità massima
AP_KPGAIN       AT %pa10; * pa10 Guadagno P
AP_KVFFGAIN     AT %pa12; * pa12 Feed forward
AP_TARTYPE      AT %pa16; * pa16 Tipo di taratura
AP_TARQUOTA     AT %pa18; * pa18 Quota di taratura
AP_VELMICRO     AT %pa19; * pa19 Velocità ricerca micro in taratura
AP_VELTACCA     AT %pa20; * pa20 Velocità ricerca tacca in taratura
AP_MINQUOTA     AT %pa21; * pa21 Quota minima
AP_MAXQUOTA     AT %pa22; * pa22 Quota massima
AP_VELMAN       AT %pa23; * pa23 Velocità di JOG
AP_MINICS       AT %pa24; * pa24 Vel min in regime di tempo cost. [mm/min]
AP_JERK         AT %pa25; * pa25 Jerk massimo
AP_OFFSET       AT %pa28; * pa28 Tensione massimo recupero offset (V)
AP_PARKQTA      AT %pa31; * pa31 Quota di parcheggio
AP_AXNGANTRY    AT %pa47; * pa47 Indice tabella gantry
AP_ICSTIME      AT %pa48; * pa48 Tempo addiz. in regime di tempo cost. [ms]

AP_DRVTYPE      AT %nvel11; * nvel11 Tipo drive (0=analogico)

DC_DACREF       AT %dDacRef; * dDacRef Tensione a Vel. Max (mVolt)

SP_ACCEL        AT %pa1; * pa1 Accelerazione massima
SP_DECEL        AT %pa2; * pa2 Decelerazione massima
SP_SSERR        AT %pa5; * pa5 Errore inseguimento massimo
SP_TOLLERG      AT %pa6; * pa6 Quota tolleranza grossolana
SP_VELMAX       AT %pa9; * pa9 Velocità massima
SP_KPGAIN       AT %pa10; * pa10 Guadagno P
SP_VELMICRO     AT %pa19; * pa19 Velocità ricerca micro mandrino (rpm)
SP_VELTACCA     AT %pa20; * pa20 Velocità ricerca tacca mandrino (rpm)
SP_VEL10V       AT %pa21; * pa21 Velocità 10 Volt mandrino (rpm)
SP_N1           AT %pa23; * pa23 Rapporto trasm. gamma 1 mandrino (1/1000)
SP_JERK         AT %pa25; * pa25 Jerk massimo
SP_VELJOG       AT %pa36; * pa36 Velocità JOG mandrino (rpm)
SP_VELM19       AT %pa37; * pa37 Velocità mandrino in orientamento (rpm)

NV_TOLLERG      AT %pa2; * pa2 Quota tolleranza grossolana (NVEL)
NV_VELMAX       AT %pa4; * pa4 Velocità massima (NVEL)
NV_TARTYPE      AT %pa6; * pa6 Tipo di taratura (NVEL)
NV_TARQUOTA     AT %pa7; * pa7 Quota di taratura (NVEL)
NV_VELMICRO     AT %pa8; * pa8 Velocità ricerca micro in taratura (NVEL)
NV_VELTACCA     AT %pa9; * pa9 Velocità ricerca tacca in taratura (NVEL)
NV_MAXQUOTA     AT %pa11; * pa11 Quota massima (NVEL)

* Parametri per revolver

CC_MAG          AT %cc25; * cc25 Tipo magazzino utensile (1=revolver)
CC_RV           AT %cc26; * cc26 Numero magazzino utensile associato al canale

RV_VELLIM       AT %rv.prv3; * prv3 Velocità limite revolver (rpm)
RV_ACCTIME      AT %rv.prv4; * prv4 Tempo accelerazione
RV_DECTIME      AT %rv.prv5; * prv5 Tempo decelerazione
RV_DELAYS       AT %rv.prv6; * prv6 Tempo di rampa S
RV_GAINP        AT %rv.prv7; * prv7 Guadagno P
RV_FWERR        AT %rv.prv8; * prv8 Massimo errore inseguimento
RV_TOLLERF      AT %rv.prv9; * prv9 Quota di tolleranza fine (gradi)
RV_TARQUOTA     AT %rv.prv10; * prv10 Quota di taratura
RV_PARKQTA      AT %rv.prv11; * prv11 Quota di parcheggio
RV_VELPOS       AT %rv.prv12; * prv12 Velocità in orientamento
RV_VELJOG       AT %rv.prv13; * prv13 Velocità in JOG
RV_VELCYCLE     AT %rv.prv14; * prv14 Velocità in SINGLE CYCLE

TDYN_VELLIM     AT %dy0; * dy0 Velocità limite
TDYN_ACCTIME    AT %dy1; * dy1 Tempo accelerazione
TDYN_DECTIME    AT %dy2; * dy2 Tempo decelerazione
TDYN_DELAYS     AT %dy3; * dy3 Tempo di rampa S
TDYN_GAINP      AT %dy4; * dy4 Guadagno P
TDYN_FWERR      AT %dy5; * dy5 Massimo errore inseguimento
TDYN_TOLLERF    AT %dy6; * dy6 Quota di tolleranza fine (gradi)
TDYN_VELPOS     AT %dy7; * dy7 Velocità in orientamento (rpm)

* Parametri per assi gantry

GDAT1           AT %Gdat1; * Gdat1 Tolleranza Warning
GDAT2           AT %Gdat2; * Gdat2 Tolleranza Allarme
GDAT3           AT %Gdat3; * Gdat3 Tolleranza Allarme REF
GDAT4           AT %Gdat4; * Gdat4 Guadagno Bilanciamento
GDAT5           AT %Gdat5; * Gdat5 Frequenza Taglio
GDAT6           AT %Gdat6; * Gdat6 Tipo taratura (0=standard, 1=con 1 finecorsa)

* Usati dal blocco AX_FROM_ISO
CA_REQUEST      AT %canopen15.17; * canopen15.17 Richiesta comando asse da ISO
CA_FINISH       AT %canopen14.29; * canopen14.29 Comando asse da ISO completato
CA_CODE         AT %canopen0; * canopen0 Codice Operativo comando da ISO
CA_QUOTA        AT %canopen1; * canopen1 Quota target da ISO
CA_VEL          AT %canopen2; * canopen2 Velocita' posizionamento da ISO
CA_VMAX         AT %canopen3; * canopen3 Velocita' massima da ISO
CA_ACCEL        AT %canopen4; * canopen4 Accelerazione da ISO
CA_DECEL        AT %canopen5; * canopen5 Decelerazione da ISO
CA_RAMPES       AT %canopen6; * canopen6 Tempo Rampe S da ISO
CA_TOLLP        AT %canopen7; * canopen7 Tolleranza da ISO


