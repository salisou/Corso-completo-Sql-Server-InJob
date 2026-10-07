# 13 - Funzioni SQL

## Funzioni di testo

```sql
SELECT
    UPPER(Nome) AS NomeMaiuscolo,
    LOWER(Email) AS EmailMinuscola
FROM Studenti;
```

## Funzioni data

```sql
SELECT
    GETDATE() AS DataOraCorrente,
    YEAR(GETDATE()) AS Anno,
    MONTH(GETDATE()) AS Mese;
```

## Gestione NULL

```sql
SELECT
    ISNULL(Email, 'Email non disponibile') AS Email
FROM Studenti;
```

## Conversioni

```sql
SELECT CONVERT(VARCHAR, DataLezione, 23)
FROM Lezioni;
```

Le funzioni sono fondamentali per trasformare e preparare i dati prima dell'analisi.
