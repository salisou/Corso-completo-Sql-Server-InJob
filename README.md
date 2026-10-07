## Stored Procedures

Le Stored Procedures sono organizzate anche didatticamente nella cartella `Store procedures/`:

- **Base**: CRUD su Studenti, Corsi, Docenti e Aule.
- **Intermedio**: Iscrizioni, DocentiCorso e Lezioni.
- **Avanzato**: Voti, validazioni e gestione degli errori con `THROW`.
- Ogni argomento è in un file SQL separato.
- Sono presenti script `00_Esecuzione_*.sql` per eseguire rapidamente le procedure del livello.
- Il file `11_Stored_Procedures.sql` originale rimane come script completo di riferimento.

Percorso consigliato: **Base → Intermedio → Avanzato → TRY/CATCH → TRANSACTION → VIEW → API**.

# Corso completo SQL Server

## Impara SQL Server partendo dalle basi fino alle query relazionali

Benvenuto nel repository **Corso completo SQL Server InJob**.

Questo repository raccoglie materiale pratico, script SQL, esercizi e database di esempio pensati per imparare **SQL Server e il linguaggio SQL attraverso la pratica**.

Il percorso parte dalla creazione e comprensione di un database relazionale e arriva alla costruzione di query che utilizzano più tabelle, aggregazioni, JOIN e sottoquery.

L'obiettivo non è soltanto imparare la sintassi SQL, ma imparare a **leggere i dati, collegarli, modificarli e ottenere informazioni utili da un database reale**.

---

## Obiettivo del corso

Al termine del corso lo studente sarà in grado di:

- comprendere che cos'è un database relazionale;
- comprendere la struttura di un database SQL Server;
- creare e utilizzare un database;
- creare tabelle con SQL Server;
- scegliere e utilizzare i principali tipi di dati;
- comprendere PRIMARY KEY e FOREIGN KEY;
- utilizzare vincoli come NOT NULL, UNIQUE e DEFAULT;
- inserire dati nelle tabelle;
- leggere e filtrare i dati;
- utilizzare SELECT e WHERE;
- utilizzare gli operatori di confronto e logici;
- utilizzare LIKE, IN, BETWEEN, IS NULL e IS NOT NULL;
- eliminare i duplicati con DISTINCT;
- limitare i risultati con TOP;
- ordinare i dati con ORDER BY;
- utilizzare le principali funzioni aggregate;
- calcolare COUNT, SUM, AVG, MIN e MAX;
- raggruppare i dati con GROUP BY;
- filtrare i gruppi con HAVING;
- comprendere e utilizzare i JOIN;
- utilizzare INNER JOIN;
- utilizzare LEFT JOIN;
- utilizzare RIGHT JOIN;
- utilizzare FULL OUTER JOIN;
- collegare correttamente più tabelle;
- comprendere le relazioni tra le tabelle;
- utilizzare le sottoquery;
- utilizzare sottoquery con IN ed EXISTS;
- comprendere le sottoquery correlate;
- modificare la struttura di una tabella con ALTER TABLE;
- aggiungere, modificare ed eliminare colonne;
- aggiungere e rimuovere vincoli;
- rinominare tabelle e colonne;
- modificare dati esistenti con UPDATE;
- eliminare dati con DELETE;
- gestire i valori NULL;
- utilizzare funzioni come ISNULL, CONVERT, CAST, CONCAT, DATEPART e FORMAT;
- lavorare con date e orari;
- costruire query utili per l'analisi dei dati;
- risolvere esercizi SQL partendo da una richiesta in linguaggio naturale;
- leggere e comprendere script SQL già esistenti;
- applicare SQL a uno scenario realistico di gestione di dati aziendali.

---

## Percorso del corso

### 01 - Creazione del database

**01_creazione_Database.sql**

In questa fase si lavora sulla struttura del database.

Si imparano:

- database;
- tabelle;
- colonne;
- tipi di dati;
- PRIMARY KEY;
- FOREIGN KEY;
- IDENTITY;
- NOT NULL;
- UNIQUE;
- DEFAULT;
- relazioni tra tabelle;
- relazione uno-a-molti;
- relazione molti-a-molti.

Il database didattico principale è **ScuolaDb**, con tabelle come:

- Studenti
- Corsi
- Docenti
- Aule
- Iscrizioni
- DocentiCorso
- Lezioni
- Voti

Questo permette di lavorare su un modello relazionale ricco e adatto alle esercitazioni.

---

### 02 - Inserimento dei dati

**02_Insert.sql**

Si impara a utilizzare:

- INSERT INTO;
- VALUES;
- inserimento di un singolo record;
- inserimento di più record;
- popolamento delle tabelle;
- gestione dei valori NULL;
- utilizzo delle chiavi primarie e delle chiavi esterne.

Il database viene popolato con dati di esempio per permettere agli studenti di eseguire query realistiche.

---

### 03 - SELECT e WHERE

**03_Select_Where.sql**

Si impara a recuperare informazioni dal database utilizzando:

- SELECT;
- SELECT *;
- selezione di colonne specifiche;
- alias;
- WHERE;
- condizioni di ricerca;
- ordinamento dei risultati;
- TOP;
- DISTINCT.

---

### 04 - Operatori SQL

**04_Operatori.sql**

Si approfondiscono gli operatori necessari per costruire condizioni di ricerca.

Gli studenti imparano a utilizzare operatori:

- aritmetici;
- di confronto;
- logici;
- AND;
- OR;
- NOT;
- LIKE;
- IN;
- BETWEEN;
- IS NULL;
- IS NOT NULL.

---

### 05 - Funzioni aggregate

**05_Funzioni_Aggregate.sql**

Si passa dall'estrazione dei dati alla loro analisi.

Gli studenti imparano a utilizzare:

- COUNT();
- SUM();
- AVG();
- MIN();
- MAX();
- GROUP BY;
- HAVING.

Queste funzioni permettono di rispondere a domande come:

- quanti studenti ci sono?
- qual è la media dei voti?
- qual è il voto massimo?
- qual è il voto minimo?
- qual è la somma di determinati valori?
- quanti record appartengono a un determinato gruppo?

---

### 06 - JOIN

**06_Join.sql**

Questa è una delle parti fondamentali del percorso.

Gli studenti imparano a collegare informazioni provenienti da più tabelle.

Vengono affrontati:

- INNER JOIN;
- LEFT JOIN;
- RIGHT JOIN;
- FULL OUTER JOIN;
- alias delle tabelle;
- condizioni ON;
- JOIN tra più tabelle.

Il corso mostra come passare, ad esempio, da:

**Studenti → Iscrizioni → Corsi**

fino a costruire query più complete che collegano:

**Studenti → Iscrizioni → Corsi → DocentiCorso → Docenti → Lezioni → Aule**

In questo modo lo studente impara a costruire report partendo da dati distribuiti in diverse tabelle.

---

### 07 - Sottoquery

**07_SottoQuery.sql**

Si introducono le query annidate, cioè query utilizzate all'interno di altre query.

Gli studenti lavorano con:

- sottoquery nel WHERE;
- sottoquery nel SELECT;
- IN;
- EXISTS;
- sottoquery correlate;
- combinazione di sottoquery e JOIN.

Esempi pratici includono la ricerca degli studenti con il voto massimo, degli studenti che hanno ottenuto determinati risultati e dei dati che rispettano condizioni calcolate tramite altre query.

---

### 08 - ALTER TABLE e modifica della struttura

**08_AlterTable_Column.sql**

Si impara a modificare una tabella già esistente senza ricrearla.

Gli argomenti comprendono:

- ALTER TABLE;
- ADD;
- ALTER COLUMN;
- DROP COLUMN;
- aggiunta di FOREIGN KEY;
- rimozione di vincoli;
- aggiunta di UNIQUE;
- aggiunta di DEFAULT;
- sp_rename;
- modifica di colonne e strutture esistenti.

---

### 09 - UPDATE e DELETE

**09_UPDATE_DELETE.sql**

Si impara a modificare e rimuovere dati già presenti nel database.

Gli studenti imparano a utilizzare:

- UPDATE;
- SET;
- WHERE;
- DELETE;
- controllo dei record prima della modifica;
- attenzione alle condizioni WHERE.

Particolare attenzione viene data al rischio di modificare accidentalmente più record del previsto.

---

## 10 - Condizioni

**10_Condizioni.sql**

Nuova sezione dedicata alla logica condizionale in SQL Server.

Gli studenti imparano, con **10 esempi pratici**, a utilizzare:

- uguaglianza e confronto;
- AND;
- OR;
- NOT;
- IN;
- BETWEEN;
- LIKE;
- CASE;
- IF / ELSE;
- condizioni su valori NULL.

L'obiettivo è imparare a trasformare una richiesta in una condizione SQL corretta.

---

## 11 - Stored Procedures

**11_Stored_Procedures.sql**

Il corso introduce le **Stored Procedure**, cioè programmi SQL salvati nel database e richiamabili tramite `EXEC`.

Sono presenti procedure CRUD complete per tutte le tabelle principali di **ScuolaDb**:

- Studenti;
- Corsi;
- Docenti;
- Aule;
- Iscrizioni;
- DocentiCorso;
- Lezioni;
- Voti.

Per ogni tabella sono disponibili procedure per:

- lettura completa;
- ricerca per ID;
- INSERT;
- UPDATE;
- DELETE.

Sono inoltre presenti **10 esempi di esecuzione** e controlli sui valori, compresa la validazione del voto da 0 a 30.

Lo studente impara quindi a passare dalla semplice query alla logica riutilizzabile tipica delle applicazioni professionali.

---

## 12 - Viste

**12_Viste.sql**

La sezione introduce le **VIEW**, cioè query salvate che possono essere utilizzate come una tabella.

Sono state aggiunte **10 viste didattiche e professionali**, tra cui:

- studenti;
- corsi;
- studenti e corsi;
- docenti e corsi;
- lezioni e aule;
- dettaglio dei voti;
- media dei voti per studente;
- report didattico completo;
- corsi con numero di iscritti;
- studenti senza voto.

Il file contiene anche **10 esempi di utilizzo delle viste**.

---

## 13 - Gestione delle eccezioni

**13_TRY_CATCH.sql**

La sezione introduce la gestione degli errori con:

- BEGIN TRY;
- BEGIN CATCH;
- ERROR_NUMBER();
- ERROR_MESSAGE();
- ERROR_LINE();
- ERROR_PROCEDURE();
- THROW;
- BEGIN TRANSACTION;
- COMMIT;
- ROLLBACK;
- XACT_STATE();
- SET XACT_ABORT ON.

Sono presenti **10 esempi progressivi**, inclusi errori di conversione, violazioni di FOREIGN KEY e UNIQUE, transazioni, rollback ed errori personalizzati.

L'obiettivo è imparare a costruire script SQL più robusti e sicuri.

---

## 14 - 10 query professionali

**14_10_Query_Professionali.sql**

Un file finale di riepilogo con **10 query complete** che combinano gli argomenti studiati:

- SELECT;
- WHERE;
- JOIN;
- LEFT JOIN;
- GROUP BY;
- HAVING;
- CASE;
- funzioni aggregate;
- sottoquery;
- gestione dei NULL;
- date e orari;
- ordinamento.

L'ultima query costruisce un report completo:

**Studente → Iscrizione → Corso → Docente → Lezione → Aula**

Questo permette allo studente di esercitarsi su uno scenario molto vicino alle richieste reali di un Data Analyst o di uno sviluppatore.

---

## Gestione di NULL, date e orari

Nel corso vengono affrontati anche problemi molto comuni nello sviluppo e nell'analisi dei dati.

Gli studenti imparano a gestire:

- valori NULL;
- conversione delle date;
- conversione dei numeri;
- formattazione dei risultati;
- estrazione di ora, minuti e secondi;
- visualizzazione di valori alternativi quando un dato non è disponibile.

Tra le funzioni utilizzate:

**ISNULL(), CONVERT(), CAST(), CONCAT(), DATEPART(), FORMAT()**.

---

## Esercitazioni

Il file **Esercizi.sql** contiene esercizi basati sul database del corso.

Gli studenti sono chiamati a produrre query per ottenere informazioni come:

- media dei voti degli studenti;
- nome completo;
- codice fiscale;
- corso frequentato;
- docente;
- aula;
- gestione dei dati mancanti;
- studenti senza voti;
- utilizzo dei JOIN;
- utilizzo delle funzioni aggregate;
- utilizzo di FULL OUTER JOIN.

L'obiettivo è imparare a trasformare una richiesta in linguaggio naturale in una query SQL.

---

## Revisione finale: scenario HR Analytics

Il file **Revisione_CRUD.sql** introduce un secondo scenario applicativo:

**HR Analytics**

Il database comprende:

- Departments
- Employees
- Attendance
- Promotions

In questa parte si applicano le conoscenze acquisite su un contesto più vicino a quello aziendale.

Gli studenti possono lavorare su:

- dipendenti;
- dipartimenti;
- ruoli;
- stipendi;
- presenze;
- promozioni;
- JOIN;
- aggregazioni;
- aggiornamento dei dati;
- analisi dello stipendio medio e massimo.

Questo passaggio serve a collegare la teoria SQL a un possibile scenario professionale.

---

## Materiali aggiuntivi

La cartella **Materiali** contiene materiale di supporto.

La cartella **Materiali Excel** contiene inoltre esercitazioni relative a:

- formule;
- tabelle pivot;
- analisi dei dati.

Questi materiali possono essere utilizzati come supporto per comprendere il rapporto tra database, dati e analisi.

---

## Struttura del repository

Il repository è organizzato anche per **aree didattiche**, così lo studente può seguire il corso in modo progressivo.

~~~text
Corso-completo-Sql-Server-InJob/
│
├── 01_Fondamenti/
│   └── README.md
│
├── 02_Query/
│   └── README.md
│
├── 03_DDL_DML/
│   └── README.md
│
├── 04_Programmability/
│   └── README.md
│
├── 05_Esercizi/
│   └── README.md
│
├── 06_Materiali/
│   └── README.md
│
├── Store procedures/
│   └── procedure create nelle fasi precedenti
│
├── Materiali/
│   └── materiale di supporto
│
├── Materiali Excel/
│   ├── Esercitazione sulle tabelle pivot.xlsx
│   └── Tutorial sulle formule1.xlsx
│
├── 01_creazione_Database.sql
├── 02_Insert.sql
├── 03_Select_Where.sql
├── 04_Operatori.sql
├── 05_Funzioni_Aggregate.sql
├── 06_Join.sql
├── 07_SottoQuery.sql
├── 08_AlterTable_Column.sql
├── 09_UPDATE_DELETE.sql
├── 10_Base_Store_procedure.sql
├── 10_Condizioni.sql
├── 11_Stored_Procedures.sql
├── 12_Viste.sql
├── 13_TRY_CATCH.sql
├── 14_10_Query_Professionali.sql
├── Esercizi.sql
├── Revisione_CRUD.sql
└── README.md
~~~

### Percorso consigliato

**Fondamenti → Query → DDL/DML → JOIN e sottoquery → Condizioni → Stored Procedure → VIEW → TRY/CATCH → esercizi professionali → HR Analytics**

Le cartelle numerate sono state aggiunte come **indice didattico**. Gli script originali nella root e la precedente cartella `Store procedures/` vengono mantenuti per non perdere materiale e storico del corso.

---

## Prerequisiti

Il corso è adatto anche a chi sta iniziando a studiare SQL.

È consigliato avere:

- un PC Windows;
- conoscenze informatiche di base;
- SQL Server installato;
- SQL Server Management Studio (SSMS).

Non è necessario conoscere SQL in modo approfondito prima di iniziare.

---

## Metodo di studio consigliato

Per ottenere il massimo dal corso:

1. leggere la spiegazione;
2. eseguire personalmente gli script;
3. modificare gli esempi;
4. osservare il risultato delle query;
5. provare a risolvere gli esercizi senza guardare subito la soluzione;
6. confrontare la propria soluzione con quella proposta;
7. creare nuove query partendo dagli stessi dati.

La programmazione e l'analisi dei dati si imparano soprattutto **scrivendo ed eseguendo codice**, non soltanto leggendo la teoria.

---

## Risultato finale

Alla fine del percorso lo studente non dovrebbe limitarsi a conoscere singoli comandi SQL.

Dovrebbe essere in grado di affrontare una richiesta come:

> "Mostrami gli studenti iscritti ai corsi, il docente assegnato, l'aula, la data della lezione e la media dei loro voti."

e trasformarla autonomamente in una query SQL utilizzando:

- più tabelle;
- JOIN;
- condizioni;
- funzioni;
- aggregazioni;
- gestione dei valori NULL;
- alias;
- ordinamento e filtraggio.

Questo rappresenta il passaggio fondamentale da **conoscere SQL** a **saper utilizzare SQL per risolvere problemi reali**.

---

## A chi è rivolto

Il corso è indicato per:

- principianti;
- studenti di informatica;
- aspiranti sviluppatori;
- aspiranti Data Analyst;
- sviluppatori che vogliono consolidare SQL;
- persone che vogliono imparare SQL Server attraverso esempi pratici;
- chi vuole costruire una base per lavorare successivamente con C#, .NET, Python, ASP.NET Core, API e applicazioni basate su database.

---

## Autore

**Docente Moussa Salisou**

Materiale didattico per lo studio e la formazione professionale su SQL Server.

© 2025 – Tutti i diritti riservati – Docente Moussa Salisou


## Nuova struttura Data Analytics

Il corso è stato esteso con una struttura didattica **Base → Intermedio → Avanzato**. Ogni argomento specialistico è separato in file dedicati e contiene spiegazioni, esempi e utilizzo pratico.

### VIEW
La cartella `Views/` contiene una VIEW per file, divisa per livello.

### Esercizi e correzioni
Le cartelle `Esercizi/` e `Correzioni/` hanno la stessa struttura Base, Intermedio e Avanzato. Lo studente deve prima svolgere gli esercizi e successivamente consultare le correzioni.

Gli esercizi avanzati introducono progressivamente CTE, ranking, funzioni finestra, KPI, LAG/LEAD e query orientate al Data Analytics.
