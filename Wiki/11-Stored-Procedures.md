# 11 - Stored Procedures

## Cos'è

Una Stored Procedure è un programma SQL salvato direttamente nel database.

## A cosa serve?

Permette di centralizzare operazioni ripetitive e logica di accesso ai dati.

## Esempio

```sql
CREATE OR ALTER PROCEDURE sp_Studenti_GetById
    @StudenteId INT
AS
BEGIN
    SELECT *
    FROM Studenti
    WHERE StudenteId = @StudenteId;
END;
GO
```

## Esecuzione

```sql
EXEC sp_Studenti_GetById @StudenteId = 5;
```

Nel repository le procedure sono separate per livello e per operazione CRUD.
