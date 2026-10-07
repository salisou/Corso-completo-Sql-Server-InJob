# 18 - KPI e Data Analysis

## Cos'è un KPI?

KPI significa **Key Performance Indicator**: un indicatore utilizzato per misurare una prestazione.

## Esempi

Nel database didattico:
- media dei voti;
- numero di studenti;
- numero di iscrizioni;
- percentuale di studenti con voto;
- miglior studente per corso.

Nel contesto HR:
- tasso di presenza;
- numero di assenze;
- dipendenti per dipartimento;
- promozioni;
- andamento temporale.

## Esempio percentuale

```sql
SELECT
    100.0 * SUM(CASE WHEN Voto >= 18 THEN 1 ELSE 0 END)
    / NULLIF(COUNT(*), 0) AS PercentualePromossi
FROM Voti;
```

Un buon KPI deve essere chiaro, misurabile e interpretabile.
