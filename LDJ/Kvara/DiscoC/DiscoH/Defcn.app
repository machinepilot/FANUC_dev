// File defcn.app
SECTION Application //********** Sezione Applicativo **************************

// inserire qui la dichiarazione dei dati dell'applicativo

// Allocazione mappa generale della memoria.

// inserire qui l'allocazione dei dati dell'applicativo

typedef struct {
    CHKSUM byte    dt[40];  // dati configurazione di un asse
    PERSIST dword   RetQta;  // quota retentiva per assi CAN
} CAX;

typedef struct {
    CHKSUM double  pt[21];  // parametri asse
} PAX;

//** 17/07/07 73.20.0: Gestione sensore COPRA LaserCheck
typedef struct {
    double d_B_SpDec;               // Velocita' di scarico durante la determinazione dello springback [mm/min] --> 16
    double d_B_DecDistance;         // Limita il massimo movimento in fase di decompressione del pestone [mm]
} DATA_LC;

typedef struct {
    word   wFinBendStatus;          // Stato finale della piega
    dword  dwYAperDeg;      // Sensitività misurata per Y1
    dword  dwYBperDeg;      // Sensitività misurata per Y2
    double dSB_YA;          // Spring back misurato per Y1
    double dSB_YB;          // Spring back misurato per Y2
    double dAngYAFin;       // Angolo finale misurato per Y1
    double dAngYBFin;       // Angolo finale misurato per Y2
    double dForce;          // Forza misurata
    dword  dwPosYAFin;      // Posizione finale Y1
    dword  dwPosYBFin;      // Posizione finale Y2
} RESULT_BEND_LC;

//** Variabili tolte perche' eravamo alla massima dimensione della defcn.app
//** Questi dati venivano usate nella prima modalita' del LaserCheck che credo non verra' piu' utilizzata
typedef struct {
    dword  dwQtaYAStop;
    dword  dwQtaYANew;
    double dAngYARil;
    dword  dwQtaYBStop;
    dword  dwQtaYBNew;
    double dAngYBRil;
    word   wBendStatus;
} TAB_DEBUG_SENS_LC;

typedef struct {
    // Dati per debug
    word wNumeroStop;
    dword dwQtaPCL;
    TAB_DEBUG_SENS_LC TabDebugLC[10];
} DEBUG_SENS_LC;
//**

//[TAN] 15/05/09: Ver. 73.23.2: IMG100
typedef struct {
    double  dSpringBack;
    double  dWarp;
    double  dConfidence;
    byte nMetodo;
    byte nNumeroTentativi;
    double  dTolleranzaPiega;
    double  dPrebend;
    double  dVelSal;        //Velocitá di risalita galleggiamento
    byte nSelPuntiMisura;
    double dQtaPntMisuraYA;
    double dQtaPntMisuraYB;
    double dQtaPntMisuraYBB;
    double dQtaParchLaser;
    double dQtaParchLaserDx;
    double dPreBendPMI;    // PMI relativo all'angolo di prebend
    word   nSensoriAttivi;  // Indica quali sensori sono attivi
} DATI_IMG;

typedef struct {
    double  dQTASB;         //SpringBack quota
    double  dAngSB;         //SpringBack angolare
    double  dAng_d_SB;      //Valutazione d'Angolo dopo ritorno elastico
    double  dMAng;          //Angolo IMG100
    double  dW;
    double  dConf;
    double  dAngCorr;       //Angolo da immettere nel data base
    double  dAngN;          //Nuovo angolo da raggiungere
    double  dPMI;           //Calcolo nuovo PMI
    double  dPMI_PntA;      //PMI calcolato sul primo punto di misura
    double  dPMI_Letto;     //PMI letto alla fine della pressata su Y1
    byte    nRet;           //Uscita funzione di ricalcolo con valori restituiti da IMG100
    byte    nErrAng;        //Errore lettura angolo

    //** 10/12/09 73.24.6: Gestione sensore COPRA LaserCheck come misuratore d'angolo
    double  dQTASB_YB;     //SpringBack quota per Y2
    double  dAngSB_YB;     //SpringBack angolare per Y2
    double  dAng_d_SB_YB;  //Valutazione d'Angolo dopo ritorno elastico per Y2
    double  dMAng_YB;      //Angolo IMG100 per Y2
    double  dAngCorr_YB;   //Angolo da immettere nel data base per Y2
    double  dAngN_YB;      //Nuovo angolo da raggiungere per Y2
    double  dPMI_YB;       //Calcolo nuovo PMI per Y2
    double  dPMI_YB_PntB;  //PMI calcolato sul secondo punto di misura
    double  dPMI_YB_Letto; //PMI letto alla fine della pressata su Y2
    byte    nRet_YB;       //Uscita funzione di ricalcolo per Y2
    byte    nErrAng_YB;    //Errore lettura angolo per Y2

    //** Ottobre 2011 73.26.4: Gestione Misura Angolo LaserCheck automatica e motorizzata
    double  dQTASB_YBB;    //SpringBack quota per YB
    double  dAngSB_YBB;    //SpringBack angolare per YB
    double  dAng_d_SB_YBB; //Valutazione d'Angolo dopo ritorno elastico per YB
    double  dMAng_YBB;     //Angolo IMG100 per YB
    double  dAngCorr_YBB;  //Angolo da immettere nel data base per YB
    double  dAngCorrRic_YBB;  //Correzione angolo su YB ricalcolato in base alle correzioni su Y1 e Y2
    double  dAngN_YBB;     //Nuovo angolo da raggiungere per YB
    double  dPMI_YBB;      //Calcolo nuovo PMI per YB
    double  dBombNom_YBB;  //Valore nominale della bombatura per la piega
    double  dBomb_YBB;     //Calcolo nuova bombatura per YB
    byte    nRet_YBB;      //Uscita funzione di ricalcolo per YB
    byte    nErrAng_YBB;   //Errore lettura angolo per YB

} STEP_IMG;

typedef struct {
    double  dAngFin;        //Angolo da ottenere
    double  dAngPreb;       //Angolo con prebend

    double  dPMIAfterPB;
    double  dPMIAfterPB_YB;

    double  dMeasAngleYA;   // Angolo misurato dal Lasercheck su Y1 con la funzione di Scan Angle
    double  dMeasAngleYB;   // Angolo misurato dal Lasercheck su Y2 con la funzione di Scan Angle

    //[BEC] Maggio 2012 - 73.27.1 - Misura continua angolo con LaserCheck
    dword   dwNumNoMatchYA; // Numero di non alternanza ricezione angoli front-back per Y1 durante la misura continua
    dword   dwNumNoMatchYB; // Numero di non alternanza ricezione angoli front-back per Y2 durante la misura continua
    double  dAngleYAFront;  // Angolo misurato dal Lasercheck su Y1 front durante la misura continua
    double  dAngleYABack;   // Angolo misurato dal Lasercheck su Y1 back durante la misura continua
    double  dAngleYBFront;  // Angolo misurato dal Lasercheck su Y2 front durante la misura continua
    double  dAngleYBBack;   // Angolo misurato dal Lasercheck su Y2 back durante la misura continua

    double  dGallYA;         // Rilassamento su Y1 al prebend misurato con gli strain gauges
    double  dGallYB;         // Rilassamento su Y2 al prebend

    STEP_IMG tp[10];
} CALC_IMG;
//Fine [TAN] 19/02/09: Ver. 73.21.2: IMG100

typedef struct {
    byte    type;              // tipo di passo
    byte    rot;               // verso di piega
    word    rip;               // numero di ripetizioni passo di caland.
    dword   fun;               // 20 funzioni macchina
    double  accomp;            // velocita' accompagnamento
    double  thick;             // spessore del foglio
    double  tbend;             // tempo permanenza in piega
    double  corpin;            // correzione quota 180
    double  angya;             // angolo y1
    double  angyb;             // angolo y2
    double  angyc;             // angolo y3
    double  angyd;             // angolo y4
    double  xa;                // double   asse x1
    double  xb;                // double   asse x2
    //** 30/04/07 73.19.1: Introduzione 4 torrette
    double  xc;                // double   asse x3
    double  xd;                // double   asse x4
    double  ya;                // double   asse y1
    double  yb;                // double   asse y2
    double  yc;                // double   asse y3
    double  yd;                // double   asse y4
    double  ara;               // double   asse r1
    double  arb;               // double   asse r2
    //** 30/04/07 73.19.1: Introduzione 4 torrette
    double  ar_c;              // double   asse r3
    double  ard;               // double   asse r4
    double  za;                // double   asse z1
    double  zb;                // double   asse z2
    //** 30/04/07 73.19.1: Introduzione 4 torrette
    double  zc;                // double   asse z3
    double  zd;                // double   asse z4
    double  aa;                // double   asse ausiliario 1
    double  ab;                // double   asse ausiliario 2
    double  ac;                // double   asse ausiliario 3
    double  ad;                // double   asse ausiliario 4
    double  ae;                // double   asse ausiliario 5
    double  af;                // double   asse ausiliario 6
    double  ag;                // double   asse ausiliario 7
    double  ah;                // double   asse ausiliario 8
    double  coraya;            // correzione angolo y1
    double  corayb;            // correzione angolo y2
    double  corayc;            // correzione angolo y3
    double  corayd;            // correzione angolo y4
    double  corxa;             // correzione x1
    double  corxb;             // correzione x2
    //** 30/04/07 73.19.1: Introduzione 4 torrette
    double  corxc;             // correzione x3
    double  corxd;             // correzione x4
    double  corya;             // correzione y1
    double  coryb;             // correzione y2
    double  coryc;             // correzione y3
    double  coryd;             // correzione y4
    double  rinxa;             // rinculo x1
    double  rinxb;             // rinculo x2
    //** 30/04/07 73.19.1: Introduzione 4 torrette
    double  rinxc;             // rinculo x3
    double  rinxd;             // rinculo x4
    double  velw;              // velocita di lavoro
    double  tcp;               // tempo di cambio passo
    double  pms;               // punto morto superiore
    byte    byNumSt;           // numero stazione
    byte    byConSe;           // consenso sensore
    byte    bySensA;           // sensore 1 abilitazione
    byte    bySensB;           //
    byte    bySensC;           //
    byte    bySensD;           //
    byte    bySensE;           //
    byte    bySensF;           //
    byte    metodo;            // metodo di funzionamento sensore
    double  dSa;               //
    double  dSb;               //
    double  dSc;               //
    double  dSd;               //
    double  dSe;               //
    double  dSf;               //
    double  altaletta;         //
    double  newpa;              //
    double  newpb;              //
    double  newpc;              //
    double  newpd;              //
    double  newpe;              //
    //27/06/07 Ver. 73.20.0: Nuovi campi generici
    byte    bPiegaA;
    byte    bPiegaB;
    byte    bPiegaC;
    byte    bPiegaD;
    byte    bPiegaE;
    byte    bPiegaF;
    byte    bPiegaG;
    byte    bPiegaH;
    byte    bPiegaI;
    double  dPiegaA;
    double  dPiegaB;
    double  dPiegaC;
    double  dPiegaD;
    double  dPiegaE;
    double  dPiegaF;
    double  dPiegaG;
    double  dPiegaH;
    double  dPiegaI;
    //FINE 27/06/07 Ver. 73.20.0: Nuovi campi generici

    //** 17/07/07 73.20.0: Gestione sensore COPRA LaserCheck
    DATA_LC        dataLC;          // Dati per sensore LC
    RESULT_BEND_LC result_bendLC;   // Risultati della piega
    DEBUG_SENS_LC  DatiDebugSensLC; // Dati per debug funzionamento sensore LC

    //[TAN] 15/05/09: Ver. 73.23.2: IMG100
    DATI_IMG   DatiIMG;
    CALC_IMG   IMG;
   string  die[261];   // matrice attuale
   string  punch[261]; // punzone attuale

   string  dieholder[261];   // die holder attuale
   string  intermediate[261]; // intermedio attuale

   double  mm_for_degree[11];  // Correzioni in mm
   double  dLabMin;
   double  dAreaSicX;
   double  dAreaSicR;
   byte  bActBomb;
   byte  bFindMax;
   byte  bFindSpess;

   double  width;        // larghezza lamiera
   byte    byV_Die;      // cava matrice
   double  WidthV_Die;   // larghezza cava selezionata
   double  force;        // forza di piega
   double  crowning;     // bombatura
   double  MutePoint;    // correzione punto cambio velocità
   byte    Direction;    // direzione pezzo
   double  InnerRadius;  // raggio interno
   string  Material[261]; // materiale
   byte    byMaterial;   // numero materiale
   word    byResist;      // resistenza
   double  dYbomb;       // asse bombatura
   double  dCorrYbomb;   // correzione asse bombatura
   byte    byInSostegno; // tipo appoggio/sostegno
} PGA;

typedef struct {
    double dInPun;          // starting point of punch position (according to Z position or fixing 0 position at the left side of the machine)
    double dLungPun;        // lenght of the punch in the current station
    double dInMat;          // starting point of die position (according to Z position or fixing 0 position at the left side of the machine)
    double dLungMat;        // lenght of the die in the current station
} TOOLING;

typedef struct {
 PERSIST dword    piecef;            // pezzi programmati
 PERSIST dword    pieced;            // pezzi fatti
    double   newha;              //
    double   newhb;              //
    double   newhc;              //
    double   newhd;              //
    double   newhe;              //
    double   newhf;              //
    double   newhg;              //
    double   newhh;              //
    double   newhi;              //
    TOOLING  Tooling[8];         // Dati stazioni

    byte    byMeasures;    // tipo misure
    double  dDevelop[8];   // sviluppo sezioni
    string  NamePrg[261];  // nome programma
    byte    byActBend;     // piega selezionata UI
    byte    byActSection;  // sezione selezionata UI
} PRG;

typedef struct {
    double          pres;       // pressione convertita in volt
    double          cpres;      // contro-pressione convertita in volt
    double          pramp;      // rampa di pressione
    double          cramp;      // rampa di bombatura
    double          tdisc;      // tempo discesa pressione
    double          tdeco;      // tempo decompressione
} CNV;

typedef struct {
    double          dqgeo;      // quota geometrica
    double          dqrel;      // quota ritorno elastico
} TCA;

// Parametri SETUP seriale

typedef struct {
    string      Port[6];           // Indirizzo porta dispositivo di comunicazione
    dword       baud;              // baudrate di comunicazione seriale
    dword       wordlen;           // lunghezza della parola (7 o 8 bit)
    dword       stopb;             // numero di bit di STOP
    dword       parity;            // codice controllo parità

    byte        ACK;               // Codice carattere di ACKNOLEDGE
    byte        NACK;              // Codice carattere di NOT ACKNOLEDGE
    byte        prefix;            // Codice carattere di prefisso (STX)
    byte        suffix;            // Codice carattere di suffisso (ETX)
    dword       rxdelay;           // Ritardo in ricezione tra ogni singolo carattere
    dword       txdelay;           // Ritardo in tramissione tra ogni singolo carattere
    dword       headch;            // numero di caratteri da scartare in testa
    dword       tailch;            // numero di caratteri da scartare in coda
    dword       retray;            // numero di tentaivi effettuati in caso di NAK

    dword       ProOpt;            // maschera delle opzioni del protocollo seriale

    byte        Xon;               // carattere di XON
    byte        Xoff;              // carattere di XOFF
    dword       XonLim;            // Nr. caratteri da attendere prima di inciare XON
    dword       XoffLim;           // Nr. caratteri da attendere prima di inciare XON
    byte        ErrCh;             // Carattere che rimpiazza gli errori (patcher)
} SERCFG;

typedef struct {
    double  altDieHolder;
    double  altIntermediate;
    double  altm;       // altezza della matrice
    double  dimp;       // dimensione posteriore
    double  angoloc;    // angolo della cava
    double  largc;      // larghezza della cava
    double  raggioc;    // raggio della cava
    double  intinter;   // interasse forchetta interna GPS4
    double  intrag;     // raggio forchetta interna GPS4
    double  estinter;   // raggio forchetta esterna GPS4
    double  estrag;     // interasse forchetta esterna GPS4
    double  labMin; // labbro minimo
    double  areaSicX;   // area sicurezza X
    double  areaSicR;   // area sicurezza R
} PLD;

typedef struct {
    double  pcv;        // punto cambio velocita'
    double  pcl;        // punto contatto lamiera
    double  pmsc;       // punto morto superiore convertito
} QPST;

// Parametri Speciali
typedef struct {
    dword   dwsp[30];
    double  dsp[30];
    word    bsp;
}PARSPEC;

// Parametri Generici
typedef struct {
    dword   dwgn[26];
    word    bgn;
}PARGENE;

// Parametri Generici pag. 2 Aggiunto Ver. 10.0
typedef struct {
    dword   dwgn[200];
    double  dgn[100];
    word    bgn;
}PARGENE_DUE;

// Parametri Generici pag. 3 Aggiunto per Multi Y
typedef struct {
    dword   dwgn[100];
    double  dgn[100];
    dword   bgn[10];
}PARGENE_TRE;

// Parametri "USER PAGE" Aggiunto Ver. 3.0 Monoboard
typedef struct {
    dword   dwuser[26];
    dword   buser;
}PAR_USER;

// Abilitazioni funzioni e pagine di impostazione UI
typedef struct {
    dword   dwFunPagUI;
}ABIL_FUN_PAG_UI;

typedef struct {
    dword   dwEnabPerformance;
}GUI;

// Parametri GPS4
typedef struct {
    word    wgps[4];
    dword   dwgps[32];
    double  dgps[1];
}PARGPS;

//Debug su 10 pressate della Value_To_Reach
typedef struct {
    byte    byStatoD[10];
    double  dNewPosSensoreA[10]; //Quota sensore1 in Input
    double  dNewPosSensoreB[10]; //Quota sensore2 in Input
    double  dProfA[10];          //Quota sensore1 in Output
    double  dProfB[10];          //Quota sensore2 in Output
    double  dRealPosSensA[10];   //Quota raggiunta sensore1
    double  dRealPosSensB[10];   //Quota raggiunta sensore2
    double  dRealPosYA[10];      //Quota raggiunta Y1
    double  dRealPosYB[10];      //Quota raggiunta Y2
    double  dDeltaA[10];         //Delta1
    double  dDeltaB[10];         //Delta2
}DEBVALUE;

//Debug su 10 pressate della StopDecomp
typedef struct {
    byte    byStatoD[10];
    double  dPosSensoreA[10];    //Quota sensore1 in Input
    double  dPosSensoreB[10];    //Quota sensore2 in Input
    double  dQuotaAttYA[10];     //Quota Y1 in Input
    double  dQuotaAttYB[10];     //Quota Y2 in Input
    double  dNewPosSensoreA[10]; //Quota sensore1 in Output
    double  dNewPosSensoreB[10]; //Quota sensore2 in Output
    double  dRealPosSensA[10];   //Quota raggiunta sensore1
    double  dRealPosSensB[10];   //Quota raggiunta sensore2
    double  dRealPosYA[10];      //Quota raggiunta Y1
    double  dRealPosYB[10];      //Quota raggiunta Y2
    byte    byArrDec[10];        //Flag di arresto decompressione
    double  dDeltaA[10];         //Delta1
    double  dDeltaB[10];         //Delta2
}DEBSTOP;

//Struttura per editor configurazio I/O
typedef struct {
    byte    byNReg;
    byte    byNBit;
}EDITORIO;

// Ver. 14.0 Parametri Sensori di pressione
// 73.18.1 Dichiarati CHECKSUM solo i parametri di impostazione
typedef struct {
  //*** Dati impostati
    CHKSUM  double   dQtaGallegg;    // Quota di galleggiamento
    CHKSUM  double   dFSSens;        // Fondo scala sensore [bar]
    CHKSUM  double   dSYa;           // Superficie camera Superior e Y1 [m^2]
    CHKSUM  double   dSYb;           // Superficie camera Superiore Y2 [m^2]
    CHKSUM  double   dOfForza;       // Offset di forza della macchina [ton]
    CHKSUM  byte     byBufferL;      // Parametro L del buffer circolare
    CHKSUM  byte     byBufferN;      // Parametro N del buffer circolare
    CHKSUM  byte     byBufferNa;     // Parametro N2 del buffer circolare
    CHKSUM  byte     bySogliaCampMax;// Parametro S del buffer circolare
    CHKSUM  byte     byBufferD;      // Parametro Delta del buffer circolare
            //byte     byBufferS;      // Soglia rilevamento spessore  - 73.18.1 ELIMINATA
    CHKSUM  byte     byAxSensYa;     // Selezione asse sensore Y1
    CHKSUM  byte     byAxSensYb;     // Selezione asse sensore Y2
    CHKSUM  double   dKa;            // Fattore moltiplicativo formula 1
    CHKSUM  double   dKb;            // Fattore moltiplicativo formula 2
    CHKSUM  double   dKc;            // Fattore moltiplicativo formula 3
    CHKSUM  word     wSelFmla;       // Selezione della formula da utilizzare
    CHKSUM  double   dOffsetSpessore;// Offset sullo spessore rilevato
    CHKSUM  double   dTollSpessore;  // Tolleranza sullo spessore rilevato

          //*** Dati per ricalcoli
            double   dSpess;         // Spessore lamiera
            double   dResist;        // Resistenza lamiera
            double   dLargC;         // Larghezza cava
            double   dRaggioC;       // Raggio cava
            double   dAngoloC;       // Angolo cava
            double   dAngoloPiega;   // Angolo piega
            double   dAltDieHolder;  // Altezza Porta Matrice
            double   dAltMat;        // Altezza Matrice
            double   dAltIntermediate;  // Altezza intermedio
            double   dPuntaPunz;     // Raggio punta punzone
            double   dAltPunz;       // Altezza del punzone
            double   dAltSch;        // Altezza schiacciata
            double   dMinAxYab;      // Minimi e massimi impostati per gli assi pestone
            double   dMaxAxYab;
            double   dCaricoMat;     // Carico matrice
            double   dCaricoPnz;     // Carico punzone
            double   dAltCava;       // Altezza cava
            double   dLargImp;       // Larghezza Impostata per calcolo materiale
            word     wFormulaPenetr; // Formula utilizzata per la penetrazione
            word     wRiUtil;        // Indica quale calcolo di Ri utilizzare
            // Ver 16.2
            double   dCorrAngYB;     // Correzione angolare impostata
            double   dDatoImp_a;     // Dati ancora da utilizzare
            double   dDatoImp_b;
            double   dDatoImp_c;
            double   dDatoImp_d;
            double   dDatoImp_e;
            double   dDatoImp_f;


          //*** Dati calcolati/rilevati
            double   dFa;            // Risoluzione di Y1 [KN/div]
            double   dFb;            // Risoluzione di Y2 [KN/div]
            double   dMaxPres;       // Massima pressione rilevata[div]
            double   dMaxForza;      // Massima forza rilevata[KN]
            double   dYaMaxPres;     // Quote assi pestone al momento in cui viene trovato il massimo
            double   dYbMaxPres;
            double   dYaInitCiclo;   // Quote asse Y1 ad inizio ciclo di rilevazione
            double   dYRilSpess;     // Quota media assi pestone al momento del rilevamento spessore
            double   dSpessRil;      // Spessore lamiera rilevato [mm]
            double   dLargCala;      // Larghezza lamiera calcolata [mm] FMLA1
            double   dLargCalb;      // Larghezza lamiera calcolata [mm] FMLA2
            double   dLargCalc;      // Larghezza lamiera calcolata [mm] FMLA3
            double   dResistCala;    // Resistenza calcolata FMLA1
            double   dResistCalb;    // Resistenza calcolata FMLA2
            double   dResistCalc;    // Resistenza calcolata FMLA3
            double   dRicForza;      // Valore di forza di piega ricalcolato
            word     wNCampMax;      // Numero di campionamenti per di trovare il massimo di pressione
            word     wNCampSpess;    // Numero di campionamenti per di trovare lo spessore

          //*** Dati TARGET impostati da programma
            double   dQtaYa;         // PMI impostati
            double   dQtaYb;
            double   dPresImp;       // Pressione impostata
            double   dBombImp;       // Bombatura impostata
            double   dForzaImp;      // Forza impostata
            double   dSpessImp;      // Spessore impostato

          //*** Valori NUOVI TARGET
            double   dQtaRicYa;      // Quote ricalcolate assi pestone
            double   dQtaRicYb;
            double   dRicPress;      // Valore ricalcolato di pressione (campo CNV.pres in volt)
            double   dQtaRicBomb;    // Valore ricalcolato asse di centinatura

          //*** Campi Delta : differenze tra i valori impostati e quelli calcolati
            double   dDeltaYa;
            double   dDeltaYb;
            double   dDeltaPres;
            double   dDeltaBomb;
            double   dDeltaForza;

          //*** Debug
    CHKSUM  word     wAbilDump;          // Abilitazione dump buffer
            word     wDumpBuffer[3000];  // Dump del buffer circolare per debug
            double   dDumpBufSpes[2000]; // Dump del buffer secondario
            word     wRTMonitor;         // Variabile per monitoraggio real-time valori letti di pressione
    CHKSUM  double   dGenerici[10];      // 10 Parametri per uso generico

          //*** Flag da automazione
            byte     byModoCiclo;        // Flag modalita' ciclo automazione

}PAR_PRES;


//** [CAR] Giugno 2009 -  73.23.3 - Gestione sensori Strain Gauge

typedef struct {

    //*** Settings
    CHKSUM  dword    dwSGFlag;              // Flags abilitazione  bit 0 : Sensori Installati
                                          //                                         bit 1 : Abilitazione Stop Pestone
                                          //                                         bit 2 : Inversione segnale di input
                                          //                                         bit 3 : Abilitazione Dump Buffer

  CHKSUM  word     wDimBuffer;            // Dimensione buffer circolare
  CHKSUM  byte     byBufferN;             // Parametro N ( Numero minimo di campioni monotoni    )
  CHKSUM  byte     byBufferD;             // Parametro D ( Minimo delta per accettare il massimo )
  CHKSUM  byte     byThrMax;              // Soglia di % di quella iniziale oltre la quale ricercare il max
  CHKSUM  byte     byAxSensYa;            // Selezione asse sensore Y1
  CHKSUM  byte     byAxSensYb;            // Selezione asse sensore Y2
  CHKSUM  byte     bySelInput;            // Selezione ingresso 0:Y1 - 1:Y2 - 2:valor medio
  CHKSUM  word     wDivInput;             // Numero divisioni ingresso sensori
  CHKSUM  word     wSkipInput;            // Skip campioni in ingresso
  CHKSUM  word     wDimFiltroMT;          // Dimensione Filtro MT (0: disabilitato)
  CHKSUM  double   dGenericiIn[20];       // Parametri per uso generico

    //*** Ciclo

    dword   dwSGCiclo;                      // Flags ciclo   bit 0  : Trovato massimo (Stop Pestone)
                                                                                    //                           bit 1  : Reset buffer (inizio ciclo di rilevazione)
                                                                                    //                           bit 2  : Errore buffer pressione pieno per segnalazione da PLC

  double  dQYa_init;                      // Quote pestone a inizio ciclo
  double  dQYb_init;
  double  dQYa_max;                       // Quote pestone a fine ciclo
  double  dQYb_max;
    word    wValMax;                        // Valor Massimo strovato
    word    wNCamp;                         // Numero di campionamenti prima di trovare il massimo
  double  dGenericiOut[20];               // Parametri per uso generico

    //*** Debug
    word             wDumpBuffer[3000];     // Dump del buffer circolare per debug
    word             wSG_RT_Ina;            // Monitoraggio real-time Sensore Y1
    word             wSG_RT_Inb;            // Monitoraggio real-time Sensore Y2
    word             wSG_RT_Inva;           // Monitoraggio real-time Sensore Y1 invertito
    word             wSG_RT_Invb;           // Monitoraggio real-time Sensore Y2 invertito
    word             wSG_RT_AVG;            // Monitoraggio real-time Segnale ingresso ciclo
    word             wSG_RT_MT;             // Monitoraggio real-time Segnale filtrato

}PAR_SENS_SG;


//** 19/07/06 73.18.2: Gestione sensore angolo di Warcom
typedef struct {
    double dAngRilYA;
    double dAngRilYB;
    double dAngRilYb;
    double dCorrYA;
    double dCorrYB;
    double dCorrYb;
}DEBUG_SENS_ANG;

typedef struct {

    // Dati necessari per la misura dell'angolo
    double dSpessMat;    // Spessore materiale
    double dAngoloDiPiega;   // Angolo di piega
    double dLungX;           // Quota asse X
    double dLargMatrice;     // Larghezza matrice
    double dAngCava;         // Angolo cava
    double dAngPunzone;      // Angolo punzone
    double dRaggioPunzone;   // Raggio punzone

    // Dati rilevati a fine del galleggiamento
    double dAngYARilevato;   // Angolo di piega misurato su Y1 a fine galleggiamento
    double dAngYBRilevato;   // Angolo di piega misurato su Y2 a fine galleggiamento
    double dAngYbRilevato;   // Angolo di piega misurato su Yb a fine galleggiamento

    // Dati rilevati al PMI
    double dAngYA_PMI;       // Angolo di piega misurato su Y1 al PMI
    double dAngYB_PMI;       // Angolo di piega misurato su Y2 al PMI
    double dAngYb_PMI;       // Angolo di piega misurato su Yb al PMI

    CHKSUM dword dwIntNumPezzi; // Indica dopo quanti pezzi,dopo il primo,i sensori vengono riutilizzati

    // Dati per debug
    dword nNumeroPressate;
    DEBUG_SENS_ANG TabDebug[10];

}PAR_SENS_ANG;

//** 17/07/07 73.20.0: Gestione sensore COPRA LaserCheck
typedef struct {

    // Parametri macchina per sensori LC
    dword  dwValueRedPosDec;     // Valore di riduzione della quota di galleggiamento fornita dal LC in [1/1000 mm] --> 1
    dword  dwDelayMeasure;       // Attesa in [ms] prima dell'invio di una richiesta di valore misurato --> 2
    dword  dwDelayDecToComp;     // Attesa in [ms] prima del passaggio da decompressione a compressione --> 3
    word   wStepToBendAngle;     // Numero delle fasi di avvicinamento all'angolo di sovrapiegatura --> 7
    dword  dwMinMovOfY;          // Perorso minimo relativo possibile dell'asse Y in [1/1000 mm] --> 8
    dword  dwLimForceRatioSB;    // Limite rapporto della forza RFlim per il calcolo dello springback in % --> 9
    dword  dwTargetAngleOffset;  // Sicurezza di avvicinamento all'angolo di arrivo in [1/100 deg] --> 10
    dword  dwMaxSBAngle;         // Springback massimo possibile in [1/100 deg] --> 11
    dword  dwOvershotBeforeRel;  // Sovraoscillazione della posizione di arrivo di Y in [1/1000 mm] nella
                         // fase di decompressione --> 12
    dword  dwTargForceRatioSB;   // Valore di arrivo del rapporto di forza nel calcolo dello springback in % --> 13
    dword  dwCommTimeout;        // Timeout in [ms] per la comunicazione --> 14
    dword  dwPrebendAngle;       // Angolo di pre-piegatura in [1/100 deg] --> 15
    dword  dwSpeedInDecomp;      // Velocita' di scarico durante la determinazione dello springback [mm/min] --> 16
    dword  dwDecDistance;        // Limita il massimo movimento in fase di decompressione del pestone [1/1000 mm]
    dword  dwExpectedSB;         // Springback atteso in [deg]: questo valore dipende dal materiale e dalla matrice
    dword  dwCompFactor;         // Lo springback calcolato sara' modificato con questo fattore di compensazione in %
    dword  dwSensorCorrAngleL;   // Correzione angolo sinistra in [1/100 deg]
    dword  dwSensorCorrAngleR;   // Correzione angolo destra in [1/100 deg]
    dword  dwLeftSensorPos;      // Posizione coppia sensori di sinistra in [1/1000 mm]
    dword  dwRightSensorPos;     // Posizione coppia sensori di destra in [1/1000 mm]
    dword  dwTimeoutInitSysASM;  // Timeout in [ms] comando InitSysASM di AngleMeasurementSystem

    string sIPAddressLC[15];     // Indirizzo IP del LC --> 4
    dword  dwPortaLC;            // Codice porta --> 6

    // Parametri di elaborazione di immagini per LC
    dword  dwSegmentation;
    dword  dwMinLaserLineLengt;
    dword  dwMinBrightness;
    dword  dwToolDetection;
    dword  dwMeasurementType;

    //** 10/12/09 73.24.6: Gestione sensore COPRA LaserCheck come misuratore d'angolo
    byte nNumeroTentativiLC;
    double dTolleranzaPiegaLC;
    double dInsPMILC;
    word   wActiveSensorLC;      // Indica quali sensori sono attivi

    //** Ottobre 2011 73.26.4: Misura angolo con LaserCheck con gallaggiamento controllato da estensimetri
    double dVelGallTarParEst;
    double dCavaTarParEst;
    byte byShowErrMess;
    word wSelPuntiMisuraAng;
    double dQtaGallBomb;

    //[BEC] Maggio 2012 - 73.27.1 - Inserito parametro differenza max tra angolo misurato e angolo voluto
    dword dwMaxDiffAng;          // Max differenza tra angolo misurato e angolo voluto prima di dare errore [1/100 deg]

    double dPosParchLaser;
    double dPosParchLaserDx;
    double dOffLaserBordoPezzo;
    byte   byUsoSGsoloPB;
    double dCorrNewAngle;
    byte   byOttMis;

    // Valori di default per i punti di misura su Y1,YB,Y2
    double dPosPntMisuraYA;
    double dPosPntMisuraYBB;
    double dPosPntMisuraYB;

    // Variabili per misura real time
    dword   dwFrameRate;
    double  dSogliaSpostAng;
    word    wNumCampAngFermo;
    double  dSpostAngInizGall;
    double  dDumpBufferLC[6000];
    word    wNCampAng;
    dword   dwMisAngRTFlag;
    dword   dwMisAngRTCiclo;
    word    wDimFiltroDataMT;          // Dimensione Filtro MT (0: disabilitato)

    double  dBufferDataM[3000];
    word    wIndWriteDataM;
    word    wIndReadDataM;

    // Gestione doppio sensore motorizzato
    double  dBufferDataM_Right[3000];
    word    wIndWriteDataMRight;
    word    wIndReadDataMRight;

    byte byBendMethod;
    dword dwLearnBndFstPiece;
} PAR_SENS_LC;

typedef struct {
    word   wActiveSensor;        // Indica se i sensori sono attivi di default e quali
    word   wBendMethod;          // Indica il metodo di piega utilizzato di default
    word   wSubBendMethod;       // Indica il sottometodo di piega utilizzato di default
} PAR_UTENTE_LC;

//**

//[TAN] 15/05/09: Ver. 73.23.2: IMG100
typedef struct {
    // Parametri macchina comunicazionr IMG100
    byte nNumeroTentativi;
    double dTolleranzaPiega;
    double dInsPMI;
    string sIPAddressLC[15];     // Indirizzo IP del IMG100
    dword  dwPortaLC;            // Codice porta
    dword  dwCommTimeout;        // Timeout in [ms] per la comunicazione
    double  dWarp;
    double  dConfidence;
    double  dPrebend;

    byte byPa;
    byte byPb;
    byte byPc;
    byte byPd;
    byte byPe;

    dword  dwPa;
    dword  dwPb;
    dword  dwPc;
    dword  dwPd;
    dword  dwPe;

    double  dPa;
    double  dPb;
    double  dPc;
    double  dPd;
    double  dPe;

} PAR_IMG;

typedef struct {

    string KernelRevision[32];           // Ver 2.7 only
    string ApplicationName[32];          // Ver 2.7 only

    dword CncCmd;

    dword CncReferenceYA;
    dword CncReferenceYB;
    dword CncToolReference;

    dword CncMatThickness;
    dword CncDieAHeight;
    dword CncDieBHeight;
    dword CncPunchAHeight;
    dword CncPunchBHeight;

    dword CncMutePosition;
    dword CncUpStandTrayMode;
    word  CncHeightOfCrowning;
    dword CncDecompEndHeight;
    word  CncOperationalMode;
    word  CncOperationalModb;          // x Ver 2.0 Lazer Safe

    dword PCSSReferenceYA;
    dword PCSSReferenceYB;
    dword PCSSToolReference;

    dword PCSSMatThickness;
    dword PCSSDieAHeight;
    dword PCSSDieBHeight;
    dword PCSSPunchAHeight;
    dword PCSSPunchBHeight;

    dword PCSSMutePosition;
    dword PCSSUpStandTrayMode;
    word  PCSSHeightOfCrown;
    dword PCSSDecompEndHeight;
    word  PCSSOperationalMode;
    word  PCSSOperationalModb;         // x Ver 2.0 Lazer Safe

    dword PCSSReplay;

    dword PCSSSensorsStatus;

    dword PCSSMutePoint;
    word  PCSSConditionCode;

    dword PCSSgA_in[32];
    dword PCSSgA_out[32];
    dword PCSSgD_in[4];
    dword PCSSgD_out[4];

} S_LAZER_SAFE;

typedef struct {
    dword PnozStat;

    dword PnozProduct;
    dword PnozDevice;
    dword PnozSerialNumber;

    dword PnozCheckSumUserPrg;
    dword PnozCheckSumUserDat;
    dword PnozCreationDate;
    dword PnozHwRegLeft;
    dword PnozHwRegRightA;
    dword PnozHwRegRightB;
    dword PnozMaskCmd;

    byte  PnozIO[32];
    byte  PnozLeds[32];

    byte  PnozVirtualInput[3];      // Input virtuali del PNOZ
    byte  PnozVirtualIOImage[6];    // I/O virtuali

} S_PNOZ;

typedef struct {
    word OutputRegister[2];
    word InputRegister[2];
    word WrDataRegister[2];
    word MessageRegister[2];
} S_FPSC;

typedef struct {
    CHKSUM  dword  TnPara[16];  // Parametri configurazione
                                // [0:3] Nodi presse
                                // [4:15]

            dword  TnData[32];  // [0] QnMisY1      Pressa1
                                // [1] QnMisY2
                                // [2] 32 Output
                                // [3] 32 Input
                                // [4:7] Varie
                                //....
                                // [24] QnMisY1     Pressa4
                                // [25] QnMisY2
                                // [26] 32 Output
                                // [27] 32 Input
                                // [28:31] Varie
} TANDEM;

///////////////////////////////////////////////////////////////////////////////
//////////////////////////// AUTOTUNING ///////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//                                                                           //
//                                                                           //
typedef struct {
    byte   ppc_typ;
    double ppc_gy_a;
    double ppc_gy_b;
    double ppc_gs_a;
    double ppc_gs_b;
    double ppc_kbil;
    double ppc_tols;
    double ppc_sbil;
    byte   ppc_abins;
} AT_PPCONF;

typedef struct {
    double ppm_typ;
    double ppm_acc;
    double ppm_vel;
    double ppm_qy_a;
    double ppm_qy_b;
    double ppm_qs_a;
    double ppm_qs_b;
    double ppm_ttol;
    double ppm_tstop;
} AT_PPMOVE;


typedef struct {
    dword in_reg;
    dword in_reg_a;
    dword out_reg;
} AT_SINC;


typedef struct {
    string ValveManuf[16];
    string ValveType[22];
    dword QtaMax;
    dword QtaMin;
    dword FsCorrente;
    dword CorrenteMax;
    dword StepIMax;
    dword StepIMin;
    dword TimImin;
    dword VelMin;
    dword TolVel;
    dword TolRefDac;
    dword IMinD_a;
    dword IMinD_b;
    dword IMinS_a;
    dword IMinS_b;
    dword IMaxD_a;
    dword IMaxD_b;
    dword IMaxS_a;
    dword IMaxS_b;
    dword vel_a;
    dword vel_b;
    dword atFlags;
    dword atdummy_a;
    dword atdummy_b;
    dword atdummy_c;
    dword atdummy_d;
    double atdummy_da;
    double atdummy_db;
    double atdummy_dc;
    double atdummy_dd;
    double dStepDecVel;
    double dDefaultVelDiscesa;
    double dFreqMinUp_a;
    double dFreqMaxUp_a;
    double dFreqMinUp_b;
    double dFreqMaxUp_b;
    double dFreqMinDn_a;
    double dFreqMaxDn_a;
    double dFreqMinDn_b;
    double dFreqMaxDn_b;
    word  wNumLettFiltroFreqA;
    word  wNumLettFiltroFreqB;
    word  wNumLettFiltroFreqC;
    word  wNumLettFiltroFreqD;
    word  wNumLettFiltroCurrA;
    word  wNumLettFiltroCurrB;
    word  wNumLettFiltroCurrC;
    word  wNumLettFiltroCurrD;
} AT_DAT;


typedef struct {
    dword DS_Abil;
    dword DS_Direz;
    dword DS_Timer;
    dword DS_Step;
    dword OQ_Gradini;
    dword OQ_Ton;
    dword OQ_Toff;
} AT_TOOLS;


typedef struct {
    double dFreqUp_a;
    double dFreqDn_a;
    double dFreqUp_b;
    double dFreqDn_b;
    double dCurrUp_a;
    double dCurrDn_a;
    double dCurrUp_b;
    double dCurrDn_b;
} AT_POS;

typedef struct {
CHKSUM dword VRS_ENAB;          //abilitazione regolazione
       dword VRS_TS;            //tempo campionamento [ms]
CHKSUM dword VRS_SENS_OFFS;     //offset ingresso sensore [P]
CHKSUM dword VRS_SENS_OFFSB;    //offset ingresso sensore Salita Veloce [P]
CHKSUM dword VRS_SCALE;         //scala uscita attuatore [Dac/P x1000]

CHKSUM dword VRS_PROP_GAIN;     //Guadagno proporzionale

CHKSUM dword VRS_VEL_GAIN;      //Guadagno velocità [Hz x1000] (P/s/P x1000)
CHKSUM dword VRS_DEADBAND;      //deadband compens. spoletta [P]
CHKSUM dword VRS_COM_UP_LIM;    //lim sup compens. spoletta [P]
CHKSUM dword VRS_COM_DN_LIM;    //lim inf compens. spoletta [P] (>0)
CHKSUM dword VRS_DOT_P_LIM;     //lim sup velocita' compens. spoletta [P/s]
CHKSUM dword VRS_DOT_N_LIM;     //lim inf velocita' compens. spoletta [P/s] (>0)

CHKSUM dword VRS_END_VOL_SCALE;     //Fondo scala tensione
CHKSUM dword VRS_INV_SENSORIN;      //Inversione ingresso cursore
CHKSUM dword VRS_TIME_SENSORIN;     //Tempo intervento errore di cursore scollegato
CHKSUM dword VRS_TH_SENSORIN;   //Soglia intervento errore di cursore scollegato
CHKSUM dword VRS_MAX_SLIDE;     //Max cursore

CHKSUM dword VRS_DUMMY_A;       //Parametro Libero
CHKSUM dword VRS_DUMMY_B;       //Parametro Libero
CHKSUM dword VRS_DUMMY_C;       //Parametro Libero

       dword VRS_RESET;         //comandi
       dword VRS_OUT;           //

       dword VRS_SETPOINT;      // testpoints
       dword VRS_SENSORIN;
       dword VRS_DEMANDOUT;
} AT_REG;

typedef struct {
    string  strNamDie[261];
    string  strNamPun[261];
} TOOL_CHANGE;

typedef struct {
    byte PilzUDPLineStat;
    dword PilzUDPInQueue;
    dword PilzUDPInput[10];
    dword PilzUDPOutput[10];
} S_PILZUDP;

typedef struct {
    dword  dwElementStep[10];
    double dElementStep[10];
    dword  bElementStep;
    dword   bFalgAntiColl;
    double  Elefaseaxa;
    double  Elefaseaxb;
    double  Elefaseaxc;
    double  Elefaseaxd;
    double  Elefaseara;
    double  Elefasearb;
    double  Elefasearc;
    double  Elefaseard;
    double  Elefaseaza;
    double  Elefaseazb;
    double  Elefaseazc;
    double  Elefaseazd;
    double  Elefasebxa;
    double  Elefasebxb;
    double  Elefasebxc;
    double  Elefasebxd;
    double  Elefasebra;
    double  Elefasebrb;
    double  Elefasebrc;
    double  Elefasebrd;
    double  Elefasebza;
    double  Elefasebzb;
    double  Elefasebzc;
    double  Elefasebzd;
    double  Elefasecxa;
    double  Elefasecxb;
    double  Elefasecxc;
    double  Elefasecxd;
    double  Elefasecra;
    double  Elefasecrb;
    double  Elefasecrc;
    double  Elefasecrd;
    double  Elefasecza;
    double  Elefaseczb;
    double  Elefaseczc;
    double  Elefaseczd;
    double  Elefasedxa;
    double  Elefasedxb;
    double  Elefasedxc;
    double  Elefasedxd;
    double  Elefasedra;
    double  Elefasedrb;
    double  Elefasedrc;
    double  Elefasedrd;
    double  Elefasedza;
    double  Elefasedzb;
    double  Elefasedzc;
    double  Elefasedzd;
    double  Elefaseexa;
    double  Elefaseexb;
    double  Elefaseexc;
    double  Elefaseexd;
    double  Elefaseera;
    double  Elefaseerb;
    double  Elefaseerc;
    double  Elefaseerd;
    double  Elefaseeza;
    double  Elefaseezb;
    double  Elefaseezc;
    double  Elefaseezd;
} STEP;

//ATC
typedef struct {
    string  ToolingName[30];
    word    nToolCass;
    word    wToolPos;
    byte    byToolScarp;
    double  ToolLength;
    double  ToolStart;
    word    nToolType;
} TOOLING_ATC;

typedef struct {
    double  IntPos;
}INTERMEDI;

typedef struct {
    dword  dwElementProg[10];
    double dElementProg[10];
    dword  bElementProg;
    TOOLING_ATC   PunchComp[100];
    TOOLING_ATC   MatComp[100];
    INTERMEDI IntComp[100];
    string    strName[41];
   STEP Step[80];
} PROGRAM;

// Correzione quota target con strain gauge
typedef struct {
    CHKSUM dword sgtcVolt[11];  // tensione rilevata
    CHKSUM dword sgtcCorr[11];  // correzione PMI
    dword sgtcData[11]; // dati attuali
} SGTC;

typedef struct {
byte MCSStat;
byte MCSIn[12];
byte MCSOut[20];
} MCS_DAT;

//PPG struttura dati accompagnatori
typedef struct{
    double pba_parm[15];                    // Parametri (vedi UIPL)

} PPG_BENDING_AID;

//PPG struttura dati gantry
typedef struct{
    double              pga_CenterDist;

    double              pga_dPar[16];
    dword               pga_dwPar[16];

} PPG_GANTRY_AXIS;

//[TAN] 30/01/14: 73.26.11.17: F(Force,B.C.D.)=Torque_0_255
typedef struct {
    double dForce_a;
    double dTorquePercentage_a;
    double dTorquePercentage_b;
    double dTorquePercentage_c;
} BDC_FORCE_TORQUE;

//[TAN] 11/05/15: 73.34.8: F(Force,Width)=Crowning
typedef struct {
double dForce_c;
double dCrowning[20];
} WFC;

typedef struct{
    word                pgs_NoOfAxes;
    PPG_GANTRY_AXIS     pgs_Axis[8];                // Parametri per asse

    double              pgs_dPar[16];
    dword               pgs_dwPar[16];

} PPG_GANTRY_SYSTEM;

// MOSES
typedef struct {
    dword PlcToUiMoses;
    dword UiToPlcMoses;
} MOSES;

typedef struct {
    string sUserName[8];
    string sPassWord[8];
    byte byLevel;
} OPERATOR_ACCESS;

typedef struct {
      double dBar;
    double dVolt;
} PRESSURE_CURVE;

typedef struct {
      double dBarBomb;
    double dVoltBomb;
} BOMB_CURVE;

typedef struct {
    dword  dwElementSStep[10];
    double dElementSStep[10];
    dword  bElementSStep;

    double dAHoming[4];

    byte   byGPS[4];
    double dGPS[4];

} SPECIAL_STEP;

typedef struct {
    dword  dwElementProg[10];
    double dElementProg[10];
    dword  bElementProg;
    SPECIAL_STEP SpecialStep[80];
} SPECIAL_PROGRAM;

typedef struct {
    word    Xhc_LineIdx[4];
    dword   Xhc_Puls;
    dword   Xhc_RatioData;
    dword   Xhc_AxisData;
    dword   Xhc_MPGData;

    dword   Xhc_Connect;
} S_XHC_CONFIG;

typedef struct {
    string  WorkDir[261];
    string  MatDir[261];
    string  PnzDir[261];
    string  WorkDrive[261];
    string  BackupUnit[261];
} S_WORK_FOLDERS;


typedef struct {
    double  dimensioning[20];
} S_GEN;


//                                                                           //
//                                                                           //
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

CAX            cax[NUM_ASSI]; // CONFIGURAZIONE assi: verificare dimensione con NMAX_AXIS
CHKSUM double  gen[31]; // Struct.configurazione GENERALI : verifica con DG_NUMDATI
CHKSUM byte    val[33]; // Struct.VALVOLE : verificare dimensione con VA_NUMDATI
CHKSUM word    outdv;   // configurazione valvole discesa veloce
CHKSUM word    outdl;   // configurazione valvole discesa lenta
CHKSUM word    outsv;   // configurazione valvole salita veloce
CHKSUM word    outsl;   // configurazione valvole salita lenta
CHKSUM word    outbm;   // configurazione valvola bombatura
CHKSUM word    outds;   // configurazione valvole discesa lentissima

PAX            ap[28];   // Dati  assi: verificare dimensione con NMAX_AXIS
CHKSUM double  pst[62];  // Strutture PESTONE : verif. dimensione con PE_NUMDATI+2
CHKSUM double  pstt[6];  // Dati TEMPI del pestone convertiti
CHKSUM dword   pstp[4];  // Dati PRESSIONI del pestone convertiti
CHKSUM word    fs[2];    // Correnti FS della scheda pressione convertiti
CHKSUM double  tabm[9];  // Tabella MATERIALI

 string  npr[261];   // nome programma verificare con NAME_LEN+1
 PRG     head;       // intestazione programma
 PGA     prog[80];   // le pieghe di lavoro
 CNV     progc[80];  // dati piega convertiti
 PLD     dap[80];    // dati attrezzaggio piega x piega
 QPST    PestQ[80];  // quote del pestone
 TCA     telec[80];  // quote geometriche e ritorno el.piega x piega
 SERCFG  Com[4];     // Configurazione porte seriali COM1 e COM2

 word    actpga;     // piega attuale
 word    actsez;     // sezione attuale
 word    nsez;       // numero di sezioni
 word    sezio[8];   // pieghe per sezione
 double  svilu[8];   // pieghe per sezione
 word    progp;      // numero di prog. in esecuzione in lista
 string  listap[261];// nome lista in esecuzione

 dword   pieceflista;  //Pezzi da fare in lista
 dword   piecedlista;  //Pezzi fatti in lista

 word    selasse;    // Indice dall` asse selezionato

                //**** GESTIONE Robot
dword   robotnam;   // Nome in codice del programma x robot

byte    cond;       // Modo operativo settato dal PLC canale 0
byte    condb;      // Modo operativo settato dal PLC canale 1
byte    condc;      // Modo operativo settato dal PLC canale 2
byte    condd;      // Modo operativo settato dal PLC canale 3
byte    conde;      // Modo operativo settato dal PLC canale 4
double  tara;       // quota taratura diretta
double  posi;       // quota di posizionamento

 byte    np;         // numero di piega corrente
 byte    nmaxp;      // numero totale di pieghe del pezzo
 word    nrip;       // numero di ripetizioni rimaste

dword   lastoplc;   // ultima quota di arresto: viene utilizzata per richiamo
dword   corrplc;    // correzione sbilanciamento convertita in DWORD per PLC
dword   sbilplc;    // massimo sbilanciamento convertito in DWORD per PLC

dword   qminpest;   // Quota minima tra Y1 e Y2
dword   qmaxpest;   // Quota massima tra Y1 e Y2

                //**** Pressioni di lav. per PLC
dword   tensaplc;   // Tensione pressione per diag pestone da plc
dword   tenscplc;   // Tensione contropressione per diag pestone da plc

dword   plav;       // pressione di lav. di piega
dword   blav;       // contropressione di lav. di piega

                //**** FASE di Diagnostica
double  tensaa;     // Tensione Y1 per diag pestone
double  tensab;     // Tensione Y2 per diag pestone
double  tensap;     // Tensione pressione per diag pestone
double  tenscp;     // Tensione contropressione per diag pestone
word    valvd;      // Config. valvole per diag pestone
                //****

//** 30/04/07 73.19.1: Introduzione 4 torrette
double  faseaxa;    // quote di posizionamento per anticollisione
double  faseaxb;
double  faseaxc;
double  faseaxd;
double  faseara;
double  fasearb;
double  fasearc;
double  faseard;
double  faseaza;
double  faseazb;
double  faseazc;
double  faseazd;
double  fasebxa;
double  fasebxb;
double  fasebxc;
double  fasebxd;
double  fasebra;
double  fasebrb;
double  fasebrc;
double  fasebrd;
double  fasebza;
double  fasebzb;
double  fasebzc;
double  fasebzd;
double  fasecxa;
double  fasecxb;
double  fasecxc;
double  fasecxd;
double  fasecra;
double  fasecrb;
double  fasecrc;
double  fasecrd;
double  fasecza;
double  faseczb;
double  faseczc;
double  faseczd;

double  fasedxa;    // quote di posizionamento per anticollisione quarta fase
double  fasedxb;
double  fasedxc;
double  fasedxd;
double  fasedra;
double  fasedrb;
double  fasedrc;
double  fasedrd;
double  fasedza;
double  fasedzb;
double  fasedzc;
double  fasedzd;

double  faseexa;    // quote di posizionamento per anticollisione quarta fase
double  faseexb;
double  faseexc;
double  faseexd;
double  faseera;
double  faseerb;
double  faseerc;
double  faseerd;
double  faseeza;
double  faseezb;
double  faseezc;
double  faseezd;

double  rinca;
double  rincb;
double  rincc;
double  rincd;

// ************* Feed X1 in coniche incrementali*************
double FeedfaseaXa;
double FeedfasebXa;
double FeedfasecXa;

// ************* dati per il funzionamento degli accompagnatori *************
double  vaccas;     // velocita' di salita accompagnatore A1
double  vaccbs;     // velocita' di salita accompagnatore A2
double  vaccad;     // velocita' di discesa accompagnatore A1
double  vaccbd;     // velocita' di discesa accompagnatore A2
double  vacccs;     // velocita' di salita accompagnatore A3
double  vaccds;     // velocita' di salita accompagnatore A4
double  vacccd;     // velocita' di discesa accompagnatore A3
double  vaccdd;     // velocita' di discesa accompagnatore A4


double  accasal;    // quota di posizionamento accompagantore A1 in salita
double  accbsal;    // quota di posizionamento accompagantore A2 in salita
double  accadis;    // quota di posizionamento accompagantore A1 in discesa
double  accbdis;    // quota di posizionamento accompagantore A2 in discesa
double  acccsal;    // quota di posizionamento accompagantore A3 in salita
double  accdsal;    // quota di posizionamento accompagantore A4 in salita
double  acccdis;    // quota di posizionamento accompagantore A3 in discesa
double  accddis;    // quota di posizionamento accompagantore A4 in discesa



// ************* dati per il funzionamento degli ausiliari (primo posiz.)*************
double  posaa;      // quota primo posizionamento aut. asse ausiliario 1
double  posab;      // quota primo posizionamento aut. asse ausiliario 2
double  posac;      // quota primo posizionamento aut. asse ausiliario 3
double  posad;      // quota primo posizionamento aut. asse ausiliario 4
double  posae;      // quota primo posizionamento aut. asse ausiliario 5
double  posaf;      // quota primo posizionamento aut. asse ausiliario 6
double  posag;      // quota primo posizionamento aut. asse ausiliario 7
double  posah;      // quota primo posizionamento aut. asse ausiliario 8

// ************* dati per il funzionamento degli ausiliari (secondo posiz.)*************
double  posba;      // quota secondo posizionamento aut. asse ausiliario 1
double  posbb;      // quota secondo posizionamento aut. asse ausiliario 2
double  posbc;      // quota secondo posizionamento aut. asse ausiliario 3
double  posbd;      // quota secondo posizionamento aut. asse ausiliario 4
double  posbe;      // quota secondo posizionamento aut. asse ausiliario 5
double  posbf;      // quota secondo posizionamento aut. asse ausiliario 6
double  posbg;      // quota secondo posizionamento aut. asse ausiliario 7
double  posbh;      // quota secondo posizionamento aut. asse ausiliario 8

// ************* dati per il funzionamento degli ausiliari (terzo posiz.)*************
double  posca;      // quota terzo posizionamento aut. asse ausiliario 1
double  poscb;      // quota terzo posizionamento aut. asse ausiliario 2
double  poscc;      // quota terzo posizionamento aut. asse ausiliario 3
double  poscd;      // quota terzo posizionamento aut. asse ausiliario 4
double  posce;      // quota terzo posizionamento aut. asse ausiliario 5
double  poscf;      // quota terzo posizionamento aut. asse ausiliario 6
double  poscg;      // quota terzo posizionamento aut. asse ausiliario 7
double  posch;      // quota terzo posizionamento aut. asse ausiliario 8

double  xaPrec;     // quota finale piega precedente X1
double  xbPrec;     // quota finale piega precedente X2
double  xcPrec;     // quota finale piega precedente X3
double  xdPrec;     // quota finale piega precedente X4

CHKSUM  PARSPEC     parspec;    // Parametri Speciali
CHKSUM  PARGENE     pargene;    // Parametri Generici
CHKSUM  PARGENE_DUE pargen_due; // Parametri Generici pag. 2 - Aggiuto Ver 10.0
CHKSUM  PARGENE_TRE pargen_tre; // Parametri Generici pag. 3 - Aggiunto per Multi Y

//**** GESTIONE Sensore EMS/GASPARINI
double  sensore;          // quota sensore 1
double  sensoreb;         // quota sensore 2

//**** GESTIONE Sensore GASPARINI
CHKSUM  byte  GPS;                // E'attiva la gestione Gasparini
byte  MecSens;            // E'attiva la gestione Mecos
CHKSUM  PARGPS pargps;    // Parametri GPS4
  dword  dwPcl[80]; // Punto contatto lamiera (doppiato per il PLC)
double  profa;            // PMI (punto morto inferiore)
byte    byPres;           // Out funzione Bomber GPS4
byte    byBombOk;         // Out funzione Bomber GPS4
byte    byNumPres;        // Numero pressata con ciclo sensore angolo
byte    byNumFoto;        // Numero foto con ciclo sensore angolo
byte    byStato;          // Stato del pestone  (In di tutte le 3 funzioni GPS4)
byte    byErrVal;         // Errore restituito da Value
byte    byErrBomb;        // Errore restituito da Bomber
byte    byErrStop;        // Errore restituito da Stop
DEBVALUE DebValue;        // Debug su 10 pressate della Value_To_Reach
DEBSTOP  DebStop;           // Debug su 10 pressate della StopDecopm

//**** Buffer Campionamenti Quote Y1,Y2,S1,S2
dword   dwQtaYa[4];    // Quote Y1 campoinate
dword   dwQtaYb[4];    // Quote Y2 campoinate
dword   dwQtaSa[4];    // Quote S1 campoinate
dword   dwQtaSb[4];    // Quote S2 campoinate
dword   dwAng[4];     // Angoli generati da GPS4 con il sensore1
dword   dwAngb[4];    // Angoli generati da GPS4 con il sensore2
byte    byCamp;           // Flag per il campionamento START=1,STOP=2,END=0

//**** Quota scostamento appresa da scheda Gasparini via seriale
double  dScost;

//Array per configurazione I/O
CHKSUM EDITORIO ConfigIO[300];    // Mappa degli IO riconfigurabili da Editor

//Numero porta seriale a cui e' collegato il PILZ
word    wNumPortPilz;

// Variabile per aggiornamento IO riconfigurabili
byte    byRefrIO;

//** Ver 14.0
 byte  byHammerle;      // Modalita' Hammerle attiva
 dword dwFlagPressione; // Flags per il funzionamento dei sensori di pressione
 PAR_PRES parpres;      // Struttura variabili per sensori di pressione
//**

//** 19/07/06 73.18.2: Gestione sensore angolo di Warcom
CHKSUM dword dwFlagSensAng;   // Flags per il funzionamento dei sensori d'angolo
PAR_SENS_ANG parsens_ang;     // Struttura variabili per sensori d'angolo

//** 17/07/07 73.20.0: Gestione sensore COPRA LaserCheck
CHKSUM dword dwFlagCOPRA_LC;      // Flags per il funzionamento dei sensori COPRA LaserCheck
CHKSUM PAR_SENS_LC parsensLC;     // Parametri macchina per sensori LC
CHKSUM PAR_UTENTE_LC parutenteLC; // Parametri utente per sensori LC

//[TAN] 15/05/09: Ver. 73.23.2: IMG100
CHKSUM PAR_IMG parIMG;     // Parametri macchina IMG100

//** Ver 14.5
dword  dwDefaultThick;        // Spessore nominale del programma corrente

dword CNCRequest;                   // request flags form kvara to LZS005
                                    // bit 0 : tool tip measurment request
                                    // bit 1 : thickness measurement request
                                    // bit 2 : angle measurement request
dword LZSAnswer;                    // bit 0 : tool tip measurment OK
                                    // bit 1 : thickness measurement OK
                                    // bit 2 : angle measurement OK
double AngleTolerance;
double Confidence;
double AngleMeasured;
byte CalibrationType;
double MinimunConfidence;
double ExclusionRadius;
double BufferAboveDie;

//** Ver 3.0 Monoboard Parametri "USER PAGE"
CHKSUM  PAR_USER paruser;

//[TAN] 22/09/10: Ver.  73.24.15: Abilitazioni funzioni e pagine di impostazione UI
CHKSUM  ABIL_FUN_PAG_UI abilfunUI;

CHKSUM  GUI GUIpar;

S_LAZER_SAFE LazerSafe;       // Comunicazione con Lazer Safe

S_PNOZ Pnoz;

S_FPSC Fpsc;

//** 31/07/06 198.2.7 183.6.1 73.18.2: Gestione uscite su cambio cava matrice
byte    byCava;


//--------------TOOL CHANGE-------------------------------------------------

string  matrice[261];   // mattrice attuale
string  punzone[261];   // punzone attuale

byte  byNumDieCurr;   // mattrice attuale
byte  byNumPunCurr;   // punzone attuale

TOOL_CHANGE        ToolChange[4];



//--------------AUTOTUNING-------------------------------------------------

CHKSUM AT_DAT    at_dat;
       AT_SINC   at_sinc;
       AT_PPCONF at_ppconf;
       AT_PPMOVE at_ppmove;
       AT_TOOLS  at_tools;
       AT_POS    at_pos;
       AT_REG    at_reg[2];

byte byShowAllIO;        // Indica se visualizzare tutti gli I/O
dword           UPLCVERS;           // Versione programma plc Utente
dword           UPLCREL;            // Release programma plc Utente

//** 30/07/07 - 73.20.0 - Pagina parametri Utente
// Correzioni alle quote di taratura degli assi
CHKSUM double CorrTarAx[28];

TANDEM  Tandem;


//** [CAR] Giugno 2009 -  73.23.3 - Gestione sensori Strain Gauge

PAR_SENS_SG par_sens_sg;  // Struttura variabili per sensori Strain Gauge

dword ThMeas[10];
CHKSUM double LedToolStation[10];
byte SyncVar;

S_PILZUDP       PilzUDP;            // Gestione del Pilz via UDP

//--------------Program sync-------------------------------------------------
byte byProgLoad;
byte byProgLoad_OK;
string  strProgLoad[261];

byte byProgSave;
byte byProgSave_OK;
string  strProgSave[261];

byte byProgDel;
byte byProgDel_OK;
string  strProgDel[261];

byte byProgReN;
byte byProgReN_OK;
string  strProgReN[261];

PROGRAM Prog;
dword  bFunDieEditor;
dword  bFunDieSelected;

//--------------Save/Load Parameters sync-------------------------------------------------
byte byParametersSave;
byte byParametersSave_OK;
byte byParametersLoad;
byte byParametersLoad_OK;
string  strParSaveFrom[261];
string  strParSaveTo[261];
string  strParLoadFrom[261];
string  strParLoadTo[261];


SGTC SGTargCorr[2]; // Correzione target PMI con strain gauges

MCS_DAT                     MCS;                   // Gestione MCS Nuova Elettronica

//[TAN] 06/11/13: 73.26.11.13: Anticoll on inferior
CHKSUM double dXinfa;
CHKSUM double dXinfb;
CHKSUM double dXinfc;
CHKSUM double dRinfa;
CHKSUM double dRinfb;
CHKSUM double dRinfc;

//[TAN] 17/01/14: 73.26.11.16: F(B.C.D.,Force)=TorquePercentage
CHKSUM  double dBaseBDC[3];
CHKSUM  BDC_FORCE_TORQUE bdc_force_torque[16];

double dTestTorque;

CHKSUM PPG_BENDING_AID  PpgBendingAid[2];   // Accompagnatore PPG

CHKSUM PPG_GANTRY_SYSTEM    PpgGantrySystem[2];     // Gantry PPG

//[TAN] 24/04/15: 73.34.8: F(Force,B.C.D.)=Torque_0_255 changes of specifications
double dCurrentBDC[3];
double dBaseForce;
CHKSUM  double dBaseMaxRam;

//[TAN] 11/05/15: 73.34.8: F(Force,Width)=Crowning
CHKSUM  double dBaseWidth[20];
CHKSUM  WFC wfc[20];

double  dQtaAttYbomb; // quota attuale asse bombatura

MOSES moses;

CHKSUM OPERATOR_ACCESS DataOperatorAccess[5];

//[TAN] 29/05/17: 183.22.0: Aumentato il numero di punti per definire curva linearizzazione pressione e bombatura
CHKSUM byte nPressureCurveType;
CHKSUM word wNumPointPress;
CHKSUM PRESSURE_CURVE PressureCurve[30];
CHKSUM byte nBombCurveType;
CHKSUM word wNumPointBomb;
CHKSUM BOMB_CURVE BombCurve[30];
CHKSUM byte nfsType;
CHKSUM byte nfsbType;
CHKSUM double  pstfsMax;
CHKSUM double  pstfsbMax;

dword SLAPPG[256];          // Interfaccia SLAPPG
dword dwRegGUI[10];         // Registri dedicati alla GUI
dword dwInUsrGUI[128];      // Input da GUI utente
dword dwOutUsrGUI[128];     // Output a GUI utente

SPECIAL_PROGRAM SpecialProg;

S_XHC_CONFIG XhcApp;             // Pulsantiera XHC

RETAIN S_WORK_FOLDERS WorkFolders;
RETAIN string PrgNameToLoad[261];

CHKSUM S_GEN BackGauge[10];

ENDSECTION Application //*************** Sezione Applicativo ******************

#include <defcn.usr> // File defcn per dati utente
#include <defcn_PPTCPServer.usr>
#include <defcn_LedsBar.usr>
#include <defcn_WILASmartLocator.usr> // File defcn per dati utente WILA
#include <defcn_ClientModBusTCP.usr>
