# 20 - Excel e Power BI

## SQL come fase di preparazione
SQL Server può preparare dati prima della visualizzazione.

```sql
SELECT s.Nome, s.Cognome, c.NomeCorso, v.Voto
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId;
```

Il risultato può diventare un dataset per Excel o Power BI.

## Buona pratica
Le colonne devono avere nomi chiari e la query deve produrre dati coerenti con l'obiettivo del report.
