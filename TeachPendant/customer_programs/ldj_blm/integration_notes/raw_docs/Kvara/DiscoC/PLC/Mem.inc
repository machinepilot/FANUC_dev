* Memorie interne PLC

#defcom %M0.0     Appoggio

* Segnali cumulativi generali
#defcom %M0.1     Tutti gli assi sono tarati
#defcom %M0.2     Tutti i canali sono inizializzati
#defcom %M0.3     Tutti i canali sono avviati in AUT
#defcom %M0.4     Presente asse in allarme
#defcom %M0.5     Tutti gli assi sono fermi
#defcom %M0.6     Presente canale in blocco
#defcom %M0.7     Ciclo taratura pestone NVEL o sola lettura terminato
#defcom %M0.8     Imp. richiesta taratura assi CanOpen
#defcom %M0.9     Assi CanOpen presenti in configurazione (cumulativo)
#defcom %M0.10    Assi CanOpen presenti in configurazione (stabile)
#defcom %M0.11    Tutti gli assi del passo corrente sono tarati
#defcom %M0.12    Almeno un asse da tarare nel passo corrente

* STATGEN
#defcom %M1.0     Canale 0 configurato
#defcom %M1.1     Canale 1 configurato
#defcom %M1.2     Canale 2 configurato
#defcom %M1.3     Canale 3 configurato
#defcom %M1.4     Canale 4 configurato
#defcom %M1.5     Pestone NVEL
#defcom %M1.6     Pestone sola lettura
#defcom %M1.7     Pressa tradizionale standard
#defcom %M1.8     Pestone sola lettura o tradizionale
#defcom %M1.9     Impulso piega completata
#defcom %M1.10    Decompressione posticipata sul PCL
#defcom %M1.11    Condizioni salita pestone da PMI a PCL
#defcom %M1.12    Condizioni salita pestone da PCL a PMS
#defcom %M1.13    Mem. piega terminata (si azzera col cambio passo)
#defcom %M1.14    Mem. piega terminata (si azzera a fine piega)
#defcom %M1.15    Pestone NVEL, sola lettura o tradizionale
#defcom %M1.16    Pestone al PMI con modo risalita attivo
#defcom %M1.17    Mem. PMI raggiunto
#defcom %M1.18    Imp. su ingresso di cambio passo
#defcom %M1.19    Canale 5 configurato
#defcom %M1.20    Pestone tradizionale con pedali e finecorsa
#defcom %M1.21    Pestone NVEL o con finecorsa
#defcom %M1.22    Pestone NVEL bicilindrico
#defcom %M1.23    Fc cambio passo escluso con pestone con ped. e FC
#defcom %M1.24    Fc rinculo escluso con pestone con ped. e FC
#defcom %M1.25    Cond. uso volantino in automatico
#defcom %M1.26    Mem. risalita a STEP    
#defcom %M1.27    Imp. avvio parcheggio assi staffe motorizzate
#defcom %M1.28    Mem. segnale C16.6 per stop al PMI

#defcom %M2.0     CNC in automatico
#defcom %M2.1     CNC in semiautomatico
#defcom %M2.2     CNC in manuale
#defcom %M2.3     CNC in posiziona
#defcom %M2.4     CNC in taratura immediata
#defcom %M2.5     CNC in JOG anello aperto
#defcom %M2.6     CNC in diagnostica
#defcom %M2.7     CNC in autotuning
#defcom %M2.8     Macchina in automatico o semiautomatico
#defcom %M2.9     Ciclo automatico avviato
#defcom %M2.10    Ciclo di piega in corso
#defcom %M2.11    Discesa manuale in corso
#defcom %M2.12    Salita manuale in corso
#defcom %M2.13    Fine ciclo riscontri dopo rinculo
#defcom %M2.14    Selettore abil. volantino con encoder attivo
#defcom %M2.15    Selezione singolo cilindro da volantino con encoder
#defcom %M2.16    Selezione Y2 da volantino con encoder
#defcom %M2.17    Modo step al PMI attivo
#defcom %M2.18    CNC in pagina test pestone
#defcom %M2.19    CNC in pagina edit con salita pestone abilitata
#defcom %M2.20    Camma pestone al PMS assoluto (con soglia)
#defcom %M2.21    Camma pestone sotto PCV (senza soglia)
#defcom %M2.22    Camma pestone sotto PCL (senza soglia)
#defcom %M2.23    Camma pestone sotto PMI (con soglia)
#defcom %M2.24    Camma pestone al PMS calcolato (con soglia)
#defcom %M2.25    Camma pestone sotto PCL (con soglia)
#defcom %M2.26    Camma pestone al PMS assoluto NVEL (con inerzia)
#defcom %M2.27    Camma pestone al PMS calcolato (con inerzia)
#defcom %M2.28    Camma pestone sotto PMI (con inerzia)
#defcom %M2.29    Camma pestone sotto PCV (con soglia)

* SEGN_POSASSI
#defcom %M3.0     Discesa veloce in corso
#defcom %M3.1     Discesa lavoro in corso
#defcom %M3.2     Sosta a fine piega in corso
#defcom %M3.3     Decompressione in corso
#defcom %M3.4     Accompagnamento in corso
#defcom %M3.5     Galleggiamento in corso
#defcom %M3.6     Salita veloce in corso
#defcom %M3.7     Richiamo in corso
#defcom %M3.8     Diagnostica pestone in corso
#defcom %M3.9     Taratura pestone in corso
#defcom %M3.10    Decompressione terminata
#defcom %M3.11    Salita pestone per ciclo zeta manuali in corso

#defcom %M4.0     Macchina al PMS
#defcom %M4.1     Macchina al PCV
#defcom %M4.2     Macchina al PCL (dopo il rinculo)
#defcom %M4.3     Macchina al PMI
#defcom %M4.4     Macchina al PCL prima del rinculo
#defcom %M4.5     Mem. accompagnatori in posizione di parcheggio
#defcom %M4.6     Assi in posizione (per tutto il ciclo)
#defcom %M4.7     Assi in posizione (per avvio ciclo piega)
#defcom %M4.8     Assi in posizione (per discesa pestone)
#defcom %M4.9     Mem. mantenimento OUT PMI attiva a fine piega
#defcom %M4.10    Mem. piega finale effettuata

* IN_GEN_MONIT
#defcom %M5.0     Emergenza da inputs
#defcom %M5.1     Abilitazione accompagnatori (o solo A1)
#defcom %M5.2     Abilitazione accompagnatore A2
#defcom %M5.3     Selez. abil. ciclo Zeta manuali
#defcom %M5.4     Comando start
#defcom %M5.5     Comando stop
#defcom %M5.6     Comando +
#defcom %M5.7     Comando -
#defcom %M5.8     Consenso discesa
#defcom %M5.9     Consenso salita
#defcom %M5.10    Comando stop bistabile
#defcom %M5.11    Emergenza da pompa spenta
#defcom %M5.12    Abilitazione Accompagnatore A1 o A2 da Input

* GENMAC
#defcom %M6.0     Emergenza generale
#defcom %M6.1     Emergenza attiva o pulsante STOP
#defcom %M6.2     Impulso su pulsante start
#defcom %M6.3     STOP usato per azz. autoritenuta in JOG OPEN
#defcom %M6.4     Comando + con autoritenuta
#defcom %M6.5     Comando - con autoritenuta
#defcom %M6.6     Impulso su comando discesa
#defcom %M6.7     Impulso start ciclo automatico
#defcom %M6.8     Emergenza attiva o pulsante STOP (per pestone)
#defcom %M6.9     Necessaria taratura assi CanOpen
#defcom %M6.10    Ciclo taratura assi in corso
#defcom %M6.11    Taratura riscontri da eseguire
#defcom %M6.12    Blocco macchina prima della salita iniziale (pestone NVEL)
#defcom %M6.13    Salita pestone NVEL per ciclo zeta manuali in corso
#defcom %M6.14    Ciclo Zeta manuali abilitato
#defcom %M6.15    Ciclo Zeta manuali attivo su riscontri
#defcom %M6.16    Mem. esecuzione cambio passo
#defcom %M6.17    Cambio passo attivo
#defcom %M6.18    Mem. cambio passo ricevuto da canale 0 (pressa trad.)
#defcom %M6.20    Ritardo canali ready all'accensione
#defcom %M6.21    Fotocellule sicurezza attive
#defcom %M6.22    Arresto discesa pestone
#defcom %M6.23    Mem. reset lavorazione
#defcom %M6.24    Reset di tutti i canali
#defcom %M6.25    Imp. comando salita con pestone fermo in piega
#defcom %M6.26    Allarme spessore fuori tolleranza da sensore pressione
#defcom %M6.27    Prima piega del pezzo attiva (ad uso PLC cliente)
#defcom %M6.28    Impulso cambio asse selezionato
#defcom %M6.29    Asse pestone selezionato
#defcom %M6.30    Selezionato cambio passo con pedale
#defcom %M6.31    Pagina manuale accompagnatori utente attiva

* CYCPEST
#defcom %M7.0     Allarme per massimo sbilanciamento (da input o quote)
#defcom %M7.1     Richiamo da effettuare
#defcom %M7.2     Piega coniata terminata su pestone NVEL
#defcom %M7.3     Fase di discesa per ciclo piega in corso
#defcom %M7.4     Discesa abilitata
#defcom %M7.5     Stop at Mute
#defcom %M7.6     Comando salita attivo in manuale o automatico
#defcom %M7.7     Comando discesa attivo in manuale
#defcom %M7.8     Comando ciclo di piega
#defcom %M7.9     Mem. risalita forzata pestone
#defcom %M7.10    Arresto del pestone in piega
#defcom %M7.11    Arresto pestone e accompagnatori
#defcom %M7.12    Superato sbilanciamento normale pestone
#defcom %M7.13    Forzamento discesa lenta (istantaneo)
#defcom %M7.14    Mem. attesa decompressione dopo reset canale
#defcom %M7.15    Mem. utilizzo PMS calcolato
#defcom %M7.16    Richiamo pestone NVEL in corso
#defcom %M7.17    Fine salita manuale per pestone NVEL
#defcom %M7.18    Esclusione Richiamo (Troppi tentativi, Richiamo non possibile)
#defcom %M7.19    Stop forzato per controllo spazio arresto pestone
#defcom %M7.20    Risalita forzata dopo controllo spazio arresto pestone
#defcom %M7.21    Controllo spazio arresto pestone eseguito OK
#defcom %M7.22    Controllo spazio arresto pestone eseguito KO
#defcom %M7.23    Forzamento discesa lenta per controllo spazio arresto non OK
#defcom %M7.24    Beam (Ram) Stopped - No movement requested
#defcom %M7.25    Beam (Ram) Stopped - No movement requested for 100mS
#defcom %M7.26    Test pestone attivo
#defcom %M7.27    Sel. veloce per test pestone

* STATGEN (Ciclo pestone NVEL)
#defcom %M8.0     Ciclo piega pestone NVEL in corso
#defcom %M8.1     Ciclo pestone NVEL: PCV raggiunto
#defcom %M8.2     Ciclo pestone NVEL: PCL raggiunto in discesa
#defcom %M8.3     Ciclo pestone NVEL: fine piega
#defcom %M8.4     Ciclo pestone NVEL: fine decompressione
#defcom %M8.5     Ciclo pestone NVEL: PCL raggiunto in risalita
#defcom %M8.6     Impulso fine ciclo pestone NVEL

* GENMAC (Sequenza taratura assi)
#defcom %M8.10    Abil. taratura riscontri in sequenza
#defcom %M8.11    Passo 2 taratura riscontri in sequenza
#defcom %M8.12    Passo 3 taratura riscontri in sequenza
#defcom %M8.13    Passo 4 taratura riscontri in sequenza

* SEGNEND e GESTRISC
#defcom %M10.0    Assi in movimento
#defcom %M10.1    Assi in allarme
#defcom %M10.2    Allarme Lubrificazione macchina elettrica
#defcom %M10.3    Limit. velocità riscontri per area pericolo attiva
#defcom %M10.4    Trasmissione nome programma OK da tandem
#defcom %M10.5    Blocco movimenti per gantry non agganciato
#defcom %M10.6    Ref slave gantry asse X richiesto
#defcom %M10.7    Grant slave gantry asse X richiesto
#defcom %M10.8    Ref slave gantry asse R richiesto
#defcom %M10.9    Grant slave gantry asse R richiesto
#defcom %M10.10   Mem. limit. velocità riscontri per area pericolo
#defcom %M10.11   Imp. reset canali riscontri per limiti software in posiziona
#defcom %M10.12   Mem. limit. velocità riscontri da input

* GSTPEST e SEGNPEST
#defcom %M10.21   Mem. pestone tarato
#defcom %M10.22   Fine tempo PMS per macchina tradizionale
#defcom %M10.23   Fine tempo sosta in piega al PMI
#defcom %M10.24   Ciclo taratura pestone attivo
#defcom %M10.25   Condizioni reset ciclo pestone
#defcom %M10.26   App. ciclo taratura pestone NVEL o sola lettura terminato
#defcom %M10.27   Valvole e pressione da ciclo autotuning
#defcom %M10.28   Set PMS per Autotunig
#defcom %M10.29   Mem. discesa interrotta da esclusione fotocellula per tandem
#defcom %M10.30   Comando valv. prop. pestone per filtraggio olio

* IN_GEN_MONIT (funzioni di sicurezza)
#defcom %M11.0    Errore direzione proporzionali
#defcom %M11.1    Allarme relé 20KA1-2-3-4
#defcom %M11.2    Warning relé KA3
#defcom %M11.3    Warning trasduttori SQ1-SQ2
#defcom %M11.4    Allarme parcheggio assi A1-A2
#defcom %M11.5    Warning trasduttori SQ5-SQ6
#defcom %M11.6    Warning trasduttore SQ7
#defcom %M11.7    Errore posizione riposo proporzionali
#defcom %M11.8    Warning trasduttore SD
#defcom %M11.9    MCS Installato e connesso
#defcom %M11.10   Forza cambio passo al PMS da MCS
#defcom %M11.11   Mem. allarme trasduttore LVDT Y1
#defcom %M11.12   Mem. allarme trasduttore LVDT Y2

* TANDEM_ROBOT
#defcom %M12.0    Selezione macchina in tandem
#defcom %M12.1    Discesa manuale disabilitata in tandem
#defcom %M12.2    Stato CN remoto valido
#defcom %M12.3    Abil. avvio ciclo da CN remoto
#defcom %M12.4    CN remoto in allarme
#defcom %M12.5    Abil. esec. ciclo automatico da CN remoto
#defcom %M12.6    Discesa abilitata da robot
#defcom %M12.7    Puls. start da CN remoto
#defcom %M12.8    Puls. stop da CN remoto
#defcom %M12.9    Pedale discesa da CN remoto
#defcom %M12.10   Pedale salita da CN remoto
#defcom %M12.11   Io sono la macchina 1 del gruppo tandem
#defcom %M12.12   Io sono la macchina 2 del gruppo tandem
#defcom %M12.13   Io sono la macchina 3 del gruppo tandem
#defcom %M12.14   Io sono la macchina 4 del gruppo tandem
#defcom %M12.15   Macchina 1 selezionata in tandem
#defcom %M12.16   Macchina 2 selezionata in tandem
#defcom %M12.17   Macchina 3 selezionata in tandem
#defcom %M12.18   Macchina 4 selezionata in tandem
#defcom %M12.19   Consenso discesa + abil. da tandem

* BLOCC_UTENSILI
#defcom %M12.20   Selezione sblocco utensili
#defcom %M12.21   Blocco macchina per utensili sbloccati
#defcom %M12.22   Punzoni sbloccati
#defcom %M12.23   Matrici sbloccate
#defcom %M12.24   Abil. sblocco utensili in manuale
#defcom %M12.25   Bloccaggio utensili in corso

* GEST_SENSORI
#defcom %M13.1    Piega con sensore
#defcom %M13.7    Attivazione ciclo taratura sensore GPS
#defcom %M13.10   Ciclo piega NVEL con sensore DATAM
#defcom %M13.11   Fine ciclo piega NVEL con sensore DATAM
#defcom %M13.12   Selez. quota target NVEL da sensore DATAM
#defcom %M13.13   Sosta su piega NVEL con sensore DATAM
#defcom %M13.14   Piega completata NVEL con sensore DATAM
#defcom %M13.15   Ricalcolo effettuato NVEL con sensore DATAM
#defcom %M13.16   Imp. fine ricalcolo con sensore DATAM
#defcom %M13.17   Piega con sensore DATAM con galleggiamento
#defcom %M13.18   Galleggiamento effettuato NVEL con sensore DATAM
#defcom %M13.19   Galleggiamento in corso NVEL con sensore DATAM
#defcom %M13.20   Macchina remota pronta per la i-esima pressata
#defcom %M13.21   Macchina remota in tolleranza durante il ciclo con sensore DATAM
#defcom %M13.22   Macchina remota a fine ciclo con sensore DATAM
#defcom %M13.23   Macchina remota ha finito di fare la misura/ricalcoli con sensore DATAM sul punto iesimo
#defcom %M13.24   Piega con Sensore DataM Necessaria Sincronizzazione


* STATGEN
#defcom %M14.0    Asse Y1 configurato
#defcom %M14.1    Asse Y2 configurato
#defcom %M14.2    Asse X1 configurato
#defcom %M14.3    Asse X2 configurato
#defcom %M14.4    Asse R1 configurato
#defcom %M14.5    Asse R2 configurato
#defcom %M14.6    Asse Z1 configurato
#defcom %M14.7    Asse Z2 configurato
#defcom %M14.8    Asse A1 configurato
#defcom %M14.9    Asse A2 configurato
#defcom %M14.10   Asse A3 configurato
#defcom %M14.11   Asse A4 configurato
#defcom %M14.12   Asse A5 configurato
#defcom %M14.13   Asse A6 configurato
#defcom %M14.14   Asse A7 configurato
#defcom %M14.15   Asse A8 configurato
#defcom %M14.16   Asse S1 configurato
#defcom %M14.17   Asse S2 configurato
#defcom %M14.18   Asse S3 configurato
#defcom %M14.19   Asse S4 configurato
#defcom %M14.20   Asse S5 configurato
#defcom %M14.21   Asse S6 configurato
#defcom %M14.22   Asse X3 configurato
#defcom %M14.23   Asse X4 configurato
#defcom %M14.24   Asse R3 configurato
#defcom %M14.25   Asse R4 configurato
#defcom %M14.26   Asse Z3 configurato
#defcom %M14.27   Asse Z4 configurato

* PLC UTENTE
#defcom %M15.0    Blocco ciclo al PCV
#defcom %M15.1    Blocco ciclo al PCL dopo il rinculo
#defcom %M15.2    Blocco ciclo al PMI prima del tempo sosta
#defcom %M15.3    Blocco ciclo al PMI dopo il tempo sosta
#defcom %M15.4    Blocco cambio passo da PLC utente
#defcom %M15.5    Forz. stato SQ7 inattivo per monitoraggio
#defcom %M15.6    Blocco ciclo di taratura assi R-Z
#defcom %M15.7    Blocco start ciclo automatico
#defcom %M15.8    Blocco ciclo richiamo
#defcom %M15.9    Esclude accompagnatore A1 dalla Taratura
#defcom %M15.10   Esclude accompagnatore A2 dalla Taratura
#defcom %M15.11   Avvio ciclo utente pestone
#defcom %M15.12   Abilita Bombatura durante ricerca spessore
#defcom %M15.13   Blocco pulsante start
#defcom %M15.14   Cambio Passo da UI Esterna
#defcom %M15.15   Forzamento ciclo sgancio accompagnatori
#defcom %M15.16   EX Impulso fine ciclo IMG100 per autoreturn
#defcom %M15.17   Abilita Bombatura attiva durante Piega Ribattuta
#defcom %M15.18   Acquisizione Quota Pestone da PLC Utente
#defcom %M15.19   Disabilita Filtro Volantino da PLC Utente
#defcom %M15.20   Abilita Taratura Automatica Bombatura da PLC Utente
#defcom %M15.21   Disabilita Invio Modalità Robot a PLC di Sicurezza da PLC Utente
#defcom %M15.22   Disabilita %M16.12 Arresto pestone al PMI per tavola attiva da PLC Utente
#defcom %M15.23   Abilita PCV da PLC Utente
#defcom %M15.24   Disabilita Reset Canali su abilitazione / Disabilitazione Accompagnatori da PLC Utente
#defcom %M15.25   Parcheggio staffe motorizzate da PLC Utente
#defcom %M15.26   Ritardo decompressione manuale da PLC Utente
#defcom %M15.27   Disabilita gestione Bit assi Sensori in posizione da PLC utente
#defcom %M15.28   Emergenza da PLC Utente

* HAMMERLE
#defcom %M16.0    Configurazione pressa Hammerle
#defcom %M16.1    Azzera pressione per cuscino idraulico (se c'è la valvola)
#defcom %M16.2    Mantenimento pressione per cuscino idraulico (se non c'è la valvola)
#defcom %M16.3    Fine pressata da sensori cuscino idraulico

* ACTBOMB
#defcom %M16.10   Tavola attiva abilitata
#defcom %M16.11   Pompa singola per comando bombatura
#defcom %M16.12   Arresto pestone al PMI per tavola attiva
#defcom %M16.13   Richiesta taratura automatica asse S4
#defcom %M16.14   Arresto pestone al PMI per tavola attiva Remota non in posizione

* Lazersafe
#defcom %M16.20   Comando manuale su staffe motorizzate da PCSS attivo

* VALV_PRESS
#defcom %M17.0    Comando elettrovalvole discesa veloce
#defcom %M17.1    Comando elettrovalvole discesa lenta
#defcom %M17.2    Comando elettrovalvole salita veloce
#defcom %M17.3    Comando elettrovalvole salita lenta
#defcom %M17.4    Comando elettrovalvole diagnostica

#defcom %M17.7    Comando mantenuto elettrovalvole salita
#defcom %M17.8    Comando elettrovalvole di lenta

#defcom %M17.10   Comando pressione discesa veloce
#defcom %M17.11   Comando pressione discesa lenta (manuale)
#defcom %M17.12   Comando pressione discesa lavoro
#defcom %M17.13   Comando pressione salita lenta (servo)
#defcom %M17.14   Comando pressione salita veloce
#defcom %M17.15   Comando pressione/bombatura diagnostica
#defcom %M17.16   Comando pressione per servosbloccaggi utensili
#defcom %M17.17   Comando pressione decompressione
#defcom %M17.18   Comando pressione bloccaggio Utensili
#defcom %M17.19   Comando pressione Galleggiamento / Accompagnamento

#defcom %M17.20   Comando bombatura lavoro
#defcom %M17.21   Comando bombatura per gestione velocità Pressa Tradizionale
#defcom %M17.22   Comando bombatura per gestione velocità Pestone NVEL

#defcom %M17.30   Allarme tempo massimo valvole

* GENMAC
#defcom %M18.0    Asse Y1 selezionato
#defcom %M18.1    Asse Y2 selezionato
#defcom %M18.2    Asse X1 selezionato
#defcom %M18.3    Asse X2 selezionato
#defcom %M18.4    Asse R1 selezionato
#defcom %M18.5    Asse R2 selezionato
#defcom %M18.6    Asse Z1 selezionato
#defcom %M18.7    Asse Z2 selezionato
#defcom %M18.8    Asse A1 selezionato
#defcom %M18.9    Asse A2 selezionato
#defcom %M18.10   Asse A3 selezionato
#defcom %M18.11   Asse A4 selezionato
#defcom %M18.12   Asse A5 selezionato
#defcom %M18.13   Asse A6 selezionato
#defcom %M18.14   Asse A7 selezionato
#defcom %M18.15   Asse A8 selezionato
#defcom %M18.16   Asse S1 selezionato
#defcom %M18.17   Asse S2 selezionato
#defcom %M18.18   Asse S3 selezionato
#defcom %M18.19   Asse S4 selezionato
#defcom %M18.20   Asse S5 selezionato
#defcom %M18.21   Asse S6 selezionato
#defcom %M18.22   Asse X3 selezionato
#defcom %M18.23   Asse X4 selezionato
#defcom %M18.24   Asse R3 selezionato
#defcom %M18.25   Asse R4 selezionato
#defcom %M18.26   Asse Z3 selezionato
#defcom %M18.27   Asse Z4 selezionato

* SEGNEND
#defcom %M19      Registro funzioni ausiliarie

#defcom %M19.0    Funzione 1
#defcom %M19.1    Funzione 2 matrice schiaccia pneumatica
#defcom %M19.2    Funzione 3 rinculo Z
#defcom %M19.3    Funzione 4 ciclo sgancio accompagnatori
#defcom %M19.4    Funzione 5 Forzamento discesa lenta
#defcom %M19.5    Funzione 6
#defcom %M19.6    Funzione 7
#defcom %M19.7    Funzione 8
#defcom %M19.8    Funzione 9 change step at BDC
#defcom %M19.9    Funzione 10
#defcom %M19.10   Funzione 11
#defcom %M19.11   Funzione 12 Stop at mute
#defcom %M19.12   Funzione 13
#defcom %M19.13   Funzione 14
#defcom %M19.14   Funzione 15
#defcom %M19.15   Funzione 16
#defcom %M19.16   Funzione 17
#defcom %M19.17   Funzione 18
#defcom %M19.18   Funzione 19
#defcom %M19.19   Funzione 20 stop al PMI
#defcom %M19.20   Funzione 21 change step at TDC
#defcom %M19.21   Funzione 22 change step on pedal release
#defcom %M19.22   Funzione 23 rinculo senza sosta


* Variabili a registro
#defcom %M20      Quota PMS assoluto - 5mm
#defcom %M21      Quota PMS calcolato (piega precedente)
#defcom %M22      Quota PCL
#defcom %M23      Quota PMI
#defcom %M24      Limitazione percentuale velocità pestone
#defcom %M25      Contropressione per bombatura attiva
#defcom %M26      Inerzia discesa pestone
#defcom %M27      Inerzia salita pestone
#defcom %M28      Quota PMS assoluto - inerzia salita
#defcom %M29      Tolleranza pestone


* Gestione pulsantiera seriale
#defcom %M30.0    Sel. comando da volantino
#defcom %M30.1    Richiesta movimentazione da volantino su quota
#defcom %M30.2    Sel. modo automatico da puls. aux.
#defcom %M30.3    Sel. modo semiautomatico da puls. aux.
#defcom %M30.4    Sel. modo manuale da puls. aux.
#defcom %M30.5    Rich. cambio piega a UI da puls. aux.
#defcom %M30.6    Rich. taraim asse da puls. aux.
#defcom %M30.7    Richiesta movimentazione da volantino
#defcom %M30.8    Predispone comando pestone da volantino in manuale
#defcom %M30.9    Comando pressione salita da volantino
#defcom %M30.10   Mem. comando da volantino su frontale
#defcom %M30.11   Sel. comando da volantino puls. seriale
#defcom %M30.14   Sel. comando da volantino su encoder
#defcom %M30.15   Presenza volantino su encoder
#defcom %M30.16   Pred. comando pestone da volantino in modo risalita
#defcom %M30.17   Presenza pulsantiera XHC
#defcom %M30.18   Sel. comando da volantino con pulsantiera XHC

#defcom %M31      Override da volantino in JOG
#defcom %M32      Quota attuale asse selezionato
#defcom %M33      Quota target asse per volantino
#defcom %M34      Numero di decimali asse selezionato
#defcom %M35      Quota PMI Y2 (per NVEL bicilindrica)
#defcom %M36      Quota asse volantino
#defcom %M37      PMI calcolato da DATAM
#defcom %M38      Registro funzioni matrice
#defcom %M39      Spazio arresto pestone campionato
#defcom %M40      Quota Y1 inizio campionamento spazio arresto
#defcom %M41      Quota Y2 inizio campionamento spazio arresto
#defcom %M42      PLC-UI TMS correzione K
#defcom %M43      PLC-UI TMS con correzione K
#defcom %M44      PLC-UI Potenziometro lettore spessore (punti ADC)

#defcom %M45.0    PLC-FAST Abil. verifica errore inseguimento per antiwindup
#defcom %M45.1    PLC-FAST Direzione negativa per antiwindup
#defcom %M46      PLC-FAST Errore inseguimento limite (impulsi) per antiwindup

#defcom %M50.0    Richiesta Cambio passo da UI esterna

#defcom %M51.0    Abil. parcheggio riscontri da PLC utente
#defcom %M51.1    Blocco assi riscontri in parcheggio da PLC utente
#defcom %M51.2    Abil. parcheggio X1 da PLC utente
#defcom %M51.3    Abil. parcheggio X2 da PLC utente
#defcom %M51.4    Abil. parcheggio R1 da PLC utente
#defcom %M51.5    Abil. parcheggio R2 da PLC utente
#defcom %M51.6    Abil. parcheggio Z1 da PLC utente
#defcom %M51.7    Abil. parcheggio Z2 da PLC utente
#defcom %M51.8    Abil. parcheggio X3 da PLC utente
#defcom %M51.9    Abil. parcheggio Z3 da PLC utente
#defcom %M51.10   Disab. acquisizione spessore MCS da PLC utente
#defcom %M51.11   Abil. salita pestone in pagina impostazioni da PLC utente
#defcom %M51.12   Abil. override pestone da PLC utente
#defcom %M51.13   Abil. override riscontri da PLC utente
#defcom %M51.14   Acquisizione Quota PCL da PLC Utente
#defcom %M51.15   Abil. handwheel at mute da PLC utente

#defcom %M52      Override pestone da PLC utente (0-100)
#defcom %M53      Override riscontri da PLC utente (0-100)
#defcom %M54      Tensione Dac Limite Velocita di piega da plc utente (mV)
#defcom %M55      Lunghezza configurabile passo volantino da plc utente (um)
#defcom %M56      Libero
#defcom %M57      Primo registro che visualizzato nelle pagine numeriche di MAN/SAUTO/AUTO
#defcom %M58      Secondo registro che visualizzato nelle pagine numeriche di MAN/SAUTO/AUTO
#defcom %M59      Tensione Dac Limite velocita di sicurezza da plc utente (mV)

* Variabili specifiche per canale
#defcom %rgc0.0   Presente asse in allarme nel canale
#defcom %rgc0.1   Assi del canale fermi
#defcom %cn0.rgc0.1  Assi fermi su canale 0
#defcom %rgc0.2   Asse selezionato nel canale
#defcom %rgc0.3   Blocco avanzamento dal canale agli assi
#defcom %rgc0.4   Selezionato asse con potenziometro
#defcom %rgc0.5   Assi canale in ISO nullo
#defcom %rgc0.6   Emergenza dal canale agli assi


