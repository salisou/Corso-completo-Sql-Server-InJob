# 07 - JOIN

## Cos'è

JOIN permette di combinare dati provenienti da più tabelle.

## INNER JOIN

Restituisce i record che hanno corrispondenza in entrambe le tabelle.

```sql
SELECT
    s.Nome,
    s.Cognome,
    c.NomeCorso
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId;
```

## LEFT JOIN

Mantiene tutte le righe della tabella a sinistra anche quando non esiste una corrispondenza.

È particolarmente utile per trovare dati mancanti.

## JOIN professionale

Il corso utilizza catene come:

**Studente → Iscrizione → Corso → Docente → Lezione → Aula → Voto**
