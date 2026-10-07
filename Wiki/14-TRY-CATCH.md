# 14 - TRY CATCH e gestione degli errori

## Cos'è

TRY/CATCH permette di intercettare errori durante l'esecuzione di codice T-SQL.

## Esempio

```sql
BEGIN TRY
    SELECT 10 / 0;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS Messaggio;
END CATCH;
```

## Perché usarlo?

È importante nelle procedure professionali e nelle operazioni che modificano dati.

## THROW

```sql
THROW 50001, 'Errore personalizzato', 1;
```

Il repository contiene esempi progressivi con TRY/CATCH e transazioni.
