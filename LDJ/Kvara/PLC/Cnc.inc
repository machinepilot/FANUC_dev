* File CNC.INC: Segnali interfaccia con CN

*********************************************
********** SEGNALI SPECIALI CNC *************
*********************************************

ALWAYS_ZERO     AT %PLCFLAGS.0; * PLCFLAGS.0  Flag sempre stato off
ALWAYS_ONE      AT %PLCFLAGS.1; * PLCFLAGS.1  Flag sempre stato on
ON_ONE_SCAN     AT %PLCFLAGS.8; * PLCFLAGS.8  Flag on alla prima scansione PLC
ERROR_CALC_S    AT %PLCFLAGS.3; * PLCFLAGS.3  Flag errore calcolo PLC slow
NORMAL_BLINK    AT %PLCFLAGS.10; * PLCFLAGS.10 Lampeggio normale (0.5 sec.)

PLUS_12V_OFF    AT %MFB_VNOK.0; * MFB_VNOK.0 Tensione +12 volt fuori limite(aliment.analogiche) (CN->PLC)
MINUS_12V_OFF   AT %MFB_VNOK.1; * MFB_VNOK.1 Tensione -12 volt fuori limite(aliment.analogiche) (CN->PLC)
POW_SUP_5V_OFF  AT %MFB_VNOK.2; * MFB_VNOK.2 Tensione   5 volt fuori limite (aliment.encoder) (CN->PLC)
LOW_BATTERY     AT %MFB_VNOK.3; * MFB_VNOK.3 Batteria CN scarica (CN->PLC)
OVERHEATING_CN  AT %MFB_VNOK.7; * MFB_VNOK.7 Sovratemperatura CN (CN->PLC)

**************************************
********** PLC -> CANALI *************
**************************************

BCI_RESET       AT %rc0.0; * rc0.0  Reset NC
BCI_EMERG       AT %rc0.1; * rc0.1  Emergenza
BCI_START       AT %rc0.2; * rc0.2  NC-start
BCI_STOP        AT %rc0.3; * rc0.3  Richiesta HOLD

BCI_ACK_M       AT %rc0.5; * rc0.5  Conferma funzione M ricevuta
BCI_ACK_S       AT %rc0.6; * rc0.6  Conferma funzione S ricevuta
BCI_ACK_T       AT %rc0.7; * rc0.7  Conferma funzione T ricevuta
BCI_TAR         AT %rc0.8; * rc0.8  Selettore modi operativi su REF (taratura)
BCI_MAN         AT %rc0.9; * rc0.9  Selettore modi operativi su JOG (manuale)
BCI_INC         AT %rc0.10; * rc0.10  Selettore modi operativi su INC (inc.fissi)
BCI_MDI         AT %rc0.11; * rc0.11  Selettore modi operativi su MDI (semiautom)
BCI_AUT         AT %rc0.12; * rc0.12  Selettore modi operativi su AUT (automatic)
BCI_STEP        AT %rc0.13; * rc0.13  DEBUG: esegui un solo blocco
BCI_STEPIN      AT %rc0.14; * rc0.14  DEBUG: esegui un solo blocco entrando nelle subroutine
BCI_REPOS       AT %rc0.15; * rc0.15  Richiesta recover dopo Hold
BCI_BLKSING     AT %rc0.17; * rc0.17  Abilita esecuzione blocco Singolo
BCI_BLKSWTCH    AT %rc0.18; * rc0.18  Abilita esecuzione blocco Barrato
BCI_DRYRUN      AT %rc0.19; * rc0.19  Abilita esecuzione dry Run
BCI_VISLOC      AT %rc0.20; * rc0.20  Abilita vis. quote in riferimento pezzo
BCI_TEST        AT %rc0.21; * rc0.21  Abilita esecuzione simulata
BCI_JOGOPEN     AT %rc0.22; * rc0.22  Abilita esecuzione JOG a Loop Aperto
BCI_STEPOUT     AT %rc0.23; * rc0.23  DEBUG: esegui fino al termine della funzione
BCI_RICBLOCCO   AT %rc0.24; * rc0.24  Ricerca blocco
BCI_I_ENDCOM    AT %rc0.25; * rc0.25  Annulla percorso residuo
BCI_ACK_PLC_SYNC AT %rc0.26; * rc0.26 ACK Full-handshake Motion block
BCI_OVERSTORE   AT %rc0.27; * rc0.27  Abilita procedura di overstore
BCI_JOGMTXON    AT %rc0.28; * rc0.28  Utilizza matrici dinamiche per il JOG
BCI_ACK_GET     AT %rc0.29; * rc0.29  ACK per GET resource
BCI_STEP_MOTION AT %rc0.30; * rc0.30  Abil. Full-handshake Motion block

CI_NUMPPGM      AT %rc1; * rc1  Numero part program selezionato per esec
CI_OVRD1        AT %rc2; * rc2  Override avanzamento
CI_FIXINCR      AT %rc4; * rc4  Quota per incrementi fissi
CI_JOGOPEN      AT %rc5; * rc5  Tensione JOG a Loop Aperto
CI_ENDISFNZ     AT %rc6; * rc6  Abilitazione Disabilitazione Funzioni

BCI_ENABVTL     AT %rc6.0; * rc6.0 Abilita gestione conteggio vita utensile (PLC->CN)
BCI_RESETVTL    AT %rc6.1; * rc6.1 Reset vita ed usura utensile (PLC->CN)
BCI_DISALVTL    AT %rc6.2; * rc6.2 Disabilita allarme vita ed usura utensile (PLC->CN)
BCI_ENSGNVTL    AT %rc6.3; * rc6.3 Abilita segnalazione vita utensile (PLC->CN)

BCI_PARKAX_X    AT %rc7.0; * rc7.0  Abilitazione Parcheggio Asse X
BCI_PARKAX_Y    AT %rc7.1; * rc7.1  Abilitazione Parcheggio Asse Y
BCI_PARKAX_Z    AT %rc7.2; * rc7.2  Abilitazione Parcheggio Asse Z
BCI_PARKAX_U    AT %rc7.3; * rc7.3  Abilitazione Parcheggio Asse U
BCI_PARKAX_V    AT %rc7.4; * rc7.4  Abilitazione Parcheggio Asse V
BCI_PARKAX_W    AT %rc7.5; * rc7.5  Abilitazione Parcheggio Asse W
BCI_PARKAX_A    AT %rc7.6; * rc7.6  Abilitazione Parcheggio Asse A
BCI_PARKAX_B    AT %rc7.7; * rc7.7  Abilitazione Parcheggio Asse B
BCI_PARKAX_C    AT %rc7.8; * rc7.8  Abilitazione Parcheggio Asse C

BCI_RT_ENABLE   AT %rc64.0; * rc64.0  Retrace enable
BCI_RT_ELECT    AT %rc64.1; * rc64.1  Retrace elect
BCI_RT_RUN      AT %rc64.2; * rc64.2  Retrace run
BCI_RT_FWD_PLAY AT %rc64.25; * rc64.25 Comando forward retrace
BCI_RT_REV_PLAY AT %rc64.26; * rc64.26 Comando reverse retrace
BCI_RT_DRYRUN   AT %rc64.28; * rc64.28 Comando retrace dry run (rapido)

CI_RT_DRUN_FEED AT %rc69; * rc69 Velocità dry run (rapido) per retrace

BCI_PASSTHRU    AT %rc84.31; * rc84.31 Abilita esecuzione passante

CI_BS_NUMLINE   AT %BlkSearch.Numline; * Numero linea per ricerca blocco
CI_BS_NUMIT     AT %BlkSearch.NumIt; * Numero iterazioni per ricerca blocco
CI_BS_VELAT     AT %BlkSearch.VelAt; * Velocità di attacco al pezzo dopo ricerca blocco
CI_BS_AUXCMD    AT %BlkSearch.AuxCmd.0; * Attacco al pezzo all'inizio del blocco ricercato
CI_BS_OPTION    AT %BlkSearch.Option; * Opzioni ricerca blocco

CI_CURRLEVBLCK  AT %lev0.curline; * lev0.curline Numero blocco in esecuzione

**************************************
********** CANALI -> PLC *************
**************************************


CO_STATREG      AT %rc8; * rc8 Registro stato canale

BCO_PRGRUN      AT %rc8.0; * rc8.0  Programma in corso
BCO_PRGINT      AT %rc8.1; * rc8.1  Programma interrotto
BCO_CANREADY    AT %rc8.2; * rc8.2  Canale Ready
BCO_IN_ALARM    AT %rc8.3; * rc8.3  Canale in allarme
BCO_STB_M       AT %rc8.4; * rc8.4  Strobe delle funzioni M
BCO_STB_S       AT %rc8.5; * rc8.5  Strobe delle funzioni S
BCO_STB_T       AT %rc8.6; * rc8.6  Strobe delle funzioni T
BCO_BLKRIC      AT %rc8.8; * rc8.8  Ricerca blocco in corso
BCO_O_ENDCOM    AT %rc8.9; * rc8.9  Stato annulla percorso residuo attivo
BCO_O_REPOS     AT %rc8.11; * rc8.11 Ciclo Repos in corso
BCO_BPTRUE      AT %rc8.12; * rc8.12 Breakpoint attivo in debug mode
BCO_WAIT        AT %rc8.13; * rc8.13 Attesa comando di debug
BCO_ENDSEARCH   AT %rc8.15; * rc8.15 Fine ricerca blocco
BCO_STB_PLC_SYNC AT %rc8.16; * rc8.16 Strobe Full-Handshake Motion blocks
BCO_STB_GET     AT %rc8.17; * rc8.17 Strobe per GET resources
BCO_CUSTOM_BOOT AT %rc8.18; * rc8.18 Ciclo $BOOT in corso
BCO_CUSTOM_START AT %rc8.19; * rc8.19 Ciclo $START in corso
BCO_CUSTOM_RESET AT %rc8.20; * rc8.20 Ciclo $RESET in corso
BCO_IDLE        AT %rc8.21; * rc8.21 Stato IDLE (in attesa di comandi) attivo
BCO_PREALVTL    AT %rc8.22; * rc8.22 Segnalazione preallarme vita utensile (CN->PLC)
BCO_ALARMVTL    AT %rc8.23; * rc8.23 Segnalazione allarme vita utensile (CN->PLC)
BCO_END_AUXCMD  AT %rc8.24; * rc8.24 Posiz. assi a inizio blocco (AuxCmd) terminato
BCO_END_OVERST  AT %rc8.25; * rc8.25 Esecuzione ciclo Overstore terminata

CO_MFUN         AT %rc9; * rc9 Registro funzioni M
CO_TFUN         AT %rc11; * rc11 Registro funzioni T
CO_VELMAND      AT %rc25; * rc25 Velocità mandrino 1 richiesta da canale (funzione S)
CO_VELMANDS2    AT %rc81; * rc81 Velocità mandrino 2 richiesta da canale (funzione S)
CO_VELMANDS3    AT %rc82; * rc82 Velocità mandrino 3 richiesta da canale (funzione S)

CO_MASKSP_S1    AT %rc39.9; * rc39.9 Funzioni M-S a mandrino S1
CO_MASKSP_S2    AT %rc39.10; * rc39.10 Funzioni M-S a mandrino S2
CO_MASKSP_S3    AT %rc39.11; * rc39.11 Funzioni M-S a mandrino S3

*********************************************
********** PLC -> ASSI/MANDRINI *************
*********************************************

BAI_CHAN        AT %ra0.0; * ra0.0 Chiusura anello di posizione
BAI_BLAV        AT %ra0.1; * ra0.1 Blocco Avanzamento
BAI_CENC        AT %ra0.2; * ra0.2 Abilita controllo encoder

BAI_GAMMA1      AT %ra0.3; * ra0.3 Gamma 1 selezionata
BAI_GAMMA2      AT %ra0.4; * ra0.4 Gamma 2 selezionata
BAI_GAMMA3      AT %ra0.5; * ra0.5 Gamma 3 selezionata
BAI_GAMMA4      AT %ra0.6; * ra0.6 Gamma 4 selezionata

BAI_AV          AT %ra0.8; * ra0.8 Comando avanti
BAI_IND         AT %ra0.9; * ra0.9 Comando indietro
BAI_FCHWAV      AT %ra0.10; * ra0.10 Finecorsa avanti
BAI_FCHWIN      AT %ra0.11; * ra0.11 Finecorsa indietro
BAI_STARTAR     AT %ra0.12; * ra0.12 Start taratura mandrino
BAI_FCRALL      AT %ra0.13; * ra0.13 Finecorsa Taratura

BAI_RESALARM    AT %ra0.15; * ra0.15 Ripristino allarme asse
BAI_ABORT       AT %ra0.16; * ra0.16 Fermata asse, annulla percorso residuo

BAI_UPDATE      AT %ra0.20; * ra0.20 Richiesta aggiornamento parametri
BAI_TARAIM      AT %ra0.24; * ra0.24 Selezione taratura immediata
BAI_TARADEC     AT %ra0.25; * ra0.25 Selezione taratura dichiarata
BAI_ACK_PLC_SYNC AT %ra0.26; * ra0.26 ACK Full-handshake Motion block asse
BAI_PLCREQ      AT %ra0.28; * ra0.28 Richiesta gestione asse da PLC

AI_OVRD         AT %ra1; * ra1  Override asse/mandrino
AI_QTAIMM       AT %ra2; * ra2  Quota taratura immediata


*********************************************
********** ASSI/MANDRINI -> PLC *************
*********************************************

BAO_AFET        AT %ra3.0; * ra3.0  Asse fermo teorico
BAO_AXAV        AT %ra3.2; * ra3.2  Direzione moto asse avanti
BAO_FPOS        AT %ra3.7; * ra3.7  Asse fuori quota di sorveglianza
BAO_FMIN        AT %ra3.8; * ra3.8  Limite Software indietro attivo
BAO_FMAX        AT %ra3.9; * ra3.9  Limite Software avanti attivo
BAO_ONMT        AT %ra3.10; * ra3.10  Richiesta abilitazione azionamento
BAO_ORDM        AT %ra3.13; * ra3.13  Ordine di moto
BAO_TARA        AT %ra3.14; * ra3.14  Asse tarato
BAO_ALLM        AT %ra3.15; * ra3.15  Asse in Allarme
BAO_GTRYLINK    AT %ra3.17; * ra3.17  Accoppiamento Gantry attivo

BAO_SPEEDOUT    AT %ra3.8; * ra3.8  Velocità misurata fuori tolleranza
BAO_MARG        AT %ra3.9; * ra3.9  Mandrino a regime
BAO_VLIM        AT %ra3.11; * ra3.11  Giri programmati troppo elevati

BAO_GRANTPLC    AT %ra3.28; * ra3.28 conferma asse gestito da PLC
BAO_PEXEC       AT %ra3.29; * ra3.29 Exec procedura attivo da slave
BAO_CNREQ       AT %ra3.30; * ra3.30 Asse/mandrino richiesto dal canale
BAO_REVOL       AT %ra3.31; * ra3.31 Selezione mandrino come revolver

AO_QUOTA        AT %ra4; * ra4  Quota asse
AO_VEL          AT %ra5; * ra5  Velocita` asse (micron/s)

BAO_FOLLWENC    AT %ra6.9; * ra6.9  Allarme per errore inseguimento
BAO_GTRYALRM    AT %ra6.19; * ra6.19 Allarme per disallineamento gantry
BAO_INS_POS     AT %ra8.14; * ra8.14 Conferma albero elettrico agganciato
BAO_SYNCUPDATE  AT %ra13.2; * ra13.2 Update dati asse effettuato
BAO_CHGCHKSUM   AT %ra13.5; * ra13.5 Parametri asse non modificati
BAO_FF_ON       AT %ra15.0; * ra15.0 Autoapprendimento maschiatura idraulica in corso

AO_REFDAC       AT %ra18; * ra18  Registro tensione DAC (mV)

BAO_ISO_NULLO   AT %ra19.0; * ra19.0 Stato NULLO all'interno del canale
BAO_ISO_JOG     AT %ra19.1; * ra19.1 Stato JOG all'interno del canale
BAO_ISO_REF     AT %ra19.2; * ra19.2 Stato REF all'interno del canale
BAO_ISO_INC     AT %ra19.3; * ra19.3 Stato INC all'interno del canale
BAO_ISO_ALARM   AT %ra19.4; * ra19.4 Stato ALLARME all'interno del canale

AO_RVQUOTA      AT %ra21; * ra21 Quota equivalente revolver

BAO_STB_PLC_SYNC AT %ra22.16; * ra22.16 strobe Full-handshake Motion block asse

*********************************************
********** PARAMETRI CANALI *****************
*********************************************

CC_MASKAXES     AT %cc1; * cc1 Maschera configurazione assi nel canale
CC_NX           AT %cc2; * cc2 Numero asse X in configurazione canale
CC_NY           AT %cc3; * cc3 Numero asse Y in configurazione canale
CC_NZ           AT %cc4; * cc4 Numero asse Z in configurazione canale
CC_NU           AT %cc5; * cc5 Numero asse U in configurazione canale
CC_NV           AT %cc6; * cc6 Numero asse V in configurazione canale
CC_NW           AT %cc7; * cc7 Numero asse W in configurazione canale
CC_NA           AT %cc8; * cc8 Numero asse A in configurazione canale
CC_NB           AT %cc9; * cc9 Numero asse B in configurazione canale
CC_NC           AT %cc10; * cc10 Numero asse C in configurazione canale
CC_NM           AT %cc11; * cc11 Numero asse S in configurazione canale
CC_S2           AT %cc12; * cc12 Numero asse S2 in configurazione canale
CC_S3           AT %cc13; * cc13 Numero asse S3 in configurazione canale

CP_VELDRY       AT %pc13; * pc13 Velocità per ciclo dry-run
CP_OPZIONI27    AT %pc14.27; * pc14.27 Abil. esecuzione passante da parametro

*********************************************
********** PARAMETRI ASSI/MANDRINI **********
*********************************************

AP_OPZIONI0     AT %pa3.0; * pa3.0 Bit inversione direzione taratura
NV_OPZIONI0     AT %pa1.0; * pa1.0 Bit inversione direzione taratura (NVEL)
AP_TIMERTOLL    AT %pa8; * pa8 Preset timer tolleranza
AP_OPZIONI31    AT %pa3.31; * pa3.31 Asse in simulato
AP_TIMERFRENO   AT %pa39; * pa39 Preset timer freno

*********************************************
********** PLC -> GUI-MONITOR ***************
*********************************************

PU_AXSEL        AT %ui8; * ui8 Asse selez. nel canale per visualizzazione cursore
PU_CHSEL        AT %ui9; * ui9 Canale selez. per visualizzazione

BPU_MONSENOVRSTR AT %ui12.0; * ui12.0 Richiesta caricamento dati overstore
BPU_MONEXECM01  AT %ui12.1; * ui12.1 Vis. selezione M01 attiva
BPU_MONOVRAUTO  AT %ui12.2; * ui12.2 Abil. overstore automatico

PU_LASTLINE     AT %ui13; * ui13 Ultima linea eseguita per ricerca blocco

BPU_UISTART     AT %bUiStart.0; * Comando START esec. passante

*********************************************
********** GUI-MONITOR -> PLC ***************
*********************************************

BUP_CHMON_ON    AT %ui16.0; * ui16.0  Pagina monitor canale attiva
BUP_SEL_REF     AT %ui16.1; * ui16.1 Modo REF selezionato da monitor canale
BUP_SEL_JOG     AT %ui16.2; * ui16.2 Modo JOG selezionato da monitor canale
BUP_SEL_INC     AT %ui16.3; * ui16.3 Modo INC selezionato da monitor canale
BUP_SEL_MDI     AT %ui16.4; * ui16.4 Modo MDI selezionato da monitor canale
BUP_SEL_AUT     AT %ui16.5; * ui16.5 Modo AUT selezionato da monitor canale
BUP_STEP        AT %ui16.10; * ui16.10 Selezione esecuzione passo singolo
BUP_BLOCK       AT %ui16.11; * ui16.11 Selezione esecuzione blocco barrato
BUP_DRYRUN      AT %ui16.12; * ui16.12 Selezione esecuzione DRY RUN
BUP_EXEM01      AT %ui16.13; * ui16.13 Selezione esecuzione arresto su M01
BUP_VISLOC      AT %ui16.14; * ui16.14 Selezione visualizz. quota in rif. pezzo
BUP_SIMUL       AT %ui16.15; * ui16.15 Selezione esecuzione simulata
BUP_JOGOPEN     AT %ui16.16; * ui16.16 Selezione esecuzione JOG a loop aperto
BUP_REPOS       AT %ui16.17; * ui16.17 Selezione esecuzione repos
BUP_RETRACE     AT %ui16.18; * ui16.18 Selezione esecuzione retrace
BUP_BLKSRC      AT %ui16.24; * ui16.24 Selezione esecuzione ricerca blocco
BUP_AUXCMD      AT %ui16.25; * ui16.25 Modalità AUXCMD selezionata
BUP_OVERSTORE   AT %ui16.26; * ui16.26 Richiesta procedura overstore
BUP_OVRSTRREADY AT %ui16.27; * ui16.27 Dati overstore pronti
BUP_SINGREF     AT %ui16.28; * ui16.28 Selezione REF singolo
BUP_PRESETREF   AT %ui16.29; * ui16.29 Impulso REF manuale (preset)

UP_SELCHAN      AT %ui17; * ui17 Canale selezionato da monitor canale
UP_AXSEL        AT %ui18; * ui18 Asse selezionato all'interno del canale
UP_FIXINCR      AT %ui22; * ui22 Quota per incrementi fissi
UP_JOGOPEN      AT %ui23; * ui23 Tensione per JOG OPEN (mVolt)
BUP_DEBUG_ON    AT %ui24.0; * ui24.0  Modo debug attivo (CN->PLC)
UP_NBLOCKSEARCH AT %ui27; * ui27 Numero riga ricerca blocco
UP_FEEDSEARCH   AT %ui28; * ui28 FEED Ricerca blocco
UP_NITERSEARCH  AT %ui29; * ui29 Iterazioni ricerca blocco
BUP_PASSTHRU    AT %ui30.0; * ui30.0 abil. esecuzione passante da UI

BUP_UIRUN       AT %bUiRun.0; * Esec. passante attiva

*********************************************
********** PLC -> PULS.AUX ******************
*********************************************

BPA_INSER1      AT %QPuls1.0; * QPuls1.0 Puls. aux inserita in pos. 1

PA_INCJOG       AT %QPuls2; * QPuls2 Quota incremento per posiz. da volantino

*********************************************
********** PULS.AUX -> PLC ******************
*********************************************

BAP_SEL_MOV     AT %IPuls2.9; * IPuls2.9 Movimentazione selezionata da puls. aux

BAP_SEL_REF     AT %IPuls3.0; * IPuls3.0 Modo REF selezionato da puls. aux
BAP_SEL_JOG     AT %IPuls3.1; * IPuls3.1 Modo JOG selezionato da puls. aux
BAP_JOGOPEN     AT %IPuls3.2; * IPuls3.2 Modo JOG OPEN selezionato da puls. aux
BAP_SEL_INC     AT %IPuls3.3; * IPuls3.3 Modo INC selezionato da puls. aux
BAP_SEL_MDI     AT %IPuls3.4; * IPuls3.4 Modo MDI selezionato da puls. aux
BAP_SEL_AUT     AT %IPuls3.5; * IPuls3.5 Modo AUT selezionato da puls. aux
BAP_SINGREF     AT %IPuls3.6; * IPuls3.6 Modo REF singolo selezionato da puls. aux

AP_QTAVOL       AT %IPuls1; * IPuls1 Quota da volantino (0-65535)
AP_MSKAXSEL     AT %IPuls5; * IPuls5 Asse selezionato da puls. aux (mask compatta)
AP_SELCHAN      AT %IPuls6; * IPuls6 Canale selezionato da puls. aux
AP_FIXINCR      AT %IPuls8; * IPuls8 Quota per incrementi fissi
AP_JOGOPEN      AT %IPuls9; * IPuls9 Tensione per JOG OPEN (mVolt)
AP_INCJOG       AT %IPuls11; * IPuls11 Quota incremento per posiz. da volantino

***********************************
********* MEM GENERALI ************
***********************************

AX_IN_ALARM     AT %rg0.0; * rg0.0 Asse in allarme
AX_ZEROED       AT %rg0.1; * rg0.1 Assi tarati
AX_STOPPED      AT %rg0.2; * rg0.2 Assi fermi
CUR_SPIN2       AT %rg0.3; * rg0.3 Mandrino corrente = S2
CUR_SPIN3       AT %rg0.4; * rg0.4 Mandrino corrente = S3
CH_IN_REPOS     AT %rg0.5; * rg0.5 Repos in corso
CH_OVERSTORE    AT %rg0.6; * rg0.6 Selezione overstore attiva
PA_INV_DIR      AT %rg0.7; * rg0.7 Movim. da volantino in direzione inversa
PA_MOV_JOG      AT %rg0.8; * rg0.8 Richiesta movim. da volantino in JOG
PA_ENAB_POS     AT %rg0.9; * rg0.9 Abilita posiz. asse da volantino
PROC_NO_CH0     AT %rg0.10; * rg0.10 Canale in elaborazione diverso da 0
PA_ENAB_ELS     AT %rg0.11; * rg0.11 Abilita albero elettrico da volantino
AX_SEL_CHG      AT %rg0.12; * rg0.12 Imp. modifica selezione asse
CONN_BUSY       AT %rg0.13; * rg0.13 Conn./disconn. asse in corso

BSG_TAR         AT %rg1.0; * rg1.0 Selezione modo REF (taratura)
BSG_MAN         AT %rg1.1; * rg1.1 Selezione modo JOG (manuale)
BSG_INC         AT %rg1.2; * rg1.2 Selezione modo INC (inc.fissi)
BSG_MDI         AT %rg1.3; * rg1.3 Selezione modo MDI (semiautom)
BSG_AUT         AT %rg1.4; * rg1.4 Selezione modo AUT (automatic)
BSG_JOGOPEN     AT %rg1.5; * rg1.5 Selezione JOG a Loop Aperto
BSG_BLKSING     AT %rg1.6; * rg1.6 Selezione esecuzione blocco Singolo
BSG_BLKSWTCH    AT %rg1.7; * rg1.7 Selezione esecuzione blocco Barrato
BSG_DRYRUN      AT %rg1.8; * rg1.8 Selezione esecuzione dry Run
BSG_EXEM01      AT %rg1.9; * rg1.9 Selezione esecuzione arresto su M01
BSG_TEST        AT %rg1.10; * rg1.10 Selezione esecuzione simulata
BSG_SINGREF     AT %rg1.11; * rg1.11 Selezione modo REF singolo
BSG_PRESETREF   AT %rg1.12; * rg1.12 Selezione modo REF con preset
BSG_BLKSRC      AT %rg1.13; * rg1.13 Selezione ricerca blocco
BSG_RETRACE     AT %rg1.14; * rg1.14 Selezione retrace attivo

BCG_START       AT %rg1.16; * rg1.16 Comando START
BCG_RESET       AT %rg1.17; * rg1.17 Comando RESET canali e assi
BCG_HOLD        AT %rg1.19; * rg1.19 Comando HOLD
BCG_EMERG       AT %rg1.20; * rg1.20 Comando emergenza
BCG_REPOS       AT %rg1.21; * rg1.21 Comando REPOS dopo HOLD
BCG_PLUS        AT %rg1.23; * rg1.23 Comando PLUS
BCG_MINUS       AT %rg1.24; * rg1.24 Comando MINUS
BCG_STPIN       AT %rg1.25; * rg1.25 Comando STEP IN
BCG_STPOUT      AT %rg1.26; * rg1.26 Comando STEP OUT
BCG_RTPLUS      AT %rg1.27; * rg1.27 Comando + in retrace
BCG_RTMINUS     AT %rg1.28; * rg1.28 Comando - in retrace
BCG_RTDRYRUN    AT %rg1.29; * rg1.29 Comando dry run (rapido) in retrace
BCG_MODREPOS    AT %rg1.30; * rg1.30 Comando attivazione modalità REPOS

SG_OVRDAX       AT %rg2; * rg2 Override avanzamento
SG_OVRDSP       AT %rg3; * rg3 Override mandrini
SG_FIXINCR      AT %rg4; * rg4 Quota per incrementi fissi
SG_JOGOPEN      AT %rg5; * rg5 Tensione JOG a Loop Aperto
SG_QTAIMM       AT %rg6; * rg6 Quota per taratura immediata (preset)
SG_AXNUM        AT %rg7; * rg7 Numero asse all'interno del canale
SG_AXSEL        AT %rg8; * rg8 Asse selezionato per vis. cursore
SG_QTAR_PAUX    AT %rg9; * rg9 Quota Target per posiz. da puls. aux
SG_QACT_SEL     AT %rg10; * rg10 Quota asse selezionato
SG_CHSEL        AT %rg11; * rg11 Canale selezionato per visualizz.
SG_MINQ_SEL     AT %rg12; * rg12 Quota minima asse selezionato
SG_MAXQ_SEL     AT %rg13; * rg13 Quota massima asse selezionato
SG_VEL_PAUX     AT %rg14; * rg14 Velocità per posiz. da puls. aux
SG_CURRBLK      AT %rg15; * rg15 Blocco corrente per ricerca blocco
SG_VOLAX        AT %rg16; * rg16 Numero asse master per volantino

* NB sono commentate perché VAR_IN_OUT
*BSY_CONN_AX     AT %rg17.0; * rg17.0 Busy aggancio/sgancio asse
*CYC_CONN_AX     AT %rg17.1; * rg17.1 Ciclo agg/sg asse in corso (per test tempo)

BSY_CAX_PLC     AT %rg18.0; * rg18.0 Busy aggancio/sgancio asse interno PLC
APP_CONN_AX     AT %rg18.1; * rg18.1 Appoggio busy aggancio/sgancio asse

*********************************************
********** MEM SPECIFICHE CANALE ************
*********************************************

CMD_PLUS_AXIS   AT %rgc0.0; * rgc0.0 Comando + assi canale
CMD_MINUS_AXIS  AT %rgc0.1; * rgc0.1 Comando - assi canale
PP_EXEC_MODE    AT %rgc0.2; * rgc0.2 Canale in AUT o MDI
AX_EXEC_MODE    AT %rgc0.3; * rgc0.3 Canale in JOG o INC
CMD_RESET_AXIS  AT %rgc0.4; * rgc0.4 Comando reset assi canale
CMD_START_AXIS  AT %rgc0.5; * rgc0.5 Comando start assi canale
CH_IN_ALARM     AT %rgc0.6; * rgc0.6 Asse in allarme nel canale
CH_ZEROED       AT %rgc0.7; * rgc0.7 Assi tarati nel canale
ACK_AX_FHMB     AT %rgc0.8; * rgc0.8 Abil. ACK Full-handshake Motion block per assi
CH_STOPPED      AT %rgc0.9; * rgc0.9 Assi del canale fermi
SICROTMA        AT %rgc0.10; * rgc0.10 Sic. da revolver per rotazione mandrino in lavoro
ORIREV_ON       AT %rgc0.11; * rgc0.11 Orientamento mandrino per innesto revolver attivo
COPPIA_REV      AT %rgc0.12; * rgc0.12 Richiesta messa in coppia mandrino da revolver
SICROTJOG       AT %rgc0.13; * rgc0.13 Sic. da revolver per rotazione mandrino in JOG
SICCOPPIAMA     AT %rgc0.14; * rgc0.14 Sic. da revolver per messa in coppia mandrino
REQASSE_REV     AT %rgc0.15; * rgc0.15 Richiesta grant mandrino da revolver
CHTOOL_RUN      AT %rgc0.16; * rgc0.16 Cambio utensile in corso su revolver
ST_JOGOPEN      AT %rgc0.17; * rgc0.17 Stato JOG OPEN attivo
BSC_SINGREF     AT %rgc0.18; * rgc0.18 Selezione modo REF singolo nel canale
BSC_PRESETREF   AT %rgc0.19; * rgc0.19 Selezione modo REF preset nel canale
CMD_EMER_MAND   AT %rgc0.20; * rgc0.20 Arresto mandrini canale con emergenza
CH_AXJOG        AT %rgc0.21; * rgc0.21 Presente un asse in JOG nel canale

REG1_FUNM       AT %rgc1; * rgc1 Registro 1 funzioni M (da M0 a M31)
REG2_FUNM       AT %rgc2; * rgc2 Registro 2 funzioni M (da M32 a M63)
REG3_FUNM       AT %rgc3; * rgc3 Registro 3 funzioni M (da M64 a M95)
REG4_FUNM       AT %rgc4; * rgc4 Registro 4 funzioni M (da M96 a M127)

FUN_M0          AT %rgc1.0;  * rgc1.0  Funzione M0 attiva
FUN_M1          AT %rgc1.1;  * rgc1.1  Funzione M1 attiva
FUN_M2          AT %rgc1.2;  * rgc1.2  Funzione M2 attiva
FUN_M3          AT %rgc1.3;  * rgc1.3  Funzione M3 attiva
FUN_M4          AT %rgc1.4;  * rgc1.4  Funzione M4 attiva
FUN_M5          AT %rgc1.5;  * rgc1.5  Funzione M5 attiva
FUN_M6          AT %rgc1.6;  * rgc1.6  Funzione M6 attiva
FUN_M8          AT %rgc1.8;  * rgc1.8  Funzione M8 attiva
FUN_M9          AT %rgc1.9;  * rgc1.9  Funzione M9 attiva
FUN_M10         AT %rgc1.10; * rgc1.10 Funzione M10 attiva
FUN_M13         AT %rgc1.13; * rgc1.13 Funzione M13 attiva
FUN_M14         AT %rgc1.14; * rgc1.14 Funzione M14 attiva
FUN_M15         AT %rgc1.15; * rgc1.15 Funzione M15 attiva
FUN_M16         AT %rgc1.16; * rgc1.16 Funzione M16 attiva
FUN_M17         AT %rgc1.17; * rgc1.17 Funzione M17 attiva
FUN_M18         AT %rgc1.18; * rgc1.18 Funzione M18 attiva
FUN_M19         AT %rgc1.19; * rgc1.19 Funzione M19 attiva
FUN_M21         AT %rgc1.21; * rgc1.21 Funzione M21 attiva
FUN_M30         AT %rgc1.30; * rgc1.30 Funzione M30 attiva

FUN_M41         AT %rgc2.9;  * rgc2.9  Funzione M41 attiva
FUN_M42         AT %rgc2.10; * rgc2.10 Funzione M42 attiva
FUN_M43         AT %rgc2.11; * rgc2.11 Funzione M43 attiva
FUN_M44         AT %rgc2.12; * rgc2.12 Funzione M44 attiva
FUN_M50         AT %rgc2.18; * rgc2.18 Funzione M50 attiva
FUN_M56         AT %rgc2.24; * rgc2.24 Funzione M56 attiva
FUN_M57         AT %rgc2.25; * rgc2.25 Funzione M57 attiva
FUN_M58         AT %rgc2.26; * rgc2.26 Funzione M58 attiva
FUN_M59         AT %rgc2.27; * rgc2.27 Funzione M59 attiva
FUN_M60         AT %rgc2.28; * rgc2.28 Funzione M60 attiva

FUN_M68         AT %rgc3.4; * rgc3.4 Funzione M68 attiva
FUN_M69         AT %rgc3.5; * rgc3.5 Funzione M69 attiva
FUN_M70         AT %rgc3.6; * rgc3.6 Funzione M70 attiva
FUN_M71         AT %rgc3.7; * rgc3.7 Funzione M71 attiva
FUN_M72         AT %rgc3.8; * rgc3.8 Funzione M72 attiva

FUN_M100        AT %rgc4.4; * rgc4.4 Funzione M100 attiva
FUN_M101        AT %rgc4.5; * rgc4.5 Funzione M101 attiva
FUN_M102        AT %rgc4.6; * rgc4.6 Funzione M102 attiva
FUN_M103        AT %rgc4.7; * rgc4.7 Funzione M103 attiva
FUN_M104        AT %rgc4.8; * rgc4.8 Funzione M104 attiva

CURPOSRCN       AT %rgc5; * rgc5 Posizione da quota equivalente revolver
SC_QTAIMM       AT %rgc6; * rgc6 Quota per taratura immediata (preset)

*******************************************
********** MEM SPECIFICHE ASSE ************
*******************************************
* NB sono commentate perché VAR_IN_OUT

*REQ_CONN_AX     AT %rga0.0; * rga0.0 Richiesta aggancio asse
*REQ_SCON_AX     AT %rga0.1; * rga0.1 Richiesta sgancio asse

*CONN_MAST       AT %rga1; * rga1 Numero asse master per aggancio

AX_CONN_OK      AT %rga2.0; * rga2.0 Asse agganciato in albero elettrico
AX_CONCP_OK     AT %rga2.1; * rga2.1 Asse agganciato in coupling
