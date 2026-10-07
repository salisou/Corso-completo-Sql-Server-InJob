# Stored Procedures

Questa cartella contiene il percorso didattico completo sulle **Stored Procedures di SQL Server**.

## Struttura

### Base

Per chi parte da zero.

- `Base/01_Studenti.sql`
- `Base/02_Corsi.sql`
- `Base/03_Docenti.sql`
- `Base/04_Aule.sql`
- `Base/00_Esecuzione_Base.sql`

Concetti:
- cos'è una Stored Procedure
- `CREATE OR ALTER PROCEDURE`
- parametri
- `SELECT`
- `INSERT`
- `UPDATE`
- `DELETE`
- `EXEC`
- CRUD completo

### Intermedio

Per lavorare con tabelle collegate tramite chiavi esterne.

- `Intermedio/01_Iscrizioni.sql`
- `Intermedio/02_DocentiCorso.sql`
- `Intermedio/03_Lezioni.sql`
- `Intermedio/00_Esecuzione_Intermedio.sql`

Concetti:
- parametri multipli
- chiavi esterne
- relazioni tra tabelle
- valori predefiniti
- `IF`
- `GETDATE()`
- gestione di dati collegati

### Avanzato

Per introdurre controlli e validazioni.

- `Avanzato/01_Voti.sql`
- `Avanzato/00_Esecuzione_Avanzato.sql`

Concetti:
- validazione dei parametri
- `IF ... BEGIN ... END`
- `THROW`
- gestione degli errori
- regole applicative dentro una Stored Procedure

## Script completo

Il file originale:

- `11_Stored_Procedures.sql`

rimane nel repository come **script completo di riferimento**. I nuovi file in questa cartella sono la versione didattica suddivisa per livello e argomento.

## Percorso consigliato

`Base → Intermedio → Avanzato`

Dopo questo percorso si può passare a:

`TRY/CATCH → TRANSACTION → VIEW → Stored Procedures professionali → API C# / Python`

**Docente Moussa Salisou**
