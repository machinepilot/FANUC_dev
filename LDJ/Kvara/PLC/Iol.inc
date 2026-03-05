* I/O logici

* Segnali speciali PLC

#defcom %PLCFLAGS.0 Sempre a zero
#defcom %PLCFLAGS.1 Sempre a uno
#defcom %PLCFLAGS.8 Bit a uno alla prima scansione
#defcom %PLCFLAGS.15 Bit a uno quando Timelock è attivo (macchina Bloccata)

* Registri da UI a PLC (e a PP)

#defcom %C0.0     UI-PLC Menu Impostazioni attivo
#defcom %C0.1     UI-PP-PLC Menu Automatico attivo
#defcom %C0.2     UI-PP-PLC Menu SemiAutomatico attivo
#defcom %C0.3     UI-PLC Menu posizionamento attivo
#defcom %C0.4     UI-PLC Menu manuale attivo
#defcom %C0.5     UI-PLC Pagina test assi/pestone attiva
#defcom %C0.6     UI-PLC Menu taratura immediata attivo
#defcom %C0.8     UI-PLC Menu diagnostica attivo (non usato)
#defcom %C0.9     UI-PP-PLC Menu taratura potenziometro attivo
#defcom %C0.10    UI-PLC Menu autotuning attivo

#defcom %C0.14    UI-PP Conferma cambio programma effettuato
#defcom %C0.15    UI-PLC Richiesta cambio programma da operatore

#defcom %C0.16    UI-PP-PLC Menu Lista Programmi attivo
#defcom %C0.17    UI-PP-PLC Menu Lista Utensili attivo
#defcom %C0.18    UI-PP-PLC Menu Correzioni attivo

#defcom %C0.25    UI-PLC Quota per taratura immediata valida
#defcom %C0.26    UI-PLC Quota posizionamento valida

#defcom %C2.0     UI-PLC Conferma Cambio Passo Acquisito
#defcom %C2.1     UI-PLC Programma modificato da operatore
#defcom %C2.2     UI-PLC Verifica programma OK
#defcom %C2.3     UI-PLC Verifica programma NON OK
#defcom %C2.5     UI-PLC ACK autoappr. quota effettuato
#defcom %C2.6     UI-PLC Conferma PMI ricalcolato dopo gallegg. sens. SER
#defcom %C2.7     UI-PLC Piega con utilizzo del sensore d'angolo SER/LC
#defcom %C2.8     UI-PLC Errore calcolo piega dopo gallegg. sens. SER
#defcom %C2.9     UI-PLC Calcolo quota piega sens. LC: OK
#defcom %C2.10    UI-PLC Calcolo quota piega sens. LC: errore
#defcom %C2.11    UI-PLC Calcolo quota piega sens. LC: piega terminata
#defcom %C2.12    UI-PLC Piega con doppio colpo
#defcom %C2.13    UI-SLAPPG Stop galleggiamento da UI
#defcom %C2.14    SA-PLC Angolo real time in tolleranza o errato, piega terminata
#defcom %C2.15    UI-SA  Scan Angle da UI
#defcom %C2.16    UI-PLC Ricevuto angolo 180 dal LC nel front angle
#defcom %C2.17    UI-PLC Ricevuto angolo 180 dal LC nel back angle
#defcom %C2.18    UI-PLC Ricevuto angolo 180 dal LC nel front angle right
#defcom %C2.19    UI-PLC Ricevuto angolo 180 dal LC nel back angle right
#defcom %C2.20    UI-PLC Correzione quota bombatura effettuata
#defcom %C2.21    UI-PLC Abil. bombatura attiva meccanica nel ciclo

#defcom %C3.0     UI-PLC Ripeti taratura
#defcom %C3.1     UI-PP Taratura negativa potenziometro
#defcom %C3.2     UI-PP Taratura positiva potenziometro
#defcom %C3.3     UI-PP Modo esecuzione lista (0-singolo, 1-circolare)
#defcom %C3.4     UI-PP Ultimo programma della lista
#defcom %C3.5     UI-PP Modo esecuzione (0-programma, 1-lista)
#defcom %C3.7     UI-PLC Pagina TOS BOS Attiva
#defcom %C3.8     UI-PLC Ciclo Speciale Allineamento Micro Massimo Sbilanciamento

#defcom %C4.0     SA-PLC Avvio galleggiamento da sensore d'angolo SER
#defcom %C4.1     SA-PLC Fine scrittura angolo da sensore d'angolo SER
#defcom %C4.2     SA-PLC Piega terminata da sensore d'angolo SER
#defcom %C4.3     SA-PLC Errore da sensore d'angolo SER

#defcom %C5.0     UI-PLC Pulsante START UI
#defcom %C5.1     UI-PLC Pulsante STOP UI
#defcom %C5.2     UI-PLC Pulsante + UI
#defcom %C5.3     UI-PLC Pulsante - UI

#defcom %C6       UI-PP Numero pezzi fatti per ogni ciclo
#defcom %C7       SLAPPG-UI Valore ricevuto da misura tempo reale angolo sensore DX in comando discesa
#defcom %C8       SLAPPG-PLC Correzione dinamica PMI Y1 per Misura Angolo
#defcom %C9       SLAPPG-PLC Correzione dinamica PMI Y2 per Misura Angolo
#defcom %C10      UI-PLC Correzione Bombatura indicizzata per piega e tentativo
#defcom %C11      SLAPPG-UI Valore ricevuto da misura tempo reale angolo sensore DX in comando galleggiamento
#defcom %C12      SLAPPG-UI Valore ricevuto da misura tempo reale angolo in comando discesa
#defcom %C13      SLAPPG-UI Valore ricevuto da misura tempo reale angolo in galleggiamento

#defcom %C14.7    PLC - PP Taratura bombatura iniziata
#defcom %C14.8    PLC - PLC Imp. per avvio ciclo taratura bombatura
#defcom %C14.9    PLC - UI Condizioni abilitazione tasto test bombatura
#defcom %C14.10   PLC - PLC Abilitazione taratura automatica sensori forza

#defcom %C15.0    UI(UIPL) Rich. preset contaore generale (Test)
#defcom %C15.1    UI(UIPL) Rich. preset contaore pompa (Test)
#defcom %C15.2    UI(UIPL) Rich. preset contaore lavoro (Test)
#defcom %C15.3    UI(UIPL) Rich. preset contatore cicli pestone (Test)

#defcom %C15.6    UI(UIPL) Rich. parcheggio Pestone in Manuale
#defcom %C15.7    PLC - PP Taratura bombatura iniziata
#defcom %C15.10   PLC - PLC Abilitazione taratura automatica sensori
#defcom %C15.11   UI(UIPL) Puls. avvio scarico utensili
#defcom %C15.12   UI(UIPL) Puls. start caricatore
#defcom %C15.13   UI(UIPL) Puls. abilitazione caricatore utensili

#defcom %C15.16   UI(UIPL) Puls. UP Y1 pagina test
#defcom %C15.17   UI(UIPL) Puls. DOWN Y1 pagina test
#defcom %C15.18   UI(UIPL) Puls. UP Y2 pagina test
#defcom %C15.19   UI(UIPL) Puls. DOWN Y2 pagina test
#defcom %C15.20   UI(UIPL) Puls. UP Y1-Y2 pagina test
#defcom %C15.21   UI(UIPL) Puls. DOWN Y1-Y2 pagina test
#defcom %C15.22   UI(UIPL) Sel. valvole veloce pagina test
#defcom %C15.23   UI(UIPL) Abil. pagina test "advanced"
#defcom %C15.24   UI(UIPL) Puls. sel. pestone in pagina test
#defcom %C15.25   UI(UIPL) Puls. sel. assi in pagina test

#defcom %selasse             UI-PP-PLC Registro selezione asse

#defcom %robotnam            UI-PLC Codice programma per robot
#defcom %robotnam.0          UI-PLC Codice programma per robot bit 0
#defcom %robotnam.1          UI-PLC Codice programma per robot bit 1
#defcom %robotnam.2          UI-PLC Codice programma per robot bit 2
#defcom %robotnam.3          UI-PLC Codice programma per robot bit 3
#defcom %robotnam.4          UI-PLC Codice programma per robot bit 4

#defcom %pstp0               UI-PLC Pressione per discesa veloce in punti DAC
#defcom %pstp1               UI-PLC Pressione per discesa lenta manuale in punti DAC
#defcom %pstp2               UI-PLC Pressione per salita veloce in punti DAC
#defcom %pstp3               UI-PLC Pressione per salita lenta in punti DAC

#defcom %valvd               UI-PLC Conf. elettrovalvole diagnostica

#defcom %Uipl.Page           UI-PLC ID pagina UIPL corrente

#defcom %ui16.10             UI-PLC Blocco singolo attivo da monitor canale
#defcom %ui16.15             UI-PLC Esecuzione simulata da monitor canale
#defcom %ui16.16             UI-PLC Jog anello aperto da monitor canale
#defcom %ui17                UI-PLC Canale selezionato da monitor canale
#defcom %ui23                UI-PLC Tensione JOG OPEN da diagnostica o monitor canale
#defcom %ui24.0              UI-PLC Modo DEBUG abilitato da monitor canale

#defcom %tensap              UI-PLC Pressione impostata in diagnostica (Volt)
#defcom %tenscp              UI-PLC Bombatura impostata in diagnostica (Volt)

* Registri da UI a PP

#defcom %tensaa              UI-PP Tensione Y1 impostata in diagnostica
#defcom %tensab              UI-PP Tensione Y2 impostata in diagnostica

#defcom %tara                UI-PP-PLC Quota taratura immediata
#defcom %posi                UI-PLC Quota posizionamento asse

#defcom %nmaxp               UI-PP-PLC Numero di pieghe totali del programma

* Dati di programma da UI a PLC o PP

* NB: sono array da 80 elementi, quindi da PLC è meglio leggere i dati
* direttamente in shared anziché rinfrescarli ad ogni scansione.
VAR_IN_OUT

PIEGA_CORR AT %np;         * PP-UI-PLC Numero piega attuale
AXIS_SEL_REG AT %selasse;  * UI-PP-PLC Registro selezione asse per forzamento da plc

* Struttura %PestQ[%np]
DP_PCL AT %pcl;            * UI-PLC-PP Quota PCL piega corrente
DP_PCV AT %pcv;            * UI-PLC-PP Quota PCV piega corrente
DP_PMS_CAL AT %pmsc;       * UI-PLC-PP Quota PMS piega corrente

* Struttura %progc[%np]
DP_TDISC AT %tdisc;        * UI-PLC-PP Tempo discesa pressione
DP_TDECO AT %tdeco;        * UI-PLC-PP Tempo decompressione
DP_PRES AT %pres;          * UI-PLC Pressione piega corrente
DP_BOMB AT %cpres;         * UI-PLC Tensione bombatura piega corrente (punti DAC)
#defcom %progc[%np].pramp    UI-PP Tempo rampa pressione

* Struttura %prog[%np]
DP_PMS_IMP AT %pms;        * UI-PLC Valore impostato PMS piega corrente
DP_PMI AT %ya;             * UI-PLC-PP Quota target asse Y1
DP_PMIY2 AT %yb;           * UI-PLC-PP Quota target asse Y2
DP_PMIYB AT %dSc;          * UI-PLC-PP Quota target asse YB (A3)
DP_X1 AT %xa;              * UI-PLC-PP Quota target asse X1
DP_X2 AT %xb;              * UI-PLC-PP Quota target asse X2
DP_X3 AT %xc;              * UI-PLC-PP Quota target asse X3
DP_X4 AT %xd;              * UI-PLC-PP Quota target asse X4
DP_COR_X1 AT %corxa;       * UI-PLC-PP Quota correzione asse X1
DP_COR_X2 AT %corxb;       * UI-PLC-PP Quota correzione asse X2
DP_COR_X3 AT %corxc;       * UI-PLC-PP Quota correzione asse X3
DP_COR_X4 AT %corxd;       * UI-PLC-PP Quota correzione asse X4
DP_RINC_X1 AT %rinxa;      * UI-PLC Quota rinculo asse X1
DP_RINC_X2 AT %rinxb;      * UI-PLC Quota rinculo asse X2
DP_RINC_X3 AT %rinxc;      * UI-PLC Quota rinculo asse X3
DP_RINC_X4 AT %rinxd;      * UI-PLC Quota rinculo asse X4
DP_RINCG_X1 AT %rinca;     * UI-PLC Quota rinculo globale asse X1
DP_RINCG_X2 AT %rincb;     * UI-PLC Quota rinculo globale asse X2
DP_RINCG_X3 AT %rincc;     * UI-PLC Quota rinculo globale asse X3
DP_RINCG_X4 AT %rincd;     * UI-PLC Quota rinculo globale asse X4
DP_R1 AT %ara;             * UI-PLC-PP Quota target asse R1
DP_R2 AT %arb;             * UI-PLC-PP Quota target asse R2
DP_R3 AT %ar_c;            * UI-PLC-PP Quota target asse R3
DP_R4 AT %ard;             * UI-PLC-PP Quota target asse R4
DP_VELW AT %velw;          * UI-PP-PLC Velocità discesa lavoro
#defcom %prog[%np].coraya    UI-PP Guadagno discesa lavoro Y1
#defcom %prog[%np].corayb    UI-PP Guadagno discesa lavoro Y2
DP_FUN_AUX AT %fun;        * UI-PLC Funzioni ausiliarie da programma
DP_TYPEBEND AT %type;      * UI-PLC-PP Tipo piega (normale, ribattuta, ecc.)
DP_DWELL_TIME AT %tbend;   * UI-PLC Tempo di sosta a fine piega
DP_ACCOM_VEL AT %accomp;   * UI-PP-PLC Vel. accompagnamento (0=escluso)
DP_THICKNESS AT %thick;    * UI-PP-PLC Spessore lamiera
DP_CHSTEP_TIME AT %tcp;    * UI-PLC Tempo cambio passo
DP_STEP_RIPET AT %rip;     * UI-PP-PLC Numero ripetizioni passo (0=simulato)
DP_SENS1 AT %bySensA;      * UI-PLC Sensore 1 attivo su piega
DP_SENS2 AT %bySensB;      * UI-PLC Sensore 2 attivo su piega
DP_SENS3 AT %bySensC;      * UI-PLC Sensore 3 attivo su piega
DP_SENS4 AT %bySensD;      * UI-PLC Sensore 4 attivo su piega
DP_SENS5 AT %bySensE;      * UI-PLC Sensore 5 attivo su piega
DP_SENS6 AT %bySensF;      * UI-PLC Sensore 6 attivo su piega
DP_METODO AT %metodo;      * UI-PLC Metodo attivo su piega
DP_CON_SENS AT %byConSe;   * UI-PLC Sensore attivo su piega
DP_QUOTA_ACC1 AT %aa;      * UI-PLC-PP Quota accompagnatore A1
DP_QUOTA_ACC2 AT %ab;      * UI-PLC-PP Quota accompagnatore A2
DP_QUOTA_ACC3 AT %ac;      * UI-PLC-PP Quota Ausiliario A3
DP_QUOTA_ACC4 AT %ad;      * UI-PLC-PP Quota Ausiliario A4
DP_QUOTA_ACC5 AT %ae;      * UI-PLC-PP Quota Ausiliario A5
DP_QUOTA_S1 AT %dSa;       * UI-PLC-PP Quota Sensore S1
DP_QUOTA_S2 AT %dSb;       * UI-PLC-PP Quota Sensore S2
DP_QUOTA_S3 AT %dSc;       * UI-PLC-PP Quota Sensore S3
DP_QUOTA_S4 AT %dSd;       * UI-PLC-PP Quota Sensore S4
DP_QUOTA_S5 AT %dSe;       * UI-PLC-PP Quota Sensore S5
DP_QUOTA_S6 AT %dSf;       * UI-PLC-PP Quota Sensore S6
DP_ALETTA AT %altaletta;   * UI-PLC Quota altezza aletta per fotocellule
DP_AT_QTAMAX AT %at_dat.QtaMax;  * PLC-PAR Quota massima per Autotuning
DP_AT_QTAMIN AT %at_dat.QtaMin;  * PLC-PAR Quota minima per Autotuning
DP_STATION AT %byNumSt;    * UI-PP-PLC Numero Stazione di lavoro selezionata
DP_NMETODO AT %nMetodo;    * UI-PP-PLC Metodo di piega programmato
DP_ANGYA AT %angya;        * UI-PP angolo target Y1
DP_DBOMB_YBB AT %IMG.tp0.dBomb_YBB; * UI-PLC-PP Correzione in mm bombatura da sensore angolo
DP_IMG_METODO AT %DatiIMG.nMetodo; * UI-PLC-PP Tipo di Piega
DP_NEWPA AT %newpa;        * UI-PLC Valore Funzione New 2
DP_NEWPB AT %newpb;        * UI-PLC Valore Funzione New 3
DP_CHSTEP_TYP AT %bPiegaE; * UI-PLC Tipo cambio passo (0-5, 10-15)
DP_DIST_DECOM AT %dPiegaD; * UI-PP-PLC Distanza decompressione
DP_FORCE AT %force;        * UI-PLC Forza piega (ton*1000)
DP_CROWNING AT %crowning;  * UI-PLC Bombatura piega (0-100000)
DP_AT_PARKLASER AT %DatiIMG.dQtaParchLaser; * UI-PP Quota fuori ingombri telecamera 1 (default o sinistra)
DP_AT_PARKLASER_DX AT %DatiIMG.dQtaParchLaserDx; * UI-PP Quota fuori ingombri telecamera 2 (destra)
DP_BYGPS0 AT %byGPS0;
DP_BYGPS1 AT %byGPS1;
DP_ENAB_ACC1 AT %bPiegaC.0; * UI-PLC Abil. accompagnatore A1 su piega corrente
DP_ENAB_ACC2 AT %bPiegaC.1; * UI-PLC Abil. accompagnatore A2 su piega corrente

* Struttura %dap[%np]
DP_DIMPOST AT %dimp;       * UI-PLC Dimensione posteriore matrice
DP_LARGC AT %largc;        * UI-PLC Larghezza Cava
DP_H_DIEHOLD AT %altDieHolder; * UI-PLC Altezza Porta Matrice
DP_H_INTERMED AT %altIntermediate; * UI-PLC Altezza Intermedio
DP_H_DIE AT %altm;         * UI-PP Quota altezza matrice

* Registri I/O presse tandem su CAN
TNDATAQ1 AT %Tandem.TnData2; * Registro output macchina 1 su CAN
TNDATAI1 AT %Tandem.TnData3; * Registro input da macchina 1 su CAN
TNDATAQ2 AT %Tandem.TnData10; * Registro output macchina 2 su CAN
TNDATAI2 AT %Tandem.TnData11; * Registro input da macchina 2 su CAN
TNDATAQ3 AT %Tandem.TnData18; * Registro output macchina 3 su CAN
TNDATAI3 AT %Tandem.TnData19; * Registro input da macchina 3 su CAN
TNDATAQ4 AT %Tandem.TnData26; * Registro output macchina 4 su CAN
TNDATAI4 AT %Tandem.TnData27; * Registro input da macchina 4 su CAN
TNDATA5  AT %Tandem.TnData5;  * Registro Quota Y2 da macchina 1 su CAN
TNDATA13 AT %Tandem.TnData13; * Registro Quota Y2 da macchina 2 su CAN
TNDATA21 AT %Tandem.TnData21; * Registro Quota Y2 da macchina 3 su CAN
TNDATA29 AT %Tandem.TnData29; * Registro Quota Y2 da macchina 4 su CAN
#defcom TNDATAI1.10 Macchina 1 selezionata in tandem
#defcom TNDATAI2.10 Macchina 2 selezionata in tandem
#defcom TNDATAI3.10 Macchina 3 selezionata in tandem
#defcom TNDATAI4.10 Macchina 4 selezionata in tandem

ErrCodes0 AT %PilzSrv.PilzErrCodes0; * Registro 0 allarmi da Pilz
ErrCodes1 AT %PilzSrv.PilzErrCodes1; * Registro 1 allarmi da Pilz

AP_FWERRY1 AT %ax0.pa5; * parametro errore inseguimento Y1
AP_FWERRY2 AT %ax1.pa5; * parametro errore inseguimento Y2

* Sensore Datam per pestone NVEL

CMD_DATAM AT %C255.0; * PLC-SA Comando acquisizione angolo e ricalcolo (PMI raggiunto)
NUM_PRES AT %byNumPres; * Conteggio pressate sensore angolo
PMI1_DATAM AT %dPMI; * PMI1 calcolato da DATAM
PMI2_DATAM AT %dPMI_YB; * PMI2 calcolato da DATAM
NRET_DATAM AT %nRet; * Codice ritorno DATAM (2=foto non precisa)
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

* Nome programma per tandem
PNOrigin AT %npr; * Stringa origine nome programma per tandem
PNDestination AT %cn0.StrPgm; * Stringa destinazione nome programma per tandem

END_VAR

* Registri da part program a PLC (e a PP o UI)

#defcom %C16.0    PP-PLC Richiesta comando CH0 da PLC
#defcom %C16.1    PP-PLC Ciclo automatico pestone in corso
#defcom %C16.2    PP-PLC Discesa veloce in corso
#defcom %C16.3    PP-PLC Discesa tra PCV e PCL in corso
#defcom %C16.4    PP-PLC Sosta su PCL per rinculo
#defcom %C16.5    PP-PLC Discesa lavoro in corso
#defcom %C16.6    PP-PLC Sosta a fine piega
#defcom %C16.7    PP-PLC Galleggiamento in corso
#defcom %C16.8    PP-PLC Piega terminata
#defcom %C16.9    PP-PLC Pestone al PCL in risalita
#defcom %C16.10   PP-PLC Fine ciclo pestone al PMS
#defcom %C16.11   PP-PLC Fine comando decompressione a quota
#defcom %C16.12   PP-PLC Abilita cambio target al volo per misura angolo realtime
#defcom %C16.13   PP-PLC Prebend effettuato per riposizionamento bombatura
#defcom %C16.17   PP-SLAPPG Discriminazione tra sensori di pressione e strain gauges
#defcom %C16.20   PP-PLC Decompressione in corso
#defcom %C16.21   PP-PLC Decompressione terminata
#defcom %C16.22   PP-PLC Modo risalita attivo
#defcom %C16.23   PP-PLC Avvio discesa accomp. non sincronizzata
#defcom %C16.24   PP-PLC Salita da PCL in corso (cambio passo)
#defcom %C16.25   PP-PLC Richiesta dati da sensore LC (non usato)
#defcom %C16.27   PP-PLC Ciclo con sensori d'angolo in corso
#defcom %C16.28   PP-PLC Prebending terminato
#defcom %C16.29   PP-PLC Macchina in tandem pronta per i-esima pressata
#defcom %C16.30   PP-PLC Macchina in tandem a fine ciclo con sensore d'angolo
#defcom %C16.31   PP-PLC Macchina in tandem ha finito di fare la misura/ricalcoli con sensore d'angolo sul punto iesimo

#defcom %C17.0    PP-PLC Richiesta comando CH1 da PLC
#defcom %C17.1    PP-PLC Ciclo riscontri avviato
#defcom %C17.2    PP-PLC Avvio tempo cambio passo
#defcom %C17.3    PP-PLC Fine tempo cambio passo
#defcom %C17.4    PP-PLC Cambio passo effettuato
#defcom %C17.5    PP-PLC Posizionamento riscontri in corso
#defcom %C17.6    PP-PLC Sblocco prima G0 su CH3-CH5
#defcom %C17.7    PP-PLC Sblocco seconda G0 su CH3-CH5
#defcom %C17.8    PP-PLC Sblocco terza G0 su CH3-CH5
#defcom %C17.9    PP-PLC Assi in posizione su CH1
#defcom %C17.10   PP-PLC Posizionamento per rinculo avviato
#defcom %C17.11   PP-PLC Fine ciclo riscontri (rinculo effettuato)
#defcom %C17.12   PP-PLC Rinculo Z prima di X terminato CH1
#defcom %C17.13   PP-PLC Rinculo X prima di Z terminato CH1
#defcom %C17.14   PP-PLC Quota riscontri errata CH1
#defcom %C17.20   PP-PLC Fine ciclo zeta manuali
#defcom %C17.21   PP-PLC Pezzi finiti
#defcom %C17.22   PP-PLC Aggiorna ripetizioni su UI
#defcom %C17.25   PP-PLC Reset numero piega effettuato
#defcom %C17.27   PP-PLC Calcolo Rinculo Automatico DataM in Corso
#defcom %C17.28   PP-PLC Sblocco primo step su ciclo 611
#defcom %C17.29   PP-PLC Sblocco secondo step su ciclo 611

#defcom %C18.0    PP-PLC-UI Richiesta cambio programma
#defcom %C18.10   PP-PLC-UI Taratura eseguita asse selezionato
#defcom %C18.12   PP-PLC-UI Fine procedura taratura potenziometro
#defcom %C18.13   PP-PLC Richiesta comando CH4 da PLC
#defcom %C18.14   PP-PLC Taratura sensori eseguita
#defcom %C18.15   PP-PLC Ciclo posizionamento singolo asse eseguito
#defcom %C18.16   PP-PLC Fine ciclo INIT pestone
#defcom %C18.25   PP-PLC Sincronismo per movimenti incrementali pestone da PMI
#defcom %C18.26   PP-PLC Taratura Automatica Sensori in corso

#defcom %C19.0    PP-PLC Richiesta comando CH2 da PLC
#defcom %C19.1    PP-PLC Ciclo accompagnatori in corso
#defcom %C19.2    PP-PLC Salita accompagnatori terminata
#defcom %C19.3    PP-PLC Salita per sgancio accompagnatori in corso
#defcom %C19.4    PP-PLC Fine sgancio pezzo
#defcom %C19.5    PP-PLC-PP Discesa accompagnatori in corso
#defcom %C19.6    PP-PLC Discesa accomp. in albero elett. terminata
#defcom %C19.7    PP-PLC-PP Fine discesa accompagnatori
#defcom %C19.8    PP-PLC errore velocità accompagnamento
#defcom %C19.9    PP-PLC Accompagnatori pronti a inizio ciclo
#defcom %C19.10   PP-PLC Ciclo accompagnatori avviato
#defcom %C19.16   PP-PLC Parcheggio assi accomp. in corso
#defcom %C19.17   PP-PLC Fine ciclo parcheggio accompagnatori
#defcom %C19.30   PP-PLC Discesa accompagnatori in posizionamento

#defcom %C20.0    PP-PLC Richiesta comando CH3 da PLC
#defcom %C20.1    PP-PLC Sblocco prima G0 su CH1
#defcom %C20.2    PP-PLC Sblocco seconda G0 su CH1
#defcom %C20.3    PP-PLC Sblocco terza G0 su CH1
#defcom %C20.4    PP-PLC Assi in posizione canale 3
#defcom %C20.5    PP-PLC Tavola centinatura in posizione
#defcom %C20.6    PP-PLC Posizion. telecamera effettuato
#defcom %C20.7    PP-PLC Parcheggio telecamera effettuato

#defcom %C21.0    PP-PLC Ciclo pos. chiocciole attivo
#defcom %C21.1    PP-PLC Chiocciole in posizione
#defcom %C21.2    PP-PLC Allarme posizionamento chiocciole non possibile
#defcom %C21.3    PP-PLC Discesa manuale in corso
#defcom %C21.4    PP-PLC Salita manuale in corso
#defcom %C21.5    PP-PLC Taratura in corso
#defcom %C21.6    PP-PLC Richiamo in corso
#defcom %C21.7    PP-PP-PLC Diagnostica pestone in corso
#defcom %C21.8    PP-PLC Fine ciclo salita manuale
#defcom %C21.9    PP-PLC Ciclo zeta manuali attivo
#defcom %C21.10   PP-PLC Fine risalita pestone per ciclo zeta manuali
#defcom %C21.11   PP-PLC Fine ciclo richiamo
#defcom %C21.12   PP-PLC Fine ciclo taratura pestone
#defcom %C21.13   PP-PLC Ciclo utente pestone attivo
#defcom %C21.14   PP-PLC Ciclo comando prop. per filtraggio olio attivo
#defcom %C21.15   PP-PLC Pestone pronto per avvio risalita
#defcom %C21.17   PP-PLC Pestone PCV esatto raggiunto
#defcom %C21.20   PP-PLC Rich. stop su PCL per sensore pressione
#defcom %C21.21   PP-PLC Ricalcolo con dati sensore pressione effettuato
#defcom %C21.22   PP-PLC Abil. riposiz. centinatura durante la pressata
#defcom %C21.23   PP-PLC Ciclo autotuning attivo
#defcom %C21.24   PP-PLC Posizionamento avviato per ciclo autotuning
#defcom %C21.25   PP-PLC Posizionamento terminato per ciclo autotuning
#defcom %C21.26   PP-PLC Attesa terminata per set Valvole discesa veloce
#defcom %C21.27   PP-PLC Richiesta posizionamento telecamere
#defcom %C21.29   PP-PLC Preclosing in corso

#defcom %C22.0    PP-PLC Richiesta comando CH5 da PLC
#defcom %C22.1    PP-PLC Sblocco prima G0 su CH1 da CH5
#defcom %C22.2    PP-PLC Sblocco seconda G0 su CH1 da CH5
#defcom %C22.3    PP-PLC Sblocco terza G0 su CH1 da CH5
#defcom %C22.4    PP-PLC Assi in posizione canale 5
#defcom %C22.12   PP-PLC Rinculo Z prima di X terminato CH5
#defcom %C22.13   PP-PLC Rinculo X prima di Z terminato CH5
#defcom %C22.28   PP-PLC Conferma primo step su ciclo 611 eseguito
#defcom %C22.29   PP-PLC Conferma secondo step su ciclo 611 eseguito
#defcom %C22.30   PP-PLC Conferma terzo step su ciclo 611 eseguito

#defcom %C23.0    SLAPPG Funzione StopGalleggiamento() terminata
#defcom %C23.1    SLAPPG Stop galleggiamento da C36.0
#defcom %C23.2    SLAPPG Stop galleggiamento da sensori di pressione
#defcom %C23.3    SLAPPG Stop galleggiamento da strain gauge
#defcom %C23.4    SLAPPG Stop galleggiamento da input digitale
#defcom %C23.5    SLAPPG Stop galleggiamento da sensore angolo GPS
#defcom %C23.6    SLAPPG Stop galleggiamento da C2.13
#defcom %C23.7    SLAPPG Stop galleggiamento da misura angolo real time

#defcom %C24.0    PLC-UI(UIPL) Bit Pompa Accesa

#defcom %C25.0    UI(UIPL)-UserPLC Pulsante Start Pompa
#defcom %C25.1    UI(UIPL)-UserPLC Pulsante Stop Pompa
#defcom %C25.3    UI(UIPL)-PLC Pulsante Barra Led Full ON
#defcom %C25.4    UI(UIPL)-UserPLC Start Pressure Curve Test
#defcom %C25.5    UI(UIPL)-UserPLC Pulsante Foot Mode
#defcom %C25.6    UI(UIPL)-UserPLC Pulsante Foot Foot
#defcom %C25.7    UI(UIPL)-UserPLC Pulsante Laser On
#defcom %C25.8    UI(UIPL)-UserPLC Pulsante Power Off
#defcom %C25.9    UI(UIPL)-UserPLC Pulsante Risalita al PMS con pedale Salita
#defcom %C25.10   UI(UIPL)-UserPLC Abilita Hand Wheel Esterna

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

#defcom %C25.24   UI(UIPL)-PLC Comando Apertura Matrici
#defcom %C25.25   UI(UIPL)-PLC Comando Apertura Punzoni
#defcom %C25.26   UI(UIPL)-PLC Comando Apertura Intermedi

#defcom %C25.27   UI(UIPL)-PLC Comando Richiesta Accoppiamento Pedale WiFi LZS

#defcom %C26.0    UI(UIPL)-UserPLC Selezione movimentazione volantino in centesimi
#defcom %C26.1    UI(UIPL)-UserPLC Selezione movimentazione volantino in decimi
#defcom %C26.2    UI(UIPL)-UserPLC Selezione movimentazione volantino in mm
#defcom %C26.3    UI(UIPL)-UserPLC Selezione acquisizione quota pestone nella piega
#defcom %C26.4    UI(UIPL)-UserPLC Selezione Hand Wheel manuale
#defcom %C26.8    UI(UIPL)-UserPLC Abil. handwheel at mute

VAR_IN_OUT
Bomb_Test_Enab AT %C27.0; ** UI - PLC Abilitazione ciclo test bombatura
Auto_Sensor_Tara AT %C27.1; ** UI - PLC Tasto abilitazione taratura automatica sensori correzione spalle
END_VAR

#defcom %C100     UI(UIPL) Libero
#defcom %C101     UI(UIPL) Preset contaminuti generale (Test)
#defcom %C102     UI(UIPL) Preset contaore generale (Test)
#defcom %C103     UI(UIPL) Preset contaminuti lavoro (Test)
#defcom %C104     UI(UIPL) Preset contaore lavoro (Test)
#defcom %C105     UI(UIPL) Preset contaminuti pompa (Test)
#defcom %C106     UI(UIPL) Preset contaore pompa (Test)
#defcom %C107     UI(UIPL) Preset contatore cicli pestone (Test)

#defcom %C110     SLAPPG Albero Elettrico Errore Y1
#defcom %C111     SLAPPG Albero Elettrico Errore Y2
#defcom %C112     SLAPPG Albero Elettrico Errore Accomp. A1
#defcom %C113     SLAPPG Albero Elettrico Errore Accomp. A2
#defcom %C114     SLAPPG Albero Elettrico Target Asse Slave
#defcom %C115     SLAPPG Albero Elettrico Target Asse Master
#defcom %C116     PP-SLAPPG Frequenza di taglio FIR (x10) Albero Elettrico Accompagnatori

#defcom %C120     PLC-SLAPPG Quota per uscita PMS veloce
#defcom %C121     PLC-SLAPPG Quota per uscita PCV veloce
#defcom %C122     PLC-SLAPPG Quota per uscita PCL prima del rinculo veloce
#defcom %C123     PLC-SLAPPG Quota per uscita PCL dopo il rinculo veloce
#defcom %C124     PLC-SLAPPG Quota per uscita PMI veloce
#defcom %C125     PLC-SLAPPG Quota per arresto salita veloce
#defcom %C126     PLC-SLAPPG Quota per arresto salita lenta
#defcom %C127     PLC-SLAPPG Quota per arresto discesa veloce
#defcom %C128     PLC-SLAPPG Quota per arresto discesa lenta
#defcom %C129     PLC-SLAPPG Quota per arresto discesa lentissima
#defcom %C130     PLC-SLAPPG Quota per arresto discesa lentissima Y2
#defcom %C131     PLC Differenza fra Y1 ed Y2
*C132-C138 riservati per I/O (vedi iof.inc)
#defcom %C139     SLAPPG-PLC Differenza fra Y1 ed Y2

#defcom %cn0.vl52 Velocità discesa lavoro da ISO in mm/min
#defcom %cn0.vl53 Quota decompressione a quota

* Da PLC a Slappg

#defcom %SLAPPG0.0  PLC-Slave Abilita correzione target
#defcom %SLAPPG0.1  PLC-Slave Abilita Adattativo (Tracking Error)
#defcom %SLAPPG0.2  PLC-Slave Abilita Riduzione Feed Pestone se ne satura la velocità. Non utilizzato
#defcom %SLAPPG0.3  PLC-Slave Abilita Guadagno Esponenziale Bilanciamento (Abilita SLAPPG15)
#defcom %SLAPPG0.4  PLC-Slave Abilita Guadagno integrativo di velocità sul bilanciamento (Abilita SLAPPG12)
#defcom %SLAPPG0.5  PLC-Slave Abilita Stima Insensibilita
#defcom %SLAPPG0.6  PLC-Slave Abilita Stima Saturazione
#defcom %SLAPPG0.7  PLC-Slave Abilita Stima Saturazione New
#defcom %SLAPPG0.12 PLC-Slave Abil. forzamento tensione DAC Y1
#defcom %SLAPPG0.13 PLC-Slave Abil. forzamento tensione DAC Y2
#defcom %SLAPPG0.14 PLC-Slave Inversione segno DAC Y1
#defcom %SLAPPG0.15 PLC-Slave Inversione segno DAC Y2
#defcom %SLAPPG0.16 PLC-Slave Esclude sincronizzazione su C16-C36 (prima versione)
#defcom %SLAPPG0.17 PLC-Slave Richiesta sincronizzazione a fine posizionamento pestone

#defcom %SLAPPG1.0  PLC-Slave Abil. congelamento generatore di posizione pestone

#defcom %SLAPPG2  PLC-Slave Correzione target Y1 micron
#defcom %SLAPPG3  PLC-Slave Correzione target Y2 micron
#defcom %SLAPPG4  PLC-Slave Asse Pestone Simulato, disturbo sommato alla quota encoder Y1
#defcom %SLAPPG5  PLC-Slave Asse Pestone Simulato, disturbo sommato alla quota encoder Y2
#defcom %SLAPPG6  PLC-Slave Asse Pestone Simulato, delay Y1
#defcom %SLAPPG7  PLC-Slave Asse Pestone Simulato, delay Y2
#defcom %SLAPPG8  PLC-Slave Asse Pestone Simulato, soglia di insensibilità attuatore Y1
#defcom %SLAPPG9  PLC-Slave Asse Pestone Simulato, soglia di insensibilità attuatore Y2
#defcom %SLAPPG10 PLC-Slave Guadagno integrativo assi pestone
#defcom %SLAPPG11 PLC-Slave Guadagno integrativo limite assi pestone
#defcom %SLAPPG12 PLC-Slave Guadagno integrativo di velocità sul bilanciamento
#defcom %SLAPPG13 PLC-Slave Limitazione Accelerazione Bilanciamento dwLimAccSbil
#defcom %SLAPPG14 PLC-Slave Guadagno integrale di velocità di ogni asse
#defcom %SLAPPG15 PLC-Slave Guadagno Esponenziale Bilanciamento (1000 = 1)
#defcom %SLAPPG16 PLC-Slave Ampiezza isteresi DAC attuatore (mV)
#defcom %SLAPPG17 PLC-Slave Soglia non intervento DAC attuatore (mV)
#defcom %SLAPPG18 PLC-Slave Valore impulso cambio direzione DAC (mV)
#defcom %SLAPPG19 PLC-Slave Costante di tempo azzeramento impulso cambio direzione DAC (ms)
#defcom %SLAPPG20 PLC-Slave Attuatore Threshold
#defcom %SLAPPG21 PLC-Slave Attuatore OutputVelGainAdjustKp
#defcom %SLAPPG22 PLC-Slave Y1 Kd derivativo
#defcom %SLAPPG23 PLC-Slave Y2 Kd derivativo
#defcom %SLAPPG24 PLC-Slave Limitazione derivativo
#defcom %SLAPPG25 PLC-Slave Vmax Y1 [mm/min] per tracking error
#defcom %SLAPPG26 PLC-Slave Vmax Y2 [mm/min] per tracking error
#defcom %SLAPPG27 PLC-Slave Soglia intervento tracking error in fase di accelerazione [um]
#defcom %SLAPPG28 PLC-Slave Kp filtro per estrarre bit di acc/cruise/dec [Hz] x 1000
#defcom %SLAPPG29 PLC-Slave Tensione per forzamento DAC Y1 (mV)
#defcom %SLAPPG30 PLC-Slave Tensione per forzamento DAC Y2 (mV)
#defcom %SLAPPG31 PLC-Slave Filtro quota riferimento albero elett. accompagnatori [ms]
#defcom %SLAPPG32 PLC-Slave Rampa decelerazione rapida per arresto con blocco avanzamento [u/s^2]

* Da Slappg a PLC

#defcom %SLAPPG128 Slave-PLC Asse Pestone, Bit usati per diagnostica
#defcom %SLAPPG128.0 Slave-PLC Asse Pestone, Bit Fase di Accelerazione in corso
#defcom %SLAPPG128.1 Slave-PLC Asse Pestone, Bit Fase di Decelerazione in corso
#defcom %SLAPPG128.2 Slave-PLC Asse Pestone, Bit movimento in corso
#defcom %SLAPPG128.3 Slave-PLC Asse Pestone, Bit controllo tolleranza in corso
#defcom %SLAPPG128.4 Slave-PLC Asse Pestone, direzione discesa Y1 per controllo in tolleranza
#defcom %SLAPPG128.5 Slave-PLC Asse Pestone, direzione discesa Y2 per controllo in tolleranza
#defcom %SLAPPG128.6 Slave-PLC Asse Pestone, target raggiunto con sincronismo a fine posizionamento
#defcom %SLAPPG128.7 Slave-PLC Asse Pestone, feed hold durante il sincronismo di fine posizionamento
#defcom %SLAPPG129 Slave-PLC Asse Pestone, Monitor Contributo Guadagno Variabile Y1 (mV)
#defcom %SLAPPG130 Slave-PLC Asse Pestone, Monitor Contributo Guadagno Variabile Y2 (mV)
#defcom %SLAPPG131 Slave-PLC Asse Pestone, Monitor Contributo Guadagno Variabile (mV)
#defcom %SLAPPG132 Slave-PLC Asse Pestone, Monitor Contributo Guadagno Integrativo (mV)
#defcom %SLAPPG133 Slave-PLC Asse Pestone, Monitor Guadagno Variabile (Kpcnt) Debug
#defcom %SLAPPG134 Slave-PLC Asse Pestone, Monitor Guadagno Variabile (Kpt) Debug
#defcom %SLAPPG135 Slave-PLC Asse Pestone, Monitor Guadagno Variabile (KpNew) Debug
#defcom %SLAPPG136 Slave-PLC deltaEpsY1 per tracking error
#defcom %SLAPPG137 Slave-PLC deltaEpsY2 per tracking error
#defcom %SLAPPG138 Slave-PLC deltaMaxEpsY1 per tracking error
#defcom %SLAPPG139 Slave-PLC deltaMaxEpsY2 per tracking error
#defcom %SLAPPG140 Slave-PLC Tensione uscita DAC Y1 (mV)
#defcom %SLAPPG141 Slave-PLC Tensione uscita DAC Y2 (mV)

* Variabili condivise tra PP e UI (ci scrivono entrambi)

#defcom %np                  PP-UI-PLC Numero piega attuale
#defcom %nrip                PP-UI Numero ripetizioni piega attuale

#defcom %pieceflista         PP-UI Pezzi rimanenti sulla lista
#defcom %piecedlista         PP-UI Pezzi fatti sulla lista
#defcom %head.piecef         PP-UI Pezzi rimanenti su programma singolo
#defcom %head.pieced         PP-UI Pezzi fatti su programma singolo

#defcom %head.Tooling0.dInPun    UI-PLC Posizione Inizio Stazione 1 Punzone
#defcom %head.Tooling1.dInPun    UI-PLC Posizione Inizio Stazione 2 Punzone
#defcom %head.Tooling2.dInPun    UI-PLC Posizione Inizio Stazione 3 Punzone
#defcom %head.Tooling3.dInPun    UI-PLC Posizione Inizio Stazione 4 Punzone
#defcom %head.Tooling4.dInPun    UI-PLC Posizione Inizio Stazione 5 Punzone
#defcom %head.Tooling5.dInPun    UI-PLC Posizione Inizio Stazione 6 Punzone
#defcom %head.Tooling0.dLungPun  UI-PLC Stazione 1 Lunghezza Punzone
#defcom %head.Tooling1.dLungPun  UI-PLC Stazione 2 Lunghezza Punzone
#defcom %head.Tooling2.dLungPun  UI-PLC Stazione 3 Lunghezza Punzone
#defcom %head.Tooling3.dLungPun  UI-PLC Stazione 4 Lunghezza Punzone
#defcom %head.Tooling4.dLungPun  UI-PLC Stazione 5 Lunghezza Punzone
#defcom %head.Tooling5.dLungPun  UI-PLC Stazione 6 Lunghezza Punzone
#defcom %head.Tooling0.dInMat    UI-PLC Posizione Inizio Stazione 1 Matrice
#defcom %head.Tooling1.dInMat    UI-PLC Posizione Inizio Stazione 2 Matrice
#defcom %head.Tooling2.dInMat    UI-PLC Posizione Inizio Stazione 3 Matrice
#defcom %head.Tooling3.dInMat    UI-PLC Posizione Inizio Stazione 4 Matrice
#defcom %head.Tooling4.dInMat    UI-PLC Posizione Inizio Stazione 5 Matrice
#defcom %head.Tooling5.dInMat    UI-PLC Posizione Inizio Stazione 6 Matrice
#defcom %head.Tooling0.dLungMat  UI-PLC Stazione 1 Lunghezza Matrice
#defcom %head.Tooling1.dLungMat  UI-PLC Stazione 2 Lunghezza Matrice
#defcom %head.Tooling2.dLungMat  UI-PLC Stazione 3 Lunghezza Matrice
#defcom %head.Tooling3.dLungMat  UI-PLC Stazione 4 Lunghezza Matrice
#defcom %head.Tooling4.dLungMat  UI-PLC Stazione 5 Lunghezza Matrice
#defcom %head.Tooling5.dLungMat  UI-PLC Stazione 6 Lunghezza Matrice

* Variabili da PP a UI

#defcom %DebValue.dRealPosSensA[%byNumPres] PP-UI Quota raggiunta sensore 1 in discesa
#defcom %DebValue.dRealPosSensB[%byNumPres] PP-UI Quota raggiunta sensore 2 in discesa
#defcom %DebValue.dRealPosYA[%byNumPres] PP-UI Quota raggiunta asse Y1 in discesa
#defcom %DebValue.dRealPosYB[%byNumPres] PP-UI Quota raggiunta asse Y2 in discesa

#defcom %DebStop.dRealPosSensA[%byNumPres] PP-UI Quota raggiunta sensore 1 in salita
#defcom %DebStop.dRealPosSensB[%byNumPres] PP-UI Quota raggiunta sensore 2 in salita
#defcom %DebStop.dRealPosYA[%byNumPres] PP-UI Quota raggiunta asse Y1 in salita
#defcom %DebStop.dRealPosYB[%byNumPres] PP-UI Quota raggiunta asse Y2 in salita

* Variabili da PP a SLAPPG

#defcom %byNumPres           PP-SLAPPG Numero tentativi lettura sensore



* Registri da PLC verso part program (o UI o interni PLC)

#defcom %C32.0    PLC-PLC-PP Consensi validi da CH0
#defcom %C32.1    PLC-PP Selez. utilizzo PMS calcolato (0=PMS assoluto)
#defcom %C32.2    PLC-PP Conferma fine ciclo salita manuale o taratura
#defcom %C32.3    PLC-PLC-PP Salita manuale lenta abilitata
#defcom %C32.4    PLC-PLC-PP Pressa con chiocciole
#defcom %C32.5    PLC-PLC-PP Pestone in sola lettura o NVEL
#defcom %C32.6    PLC-PP Pressa monocilindrica proporzionale
#defcom %C32.7    PLC-PP Piega con cuscino idraulico
#defcom %C32.8    PLC-PP Pressa tandem sincronizzata
#defcom %C32.9    PLC-PP Conferma fine ciclo richiamo
#defcom %C32.10   PLC-PP Cambio passo per CH0 pressa tradiz.
#defcom %C32.11   PLC-PP Conferma fine ciclo pressa trad.
#defcom %C32.12   PLC-PP Esclude sosta al PCV
#defcom %C32.13   PLC-PP Conferma fine ciclo INIT pestone
#defcom %C32.14   PLC-PP Comando da volantino in modo risalita
#defcom %C32.15   PLC-PP Volantino configurato
#defcom %C32.16   PLC-PP-UI Assi in movimento
#defcom %C32.18   PLC-UI Assi riscontri tarati
#defcom %C32.19   PLC-UI Assi pestone tarati
#defcom %C32.20   PLC-UI Conferma ripeti taratura ricevuto
#defcom %C32.21   PLC-PP Tavola centinatura in posizione
#defcom %C32.22   PLC-PP Limitazione velocità lavoro attiva
#defcom %C32.23   PLC-PP abilita soglie insens. su tutti i movimenti
#defcom %C32.24   PLC-PLC-PP Decompressione esclusa
#defcom %C32.25   PLC-PP Escl. controllo corsa chiocciole rispetto al pestone
#defcom %C32.26   PLC-PP Richiesto Cambio Passo a Fine Piega
#defcom %C32.27   PLC-PP abilita Decelerazione separata per DV in Closed Loop
#defcom %C32.28   PLC-PP abilita Decelerazione separata per SV in Closed Loop
#defcom %C32.29   PLC-PP Bit di attesa macchina remota per iniziare i-esima pressata
#defcom %C32.30   PLC-PP Macchina remota in tolleranza durante il ciclo di piega con sensore DATAM
#defcom %C32.31   PLC-PP Bit di attesa macchina remota per la risalita a fine ciclo con sensore DATAM

#defcom %C33.0    PLC-PLC-PP Consensi validi da CH1
#defcom %C33.1    PLC-PP Fine tempo cambio passo
#defcom %C33.2    PLC-PP Start dopo pezzi finiti
#defcom %C33.3    PLC-PP Sblocco gruppo 1 posizion. assi CH1
#defcom %C33.4    PLC-PP Sblocco gruppo 2 posizion. assi CH1
#defcom %C33.5    PLC-PP Sblocco gruppo 3 posizion. assi CH1
#defcom %C33.6    PLC-PP Abilitazione rinculo da canale 0
#defcom %C33.7    PLC-PP Abilita cambio passo
#defcom %C33.8    PLC-PP Conferma fine ciclo riscontri
#defcom %C33.9    PLC-PP Richiesto rinculo Z prima di X-R
#defcom %C33.10   PLC-PP Richiesto rinculo Z dopo X-R
#defcom %C33.11   PLC-PLC-PP Rinculo richiesto nel ciclo CH1-5
#defcom %C33.12   PLC-UI Canali ristartati dopo cambio programma da operatore
#defcom %C33.13   PLC-PP Richiesta movimentazione da volantino in JOG
#defcom %C33.14   PLC-PP Movim. da volantino in direzione inversa
#defcom %C33.15   PLC-PP Movim. da volantino ad assi indipendenti
#defcom %C33.16   PLC-PP Abilitazione rinculo X dopo Z CH1
#defcom %C33.17   PLC-PP Abilitazione rinculo Z dopo X CH1
#defcom %C33.18   PLC-PP Stop asse Z per contatto con Z passivo CH1
#defcom %C33.19   PLC-PP Rich. parcheggio assi per cambio utensile CH1
#defcom %C33.22   PLC-PP Ciclo Zeta manuali disabilitato
#defcom %C33.23   PLC-PP Conferma taratura immediata eseguita da UI
#defcom %C33.24   PLC-PP Aggiorna informazioni piega corrente da UI
#defcom %C33.25   PLC-PP Conferma ciclo posiziona asse eseguito
#defcom %C33.26   PLC-PP Conferma ciclo autotuning eseguito
#defcom %C33.27   PLC-PP Bit di attesa macchina remota per continuare il ciclo dopo la misura/ricalcoli con sensore DATAM sul punto iesimo
#defcom %C33.28   PLC-PP Abilita fine primo step su ciclo 211
#defcom %C33.29   PLC-PP Abilita fine secondo step su ciclo 211



#defcom %C34.0    PLC-PLC-PP Consensi validi da CH2
#defcom %C34.1    PLC-PP Abil. ciclo accompagnatore A1
#defcom %C34.2    PLC-PP Abil. ciclo accompagnatore A2
#defcom %C34.3    PLC-PP Abil. ciclo accompagnatori
#defcom %C34.4    PLC-PP Abil. salita accompagnatori
#defcom %C34.5    PLC-PP Sgancio albero elettrico salita accompagnatori
#defcom %C34.6    PLC-PP Abil. discesa accompagnatori
#defcom %C34.7    PLC-PP Abil. discesa accompagnatori dopo ciclo sgancio
#defcom %C34.8    PLC-PP Conferma fine ciclo accompagnatori
#defcom %C34.9    PLC-PP Cambio passo per canale 2
#defcom %C34.10   PLC-PP Ciclo sgancio abilitato
#defcom %C34.12   PLC-PP Abil. funz. in albero elettrico per accompagnatori in discesa
#defcom %C34.13   PLC-PP Abil. funz. in albero elettrico per accompagnatori in salita
#defcom %C34.15   PLC-PP Segnalazione albero elettrico pestone agganciato
#defcom %C34.17   PLC-PP Conferma accompagnatori in posizione

#defcom %C35.0    PLC-PLC-PP Consensi validi da CH3
#defcom %C35.1    PLC-PP Sblocco gruppo 1 posizion. assi CH3
#defcom %C35.2    PLC-PP Sblocco gruppo 2 posizion. assi CH3
#defcom %C35.3    PLC-PP Sblocco gruppo 3 posizion. assi CH3
#defcom %C35.4    PLC-PP Cambio passo per canale 3
#defcom %C35.5    PLC-PP Presenza asse Z3
#defcom %C35.6    PLC-PP Asse centinatura presente su A2 o A3
#defcom %C35.7    PLC-PP Asse centinatura presente su A3
#defcom %C35.8    PLC-PP Abil. posiz. asse centinatura
#defcom %C35.9    PLC-PP Abil. posiz. asse telecamera
#defcom %C35.10   PLC-PP Attesa lettura dati da telecamera CH3
#defcom %C35.11   PLC-PP Rich. parcheggio assi per cambio utensile CH3
#defcom %C35.12   PLC-PP Rich. parcheggio asse telecamera A8 CH3

#defcom %C36.0    PLC-SLAPPG Fine pressata (pressa Hammerle)
#defcom %C36.1    PLC-PP Abil. regolazione pestone con arresto in piega
#defcom %C36.2    PLC-PLC-PP Forzamento discesa lenta (ritardato)
#defcom %C36.3    PLC-PP Abilita sincronizzazione al PCV
#defcom %C36.4    PLC-PP Prosecuzione ciclo dal PCV
#defcom %C36.5    PLC-PLC-PP Rinculo richiesto nel ciclo CH0
#defcom %C36.6    PLC-PP Rinculo eseguito
#defcom %C36.7    PLC-PP Abilita sincronizzazione al PCL dopo il rinculo
#defcom %C36.8    PLC-PP Prosecuzione ciclo dal PCL dopo il rinculo
#defcom %C36.9    PLC-PP Abilita sincronizzazione al PMI
#defcom %C36.10   PLC-PP Prosecuzione ciclo dal PMI
#defcom %C36.11   PLC-PP Abilita modo STEP al PMI
#defcom %C36.12   PLC-PP Pedale di salita premuto in modo risalita
#defcom %C36.13   PLC-PP Tasto + premuto in modo risalita
#defcom %C36.14   PLC-PP Tasto - premuto in modo risalita
#defcom %C36.15   PLC-PP Tasto START premuto in modo risalita
#defcom %C36.16   PLC-PP Decompressione posticipata sul PCL
#defcom %C36.17   PLC-PP Rich. salita al PCL in albero elettrico con accompagnatori
#defcom %C36.18   PLC-PP Sgancio albero elettrico discesa accompagnatori
#defcom %C36.19   PLC-PP Rich. salita al PCL in lento per accompagnatori
#defcom %C36.20   PLC-PP Salita lenta con valvole di discesa lavoro
#defcom %C36.21   PLC-PP Accompagnamento abilitato
#defcom %C36.22   PLC-PP Accompagnamento con valvole di discesa lavoro
#defcom %C36.23   PLC-PP Sblocco salita pestone al PCL
#defcom %C36.24   PLC-PP Abil. salita al PCL in veloce
#defcom %C36.25   PLC-PP Conferma fine ciclo automatico pestone
#defcom %C36.26   PLC-PP Abil. arresto rapido pestone con rilascio pedale
#defcom %C36.27   PLC-PP Pestone oltre il PCV
#defcom %C36.28   PLC-PP Pestone oltre il PCL
#defcom %C36.29   PLC-PP Selezione scarico pressione di lavoro
#defcom %C36.30   PLC-PLC-PP Abil. rilevamento spessore
#defcom %C36.31   PLC-PLC-PP Abil. rilevamento larghezza

#defcom %C37.0    PLC-PP Consensi validi da CH4
#defcom %C37.1    PLC-PP Taratura immediata sensori eseguita
#defcom %C37.8    PLC-PP Taratura pestone in battuta
#defcom %C37.9    PLC-PP Completamento taratura pestone in battuta
#defcom %C37.10   PLC-PP Completamento taratura pestone in due fasi
#defcom %C37.20   PLC-PP Asse S1 da tarare
#defcom %C37.21   PLC-PP Asse S2 da tarare
#defcom %C37.22   PLC-PP Asse S3 da tarare
#defcom %C37.23   PLC-PP Asse S4 da tarare
#defcom %C37.24   PLC-PP Asse S5 da tarare
#defcom %C37.25   PLC-PP Asse S6 da tarare

#defcom %C38.0    PLC-PLC-PP Piega coniata o ribattuta
#defcom %C38.1    PLC-SLAPPG PLC avviato
#defcom %C38.2    PLC-PP Piega con sensore d'angolo seriale
#defcom %C38.3    PLC-PP Piega con sensore d'angolo LC
#defcom %C38.4    PLC-PP Conferma sensore angolo attivo
#defcom %C38.5    PLC-PP Piega con sensore d'angolo LS
#defcom %C38.6    PLC-PP Conferma telecamere in posizione
#defcom %C38.7    PLC-PP Piega con sensore d'angolo LC-LS
#defcom %C38.8    PLC-PP Presenza carrello sensore d'angolo
#defcom %C38.10   PLC-PP Conferma fine ciclo utente pestone
#defcom %C38.11   PLC-PP Blocco discesa veloce per precarica pompe da plc utente
#defcom %C38.12   PLC-PP Blocco salita veloce per precarica pompe da plc utente
#defcom %C38.13   PLC-PP Abil. fine decompressione a quota
#defcom %C38.14   PLC-PP Pagina test pestone attiva
#defcom %C38.15   PLC-PP Direzione negativa pagina test pestone
#defcom %C38.16   PLC-PP Comando Y1 pagina test pestone
#defcom %C38.17   PLC-PP Comando Y2 pagina test pestone
#defcom %C38.18   PLC-PP Hold Beam up movement after Decompression from User plc
#defcom %C38.19   PLC-PP Abil. decompressione utente
#defcom %C38.20   PLC-PP conferma decompressione utente effettuata
#defcom %C38.21   PLC-PP Abil. risalita pestone dopo completamento piega
#defcom %C38.22   PLC-PP Arresto esatto su PCV
#defcom %C38.23   PLC-PP Abil. mantenimento in coppia pestone al mute
#defcom %C38.24   PLC-PP Abil. ciclo bombatura attiva meccanica da plc utente
#defcom %C38.25   PLC-PP Conferma avanz. ciclo bombatura attiva meccanica dopo prebend da plc utente
#defcom %C38.26   PLC-PP Conferma effettuazione riposizionamento bombatura attiva meccanica da plc utente
#defcom %C38.27   PLC-PP Abilita sincronizzazione al PCL in risalita

#defcom %C39.0    PLC-PLC-PP Consensi validi da CH5
#defcom %C39.1    PLC-PP Sblocco gruppo 1 posizion. assi CH5
#defcom %C39.2    PLC-PP Sblocco gruppo 2 posizion. assi CH5
#defcom %C39.3    PLC-PP Sblocco gruppo 3 posizion. assi CH5
#defcom %C39.4    PLC-PP Cambio passo per canale 5
#defcom %C39.16   PLC-PP Abilitazione rinculo X dopo Z CH5
#defcom %C39.17   PLC-PP Abilitazione rinculo Z dopo X CH5
#defcom %C39.28   PLC-PP Primo step in corso su ciclo 211
#defcom %C39.29   PLC-PP Secondo step in corso su ciclo 211

#defcom %C50                 PLC-PP Movimentazione richiesta canale 0
#defcom %C51                 PLC-PP Movimentazione richiesta canale 1
#defcom %C52                 PLC-PP Movimentazione richiesta canale 2
#defcom %C53                 PLC-PP Movimentazione richiesta canale 3
#defcom %C54                 PLC-PP Movimentazione richiesta canale 4
#defcom %C55                 PLC-PP Ultima quota di arresto pestone
#defcom %C56                 PLC-PP Quota massima tra Y1 e Y2
#defcom %C57                 PLC-PP Quota minima tra Y1 e Y2
#defcom %C58                 PLC-PP Quota PMS calcolato
#defcom %C59                 PLC-PP Movimentazione richiesta canale 5

#defcom %C90                 PLC-PP Quota taratura immediata asse
#defcom %C91                 PLC-PP Quota target asse per posizionamento
#defcom %C92                 PLC-PLC-PP Quota PCV

#defcom %vg0                 PLC-PP Limite minimo pestone
#defcom %vg1                 PLC-PLC-PP Limite massimo pestone

* Registri da PLC verso UI

#defcom %C40.4    PLC-UI Richiesta cambio passo
#defcom %C40.5    PLC-UI Richiesta cambio programma
#defcom %C40.6    PLC-UI Strobe autoappr. quota PCL
#defcom %C40.7    PLC-UI Abilita editing correzioni
#defcom %C40.8    PLC-UI Richiesta verifica programma
#defcom %C40.9    PLC-UI Selezione pagina impostazione da PLC
#defcom %C40.10   PLC-UI Sel. pagina automatico + sel. programma da PLC
#defcom %C40.11   PLC-UI Abilita acquisizione spessore rilevato (uso PLC cliente)
#defcom %C40.12   PLC-UI Selezione pagina manuale da PLC
#defcom %C40.13   PLC-UI Selezione pagina semiautomatico da PLC
#defcom %C40.14   PLC-UI Selezione pagina automatico da PLC
#defcom %C40.15   PLC-UI Strobe selezione asse da PLC
#defcom %C40.16   PLC-UI Strobe autoappr. quota asse selezionato
#defcom %C40.17   PLC-UI Strobe autoappr. quota assi pestone
#defcom %C40.18   PLC-UI Abilita solo ricalcolo PMI se spess. da PLC
#defcom %C40.19   PLC-UI Abilita ricalcolo PMI da sensore d'angolo SER
#defcom %C40.20   PLC-UI Rich. primo target a sensore d'angolo LC
#defcom %C40.21   PLC-UI Rich. target successivi a sensore d'angolo LC
#defcom %C40.22   PLC-UI Lazersafe Raggio Inferiore anteriore
#defcom %C40.23   PLC-UI Lazersafe Raggio Inferiore centrale
#defcom %C40.24   PLC-UI Lazersafe Raggio Inferiore posteriore
#defcom %C40.25   PLC-UI Lazersafe Raggio Superiore anteriore
#defcom %C40.26   PLC-UI Lazersafe Raggio Superiore centrale
#defcom %C40.27   PLC-UI Lazersafe Raggio Superiore posteriore
#defcom %C40.28   PLC-UI Caricatore utensili connesso (uso PLC cliente)
#defcom %C40.29   PLC-UI I bloccaggi utensili sono stati aperti
#defcom %C40.30   PLC-UI I bloccaggi utensili sono aperti in questo momento
#defcom %C40.31   PLC-UI Caricatore utensili selezionato (uso PLC cliente)

#defcom %C41      PLC-UI Numero programma selezionato da robot
#defcom %C42      PLC-UI Spessore rilevato (uso PLC cliente)
#defcom %C43      PLC-UI Numero asse selezionato da PLC

#defcom %C44.0    PLC-UI Luce pulsante START
#defcom %C44.1    PLC-UI Luce pulsante STOP
#defcom %C44.2    PLC-UI Vis. stato ciclo piega fermo al PMS
#defcom %C44.3    PLC-UI Vis. stato ciclo piega discesa veloce
#defcom %C44.4    PLC-UI Vis. stato ciclo piega fermo al PCV
#defcom %C44.5    PLC-UI Vis. stato ciclo piega discesa lenta
#defcom %C44.6    PLC-UI Vis. stato ciclo piega fermo al PCL
#defcom %C44.7    PLC-UI Vis. stato ciclo piega discesa lavoro
#defcom %C44.8    PLC-UI Vis. stato ciclo piega fermo al PMI
#defcom %C44.9    PLC-UI Vis. stato ciclo piega decompressione
#defcom %C44.10   PLC-UI Vis. stato ciclo piega salita lenta
#defcom %C44.11   PLC-UI Vis. stato ciclo piega salita veloce
#defcom %C44.12   PLC-UI Fase discesa con ciclo pressata in corso
#defcom %C44.13   PLC-UI Congelamento visualizz. quota pestone
#defcom %C44.14   PLC-UI Richiesta correzione quota bombatura

#defcom %C45      PLC-ISO Quota correzione PCV da PLC Utente
#defcom %C46      PLC-UI Quota correzione bombatura da PLC Utente

#defcom %R10      PLC-UI Contaminuti generale
#defcom %R11      PLC-UI Contaore generale
#defcom %R12      PLC-UI Contasecondi lavoro
#defcom %R13      PLC-UI Contaminuti lavoro
#defcom %R14      PLC-UI Contaore lavoro
#defcom %R15      PLC-UI Contaminuti pompa
#defcom %R16      PLC-UI Contaore pompa
#defcom %R17      PLC-UI Contapieghe per taratura asse S4
#defcom %R19      PLC-UI Contatore cicli pestone

#defcom %R25.0    UI(UIPL)-PLC Pulsante Barra Led Off

#defcom %R30      UI-PP Quota Parcheggio Pestone
#defcom %R31      UI-PP Quota Parcheggio Pestone per Allineamento Micro Sbilanciamento
#defcom %R32      UI-PP Delta Quota Parcheggio Y2 per Allineamento Micro Sbilanciamento

#defcom %R35.0    UI-PLC Disabilita Correzione Spalle da Pagina UIPL Utente
#defcom %R35.1    UI-PLC Abilitazione Pedaliera WiFi LZS (Seconda Pedaliera)

#defcom %C140     PLC-UI Velocità misurata discesa Y1
#defcom %C141     PLC-UI Velocità misurata discesa Y2
#defcom %C142     PLC-UI Velocità misurata salita Y1
#defcom %C143     PLC-UI Velocità misurata salita Y2
*C144-C161 liberi

#defcom %C162     PLC-UI Posizione asse pagina test
#defcom %C163     PLC-UI Velocita avanti asse pagina test
#defcom %C164     PLC-UI Velocita indietro asse pagina test
#defcom %C165     PLC-UI Pressione principale in bar
#defcom %C166     PLC-UI Pressione bombatura in bar

#defcom %C179.0   PLC-UI Asse Y1 in posizione
#defcom %C179.1   PLC-UI Asse Y2 in posizione
#defcom %C179.2   PLC-UI Asse X1 in posizione
#defcom %C179.3   PLC-UI Asse X2 in posizione
#defcom %C179.4   PLC-UI Asse R1 in posizione
#defcom %C179.5   PLC-UI Asse R2 in posizione
#defcom %C179.6   PLC-UI Asse Z1 in posizione
#defcom %C179.7   PLC-UI Asse Z2 in posizione
#defcom %C179.8   PLC-UI Asse A1 in posizione
#defcom %C179.9   PLC-UI Asse A2 in posizione
#defcom %C179.10  PLC-UI Asse A3 in posizione
#defcom %C179.11  PLC-UI Asse A4 in posizione
#defcom %C179.12  PLC-UI Asse A5 in posizione
#defcom %C179.13  PLC-UI Asse A6 in posizione
#defcom %C179.14  PLC-UI Asse A7 in posizione
#defcom %C179.15  PLC-UI Asse A8 in posizione
#defcom %C179.16  PLC-UI Asse S1 in posizione
#defcom %C179.17  PLC-UI Asse S2 in posizione
#defcom %C179.18  PLC-UI Asse S3 in posizione
#defcom %C179.19  PLC-UI Asse S4 in posizione
#defcom %C179.20  PLC-UI Asse S5 in posizione
#defcom %C179.21  PLC-UI Asse S6 in posizione
#defcom %C179.22  PLC-UI Asse X3 in posizione
#defcom %C179.23  PLC-UI Asse X4 in posizione
#defcom %C179.24  PLC-UI Asse R3 in posizione
#defcom %C179.25  PLC-UI Asse R4 in posizione
#defcom %C179.26  PLC-UI Asse Z3 in posizione
#defcom %C179.27  PLC-UI Asse Z4 in posizione


#defcom %C200     UI Usato per bit di appoggio dall'UI
#defcom %C201.0   UI Selez. TAB assi in pagina test
#defcom %C202.0   UI Selez. TAB pestone in pagina test

#defcom %PLCVERS             Versione programma plc
#defcom %PLCREL              Release programma plc

* messaggi PLC

#defcom %PLCmsg0.0           PLCMSG Premere Start
#defcom %PLCmsg0.1           PLCMSG Premere discesa per piegare
#defcom %PLCmsg0.2           PLCMSG Taratura pestone: premere salita
#defcom %PLCmsg0.3           PLCMSG Fotocellule escluse
#defcom %PLCmsg0.4           PLCMSG Pezzi finiti! START = continua
#defcom %PLCmsg0.7           PLCMSG Richiamo in corso
#defcom %PLCmsg0.8           PLCMSG Pompa non avviata
#defcom %PLCmsg0.9           PLCMSG Selettore rallentamento richiesto
#defcom %PLCmsg0.10          PLCMSG Emergenza da input
#defcom %PLCmsg0.11          PLCMSG Cancello laterale aperto
#defcom %PLCmsg0.12          PLCMSG Pestone non tarato
#defcom %PLCmsg0.13          PLCMSG Selez. ciclo zeta manuali
#defcom %PLCmsg0.14          PLCMSG Effettuare salita pestone
#defcom %PLCmsg0.15          PLCMSG Assi non tarati Premere START
#defcom %PLCmsg0.16          PLCMSG Gantry X non attivo
#defcom %PLCmsg0.17          PLCMSG Gantry R non attivo
#defcom %PLCmsg0.18          PLCMSG Overrun pestone OK
#defcom %PLCmsg0.19          PLCMSG Riscontri in modalità Demo (Fiera)
#defcom %PLCmsg0.20          PLCMSG Ciclo taratura sensori forza terminato
#defcom %PLCmsg0.21          PLCMSG Ciclo taratura sensori forza in corso
#defcom %PLCmsg0.22          PLCMSG Effettuare controllo utensili

#defcom %PLCmsg2.0           PLCMSG Manuale da pulsantiera attivo
#defcom %PLCmsg2.1           PLCMSG Manuale da volantino interno attivo
#defcom %PLCmsg2.2           PLCMSG Manuale da volantino esterno attivo

* Allarmi PLC

#defcom %PLCerr0.0           PLCERR Emergenza generale
#defcom %PLCerr0.1           PLCERR Intervento fotocellula
#defcom %PLCerr0.2           PLCERR Massimo Sbilanciamento
#defcom %PLCerr0.3           PLCERR CN remoto in allarme
#defcom %PLCerr0.4           PLCERR Stato CN remoto non valido
#defcom %PLCerr0.5           PLCERR Posizione pestone errata
#defcom %PLCerr0.6           PLCERR Canale in blocco
#defcom %PLCerr0.7           PLCERR Tempo massimo comando pressione
#defcom %PLCerr0.8           PLCERR Richiamo non possibile
#defcom %PLCerr0.9           PLCERR Allineamento gantry X non possibile
#defcom %PLCerr0.10          PLCERR Allineamento gantry R non possibile
#defcom %PLCerr0.11          PLCERR Allarme trasduttore LVDT Y1
#defcom %PLCerr0.12          PLCERR Allarme trasduttore LVDT Y2
#defcom %PLCerr0.13          PLCERR Programma non valido con robot
#defcom %PLCerr0.14          PLCERR Attesa OK nome programma
#defcom %PLCerr0.15          PLCERR Attesa OK uscita automatico
#defcom %PLCerr0.16          PLCERR Quota riscontri errata
#defcom %PLCerr0.20          PLCERR Superato limite sbilanciamento
#defcom %PLCerr0.21          PLCERR Mancanza Aria
#defcom %PLCerr0.25          PLCERR Mancata risposta sensore angolo
#defcom %PLCerr0.26          PLCERR Richiesta lubrificazione viti
#defcom %PLCerr0.27          PLCERR Errore angolo
#defcom %PLCerr0.28          PLCERR Errore spessore
#defcom %PLCerr0.29          PLCERR Errore PCL
#defcom %PLCerr0.30          PLCERR Selez. ext. modo non consentita
#defcom %PLCerr0.31          PLCERR Ridurre velocità pestone

#defcom %PLCerr1.0           PLCERR CN remoto non a PMS
#defcom %PLCerr1.1           PLCERR CN remoto Assi non in posizione
#defcom %PLCerr1.2           PLCERR Attesa Inizializzazione PLC
#defcom %PLCerr1.3           PLCERR Fungo Premuto o Ripari Aperti
#defcom %PLCerr1.4           PLCERR Malfunzionamento EV veloci
#defcom %PLCerr1.5           PLCERR Pestone o Assi Fuori Limite
#defcom %PLCerr1.6           PLCERR Errore Interno, Premere RESET
#defcom %PLCerr1.7           PLCERR Filtro Olio Intasato
#defcom %PLCerr1.8           PLCERR Malfunzionamento EV Proporz.
#defcom %PLCerr1.9           PLCERR Malfunzionamento EV Aspiraz.
#defcom %PLCerr1.10          PLCERR Malfunz. Selett. Modo Lavoro
#defcom %PLCerr1.11          PLCERR Intervento Barriera Ottica
#defcom %PLCerr1.12          PLCERR Emergenza Punzone Sbloccato
#defcom %PLCerr1.13          PLCERR Recupero Pressione Bloccaggio Punzone
#defcom %PLCerr1.14          PLCERR Intervento Termico Pompa
#defcom %PLCerr1.15          PLCERR Azionamento asse X : Malfunzionamento
#defcom %PLCerr1.16          PLCERR Azionamento asse R : Malfunzionamento
#defcom %PLCerr1.17          PLCERR Azionamento asse Z1 : Malfunzionamento
#defcom %PLCerr1.18          PLCERR Azionamento asse Z2 : Malfunzionamento
#defcom %PLCerr1.19          PLCERR Filtro Olio Intasato
#defcom %PLCerr1.20          PLCERR Bloccaggi superiori aperti
#defcom %PLCerr1.21          PLCERR Bloccaggi inferiori aperti
#defcom %PLCerr1.22          PLCERR Input massimo sbilanciamento
#defcom %PLCerr1.23          PLCERR Errore direzione proporzionali
#defcom %PLCerr1.24          PLCERR Start macchina (emergenza discesa)
#defcom %PLCerr1.25          PLCERR DV non consentita - controllare relé 20KA1-2-3-4
#defcom %PLCerr1.26          PLCERR Errore parcheggio A1
#defcom %PLCerr1.27          PLCERR Errore parcheggio A2
#defcom %PLCerr1.28          PLCERR Controllare trasduttore SQ1
#defcom %PLCerr1.29          PLCERR Controllare trasduttore SQ2
#defcom %PLCerr1.30          PLCERR Programma da robot non corretto
#defcom %PLCerr1.31          PLCERR Controllare stato relé KA3

#defcom %PLCerr2.0           PLCERR Sensori cuscino idraulico attivi
#defcom %PLCerr2.1           PLCERR Punzoni sbloccati
#defcom %PLCerr2.2           PLCERR Matrici sbloccate
#defcom %PLCerr2.3           PLCERR STOP attivo
#defcom %PLCerr2.4           PLCERR Controllare trasduttore SQ5
#defcom %PLCerr2.5           PLCERR Controllare trasduttore SQ6
#defcom %PLCerr2.6           PLCERR Errore ciclo autotuning
#defcom %PLCerr2.7           PLCERR Controllare trasduttore SQ7
#defcom %PLCerr2.8           PLCERR Errore posiz. riposo proporzionali
#defcom %PLCerr2.9           PLCERR Controllare trasduttore SD
#defcom %PLCerr2.10          PLCERR Overrun pestone eccessivo
#defcom %PLCerr2.11          PLCERR Timelock 10gg prima del blocco (SYSTEM ERROR PID LIMIT)
#defcom %PLCerr2.31          PLCERR Servo drives not ready

#defcom %PLCerr6             PLCERR Registro allarme utente usato per il Fiessler

* Parametri per PLC (e PP)

#defcom %outdv               PAR-PLC Conf. elettrovalvole discesa veloce
#defcom %outdl               PAR-PLC Conf. elettrovalvole discesa lenta
#defcom %outsv               PAR-PLC-PP Conf. elettrovalvole salita veloce
#defcom %outsl               PAR-PLC-PP Conf. elettrovalvole salita lenta

#defcom %pargene.bgn.0       PAR-PLC Taratura Assi Obbligatoria
#defcom %pargene.bgn.1       PAR-PLC Abilitazione pedale potenziometrico
#defcom %pargene.bgn.2       PAR-PLC Macchina di tipo elettrico
#defcom %pargene.bgn.3       PAR-PLC Ridirezione pressione (esclusione bombatura)
#defcom %pargene.bgn.4       PAR-PLC Sblocco utensili in manuale
#defcom %pargene.bgn.5       PAR-PLC Abil. scheda centinatura esterna
#defcom %pargene.bgn.6       PAR-PLC Abil. attesa cambio passo da robot
#defcom %pargene.bgn.7       PAR-PLC Pressa tandem sincronizzata
#defcom %pargene.bgn.8       PAR-PLC Inversione Fotocellule escluse
#defcom %pargene.bgn.9       PAR-PLC Start assi con pedale discesa
#defcom %pargene.bgn.10      PAR-PLC Inversione Allarmi Motori
#defcom %pargene.bgn.11      PAR-PLC Abil. pressione servo durante tempo di piega
#defcom %pargene.bgn.12      PAR-PLC Abil. ciclo Zeta manuali
#defcom %pargene.bgn.13      PAR-PLC Abil. analog out S500
#defcom %pargene.bgn.14      PAR-PP Abil. controllo tolleranza (su pressa trad.)
#defcom %pargene.bgn.15      PAR-PLC Abil. gestione robot al PCL con OPS

#defcom %pargene.dwgn0       PAR-PLC Tolleranza sensore S1 al PCL
#defcom %pargene.dwgn1       PAR-PLC Tolleranza sensore S2 al PCL
#defcom %pargene.dwgn3       PAR-PLC Valore minimo potenziometro
#defcom %pargene.dwgn4       PAR-PLC Valore massimo potenziometro
#defcom %pargene.dwgn5       PAR-PLC Costante rinculo assi Z
#defcom %pargene.dwgn6       PAR-PLC Apertura minima pestone per start assi
#defcom %pargene.dwgn8       PAR-PLC Valore sbilanciamento normale
#defcom %pargene.dwgn9       PAR-PP guadagno bilanciamento per tandem sincro
#defcom %pargene.dwgn10      PAR-PLC Abil. ripetizione automatica piega
#defcom %pargene.dwgn11      PAR-PP quota assi R sopra matrice per Z manuali
#defcom %pargene.dwgn12      PAR-PLC Ore di lavoro
#defcom %pargene.dwgn13      PAR-PLC Velocità salita pestone (tradizionale)
#defcom %pargene.dwgn14      PAR-PP Tempo attesa inizio galleggiamento
#defcom %pargene.dwgn15      PAR-PLC Quota X1-X2 limitazione velocità per sicurezza operatore
#defcom %pargene.dwgn16      PAR-PLC Tempo per driver enable

#defcom %parspec.bsp.0       PAR-PLC Abil. richiesta consenso taratura riscontri
#defcom %parspec.bsp.1       PAR-PLC Abil. controllo syncro
#defcom %parspec.bsp.2       PAR-PLC Abil. autoritenuta funz. aux. 11-15
#defcom %parspec.bsp.3       PAR-PLC Abil. set uscita PMI dopo tempo piega
#defcom %parspec.bsp.4       PAR-PLC Abil. accompagnamento lento
#defcom %parspec.bsp.5       PAR-PLC Abil. coppia accompagnatori in ciclo
#defcom %parspec.bsp.6       PAR-PLC Abil. allarmi su codice esterno
#defcom %parspec.bsp.7       PAR-PLC Abil. autoritenuta funz. aux. 1-10
#defcom %parspec.bsp.8       PAR-PLC Abil. albero elettrico per discesa
#defcom %parspec.bsp.9       PAR-PLC Abil. albero elettrico per salita
#defcom %parspec.bsp.10      PAR-PLC Abil. accompagnatori elettrici
#defcom %parspec.bsp.11      PAR-PLC Abil. pressione discesa veloce al PCV
#defcom %parspec.bsp.12      PAR-PLC Abil. salita non sincronizzata accompagnatori
#defcom %parspec.bsp.13      PAR-PLC Disab. interv. fotocellula con pedali insieme
#defcom %parspec.bsp.14      PAR-PLC Escl. pedale salita a fine piega (va a PMS calc.)
#defcom %parspec.bsp.15      PAR-PLC Abil. arresto rapido pestone con blocco avanzamento

#defcom %parspec.dwsp5       PAR-PLC Guadagno iniziale tavola attiva
#defcom %parspec.dwsp6       PAR-PLC Tempo utilizzo guadagno iniziale tavola attiva
#defcom %parspec.dwsp8       PAR-PP guadagno richiamo per valvole Hoerbiger (0=disab)
#defcom %parspec.dwsp9       PAR-PP Velocità pestone in lentissima
#defcom %parspec.dwsp10      PAR-PP Lunghezza tratto in lentissima
#defcom %parspec.dwsp11      PAR-PLC Soglia utilizzo guadagno iniziale tavola attiva
#defcom %parspec.dwsp12      PAR-PLC K Max da Parametro
#defcom %parspec.dwsp13      PAR-PLC Rampa Pressione
#defcom %parspec.dwsp14      PAR-PP Ritardo pressione salita dopo decompressione
#defcom %parspec.dwsp18      PAR-PP guadagno inseguimento asse Y1
#defcom %parspec.dwsp19      PAR-PP guadagno inseguimento asse Y2
#defcom %parspec.dwsp20.0    PAR-UI Abilita Taratura Diretta con Password
#defcom %parspec.dwsp20.1    PAR-PLC Abilita Decompressione su salita, dopo discesa lenta forzata
#defcom %parspec.dwsp20.2    PAR-PLC Abilita Algoritmo Adattativo (SLAPPG0.1)
#defcom %parspec.dwsp20.3    PAR-PLC Abilita Pressione Piega fra PCV e PCL
#defcom %parspec.dwsp20.4    PAR-UI Abilita mirror orizzontale grafica
#defcom %parspec.dwsp20.5    PAR-UI Abilita mirror verticale grafica
#defcom %parspec.dwsp20.6    PAR-PLC Abilita Algoritmo Adattativo (SLAPPG0.1) in fase di discesa lavoro
#defcom %parspec.dwsp20.7    PAR-UI Abilita il caricamento automatico del programma sulla macchina slave in tandem
#defcom %parspec.dwsp20.8    PAR-UI Abilita password livello utente
#defcom %parspec.dwsp20.9    PAR-PLC Disabilita antiripetitore con discesa fotocellule escluse (Vimerc.)
#defcom %parspec.dwsp20.10   PAR-ISO Abilita Acquisizione Spessore a 2mm dal Materiale
#defcom %parspec.dwsp20.11   PAR-UI Abilita Pulsante Pompa abilitata
#defcom %parspec.dwsp20.12   PAR-UI Abilita calcolo bombatura lineare con la forza
#defcom %parspec.dwsp20.13   PAR-UI Abilita ingresso in Manuale/Semiautomatico/Automatico con password
#defcom %parspec.dwsp20.14   PAR-UI Abilita visualizzazione registro M57 nelle pagine numeriche in Manuale/Semiautomatico/Automatico
#defcom %parspec.dwsp20.15   PAR-UI Abilita visualizzazione registro M58 nelle pagine numeriche in Manuale/Semiautomatico/Automatico
#defcom %parspec.dwsp20.16   PAR-UI Abilita gestione Accesso Operatore
#defcom %parspec.dwsp20.17   PAR-PLC Riabilita Ritardo Valvole al rilascio Pedale

#defcom %parspec.dwsp21      PAR-PLC Guadagno integrativo Discesa Veloce per arrivare su target
#defcom %parspec.dwsp22      PAR-PLC Guadagno integrativo Salita Veloce per arrivare su target
#defcom %parspec.dwsp23      PAR-PLC Guadagno integrativo Discesa Lavoro per arrivare su target
#defcom %parspec.dwsp24      PAR-PLC Guadagno Proporzionale di Velocità sul Bilanciamento
#defcom %parspec.dwsp25      PAR-PLC Guadagno Esponenziale Bilanciamento
#defcom %parspec.dwsp26      PAR-PLC Pressione Minima in punti DAC per Arrivo al PMS

#defcom %pargen_due.bgn.0    PAR-PLC Opz. gestione procedura spazio d'arresto
#defcom %pargen_due.bgn.1    PAR-PLC Opz. gestione bloccaggi superiori
#defcom %pargen_due.bgn.2    PAR-PLC Opz. gestione bloccaggi inferiori
#defcom %pargen_due.bgn.3    PAR-PLC Opz. gestione bloccaggi superiori 2
#defcom %pargen_due.bgn.4    PAR-PLC Opz. gestione Fiessler
#defcom %pargen_due.bgn.5    PAR-PLC Opz. gestione doppia pedaliera
#defcom %pargen_due.bgn.6    PAR-PLC Opz. gestione bloccaggi pneumatici
#defcom %pargen_due.bgn.7    PAR-PLC Opz. autoritenuta su pedale salita sopra PCV
#defcom %pargen_due.bgn.8    PAR-UI  Macchina lattonieri
#defcom %pargen_due.bgn.9    PAR-UI  Bombatura -100 + 100
#defcom %pargen_due.bgn.10   PAR-PLC Abil. ricarica pedale al PCL e PMI senza robot
#defcom %pargen_due.bgn.11   PAR-PLC Abil. salto su piega simulata
#defcom %pargen_due.bgn.12   PAR-PLC Abil. puls. STOP bistabile
#defcom %pargen_due.bgn.13   PAR-PLC Esclude ciclo taratura pestone
#defcom %pargen_due.bgn.14   PAR-PLC Abil. salita pestone a fine taratura
#defcom %pargen_due.bgn.15   PAR-PLC Abil. ciclo setup taratura gantry

#defcom %pargen_due.dgn0     PAR-UI Massima pressione Cuscino idraulico
#defcom %pargen_due.dgn1     PAR-UI Coefficente forza ribattuta
#defcom %pargen_due.dgn2     PAR-PLC-SLAPPG Quota passaggio velocità lentissima
#defcom %pargen_due.dgn3     PAR-PLC Quota rall. pestone sola lettura o NVEL in salita
#defcom %pargen_due.dgn4     PAR-PLC Ritardo caduta Press.e OFF Valvole Salita
#defcom %pargen_due.dgn5     PAR-UI-PP Fondo Scala Bombatura
#defcom %pargen_due.dgn6     PAR-UI Disabilita controllo collisione riscontro
#defcom %pargen_due.dgn7     PAR-PP Acceleraz. discesa veloce pestone OL
#defcom %pargen_due.dgn8     PAR-PP Massimo guadagno integrativo Y1
#defcom %pargen_due.dgn9     PAR-PP Massimo guadagno integrativo Y2
#defcom %pargen_due.dgn10    PAR-PP Limite massimo di tensione sul dac per guad. variabile DL
#defcom %pargen_due.dgn11    PAR-PP Tempo costante Decompressione a Trapezio
#defcom %pargen_due.dgn12    PAR-PP Frequenza taglio filtro DAC Y1 discesa lavoro
#defcom %pargen_due.dgn13    PAR-PP Frequenza taglio filtro DAC Y2 discesa lavoro
#defcom %pargen_due.dgn14    PAR-PP Massima tensione in discesa lenta (mVolt)
#defcom %pargen_due.dgn15    PAR-PP Massima tensione in discesa Veloce (mVolt)
#defcom %pargen_due.dgn16    PAR-PP Accel. per camp. spessore con sensore pressione
#defcom %pargen_due.dgn17    PAR-PLC Guadagno K tavola attiva
#defcom %pargen_due.dgn18    PAR-PLC Pompa Singola per tavola attiva
#defcom %pargen_due.dgn19    PAR-PP Ritardo Inizio Campionamento sensore pressione
#defcom %pargen_due.dgn20    PAR-PP Decelerazione Pestone DV CL
#defcom %pargen_due.dgn21    PAR-PP Decelerazione Pestone SV CL
#defcom %pargen_due.dgn22    PAR-PP Insensibilità Neg. DV Y1
#defcom %pargen_due.dgn23    PAR-PP Insensibilità Neg. DV Y2
#defcom %pargen_due.dgn24    PAR-PP Insensibilità Pos. SV Y1
#defcom %pargen_due.dgn25    PAR-PP Insensibilità Pos. SV Y2
#defcom %pargen_due.dgn26    PAR-PP Limite max. tensione dac per guad. variabile DV e SV
#defcom %pargen_due.dgn27    PAR-PP Tempo tolleranza in discesa veloce
#defcom %pargen_due.dgn28    PAR-PP Correzione PCL
#defcom %pargen_due.dgn29    PAR-PP Errore inseguimento massimo
#defcom %pargen_due.dgn30    PAR-PP Errore inseguimento salita veloce
#defcom %pargen_due.dgn31    PAR-PP Quota minima Decompressione
#defcom %pargen_due.dgn32    PAR-PP guadagno bilanciamento in Salita Veloce
#defcom %pargen_due.dgn33    PAR-PP Forza min. decomp.
#defcom %pargen_due.dgn34    PAR-PP Massima Velocità Angolare in Piega
#defcom %pargen_due.dgn35    PAR-PLC Ritardo attivazione Valvole Discesa Veloce
#defcom %pargen_due.dgn36    PAR-PLC Ritardo disattivazione Valvole Discesa Veloce
#defcom %pargen_due.dgn37    PAR-PP Offset quota accompagnatori
#defcom %pargen_due.dgn38    PAR-PLC Tensione limite in salita (mV)
#defcom %pargen_due.dgn39    PAR-PLC Tensione limite per velocità di sicurezza (mV)
#defcom %pargen_due.dgn40    PAR-PLC Soglia intervento limitatore tracking error (%)
#defcom %pargen_due.dgn41    PAR-PP Offset Quota Risalita Pestone con Accompagnatori
#defcom %pargen_due.dgn42    PAR-PLC Frequenza taglio filtro DAC discesa veloce (Hz)
#defcom %pargen_due.dgn43    PAR-PLC Frequenza taglio filtro DAC salita veloce (Hz)
#defcom %pargen_due.dgn44    PAR-UI Margine da aggiungere rispetto alla forza teorica (%)
#defcom %pargen_due.dgn45    PAR-UI X1 center of rotation, Z position
#defcom %pargen_due.dgn46    PAR-UI X2 center of rotation, Z position
#defcom %pargen_due.dgn47    PAR-UI Distance between finger stop and bar
#defcom %pargen_due.dgn48    PAR-PP Decompression to target speed (m/min)
#defcom %pargen_due.dgn49    PAR-PP Decompression to target tolerance time (s)
#defcom %pargen_due.dgn50    PAR-PP Decompression to target max voltage (V)
#defcom %pargen_due.dgn51    PAR-PP Decompression to target gain (DAC steps/encoder pulses)
#defcom %pargen_due.dgn52    PAR-UI Riservato zfw conica
#defcom %pargen_due.dgn53    PAR-PP Quota massima Decompressione
#defcom %pargen_due.dgn54    PAR-UI Minima distanza tra le stazioni
#defcom %pargen_due.dgn55    PAR-PP Quota X sicurezza basamento 1
#defcom %pargen_due.dgn56    PAR-PP Quota R sicurezza basamento 1
#defcom %pargen_due.dgn57    PAR-PLC Posizione parcheggio pestone per cambio utensili automatico
#defcom %pargen_due.dgn58    PAR-UI Minima posizione stazioni
#defcom %pargen_due.dgn59    PAR-UI Massima posizione stazioni
#defcom %pargen_due.dgn60    PAR-UI Angolo di prebend dinamico
#defcom %pargen_due.dgn61    PAR-PP Angolo di prebend per ricalcolo bombatura meccanica
#defcom %pargen_due.dgn62    PAR-PLC-PP Tempo minimo decompressione
#defcom %pargen_due.dgn63    PAR-PP Quota X sicurezza basamento 2
#defcom %pargen_due.dgn64    PAR-PP Quota R sicurezza basamento 2
#defcom %pargen_due.dgn65    PAR-PP Quota X sicurezza basamento 3
#defcom %pargen_due.dgn66    PAR-PP Quota R sicurezza basamento 3
#defcom %pargen_due.dgn67    PAR-PP Quota X sicurezza basamento 4
#defcom %pargen_due.dgn68    PAR-PP Quota R sicurezza basamento 4

#defcom %pargen_due.dwgn0    PAR-PLC Preset ritardo controllo direz. valvole prop.
#defcom %pargen_due.dwgn1    PAR-PLC Preset ritardo controllo relé 20KA1-2-3-4
#defcom %pargen_due.dwgn2    PAR-PLC Preset ritardo controllo valvole discesa accompagnatori
#defcom %pargen_due.dwgn3    PAR-PLC Preset ritardo controllo relé KA3
#defcom %pargen_due.dwgn4    PAR-PLC Preset ritardo controllo pressostato bloccaggi
#defcom %pargen_due.dwgn5    PAR-PLC Preset ritardo controllo EV sicurezza
#defcom %pargen_due.dwgn6    PAR-PLC Preset impulso messa in pressione cuscino idraulico
#defcom %pargen_due.dwgn7    PAR-PLC Pressione sblocco punzone
#defcom %pargen_due.dwgn8    PAR-PLC Pressione sblocco matrice
#defcom %pargen_due.dwgn9    PAR-PLC K Ritardo caduta Press.e OFF Valvole Discesa (1000 = tdeco)
#defcom %pargen_due.dwgn10   PAR-PLC Ritardo attiv. Press. dopo Valvole Discesa
#defcom %pargen_due.dwgn11   PAR-PLC Modo lavoro LazerSafe: 0-2=Staz.A, 3-5=Staz.A+B, 8-10=Staz.B
#defcom %pargen_due.dwgn13   PAR-PLC Pressione decompressione (gradini DAC)
#defcom %pargen_due.dwgn12   PAR-UI-PLC Distanza 0 interno spalla
#defcom %pargen_due.dwgn14   PAR-PLC Anticipo disatt. pressione decompressione
#defcom %pargen_due.dwgn15   PAR-UI Coefficiente Angolo Alluminio
#defcom %pargen_due.dwgn16   PAR-UI Coefficiente Angolo Ferro
#defcom %pargen_due.dwgn17   PAR-UI Coefficiente Angolo Acciaio
#defcom %pargen_due.dwgn18   PAR-PP Guadagno bilanciamento tandem in discesa veloce

#defcom %pargen_due.dwgn19.0 PAR-PLC Abil. pressione discesa manuale al PCV
#defcom %pargen_due.dwgn19.1 PAR-PP Abil. velocità discesa manuale da PCV a PCL
#defcom %pargen_due.dwgn19.2 PAR-PLC Abil. salita pestone con emergenza
#defcom %pargen_due.dwgn19.3 PAR-PLC LazerSafe: stop at mute
#defcom %pargen_due.dwgn19.4 PAR-PLC Comando PMS con controllo syncro
#defcom %pargen_due.dwgn19.5 PAR-PLC Forza cambio passo al PMS
#defcom %pargen_due.dwgn19.6 PAR-PLC Abil. risalita al PMS con rilascio pedale in DV
#defcom %pargen_due.dwgn19.7 PAR-PLC Escl. decompressione in manuale
#defcom %pargen_due.dwgn19.8 PAR-PLC Controllo SQ1 e 2 con comando Valvole
#defcom %pargen_due.dwgn19.9 PAR-PLC Intervento Fotocellule solo in Veloce
#defcom %pargen_due.dwgn19.10 PAR-PLC Intervento Fotocellule No Auto Open
#defcom %pargen_due.dwgn19.11 PAR-PLC Emergenza da ausiliari
#defcom %pargen_due.dwgn19.12 PAR-PLC Sel. ciclo taratura pestone in battuta
#defcom %pargen_due.dwgn19.13 PAR-PLC Forza Cambio Passo a Fine Piega
#defcom %pargen_due.dwgn19.14 PAR-PLC OUT PMS a pestone fermo
#defcom %pargen_due.dwgn19.15 PAR-PLC Tandem su ring 0
#defcom %pargen_due.dwgn19.16 PAR-PLC Abil. volantino su frontale
#defcom %pargen_due.dwgn19.17 PAR-PLC Abil. bombatura dinamica
#defcom %pargen_due.dwgn19.18 PAR-PLC Abil. volantino su frontale in inseguimento
#defcom %pargen_due.dwgn19.19 PAR-PP Abilita decompressione pressa elettrica
#defcom %pargen_due.dwgn19.20 PAR-PLC Sel. ciclo taratura pestone in due fasi
#defcom %pargen_due.dwgn19.21 PAR-PLC Abil. controllo sbilanciamento in taratura
#defcom %pargen_due.dwgn19.22 PAR-PLC No pressione modo funzionamento asse Y1 = 2
#defcom %pargen_due.dwgn19.23 PAR-PLC Abilita taratura pestone con START
#defcom %pargen_due.dwgn19.24 PAR-UI  Azzera parametri generali con nuovo programma su S525
#defcom %pargen_due.dwgn19.25 PAR-PLC Decompressione a quota in discesa lenta
#defcom %pargen_due.dwgn19.26 PAR-PLC Forza bombatura in alta risoluzione
#defcom %pargen_due.dwgn19.27 PAR-PLC Abilita correzione PMI con strain gauge
#defcom %pargen_due.dwgn19.28 PAR-PLC Abilita riscontri in modalità fiera
#defcom %pargen_due.dwgn19.29 PAR-PLC Abilita modo risalita a step
#defcom %pargen_due.dwgn19.30 PAR-UI Abilita Accesso Pagina Manuale con Password
#defcom %pargen_due.dwgn19.31 PAR-PLC Abilita modo INC al PMI senza allineare Y1 ed Y2 (Modo conico)

#defcom %pargen_due.dwgn20   PAR-PLC Quota anticipo discesa lenta su PCV
#defcom %pargen_due.dwgn21   PAR-UI Interdistanza minima Z1-Z3
#defcom %pargen_due.dwgn22   PAR-UI Interdistanza minima Z3-Z4
#defcom %pargen_due.dwgn23   PAR-UI Interdistanza minima Z4-Z2
#defcom %pargen_due.dwgn24   PAR-UI Interdistanza minima Z3-Z2
#defcom %pargen_due.dwgn25   PAR-PP Ritardo On Valvole->On Proporzionali DV
#defcom %pargen_due.dwgn26   PAR-PP Velocità di Sicurezza
#defcom %pargen_due.dwgn27   PAR-PP Quota Anticipo PCV
#defcom %pargen_due.dwgn28   PAR-PP Guadagno prop. bombatura attiva
#defcom %pargen_due.dwgn29   PAR-LZS Tipo controllo parita connessione PCSS
#defcom %pargen_due.dwgn30   PAR-PLC Ritardo lettura angolo sensore Datam
#defcom %pargen_due.dwgn31   PAR-PLC Tempo galleggiamento pestone NVEL con sensore Datam
#defcom %pargen_due.dwgn32   PAR-PLC Tempo massimo comando pressione
#defcom %pargen_due.dwgn33   PAR-PLC Tensione filtraggio olio (mV)
#defcom %pargen_due.dwgn34   PAR-PLC Quota controllo spazio arresto pestone
#defcom %pargen_due.dwgn35   PAR-PLC Tempo Rampa Discesa Pressione Rilascio Pedale in Piega
#defcom %pargen_due.dwgn36   PAR-PLC Guadagno Bilanciamento Salita Galleggiamento (0 = 1000)
#defcom %pargen_due.dwgn37   PAR-PLC Massimo Galleggiamento mm per misura angolo con Strain Gauge
#defcom %pargen_due.dwgn38   PAR-PLC Tensione salita prima della discesa veloce (mV)
#defcom %pargen_due.dwgn39   PAR-PLC Tempo salita prima della discesa veloce (ms)
#defcom %pargen_due.dwgn40   PAR-PLC Forza commutazione guadagno decompressione (%) (ibrida speciale)
#defcom %pargen_due.dwgn41   PAR-PLC Guadagno decompressione con forza bassa (ibrida speciale)
#defcom %pargen_due.dwgn42   PAR-PLC Guadagno decompressione con forza alta (ibrida speciale)
#defcom %pargen_due.dwgn43   PAR-PLC Numero pieghe per azzeramento automatico sensore S4
#defcom %pargen_due.dwgn44   PAR-PLC VMAX per Tracking Error mm-min Discesa Veloce
#defcom %pargen_due.dwgn45   PAR-PLC VMAX per Tracking Error mm-min Discesa Lenta
#defcom %pargen_due.dwgn46   PAR-PLC VMAX per Tracking Error mm-min Salita Veloce
#defcom %pargen_due.dwgn47   PAR-PLC Soglia intervento tracking error in fase di accelerazione [um]. Normalmente 5
#defcom %pargen_due.dwgn48   PAR-PLC Kp filtro per estrarre bit di acc/cruise/dec [Hz] x 1000.  Normalmente 5 Hz (5000)
#defcom %pargen_due.dwgn49   PAR-PLC Kd Y1
#defcom %pargen_due.dwgn50   PAR-PLC Kd Y2
#defcom %pargen_due.dwgn51   PAR-PLC Limitazione Kd (ImpulsiEncoder/t.reg)
#defcom %pargen_due.dwgn52   PAR-PLC Anticipo arretramento riscontri per rinculo (%)
#defcom %pargen_due.dwgn53   PAR-PLC Lunghezza barra led WILA (mm)
#defcom %pargen_due.dwgn54   PAR-PLC Secondo punto di Mute prima del Mute standard (mm)
#defcom %pargen_due.dwgn55   UI-UI Percentuale scostamento Z
#defcom %pargen_due.dwgn56   UI-UI Ritardo per cambiare layout IMP\MAN\SAUTO\AUTO
#defcom %pargen_due.dwgn57   UI-UI Quota sicurezza X piega schiaccia
#defcom %pargen_due.dwgn58   PAR-PLC Tempo uscita pressione per taratura bombatura
#defcom %pargen_due.dwgn59   PAR-PLC % pressione per taratura bombatura
#defcom %pargen_due.dwgn60   PAR-PLC Tempo attesa rilassamento bombatura
#defcom %pargen_due.dwgn61   PAR-PLC Tempo fasi ciclo taratura automatica sensori correzione spalle (ms)
#defcom %pargen_due.dwgn62   Libero
#defcom %pargen_due.dwgn63   PAR-UI Tipo ibrida

#defcom %pargen_due.dwgn64.0 UI-UI Disabilitazione copia correzione angolo Y1 su Y2
#defcom %pargen_due.dwgn64.1 UI-UI Nasconde nel menu in Manuale/SAUTO/AUTO le voci per aprire le pagine UIPL utente e speciale
#defcom %pargen_due.dwgn64.2 PAR-PLC Abil. ibrida Esa
#defcom %pargen_due.dwgn64.3  PAR-PLC Abil. accompagnatori al PMI con volantino
#defcom %pargen_due.dwgn64.4 PAR-UI Ricalcolo R1 con modifica angolo X1-X2
#defcom %pargen_due.dwgn64.5 PAR-PLC forza cambio passo al rilascio pedale
#defcom %pargen_due.dwgn64.6 PAR-PLC abilita rinculo senza sosta pestone
#defcom %pargen_due.dwgn64.7 PAR-PLC Abil. salita R in zona matrice
#defcom %pargen_due.dwgn64.8 PAR-UI Conic bar fulcrum is on the left
#defcom %pargen_due.dwgn64.9 PAR-UI Enable Calculation Conic Bar
#defcom %pargen_due.dwgn64.10 PAR-UI Conic bar debug enable
#defcom %pargen_due.dwgn64.11 PAR-UI Non ricalcolo bombatura se viene modificata manualmente la forza
#defcom %pargen_due.dwgn64.12 PAR-UI Parametro per non chiedere l'inserimento di un nuovo passo
#defcom %pargen_due.dwgn64.13 PAR-UI Parametro per salvare il programma al cambio di stato e alla pressione dello START
#defcom %pargen_due.dwgn64.14 PAR-UI Configurazione Custom UI 1
#defcom %pargen_due.dwgn64.15 PAR-PLC Abil. gestione fotoc. motorizzate da PCSS
#defcom %pargen_due.dwgn64.16 PAR-PLC Abil. limitatore JOG
#defcom %pargen_due.dwgn64.17 PAR-PLC Modo decompressione (0=standard, 1=a quota)
#defcom %pargen_due.dwgn64.18 PAR-UI Abil. compensazione a zone
#defcom %pargen_due.dwgn64.19 PAR-PLC-PP Abil. quote inizio-fine ciclo accompagnatori da programma
#defcom %pargen_due.dwgn64.20 PAR-PLC Abil. seconda barra LED su matrice
#defcom %pargen_due.dwgn64.21 PAR-PLC Abil. parcheggio telecamera prima della discesa accompagnatori
#defcom %pargen_due.dwgn64.22 PAR-UI Abil. invio comando Extended Tool Info al LaserCheck
#defcom %pargen_due.dwgn64.23 PAR-PLC Disab. acquisizione spessore per MCS
#defcom %pargen_due.dwgn64.24 PAR-UI Abil. utilizzo comando per lettura angoli front e back dal LaserCheck
#defcom %pargen_due.dwgn64.25 PAR-PLC Abil. comando valvole Y1-Y2 a doppio solenoide
#defcom %pargen_due.dwgn64.26 PAR-UI Abil. controllo collisioni durante esecuzione pezzo
#defcom %pargen_due.dwgn64.27 PAR-PLC Abil. press. servo tra PCV e PCL (elettrica)
#defcom %pargen_due.dwgn64.29 PAR-PLC Presenza cambio utensili automatico (ATC)
#defcom %pargen_due.dwgn64.30 PAR-PLC Abil. correzione target PMI durante la piega
#defcom %pargen_due.dwgn64.31 PAR-UI Abil. metodo 5 sensori d'angolo

#defcom %pargen_due.dwgn65   PAR-PLC Pressione precarica discesa veloce (bar)
#defcom %pargen_due.dwgn66   PAR-PLC Velocita precarica Y1 discesa veloce (mV)
#defcom %pargen_due.dwgn67   PAR-PLC Velocita mantenimento discesa veloce (mV)
#defcom %pargen_due.dwgn68   PAR-PLC Pressione precarica salita veloce (bar)
#defcom %pargen_due.dwgn69   PAR-PLC Velocita precarica Y1 salita veloce (mV)
#defcom %pargen_due.dwgn70   PAR-PLC Velocita precarica Y2 salita veloce (mV)
#defcom %pargen_due.dwgn71   PAR-PLC Velocita mantenimento salita veloce (mV)
#defcom %pargen_due.dwgn72   PAR-PLC Pressione minima cilindri (bar)
#defcom %pargen_due.dwgn73   PAR-PLC Pressione minima accumulatore (bar)
#defcom %pargen_due.dwgn74   PAR-PLC Tempo chiusura sostegni (ms)
#defcom %pargen_due.dwgn75   PAR-PLC Rampa discesa pressione in decompressione (ms)
#defcom %pargen_due.dwgn76   PAR-UI  Wila TIPS_Config
#defcom %pargen_due.dwgn77   PAR-PLC Max discesa lavoro su accumulatore (mm)
#defcom %pargen_due.dwgn78   PAR-PLC Offset homing per staffe da PCSS
#defcom %pargen_due.dwgn79   PAR-PLC Pressione massima accumulatore (bar)
#defcom %pargen_due.dwgn80   PAR-PLC Fondo scala sensore pressione  (bar)
#defcom %pargen_due.dwgn81   PAR-PLC Fondo scala sensore pressione bombatura (bar)
#defcom %pargen_due.dwgn82   PAR-PLC Tempo apertura valvole salita (ms)
#defcom %pargen_due.dwgn83   PAR-UI Abilitazione server DLL utente
#defcom %pargen_due.dwgn84   PAR-PLC Filtro inseguim. accompagnatori (ms)
#defcom %pargen_due.dwgn85   PAR-PLC Velocita precarica Y2 discesa veloce (mV)
#defcom %pargen_due.dwgn86   PAR-PLC Tensione limite minima per discesa lenta (mV)
#defcom %pargen_due.dwgn87   PAR-PLC Tensione limite minima per velocita di sicurezza (mV)
#defcom %pargen_due.dwgn88   PAR-UI Selez. modo invio file ATC

#defcom %pargen_due.dwgn89.0 PAR-UI Abil. metodo 8 come piega copiata di default
#defcom %pargen_due.dwgn89.1 PAR-UI Abil. misura ritorno elastico con il metodo 6
#defcom %pargen_due.dwgn89.2 PAR-UI Abil. limitazione larghezza pezzo alla larghezza della macchina
#defcom %pargen_due.dwgn89.3 PAR-UI Disabilita Warning su angolo a zero
#defcom %pargen_due.dwgn89.4 PAR-UI Salvataggio automatico pezzi fatti e da fare
#defcom %pargen_due.dwgn89.5 PAR-UI Abil. 3D integrato
#defcom %pargen_due.dwgn89.6 PAR-UI Abil. da metodo 7 a metodo 8 al termine della piega
#defcom %pargen_due.dwgn89.7 PAR-UI Abil. quota parcheggio laser sul primo punto di misura
#defcom %pargen_due.dwgn89.8 PAR-UI Abil. copia quota X1 in X2, X3 in X4
#defcom %pargen_due.dwgn89.9 PAR-UI Abil. copia quota X1 in X2,X3,X4
#defcom %pargen_due.dwgn89.10 PAR-UI Abil. visualizzazione ordine assi X 1-2-3-4
#defcom %pargen_due.dwgn89.11 PAR-PLC Abil. selezione accompagnatori piega per piega

#defcom %pargen_due.dwgn90   PAR-PLC Quota congelamento quota pestone al PMS
#defcom %pargen_due.dwgn91   PAR-PLC Frequenza PWM valvole Y1-Y2
#defcom %pargen_due.dwgn92   PAR-UI Modo standard calcolo misure riscontri (0=Esterne,1=Int. senza sviluppo,2=Interne)
#defcom %pargen_due.dwgn93   PAR-PLC Rampa arresto rapido in discesa veloce (ms)
#defcom %pargen_due.dwgn94   PAR-PLC Isteresi sensori correzione PMI (mV)
#defcom %pargen_due.dwgn95   PAR-PLC Altezza secondo PCV
#defcom %pargen_due.dwgn96   PAR-PP Massima velocita accompagnamento (mm/min)
#defcom %pargen_due.dwgn97   PAR-PLC Lunghezza vis. assi Z su barra LED (mm)
#defcom %pargen_due.dwgn98   PAR-PLC Massimo sbilanciamento Y1-Y2 da volantino (um)

#defcom %UsrDll1.bDllEnable.0 PAR-PLC Abilita DLL pulsantiera ausiliaria
#defcom %UsrDll2.bDllEnable.0 PAR-PLC Abilita DLL LazerSafe
#defcom %UsrDll4.bDllEnable.0 PAR-PLC Abilita DLL Fiessler
#defcom %UsrDll6.bDllEnable.0 PAR-PLC Abilita DLL MCS

VAR_IN_OUT
SensVoltage AT %sgtcVolt; * PAR-PLC Tensione strain gauge da tabella (mV)
CorrLength AT %sgtcCorr; * PAR-PLC Correzione strain gauge da tabella (um)
END_VAR

* Parametri canali di base usati da PLC

#defcom %cn0.cc1             PAR-PLC maschera assi configurati nel canale 0
#defcom %cn1.cc1             PAR-PLC maschera assi configurati nel canale 1
#defcom %cn2.cc1             PAR-PLC maschera assi configurati nel canale 2
#defcom %cn3.cc1             PAR-PLC maschera assi configurati nel canale 3
#defcom %cn4.cc1             PAR-PLC maschera assi configurati nel canale 4
#defcom %cn5.cc1             PAR-PLC maschera assi configurati nel canale 5
#defcom %cn7.cc1             PAR-PLC maschera assi configurati nel canale 7

* Parametri assi di base usati da PLC

#defcom %ax0.pa2             PAR-PLC tolleranza grossolana asse Y1 (NVEL)
#defcom %ax0.pa10            PAR-PLC quota minima asse Y1 (NVEL)
#defcom %ax0.pa11            PAR-PLC quota massima asse Y1 (NVEL)
#defcom %ax0.pa17            PAR-PLC quota rallentamento avanti asse Y1 (NVEL)
#defcom %ax0.pa28            PAR-PLC quota inerzia indietro asse Y1 (NVEL)

#defcom %ax1.pa2             PAR-PLC tolleranza grossolana asse Y2 (NVEL)
#defcom %ax1.pa10            PAR-PLC quota minima asse Y2 (NVEL)
#defcom %ax1.pa11            PAR-PLC quota massima asse Y2 (NVEL)
#defcom %ax1.pa17            PAR-PLC quota rallentamento avanti asse Y2 (NVEL)
#defcom %ax1.pa28            PAR-PLC quota inerzia indietro asse Y2 (NVEL)

#defcom %ax2.pa3.25          PAR-PLC Gantry asse X1-X2 abilitato
#defcom %ax4.pa3.25          PAR-PLC Gantry asse R1-R2 abilitato

#defcom %ax2.pa2             PAR-PLC Rampa decelerazione X1 (ms)
#defcom %ax3.pa2             PAR-PLC Rampa decelerazione X2 (ms)
#defcom %ax22.pa2            PAR-PLC Rampa decelerazione X3 (ms)
#defcom %ax23.pa2            PAR-PLC Rampa decelerazione X4 (ms)

#defcom %ax2.pa9             PAR-PLC velocita massima asse X1
#defcom %ax3.pa9             PAR-PLC velocita massima asse X2
#defcom %ax22.pa9            PAR-PLC velocita massima asse X3
#defcom %ax23.pa9            PAR-PLC velocita massima asse X4
#defcom %ax4.pa9             PAR-PLC velocita massima asse R1
#defcom %ax5.pa9             PAR-PLC velocita massima asse R2
#defcom %ax24.pa9            PAR-PLC velocita massima asse R3
#defcom %ax25.pa9            PAR-PLC velocita massima asse R4
#defcom %ax6.pa9             PAR-PLC velocita massima asse Z1
#defcom %ax7.pa9             PAR-PLC velocita massima asse Z2
#defcom %ax26.pa9            PAR-PLC velocita massima asse Z3
#defcom %ax27.pa9            PAR-PLC velocita massima asse Z4

#defcom %ax18.pa2            PAR-PLC quota tolleranza asse S3 (NVEL)
#defcom %ax18.pa10           PAR-PLC quota minima asse S3 (NVEL)

#defcom %pa0                 PAR-PLC tipo asse (1-4=prop,20=NVEL,30=pest)
#defcom %pa9                 PAR-PLC velocitá massima asse
#defcom %pa64                PAR-PLC valore riduzione di coppia (1000=100%)
#defcom %nvel3               PAR-PLC tipo di encoder (pest.), 3=potenziom. 16 bit
#defcom %nvel6               PAR-PLC tipo di encoder (prop.), 2=potenziom.
#defcom %nvel10              PAR-PLC tipo di encoder (NVEL), 2=potenziom.
#defcom %nvel11              PAR-PLC tipo di drive, 0=analogico

* Parametri configurazione assi usati dal PLC

#defcom %dt1                 PAR-PLC tipo di motore (1=pestone idr.)
#defcom %dt2                 PAR-PLC Tipo taratura (9=disab)
#defcom %dt5                 PAR-PLC Numero di decimali
#defcom %dt6.0               PAR-PLC Direzione taratura indietro
#defcom %dt7.0               PAR-PLC Asse normalmente in coppia
#defcom %dt32.0              PAR-PLC Ciclo taratura abilitato in passo 1
#defcom %dt32.1              PAR-PLC Ciclo taratura abilitato in passo 2
#defcom %dt32.2              PAR-PLC Ciclo taratura abilitato in passo 3
#defcom %dt32.3              PAR-PLC Ciclo taratura abilitato in passo 4

#defcom %cax0.dt0            PAR-PLC asse Y1 presente
#defcom %cax0.dt1            PAR-PLC tipo di motore Y1
#defcom %cax0.dt6            PAR-PLC Direzione taratura indietro Y1
#defcom %cax0.dt26.0         PAR-PLC Asse Y1 in simulato
#defcom %cax0.dt27           PAR-PLC Modo funzionamento asse Y1

#defcom %cax1.dt0            PAR-PLC asse Y2 presente
#defcom %cax1.dt1            PAR-PLC tipo di motore Y2
#defcom %cax1.dt6            PAR-PLC Direzione taratura indietro Y2
#defcom %cax1.dt27           PAR-PLC Modo funzionamento asse Y2

#defcom %cax2.dt0            PAR-PLC asse X1 presente
#defcom %cax2.dt6            PAR-PLC Direzione taratura indietro X1
#defcom %cax2.dt32.0         PAR-PLC Ciclo taratura X1 in passo 1
#defcom %cax2.dt32.1         PAR-PLC Ciclo taratura X1 in passo 2
#defcom %cax2.dt32.2         PAR-PLC Ciclo taratura X1 in passo 3
#defcom %cax2.dt32.3         PAR-PLC Ciclo taratura X1 in passo 4

#defcom %cax3.dt0            PAR-PLC asse X2 presente
#defcom %cax3.dt6            PAR-PLC Direzione taratura indietro X2
#defcom %cax3.dt27           PAR-PLC Modo funzionamento asse X2 (7=incrementale)

#defcom %cax4.dt0            PAR-PLC asse R1 presente
#defcom %cax4.dt6            PAR-PLC Direzione taratura indietro R1

#defcom %cax5.dt0            PAR-PLC asse R2 presente
#defcom %cax5.dt6            PAR-PLC Direzione taratura indietro R2

#defcom %cax6.dt0            PAR-PLC asse Z1 presente
#defcom %cax6.dt6            PAR-PLC Direzione taratura indietro Z1

#defcom %cax7.dt0            PAR-PLC asse Z2 presente
#defcom %cax7.dt6            PAR-PLC Direzione taratura indietro Z2

#defcom %cax8.dt0            PAR-PLC asse A1 presente
#defcom %cax8.dt1            PAR-PLC tipo di motore A1
#defcom %cax8.dt6            PAR-PLC Direzione taratura indietro A1
#defcom %cax8.dt27           PAR-PLC Modo funzionamento asse A1 (6=asse Z3)

#defcom %cax9.dt0            PAR-PLC asse A2 presente
#defcom %cax9.dt27           PAR-PLC Modo funzionamento asse A2 (4=centinatura)

#defcom %cax10.dt0           PAR-PLC asse A3 presente
#defcom %cax10.dt27          PAR-PLC Modo funzionamento asse A3 (4=centinatura)

#defcom %cax11.dt0           PAR-PLC asse A4 presente
#defcom %cax11.dt27          PAR-PLC Modo funzionamento asse A4 (11=staffa motor.)

#defcom %cax12.dt0           PAR-PLC asse A5 presente
#defcom %cax13.dt0           PAR-PLC asse A6 presente
#defcom %cax14.dt0           PAR-PLC asse A7 presente

#defcom %cax15.dt0           PAR-PLC asse A8 presente
#defcom %cax15.dt27          PAR-PLC Modo funzionamento asse A8 (5=carrello sensore angolo)

#defcom %cax16.dt0           PAR-PLC asse S1 presente
#defcom %cax17.dt0           PAR-PLC asse S2 presente
#defcom %cax18.dt0           PAR-PLC asse S3 presente
#defcom %cax19.dt0           PAR-PLC asse S4 presente
#defcom %cax20.dt0           PAR-PLC asse S5 presente
#defcom %cax21.dt0           PAR-PLC asse S6 presente

#defcom %cax18.dt27          PAR-PLC Modo funz. asse S3 (4=bombatura attiva)
#defcom %cax19.dt27          PAR-PLC Modo funz. asse S4 (5=sens. pest. per bomb. attiva)

#defcom %cax16.dt26.0        PAR-PLC asse S1 in simulato
#defcom %cax17.dt26.0        PAR-PLC asse S2 in simulato

#defcom %cax22.dt0           PAR-PLC asse X3 presente
#defcom %cax23.dt0           PAR-PLC asse X4 presente
#defcom %cax24.dt0           PAR-PLC asse R3 presente
#defcom %cax25.dt0           PAR-PLC asse R4 presente
#defcom %cax26.dt0           PAR-PLC asse Z3 presente
#defcom %cax27.dt0           PAR-PLC asse Z4 presente

* Parametri configurazione I/O

#defcom %ConfigIO2.byNReg     PAR-PLC Scheda input intervento fotocellula
#defcom %ConfigIO5.byNReg     PAR-PLC Scheda input fotocellule escluse
#defcom %ConfigIO6.byNReg     PAR-PLC Scheda input emergenza generale
#defcom %ConfigIO8.byNReg     PAR-PLC Scheda input StatoRemoto Automatico
#defcom %ConfigIO9.byNReg     PAR-PLC Scheda input StatoRemoto Semiautomatico
#defcom %ConfigIO13.byNReg    PAR-PLC Scheda input funzionamento con robot
#defcom %ConfigIO28.byNReg    PAR-PLC Scheda input cambio passo
#defcom %ConfigIO29.byNReg    PAR-PLC Scheda input micro rinculo
#defcom %ConfigIO30.byNReg    PAR-PLC Scheda input micro PMS
#defcom %ConfigIO37.byNReg    PAR-PLC Scheda input allarme Intervento Termico Pompa
#defcom %ConfigIO38.byNReg    PAR-PLC Scheda input allarme Azionamento asse X
#defcom %ConfigIO39.byNReg    PAR-PLC Scheda input allarme Azionamento asse R
#defcom %ConfigIO40.byNReg    PAR-PLC Scheda input allarme Azionamento asse Z1
#defcom %ConfigIO41.byNReg    PAR-PLC Scheda input allarme Azionamento asse Z2
#defcom %ConfigIO45.byNReg    PAR-PLC Scheda input selett. 2 abil. accompagnatori
#defcom %ConfigIO46.byNReg    PAR-PLC Scheda input Mancanza aria NC
#defcom %ConfigIO47.byNReg    PAR-PLC Scheda input Puls. abil. volantino da encoder
#defcom %ConfigIO48.byNReg    PAR-PLC Scheda Input NC Forza Velocità di sicurezza Riscontri (2m/min)
#defcom %ConfigIO73.byNReg    PAR-PLC Scheda output bit 0 codice selezione programma
#defcom %ConfigIO107.byNReg   PAR-PLC Scheda input Blocco ciclo da robot
#defcom %ConfigIO108.byNReg   PAR-PLC Scheda input Pressostato Bloccaggi Superiori
#defcom %ConfigIO109.byNReg   PAR-PLC Scheda input Pressostato Bloccaggi Inferiori
#defcom %ConfigIO113.byNReg   PAR-PLC Scheda input Reset PCL e PMI
#defcom %ConfigIO100.byNReg   PAR-PLC Scheda input massimo sbilanciamento
#defcom %ConfigIO101.byNReg   PAR-PLC Scheda input direzione EV Y1 salita
#defcom %ConfigIO102.byNReg   PAR-PLC Scheda input direzione EV Y2 salita
#defcom %ConfigIO103.byNReg   PAR-PLC Scheda input direzione EV Y1 discesa
#defcom %ConfigIO104.byNReg   PAR-PLC Scheda input direzione EV Y2 discesa
#defcom %ConfigIO105.byNReg   PAR-PLC Scheda input selettore manuale
#defcom %ConfigIO110.byNReg   PAR-PLC Scheda input monitoraggio relé 20KA1,2,3,4
#defcom %ConfigIO114.byNReg   PAR-PLC Scheda input pompa accesa
#defcom %ConfigIO116.byNReg   PAR-PLC Scheda input monitoraggio trasduttore SQ1
#defcom %ConfigIO117.byNReg   PAR-PLC Scheda input monitoraggio trasduttore SQ2
#defcom %ConfigIO125.byNReg   PAR-PLC Scheda input Azionamenti OK
#defcom %ConfigIO126.byNReg   PAR-PLC Scheda input FC fine pressata 1
#defcom %ConfigIO128.byNReg   PAR-PLC Scheda input PCV (mute)
#defcom %ConfigIO129.byNReg   PAR-PLC Scheda input stop at mute
#defcom %ConfigIO131.byNReg   PAR-PLC Scheda input monitor EV DiscVel SQ5
#defcom %ConfigIO132.byNReg   PAR-PLC Scheda input monitor EV DiscVel SQ6
#defcom %ConfigIO133.byNReg   PAR-PLC Scheda input Allarme Utente 1
#defcom %ConfigIO134.byNReg   PAR-PLC Scheda input Allarme Utente 2
#defcom %ConfigIO135.byNReg   PAR-PLC Scheda input Allarme Utente 3
#defcom %ConfigIO136.byNReg   PAR-PLC Scheda input Messaggio Utente 1
#defcom %ConfigIO137.byNReg   PAR-PLC Scheda input Messaggio Utente 2
#defcom %ConfigIO138.byNReg   PAR-PLC Scheda input monitor EV Preriempimenti SQ7
#defcom %ConfigIO139.byNReg   PAR-PLC Scheda input monitor EV Y1 a riposo
#defcom %ConfigIO140.byNReg   PAR-PLC Scheda input monitor EV Y2 a riposo
#defcom %ConfigIO141.byNReg   PAR-PLC Scheda input monitor EV DiscLen SD
#defcom %ConfigIO143.byNReg   PAR-PLC Scheda input micro taratura pestone NVEL o sola lettura
#defcom %ConfigIO153.byNReg   PAR-PLC Scheda output EV pressione cuscino idraulico
#defcom %ConfigIO161.byNReg   PAR-PLC Scheda output Opz. gestione procedura spazio d'arresto
#defcom %ConfigIO189.byNReg   PAR-PLC Scheda output EV Bloccaggio Utensili

* Parametri da UI a PP

#defcom %parspec.dsp8        PAR-PP vel. accompagnatori per ciclo sgancio
#defcom %parspec.dsp13       PAR-PP vel. ritorno pestone per accompagnatori
#defcom %parspec.dsp14       PAR-PP velocità ritorno accompagnatori
#defcom %parspec.dsp15       PAR-PP timer tolleranza per ciclo richiamo
#defcom %parspec.dsp16       PAR-PP quota accompagnatori per ciclo sgancio
#defcom %parspec.dsp17       PAR-PP guadagno inseguimento asse A1
#defcom %parspec.dsp18       PAR-PP guadagno inseguimento asse A2
#defcom %parspec.dsp19       PAR-PP valore filtro per slave
#defcom %parspec.dsp20       PAR-PP guadagno bilanciamento in DL
#defcom %parspec.dsp21       PAR-PP guadagno bilanciamento in DV
#defcom %parspec.dsp22       PAR-PP guadagno Feed Forward Y1 in DV
#defcom %parspec.dsp23       PAR-PP guadagno Feed Forward Y2 in DV
#defcom %parspec.dsp24       PAR-PP guadagno Feed Forward Y1 in SV
#defcom %parspec.dsp25       PAR-PP guadagno Feed Forward Y2 in SV
#defcom %parspec.dsp28       PAR-PP guadagno Feed Forward Y1 in DL
#defcom %parspec.dsp29       PAR-PP guadagno Feed Forward Y2 in DL

#defcom %pst0                PAR-PLC Limite inferiore pestone
#defcom %pst1                PAR-PLC Limite superiore pestone
#defcom %pst2                PAR-PP Quota taratura asse Y1
#defcom %pst3                PAR-PP Quota taratura asse Y2
#defcom %pst4                PAR-PP Quota tolleranza pestone
#defcom %pst5                PAR-PLC Correzione sbilanciamento
#defcom %pst6                PAR-PP-PLC Massimo sbilanciamento
#defcom %pst7                PAR-PP Fattore conversione pestone
#defcom %pst8                PAR-PP-PLC Tempo stop per coniatura
#defcom %pst9                PAR-UI Tempo rampa pressione
#defcom %pst10               PAR-UI-PLC Tensione 0 Pressione
#defcom %pst11               PAR-UI-PLC Tensione 50% Pressione
#defcom %pst12               PAR-UI Tempo rampa bombatura (non usato)
#defcom %pst13               PAR-UI-PLC Tensione 0 Bombatura
#defcom %pst14               PAR-UI Tensione 50% Bombatura
#defcom %pst16               PAR-PP Abil. discesa veloce anello chiuso
#defcom %pst17               PAR-UI Pressione discesa veloce
#defcom %pst18               PAR-PP Accelerazione discesa veloce
#defcom %pst19               PAR-PP Velocità in discesa veloce
#defcom %pst20               PAR-PP Tensione minima discesa veloce OL
#defcom %pst21               PAR-PP Potenz. OL o guad. CL Y1 in discesa veloce
#defcom %pst22               PAR-PP Potenz. OL o guad. CL Y2 in discesa veloce
#defcom %pst23               PAR-PP Anticipo rallentamento discesa veloce OL
#defcom %pst24               PAR-PLC Tempo cambio velocità
#defcom %pst25               PAR-PP Pressione discesa manuale
#defcom %pst26               PAR-PP-PLC Velocità in discesa lenta
#defcom %pst27               PAR-PP Accelerazione in discesa lenta
#defcom %pst28               PAR-PP Guadagno Y1 in discesa lenta
#defcom %pst29               PAR-PP Guadagno Y2 in discesa lenta
#defcom %pst30               PAR-PP Tempo toller. in discesa
#defcom %pst31               PAR-PP Tensione insensibilita negativa Y1
#defcom %pst32               PAR-PP Tensione insensibilita negativa Y2
#defcom %pst33               PAR-PP Tensione insensibilita positiva Y1
#defcom %pst34               PAR-PP Tensione insensibilita positiva Y2
#defcom %pst35               PAR-PP Potenziometro Y1 in decompressione
#defcom %pst36               PAR-PP Potenziometro Y2 in decompressione
#defcom %pst37               PAR-PP-PLC Tempo discesa pressione
#defcom %pst38               PAR-PP-PLC Tempo decompressione
#defcom %pst39               PAR-UI Pressione salita veloce
#defcom %pst40               PAR-PP Velocità in salita veloce
#defcom %pst41               PAR-PP Accelerazione in salita veloce
#defcom %pst42               PAR-PP Guadagno Y1 in salita veloce
#defcom %pst43               PAR-PP Guadagno Y2 in salita veloce
#defcom %pst44               PAR-PP Tempo toller. in salita veloce
#defcom %pst45               PAR-PP Attesa iniziale salita veloce
#defcom %pst46               PAR-UI Pressione salita lenta
#defcom %pst47               PAR-PP Velocità in salita lenta
#defcom %pst48               PAR-PP Accelerazione in salita lenta
#defcom %pst49               PAR-PP Guadagno Y1 in salita lenta
#defcom %pst50               PAR-PP Guadagno Y2 in salita lenta
#defcom %pst51               PAR-PP Tempo toller. in salita lenta
#defcom %pst52               PAR-PP Attesa iniziale salita lenta
#defcom %pst53               PAR-PP Velocità in richiamo
#defcom %pst54               PAR-PP Massimo errore inseguimento
#defcom %pst55               PAR-UI-PLC Tensione 25% Pressione
#defcom %pst56               PAR-UI-PLC Tensione 75% Pressione
#defcom %pst57               PAR-UI Tensione 25% Bombatura
#defcom %pst58               PAR-UI Tensione 75% Bombatura
#defcom %pst59               PAR-UI Tempo piega di default
#defcom %pst60               PAR-UI Corrente fondo scala pressione (mA)
#defcom %pst61               PAR-UI Corrente fondo scala bombatura (mA)

#defcom %pstt0               PAR-PP Tempo rampa pressione discesa veloce
#defcom %pstt1               PAR-PP Tempo rampa pressione discesa lenta
#defcom %pstt2               PAR-PP Tempo rampa pressione salita veloce
#defcom %pstt3               PAR-PP Tempo rampa pressione salita lenta

#defcom %gen0                PAR-PP Area sicurezza X
#defcom %gen1                PAR-PP Area sicurezza R
#defcom %gen2                PAR-PP Metodo anticollisione
#defcom %gen4                PAR-UI-PLC Interasse minimo Z
#defcom %gen7                PAR-PLC Variazione PCV
#defcom %gen8                PAR-PLC Larghezza Macchina
#defcom %gen9                PAR-PP-PLC  Forza massima

#defcom %ap0.pt4             PAR-PP Quota tolleranza asse Y1

#defcom %ap2.pt0             PAR-PP Quota minima asse X1
#defcom %ap3.pt0             PAR-PP Quota minima asse X2

#defcom %ap4.pt1             PAR-PP Quota massima asse R1
#defcom %ap5.pt1             PAR-PP Quota massima asse R2

#defcom %ap16.pt2            PAR-PP Quota taratura asse S1
#defcom %ap16.pt4            PAR-PP Quota tolleranza asse S1
#defcom %ap16.pt11           PAR-PP Guadagno asse S1

#defcom %ap17.pt2            PAR-PP Quota taratura asse S2
#defcom %ap17.pt4            PAR-PP Quota tolleranza asse S2
#defcom %ap17.pt11           PAR-PP Guadagno asse S2

#defcom %ap18.pt2            PAR-PP Quota taratura asse S3
#defcom %ap19.pt2            PAR-PP Quota taratura asse S4
#defcom %ap20.pt2            PAR-PP Quota taratura asse S5
#defcom %ap21.pt2            PAR-PP Quota taratura asse S6


* Variabili da CFC anticollisione risc. 1-2

#defcom %faseaxa             CFC-PP Quota asse X1 fase 1 anticoll.
#defcom %faseaxb             CFC-PP Quota asse X2 fase 1 anticoll.
#defcom %faseara             CFC-PP Quota asse R1 fase 1 anticoll.
#defcom %fasearb             CFC-PP Quota asse R2 fase 1 anticoll.
#defcom %faseaza             CFC-PP Quota asse Z1 fase 1 anticoll.
#defcom %faseazb             CFC-PP Quota asse Z2 fase 1 anticoll.

#defcom %fasebxa             CFC-PP Quota asse X1 fase 2 anticoll.
#defcom %fasebxb             CFC-PP Quota asse X2 fase 2 anticoll.
#defcom %fasebra             CFC-PP Quota asse R1 fase 2 anticoll.
#defcom %fasebrb             CFC-PP Quota asse R2 fase 2 anticoll.
#defcom %fasebza             CFC-PP Quota asse Z1 fase 2 anticoll.
#defcom %fasebzb             CFC-PP Quota asse Z2 fase 2 anticoll.

#defcom %fasecxa             CFC-PP Quota asse X1 fase 3 anticoll.
#defcom %fasecxb             CFC-PP Quota asse X2 fase 3 anticoll.
#defcom %fasecra             CFC-PP Quota asse R1 fase 3 anticoll.
#defcom %fasecrb             CFC-PP Quota asse R2 fase 3 anticoll.
#defcom %fasecza             CFC-PP Quota asse Z1 fase 3 anticoll.
#defcom %faseczb             CFC-PP Quota asse Z2 fase 3 anticoll.

#defcom %rinca               CFC-PP Quota rinculo asse X1
#defcom %rincb               CFC-PP Quota rinculo asse X2

#defcom %C80                 CFC-PP Maschera per Disab/Enab rec. giochi risc. 1-2

#defcom %FeedfaseaXa         CFC-PP Override X1 fase 1 anticoll.
#defcom %FeedfasebXa         CFC-PP Override X1 fase 2 anticoll.
#defcom %FeedfasecXa         CFC-PP Override X1 fase 3 anticoll.

* Variabili da CFC anticollisione risc. 3-4

#defcom %faseaxc             CFC-PP Quota asse X3 fase 1 anticoll.
#defcom %faseaxd             CFC-PP Quota asse X4 fase 1 anticoll.
#defcom %fasearc             CFC-PP Quota asse R3 fase 1 anticoll.
#defcom %faseard             CFC-PP Quota asse R4 fase 1 anticoll.
#defcom %faseazc             CFC-PP Quota asse Z3 fase 1 anticoll.
#defcom %faseazd             CFC-PP Quota asse Z4 fase 1 anticoll.

#defcom %fasebxc             CFC-PP Quota asse X3 fase 2 anticoll.
#defcom %fasebxd             CFC-PP Quota asse X4 fase 2 anticoll.
#defcom %fasebrc             CFC-PP Quota asse R3 fase 2 anticoll.
#defcom %fasebrd             CFC-PP Quota asse R4 fase 2 anticoll.
#defcom %fasebzc             CFC-PP Quota asse Z3 fase 2 anticoll.
#defcom %fasebzd             CFC-PP Quota asse Z4 fase 2 anticoll.

#defcom %fasecxc             CFC-PP Quota asse X3 fase 3 anticoll.
#defcom %fasecxd             CFC-PP Quota asse X4 fase 3 anticoll.
#defcom %fasecrc             CFC-PP Quota asse R3 fase 3 anticoll.
#defcom %fasecrd             CFC-PP Quota asse R4 fase 3 anticoll.
#defcom %faseczc             CFC-PP Quota asse Z3 fase 3 anticoll.
#defcom %faseczd             CFC-PP Quota asse Z4 fase 3 anticoll.

#defcom %rincc               CFC-PP Quota rinculo asse X3
#defcom %rincd               CFC-PP Quota rinculo asse X4

#defcom %C81                 CFC-PP Maschera per Disab/Enab rec. giochi risc. 3-4

* Variabili da CFC accompagnatori

#defcom %vaccas              CFC-PP Vel. salita accompagnatore 1 in interp.
#defcom %vaccbs              CFC-PP Vel. salita accompagnatore 2 in interp.
#defcom %accasal             CFC-PP Quota salita accompagnatore 1 in interp.
#defcom %accbsal             CFC-PP Quota salita accompagnatore 2 in interp.

* Variabili da CFC assi ausiliari

#defcom %posaa               CFC-PP Quota asse A1 fase 1 anticoll.
#defcom %posab               CFC-PP Quota asse A2 fase 1 anticoll.
#defcom %posac               CFC-PP Quota asse A3 fase 1 anticoll.
#defcom %posad               CFC-PP Quota asse A4 fase 1 anticoll.
#defcom %posae               CFC-PP Quota asse A5 fase 1 anticoll.
#defcom %posaf               CFC-PP Quota asse A6 fase 1 anticoll.
#defcom %posag               CFC-PP Quota asse A7 fase 1 anticoll.
#defcom %posah               CFC-PP Quota asse A8 fase 1 anticoll.

#defcom %posba               CFC-PP Quota asse A1 fase 2 anticoll.
#defcom %posbb               CFC-PP Quota asse A2 fase 2 anticoll.
#defcom %posbc               CFC-PP Quota asse A3 fase 2 anticoll.
#defcom %posbd               CFC-PP Quota asse A4 fase 2 anticoll.
#defcom %posbe               CFC-PP Quota asse A5 fase 2 anticoll.
#defcom %posbf               CFC-PP Quota asse A6 fase 2 anticoll.
#defcom %posbg               CFC-PP Quota asse A7 fase 2 anticoll.
#defcom %posbh               CFC-PP Quota asse A8 fase 2 anticoll.

#defcom %posca               CFC-PP Quota asse A1 fase 3 anticoll.
#defcom %poscb               CFC-PP Quota asse A2 fase 3 anticoll.
#defcom %poscc               CFC-PP Quota asse A3 fase 3 anticoll.
#defcom %poscd               CFC-PP Quota asse A4 fase 3 anticoll.
#defcom %posce               CFC-PP Quota asse A5 fase 3 anticoll.
#defcom %poscf               CFC-PP Quota asse A6 fase 3 anticoll.
#defcom %poscg               CFC-PP Quota asse A7 fase 3 anticoll.
#defcom %posch               CFC-PP Quota asse A8 fase 3 anticoll.

* Variabili da CFC calcolo PMI per sensore

#defcom %sensore             CFC-PP Quota target sensore 1
#defcom %sensoreb            CFC-PP Quota target sensore 2

* Variabili per ciclo con sensore angolo LC-LS

#defcom %C210                SLAPPG-UI Primo contributo correzione durante piega con misura angolo real time
#defcom %C211                SLAPPG-UI Secondo contributo correzione durante piega con misura angolo real time
#defcom %C212                SLAPPG-UI Primo contributo correzione su Y2 durante piega con misura angolo real time
#defcom %C213                SLAPPG-UI Secondo contributo correzione su Y2 durante piega con misura angolo real time

*%C230-239 Riservati per plc utente
#defcom %C240                SLAPPG Riservato debug sensore IRIS

VAR_IN_OUT
#defcom %C255.0              PP-SA Comando acquisizione angolo e ricalcolo (PMI raggiunto)
#defcom %C255.1              SA- Lettura angolo in corso
#defcom %C255.2              SA-PP Angolo acquisito fuori tolleranza, va alla pressata successiva
#defcom %C255.3              SA-PP Angolo acquisito in tolleranza o errato, piega terminata
#defcom %C255.4              SA-PP Richiesta riposizionamento bombatura
LON_DATAM AT %C255.5;        * PLC-SA Comando accensione laser
#defcom %C255.6              PP-SLAPPG Misura real-time angolo per fase di galleggiamento
#defcom %C255.7              -SA Lettura angolo comandata da plc
#defcom %C255.8              SA-PLC Conferma accensione laser OK
#defcom %C255.9              SA-PLC Conferma accensione laser KO
#defcom %C255.10             SA-PP Start misura real-time angolo OK
#defcom %C255.11             SA-PP Errore comando real-time sensore angolo
#defcom %C255.12             SA-PP Stop misura real-time angolo OK
#defcom %C255.14             PP-SA Misura real-time angolo per fase di piega
#defcom %C255.15             PP-SA Comando per lettura quote attuali Y1,Y2
#defcom %C255.16             SA-PP Lettura quote attuali Y1,Y2 OK
#defcom %C255.17             SA-PP Lettura quote attuali Y1,Y2 KO
#defcom %C255.18             SA-PP Non effettua la misura real time in fase di piega
RTE_DATAM AT %C255.19;       * PLC-SA Attivazione misuratore real time
#defcom %C255.20             SA-PLC Conferma misuratore real time attivo
END_VAR

* Variabili per ciclo con sensore pressione

#defcom %dwFlagPressione.1   SLAPPG-PLC-PP Abil. ricerca massima pressione
#defcom %dwFlagPressione.2   SLAPPG-PLC-PP Abil. rilevamento spessore
#defcom %dwFlagPressione.4   SLAPPG-PLC Spessore rilevato fuori tolleranza
*#defcom %dwFlagPressione.6   SLAPPG-PLC Rilevata massima pressione
#defcom %dwFlagPressione.7   SLAPPG-PLC Rilevato spessore
#defcom %dwFlagPressione.8   SLAPPG-PLC Inizializzazione ciclo sensori pressione
#defcom %dwFlagPressione.9   SLAPPG-PLC Abilita tavola attiva

#defcom %parpres.dQtaRicBomb PAR-PLC Valore bombatura calcolato con sensore pressione
#defcom %parpres.dRicPress   PAR-PLC Valore pressione calcolato con sensore pressione
#defcom %parpres.dQtaGallegg PAR-PP Quota galleggiamento
#defcom %parpres.dQtaRicYa   PAR-PP Quota target Y1 calcolata con sensore pressione
#defcom %parpres.dQtaRicYb   PAR-PP Quota target Y2 calcolata con sensore pressione
#defcom %parpres.dForzaImp   PAR-PP Forza impostata in tonnellate
#defcom %parpres.dLargImp    PAR-PLC Larghezza Piega

#defcom %parpres.dAltPunz    PAR-PLC Altezza punzone
#defcom %parpres.dAltMat     PAR-PLC Altezza matrice

#defcom %parpres.byModoCiclo.0 PLC-SLAPPG Fase ricerca con sensore: 0=spessore, 1=larghezza
#defcom %parpres.byModoCiclo.1 PLC-SLAPPG Richiesta stop dopo rilevamento spessore

* Registri comando canale

#defcom %rc0.0           PLC-CN Reset CN canale
#defcom %rc0.1           PLC-CN Emergenza canale
#defcom %rc0.2           PLC-CN Start CN canale
#defcom %rc0.5           PLC-CN Conferma funzione M ricevuta canale
#defcom %rc0.8           PLC-CN Selez. modo REF (taratura) canale
#defcom %rc0.9           PLC-CN Selez. modo JOG (manuale) canale
#defcom %rc0.12          PLC-CN Selez. modo AUT (automatico) canale
#defcom %rc0.13          PLC-CN Step canale
#defcom %rc0.14          PLC-CN Step IN canale
#defcom %rc0.17          PLC-CN Abilitazione esecuzione passo singolo canale
#defcom %rc0.22          PLC-CN Abilitazione esecuzione jog anello aperto canale
#defcom %rc0.23          PLC-CN Step OUT canale
#defcom %rc0.25          PLC-CN Annulla percorso residuo canale

#defcom %rc1             PLC-CN Numero part program canale
#defcom %rc2             PLC-CN Feed-rate canale
#defcom %rc5             PLC-CN Tensione jog anello aperto canale

#defcom %rc86.0          PLC-CN Abilita limiti software da plc

* Registri stato canale

#defcom %rc8.0           CN-PLC Programma in corso
#defcom %rc8.1           CN-PLC Programma interrotto
#defcom %rc8.2           CN-PLC Canale Ready
#defcom %rc8.3           CN-PLC Allarme canale
#defcom %rc8.9           CN-PLC Percorso residuo annullato

#defcom %rc63            CN-PLC Stato canale (0=IDLE)

#defcom %cn2.rc8.3           CN-PLC Allarme canale 2

#defcom %cn0.rc8.2           CN-PLC Ready canale 0
#defcom %cn1.rc8.2           CN-PLC Ready canale 1
#defcom %cn2.rc8.2           CN-PLC Ready canale 2
#defcom %cn3.rc8.2           CN-PLC Ready canale 3
#defcom %cn4.rc8.2           CN-PLC Ready canale 4

* Registri comando assi

#defcom %ra0.0               PLC-AX Chiusura anello asse
#defcom %ra0.1               PLC-AX Blocco avanzamento asse
#defcom %ra0.8               PLC-AX Comando + asse
#defcom %ra0.9               PLC-AX Comando - asse
#defcom %ra0.13              PLC-AX Finecorsa taratura asse
#defcom %ra0.15              PLC-AX Ripristino allarme asse

#defcom %ra1                 PLC-AX Override asse
#defcom %ra35.1              PLC-AX Abilita limiti software da plc
#defcom %ra64                PLC-AX Quota limite minimo da plc
#defcom %ra65                PLC-AX Quota limite massimo da plc
#defcom %ra82                PLC-AX Limitazione coppia asse (1000=100%)

#defcom %ax8.ra0.0           PLC-AX Chiusura anello asse A1
#defcom %ax8.ra0.8           PLC-AX Comando + asse A1
#defcom %ax8.ra0.9           PLC-AX Comando - asse A1

#defcom %ax9.ra0.0           PLC-AX Chiusura anello asse A2
#defcom %ax9.ra0.8           PLC-AX Comando + asse A2
#defcom %ax9.ra0.9           PLC-AX Comando - asse A2

* Registri stato assi

#defcom %ra3.0               AX-PLC Asse fermo teorico
#defcom %ra3.2               AX-PLC Direzione asse avanti
#defcom %ra3.10              AX-PLC Anello di posizione chiuso
#defcom %ra3.13              AX-PLC Ordine di moto asse
#defcom %ra3.14              AX-PLC Asse tarato
#defcom %ra3.15              AX-PLC Asse Y1 in allarme
#defcom %ra8.7               AX-PLC Asse in arresto per allarme in corso
#defcom %ra19.0              AX-PLC Asse in stato ISO nullo
#defcom %ra19.2              AX-PLC Taratura asse in corso
#defcom %ra19.4              AX-PLC Asse in stato ISO alarm

#defcom %ra4                 AX-PLC Quota attuale asse
#defcom %ra5                 AX-PLC Velocita attuale asse (micron/s)

#defcom %ax0.ra3.0           AX-PLC Fermo teorico asse Y1
#defcom %ax0.ra3.2           AX-PLC Direzione asse Y1 avanti
#defcom %ax0.ra3.10          AX-PLC Anello di posizione chiuso asse Y1
#defcom %ax0.ra4             AX-PLC Quota attuale asse Y1
#defcom %ax0.ra5             AX-PLC Velocità misurata asse Y1
#defcom %ax0.ra6.9           AX-PLC Allarme per errore inseguimento asse Y1
#defcom %ax0.ra8.14          AX-PLC Albero elettrico agganciato asse Y1
#defcom %ax0.ra18            AX-PLC RefDac Asse Y1
#defcom %ax0.ra16            AX-PLC Registro Distance to Go Asse Y1
#defcom %ax0.pa7             AX-PLC Quota di tolleranza fine Asse Y1

#defcom %ax1.ra3.0           AX-PLC Fermo teorico asse Y2
#defcom %ax1.ra3.2           AX-PLC Direzione asse Y2 avanti
#defcom %ax1.ra3.10          AX-PLC Anello di posizione chiuso asse Y2
#defcom %ax1.ra4             AX-PLC Quota attuale asse Y2
#defcom %ax1.ra5             AX-PLC Velocità misurata asse Y2
#defcom %ax1.ra6.9           AX-PLC Allarme per errore inseguimento asse Y2
#defcom %ax1.ra8.14          AX-PLC Albero elettrico agganciato asse Y2
#defcom %ax1.ra18            AX-PLC RefDac Asse Y2
#defcom %ax1.ra16            AX-PLC Registro Distance to Go Asse Y2
#defcom %ax1.pa7             AX-PLC Quota di tolleranza fine Asse Y2

#defcom %ax2.ra4             AX-PLC Quota attuale asse X1
#defcom %ax2.ra5             AX-PLC Velocità misurata asse X1
#defcom %ax2.ra7             AX-PLC Errore inseguimento X1 in impulsi
#defcom %ax2.ra16            AX-PLC Registro Distance to Go Asse X1
#defcom %ax2.pa7             AX-PLC Quota di tolleranza fine Asse X1
#defcom %ax2.ra3.0           AX-PLC Fermo teorico asse X1
#defcom %ax2.ra3.2           AX-PLC Direzione asse X1 avanti

#defcom %ax3.ra4             AX-PLC Quota attuale asse X2
#defcom %ax3.ra5             AX-PLC Velocità misurata asse X2
#defcom %ax3.ra7             AX-PLC Errore inseguimento X2 in impulsi
#defcom %ax3.ra16            AX-PLC Registro Distance to Go Asse X2
#defcom %ax3.pa7             AX-PLC Quota di tolleranza fine Asse X2
#defcom %ax3.ra3.0           AX-PLC Fermo teorico asse X2
#defcom %ax3.ra3.2           AX-PLC Direzione asse X2 avanti

#defcom %ax4.ra5             AX-PLC Velocità misurata asse R1
#defcom %ax4.ra16            AX-PLC Registro Distance to Go Asse R1
#defcom %ax4.pa7             AX-PLC Quota di tolleranza fine Asse R1
#defcom %ax4.ra3.0           AX-PLC Fermo teorico asse R1

#defcom %ax5.ra5             AX-PLC Velocità misurata asse R2
#defcom %ax5.ra16            AX-PLC Registro Distance to Go Asse R2
#defcom %ax5.pa7             AX-PLC Quota di tolleranza fine Asse R2
#defcom %ax5.ra3.0           AX-PLC Fermo teorico asse R2

#defcom %ax6.ra5             AX-PLC Velocità misurata asse Z1
#defcom %ax6.ra16            AX-PLC Registro Distance to Go Asse Z1
#defcom %ax6.pa7             AX-PLC Quota di tolleranza fine Asse Z1
#defcom %ax6.ra3.0           AX-PLC Fermo teorico asse Z1

#defcom %ax7.ra5             AX-PLC Velocità misurata asse Z2
#defcom %ax7.ra16            AX-PLC Registro Distance to Go Asse Z2
#defcom %ax7.pa7             AX-PLC Quota di tolleranza fine Asse Z2
#defcom %ax7.ra3.0           AX-PLC Fermo teorico asse Z2

#defcom %ax8.ra3.0           AX-PLC Fermo teorico asse A1
#defcom %ax8.ra3.2           AX-PLC Direzione asse A1 avanti
#defcom %ax8.ra4             AX-PLC Quota attuale asse A1
#defcom %ax8.ra5             AX-PLC Velocità misurata asse A1
#defcom %ax8.ra8.14          AX-PLC Albero elettrico agganciato asse A1
#defcom %ax8.ra16            AX-PLC Registro Distance to Go Asse A1
#defcom %ax8.pa7             AX-PLC Quota di tolleranza fine Asse A1

#defcom %ax9.ra3.0           AX-PLC Fermo teorico asse A2
#defcom %ax9.ra3.2           AX-PLC Direzione asse A2 avanti
#defcom %ax9.ra4             AX-PLC Quota attuale asse A2
#defcom %ax9.ra5             AX-PLC Velocità misurata asse A2
#defcom %ax9.ra8.14          AX-PLC Albero elettrico agganciato asse A2
#defcom %ax9.ra16            AX-PLC Registro Distance to Go Asse A2
#defcom %ax9.pa7             AX-PLC Quota di tolleranza fine Asse A2

#defcom %ax10.ra5            AX-PLC Velocità misurata asse A3
#defcom %ax10.ra16           AX-PLC Registro Distance to Go Asse A3
#defcom %ax10.pa7            AX-PLC Quota di tolleranza fine Asse A3
#defcom %ax10.ra3.0          AX-PLC Fermo teorico asse A3

#defcom %ax11.ra16           AX-PLC Registro Distance to Go Asse A4
#defcom %ax11.pa7            AX-PLC Quota di tolleranza fine Asse A4
#defcom %ax11.ra3.0          AX-PLC Fermo teorico asse A4

#defcom %ax12.ra16           AX-PLC Registro Distance to Go Asse A5
#defcom %ax12.pa7            AX-PLC Quota di tolleranza fine Asse A5
#defcom %ax12.ra3.0          AX-PLC Fermo teorico asse A5

#defcom %ax13.ra16           AX-PLC Registro Distance to Go Asse A6
#defcom %ax13.pa7            AX-PLC Quota di tolleranza fine Asse A6
#defcom %ax13.ra3.0          AX-PLC Fermo teorico asse A6

#defcom %ax14.ra16           AX-PLC Registro Distance to Go Asse A7
#defcom %ax14.pa7            AX-PLC Quota di tolleranza fine Asse A7
#defcom %ax14.ra3.0          AX-PLC Fermo teorico asse A7

#defcom %ax15.ra16           AX-PLC Registro Distance to Go Asse A8
#defcom %ax15.pa7            AX-PLC Quota di tolleranza fine Asse A8
#defcom %ax15.ra3.0          AX-PLC Fermo teorico asse A8

#defcom %ax16.ra4            AX-PLC Quota attuale asse S1
#defcom %ax16.ra16           AX-PLC Registro Distance to Go Asse S1
#defcom %ax16.pa7            AX-PLC Quota di tolleranza fine Asse S1
#defcom %ax16.ra3.0          AX-PLC Fermo teorico asse S1

#defcom %ax17.ra4            AX-PLC Quota attuale asse S2
#defcom %ax17.ra16           AX-PLC Registro Distance to Go Asse S2
#defcom %ax17.pa7            AX-PLC Quota di tolleranza fine Asse S2
#defcom %ax17.ra3.0          AX-PLC Fermo teorico asse S2

#defcom %ax18.ra4            AX-PLC Quota attuale asse S3
#defcom %ax18.ra16           AX-PLC Registro Distance to Go Asse S3
#defcom %ax18.pa7            AX-PLC Quota di tolleranza fine Asse S3
#defcom %ax18.ra3.0          AX-PLC Fermo teorico asse S3

#defcom %ax19.ra4            AX-PLC Quota attuale asse S4
#defcom %ax19.ra16           AX-PLC Registro Distance to Go Asse S4
#defcom %ax19.pa7            AX-PLC Quota di tolleranza fine Asse S4
#defcom %ax19.ra3.0          AX-PLC Fermo teorico asse S4

#defcom %ax20.ra4            AX-PLC Quota attuale asse S5
#defcom %ax20.ra16           AX-PLC Registro Distance to Go Asse S5
#defcom %ax20.pa7            AX-PLC Quota di tolleranza fine Asse S5
#defcom %ax20.ra3.0          AX-PLC Fermo teorico asse S5

#defcom %ax21.ra4            AX-PLC Quota attuale asse S6
#defcom %ax21.ra16           AX-PLC Registro Distance to Go Asse S6
#defcom %ax21.pa7            AX-PLC Quota di tolleranza fine Asse S6
#defcom %ax21.ra3.0          AX-PLC Fermo teorico asse S6

#defcom %ax22.ra4            AX-PLC Quota attuale asse X3
#defcom %ax22.ra5            AX-PLC Velocità misurata asse X3
#defcom %ax22.ra7            AX-PLC Errore inseguimento X3 in impulsi
#defcom %ax22.ra16           AX-PLC Registro Distance to Go Asse X3
#defcom %ax22.pa7            AX-PLC Quota di tolleranza fine Asse X3
#defcom %ax22.ra3.0          AX-PLC Fermo teorico asse X3
#defcom %ax22.ra3.2          AX-PLC Direzione asse X3 avanti

#defcom %ax23.ra4            AX-PLC Quota attuale asse X4
#defcom %ax23.ra5            AX-PLC Velocità misurata asse X4
#defcom %ax23.ra7            AX-PLC Errore inseguimento X4 in impulsi
#defcom %ax23.ra16           AX-PLC Registro Distance to Go Asse X4
#defcom %ax23.pa7            AX-PLC Quota di tolleranza fine Asse X4
#defcom %ax23.ra3.0          AX-PLC Fermo teorico asse X4
#defcom %ax23.ra3.2          AX-PLC Direzione asse X4 avanti

#defcom %ax24.ra16           AX-PLC Registro Distance to Go Asse R3
#defcom %ax24.pa7            AX-PLC Quota di tolleranza fine Asse R3
#defcom %ax24.ra3.0          AX-PLC Fermo teorico asse R3

#defcom %ax25.ra16           AX-PLC Registro Distance to Go Asse R4
#defcom %ax25.pa7            AX-PLC Quota di tolleranza fine Asse R4
#defcom %ax25.ra3.0          AX-PLC Fermo teorico asse R4

#defcom %ax26.ra16           AX-PLC Registro Distance to Go Asse Z3
#defcom %ax26.pa7            AX-PLC Quota di tolleranza fine Asse Z3
#defcom %ax26.ra3.0          AX-PLC Fermo teorico asse Z3

#defcom %ax27.ra16           AX-PLC Registro Distance to Go Asse Z4
#defcom %ax27.pa7            AX-PLC Quota di tolleranza fine Asse Z4
#defcom %ax27.ra3.0          AX-PLC Fermo teorico asse Z4


* Registri input da pulsantiera

#defcom %FUNCBTN.5           FP-PLC Pulsante volantino sul frontale
#defcom %EncAPos             FP-PLC Quota da volantino frontale (0-65535)

#defcom %XhcApp.Xhc_Puls.0   PULS-PLC Stop da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.2   PULS-PLC Start da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.3   PULS-PLC Piega precedente (feed-) da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.4   PULS-PLC Piega successiva (feed+) da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.7   PULS-PLC F1 Selezione modo da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.8   PULS-PLC F2 Selezione asse da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.10  PULS-PLC F4 Abil. autoapprendimento quota PCL da pulsantiera XHC
#defcom %XhcApp.Xhc_Puls.11  PULS-PLC F5 Abil. autoapprend. quota asse da pulsantiera XHC
#defcom %XhcApp.Xhc_Connect  PULS-PLC Stato connessione da pulsantiera XHC
#defcom %XhcApp.Xhc_AxisData PULS-PLC Selezione asse da pulsantiera XHC
#defcom %XhcApp.Xhc_RatioData PULS-PLC Selezione moltiplica da pulsantiera XHC
#defcom %XhcApp.Xhc_MPGData  PULS-PLC Quota da volantino pulsantiera XHC

* Registri output verso pulsantiera

#defcom %XhcApp.Xhc_LineIdx0 PLC-PULS Numero visual. su linea 1 pulsantiera XHC
#defcom %XhcApp.Xhc_LineIdx1 PLC-PULS Numero visual. su linea 2 pulsantiera XHC
#defcom %XhcApp.Xhc_LineIdx2 PLC-PULS Numero visual. su linea 3 pulsantiera XHC
#defcom %XhcApp.Xhc_LineIdx3 PLC-PULS Numero visual. su linea 4 pulsantiera XHC
#defcom %QPuls3              PLC-PULS Numero piega corrente per pulsantiera XHC

* Registri input da Lazersafe

#defcom %LazerSafe.PCSSReplay.0 LZS-CNC Pacchetto trasmesso correttamente
#defcom %LazerSafe.PCSSReplay.1 LZS-CNC Pacchetto trasmesso con errore
#defcom %LazerSafe.PCSSReplay.2 LZS-CNC Comunicazione con Lazersafe attiva

#defcom %LazerSafe.PCSSMutePosition LZS-CNC PCV calcolato da Lazersafe

* Registri output verso Lazersafe

#defcom %LazerSafe.CncCmd.0 PLC-LZS Invio dati power-up a Lazersafe
#defcom %LazerSafe.CncCmd.1 PLC-LZS Invio dati programma a Lazersafe
#defcom %LazerSafe.CncCmd.2 PLC-LZS Invio dati piega a Lazersafe

#defcom %LazerSafe.CncOperationalMode.0 PLC-LZS CNC in normal mode
#defcom %LazerSafe.CncOperationalMode.1 PLC-LZS CNC in tray mode
#defcom %LazerSafe.CncOperationalMode.2 PLC-LZS Stop at mute
#defcom %LazerSafe.CncOperationalMode.4 PLC-LZS Seleziona seconda stazione
#defcom %LazerSafe.CncOperationalMode.5 PLC-LZS Mode 1 foot - 1 foot
#defcom %LazerSafe.CncOperationalMode.6 PLC-LZS Mode 2 hand - 1 foot
#defcom %LazerSafe.CncOperationalMode.7 PLC-LZS Mode 2 hand - 2 hand
#defcom %LazerSafe.CncOperationalMode.8 PLC-LZS Mode 2 foot - 2 foot
#defcom %LazerSafe.CncOperationalMode.9 PLC-LZS Mode 4 hand - 2 foot
#defcom %LazerSafe.CncOperationalMode.10 PLC-LZS Mode 4 hand - 4 hand
#defcom %LazerSafe.CncOperationalMode.11 PLC-LZS Pestone tarato
#defcom %LazerSafe.CncOperationalMode.12 PLC-LZS Funz. con robot
#defcom %LazerSafe.CncOperationalModb.0 PLC-LZS Guard Only
#defcom %LazerSafe.CncOperationalModb.1 PLC-LZS Single Break Mode
#defcom %LazerSafe.CncOperationalModb.2 PLC-LZS Double Break Mode
#defcom %LazerSafe.CncOperationalModb.4 PLC-LZS BSM management
#defcom %LazerSafe.CncOperationalModb.6 PLC-LZS Programming Mode
#defcom %LazerSafe.CncOperationalModb.7 PLC-LZS Manual Mode
#defcom %LazerSafe.CncOperationalModb.8 PLC-LZS Semiautomatic Mode
#defcom %LazerSafe.CncOperationalModb.9 PLC-LZS Automatic Mode

#defcom %LazerSafe.CncDieBHeight PLC-LZS Larghezza cava

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

PCSS_WIFI_PED_COUP AT %LazerSafe.PCSSgD_in0.24; * LazerSafe.PCSSgD_in0.24 WiFi Pedal Coupling request

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

* Registri input da autotuning

#defcom %at_sinc.out_reg.0 AT-PLC Pressione salita lenta da autotuning
#defcom %at_sinc.out_reg.1 AT-PLC Pressione salita veloce da autotuning
#defcom %at_sinc.out_reg.2 AT-PLC Pressione discesa lenta da autotuning
#defcom %at_sinc.out_reg.3 AT-PLC Pressione discesa veloce da autotuning
#defcom %at_sinc.out_reg.4 AT-PLC Valvole discesa (e salita) lenta da autotuning
#defcom %at_sinc.out_reg.5 AT-PLC Valvole discesa veloce da autotuning
#defcom %at_sinc.out_reg.6 AT-PLC Valvole salita veloce da autotuning
#defcom %at_sinc.out_reg.20 AT-PLC Ciclo autotuning in corso
#defcom %at_sinc.out_reg.21 AT-PLC Ciclo autotuning terminato OK
#defcom %at_sinc.out_reg.22 AT-PLC Ciclo autotuning terminato con errore

#defcom %at_dat.atFlags.0 PAR-PLC Abilita simulazione autotuning
#defcom %at_dat.atFlags.1 PAR-PLC Abilita ricerca IMIN
#defcom %at_dat.atFlags.2 PAR-PLC Abilita ricerca IMAX
#defcom %at_dat.atdummy_d.0 PAR-PLC Disabilita AutoTuning con Utensili

#defcom %at_dat.FsCorrente AT-PLC Fondo Scala Corrente Massima Driver Valvole Proporzionali Y1 e Y2, fisso a 2800mA
#defcom %at_dat.IMinD_a AT-PLC Corrente minima Y1 discesa da autotuning
#defcom %at_dat.IMinD_b AT-PLC Corrente minima Y2 discesa da autotuning
#defcom %at_dat.IMinS_a AT-PLC Corrente minima Y1 salita da autotuning
#defcom %at_dat.IMinS_b AT-PLC Corrente minima Y2 salita da autotuning
#defcom %at_dat.IMaxD_a AT-PLC Corrente massima Y1 discesa da autotuning
#defcom %at_dat.IMaxD_b AT-PLC Corrente massima Y2 discesa da autotuning
#defcom %at_dat.IMaxS_a AT-PLC Corrente massima Y1 salita da autotuning
#defcom %at_dat.IMaxS_b AT-PLC Corrente massima Y2 salita da autotuning
#defcom %at_dat.atdummy_c PAR-PLC Frequenza PWM pressione e bombatura

#defcom %at_dat.atdummy_d.1 PAR-PLC Abilita Closed Loop Spool Valvole senza comando ma con Emergenza OK

* Registri output per autotuning

#defcom %at_sinc.in_reg.0 PLC-AT Abilitazione ciclo autotuning
#defcom %at_sinc.in_reg.1 PLC-AT Start passo salita/discesa autotuning
#defcom %at_sinc.in_reg.2 PLC-AT Posizionamento assi avviato per autotuning
#defcom %at_sinc.in_reg.3 PLC-AT Simulazione attiva per autotuning
#defcom %at_sinc.in_reg.6 PLC-AT Posizionamento assi terminato per autotuning

* Registri input per sensore angolo LC

#defcom %dwFlagCOPRA_LC.0 PAR-PLC Abilitazione sensore angolo LC-LS
#defcom %dwFlagCOPRA_LC.1 PAR-PLC Modo standard sensore angolo LC
#defcom %dwFlagCOPRA_LC.2 PAR-PLC Abilitazione sensore angolo LS
#defcom %dwFlagCOPRA_LC.3 PAR-PLC Modo foto multiple sensore angolo LC
#defcom %dwFlagCOPRA_LC.4 PAR-PLC Abilitazione sensore angolo LC1
#defcom %parsensLC.nNumeroTentativiLC PAR-PLC Numero tentativi sensore angolo LC

* Registri input da Fiessler

#defcom %Fpsc.OutputRegister0 FPSC-PLC Allarmi 0-15 da Fiessler
#defcom %Fpsc.OutputRegister1 FPSC-PLC Allarmi 16-31 da Fiessler

* Registri Barra Led

#defcom %WilaObjectList0.WilaObjLength Larghezza Stazione 1
#defcom %WilaObjectList1.WilaObjLength Larghezza Stazione 2
#defcom %WilaObjectList2.WilaObjLength Larghezza Stazione 3
#defcom %WilaObjectList3.WilaObjLength Larghezza Stazione 4
#defcom %WilaObjectList4.WilaObjLength Larghezza Stazione 5
#defcom %WilaObjectList5.WilaObjLength Larghezza Stazione 6
#defcom %WilaObjectList6.WilaObjLength Larghezza Stazione 7
#defcom %WilaObjectList7.WilaObjLength Larghezza Stazione 8
#defcom %WilaObjectList8.WilaObjLength Larghezza Pezzo
#defcom %WilaObjectList9.WilaObjLength Larghezza Massima Barra Led
#defcom %WilaGroupListA0.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 1 da abbinare
#defcom %WilaGroupListA1.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 2 da abbinare
#defcom %WilaGroupListA2.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 3 da abbinare
#defcom %WilaGroupListA3.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 4 da abbinare
#defcom %WilaGroupListA4.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 5 da abbinare
#defcom %WilaGroupListA5.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 6 da abbinare
#defcom %WilaGroupListA6.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 7 da abbinare
#defcom %WilaGroupListA7.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 8 da abbinare
#defcom %WilaGroupListA8.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 9 da abbinare
#defcom %WilaGroupListA9.WilaGrpObjNumber PLC-DLL Indice dell'oggetto grafico 10 da abbinare
#defcom %WilaGroupListA0.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 1
#defcom %WilaGroupListA1.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 2
#defcom %WilaGroupListA2.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 3
#defcom %WilaGroupListA3.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 4
#defcom %WilaGroupListA4.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 5
#defcom %WilaGroupListA5.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 6
#defcom %WilaGroupListA6.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 7
#defcom %WilaGroupListA7.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 8
#defcom %WilaGroupListA8.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 9
#defcom %WilaGroupListA9.WilaGrpStartPos PLC-DLL Posizione di partenza dell'oggetto grafico 10
#defcom %WilaObjectList0.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList1.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList2.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList3.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList4.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList5.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList6.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList7.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList8.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaObjectList9.WilaObjType PLC-DLL Tipo di visualizzazione 0=OFF 1=ON 2=FRONT 3=BACK 4=BLINKING 5=NUMBER
#defcom %WilaAckState Acknowledge Barra LED
#defcom %WilaReqState Stato richiesto della Barra LED
#defcom %WilaError Codice Errore Barra LED

* Registri per comunicazione con Moses

#defcom %moses.PlcToUiMoses.0 PLC-UI On the rising edge UI send to MOSES the message of machine in RUN - On the descent edge UI send to MOSES the message of machine in STANDBY
#defcom %moses.PlcToUiMoses.1 PLC-UI On the rising edge UI send to MOSES the message of bend done

#defcom %moses.UiToPlcMoses.0 UI-PLC Set to 1 when the Moses START button is pressed, set to 0 when is released
#defcom %moses.UiToPlcMoses.1 UI-PLC Set to 1 when the Moses STOP button is pressed, set to 0 when is released

* User options

#defcom %CNInfo.UserOptions.27 Opzione barra LED Esa abilitata
#defcom %CNInfo.UserOptions.28 Opzione barra LED Wila abilitata
#defcom %CNInfo.UserOptionsExt.1 Opzione BSM abilitata
#defcom %CNInfo.UserOptionsExt.9 Opzione staffe motorizzate abilitata
#defcom %CNInfo.UserOptionsExt.13 Opzione assi Z su barra LED

*%dwInUsrGUI0-127 Input da GUI utente
*%dwOutUsrGUI0-127 Output a GUI utente
