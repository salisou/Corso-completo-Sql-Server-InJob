# 06 - Funzioni Aggregate

Le funzioni aggregate trasformano più righe in un risultato sintetico.

## Funzioni principali

- COUNT
- SUM
- AVG
- MIN
- MAX

## Esempio

```sql
SELECT
    COUNT(*) AS NumeroStudenti
FROM Studenti;
```

## GROUP BY

```sql
SELECT
    CorsoId,
    COUNT(*) AS NumeroIscritti
FROM Iscrizioni
GROUP BY CorsoId;
```

## HAVING

HAVING filtra i gruppi dopo GROUP BY.

```sql
SELECT CorsoId, COUNT(*) AS Totale
FROM Iscrizioni
GROUP BY CorsoId
HAVING COUNT(*) > 5;
```
