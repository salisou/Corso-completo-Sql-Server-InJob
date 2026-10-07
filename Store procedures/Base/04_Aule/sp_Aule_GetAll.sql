/*
============================================================
STORED PROCEDURE
Livello: Base
Procedura: sp_Aule_GetAll
============================================================
COS'È?
Una Stored Procedure è un programma SQL salvato nel database.

A COSA SERVE?
Permette di riutilizzare una specifica operazione SQL.

PERCHÉ USARLA?
Per rendere il codice organizzato, riutilizzabile e più facile
da manutenere.

Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Aule_GetAll
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Aule
    ORDER BY NomeAula;
END;
GO
