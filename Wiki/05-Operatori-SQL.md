# 05 - Operatori SQL

## Operatori di confronto

```sql
=   <>   >   <   >=   <=
```

## Operatori logici

```sql
AND
OR
NOT
```

## Esempio

```sql
SELECT *
FROM Voti
WHERE Voto >= 18
  AND Voto <= 30;
```

## LIKE

```sql
SELECT *
FROM Studenti
WHERE Cognome LIKE 'Ros%';
```

Gli operatori permettono di costruire filtri precisi per le analisi.
