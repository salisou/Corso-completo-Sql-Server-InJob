# 04 - SELECT e WHERE

## SELECT

Serve per leggere dati.

```sql
SELECT Nome, Cognome
FROM Studenti;
```

## WHERE

Serve per filtrare i risultati.

```sql
SELECT *
FROM Studenti
WHERE Cognome = 'Rossi';
```

## ORDER BY

```sql
SELECT *
FROM Studenti
ORDER BY Cognome ASC;
```

## TOP

```sql
SELECT TOP 10 *
FROM Studenti
ORDER BY Cognome;
```

## Concetti da padroneggiare

SELECT, FROM, WHERE, ORDER BY, TOP, DISTINCT, LIKE, BETWEEN, IN, IS NULL e IS NOT NULL.
