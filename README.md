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

~~~text
Corso-completo-Sql-Server-InJob/
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
├── Esercizi.sql
├── Revisione_CRUD.sql
│
├── Materiali/
│   └── materiale di supporto
│
└── Materiali Excel/
    ├── Esercitazione sulle tabelle pivot.xlsx
    └── Tutorial sulle formule1.xlsx
~~~

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
