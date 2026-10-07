# Stored Procedures

Ogni file SQL contiene **UNA SOLA Stored Procedure**, come in una struttura professionale e didattica.

## Base

### Studenti
- `Base/01_Studenti/sp_Studenti_GetAll.sql`
- `Base/01_Studenti/sp_Studenti_GetById.sql`
- `Base/01_Studenti/sp_Studenti_Insert.sql`
- `Base/01_Studenti/sp_Studenti_Update.sql`
- `Base/01_Studenti/sp_Studenti_Delete.sql`

### Corsi
- `Base/02_Corsi/sp_Corsi_GetAll.sql`
- `Base/02_Corsi/sp_Corsi_GetById.sql`
- `Base/02_Corsi/sp_Corsi_Insert.sql`
- `Base/02_Corsi/sp_Corsi_Update.sql`
- `Base/02_Corsi/sp_Corsi_Delete.sql`

### Docenti
- `Base/03_Docenti/sp_Docenti_GetAll.sql`
- `Base/03_Docenti/sp_Docenti_GetById.sql`
- `Base/03_Docenti/sp_Docenti_Insert.sql`
- `Base/03_Docenti/sp_Docenti_Update.sql`
- `Base/03_Docenti/sp_Docenti_Delete.sql`

### Aule
- `Base/04_Aule/sp_Aule_GetAll.sql`
- `Base/04_Aule/sp_Aule_GetById.sql`
- `Base/04_Aule/sp_Aule_Insert.sql`
- `Base/04_Aule/sp_Aule_Update.sql`
- `Base/04_Aule/sp_Aule_Delete.sql`

## Intermedio

### Iscrizioni
- `Intermedio/01_Iscrizioni/sp_Iscrizioni_GetAll.sql`
- `Intermedio/01_Iscrizioni/sp_Iscrizioni_GetById.sql`
- `Intermedio/01_Iscrizioni/sp_Iscrizioni_Insert.sql`
- `Intermedio/01_Iscrizioni/sp_Iscrizioni_Update.sql`
- `Intermedio/01_Iscrizioni/sp_Iscrizioni_Delete.sql`

### DocentiCorso
- `Intermedio/02_DocentiCorso/sp_DocentiCorso_GetAll.sql`
- `Intermedio/02_DocentiCorso/sp_DocentiCorso_GetById.sql`
- `Intermedio/02_DocentiCorso/sp_DocentiCorso_Insert.sql`
- `Intermedio/02_DocentiCorso/sp_DocentiCorso_Update.sql`
- `Intermedio/02_DocentiCorso/sp_DocentiCorso_Delete.sql`

### Lezioni
- `Intermedio/03_Lezioni/sp_Lezioni_GetAll.sql`
- `Intermedio/03_Lezioni/sp_Lezioni_GetById.sql`
- `Intermedio/03_Lezioni/sp_Lezioni_Insert.sql`
- `Intermedio/03_Lezioni/sp_Lezioni_Update.sql`
- `Intermedio/03_Lezioni/sp_Lezioni_Delete.sql`

## Avanzato

### Voti
- `Avanzato/01_Voti/sp_Voti_GetAll.sql`
- `Avanzato/01_Voti/sp_Voti_GetById.sql`
- `Avanzato/01_Voti/sp_Voti_Insert.sql`
- `Avanzato/01_Voti/sp_Voti_Update.sql`
- `Avanzato/01_Voti/sp_Voti_Delete.sql`

Le procedure avanzate introducono anche validazione dei dati e `THROW`.

## Materiale precedente

I file già presenti nella cartella `Store procedures/` **non sono stati cancellati**. Rimangono disponibili come materiale storico/didattico.

Anche `11_Stored_Procedures.sql` rimane nel repository come script completo di riferimento.

**Percorso didattico:** Base → Intermedio → Avanzato.
