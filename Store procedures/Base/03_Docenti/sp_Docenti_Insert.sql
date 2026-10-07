/*
============================================================
STORED PROCEDURE
Livello: Base
Procedura: sp_Docenti_Insert
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

CREATE OR ALTER PROCEDURE dbo.sp_Docenti_Insert
    @Nome NVARCHAR(50),
    @Cognome NVARCHAR(50),
    @Email NVARCHAR(150) = NULL,
    @Specializzazione NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Docenti (Nome, Cognome, Email, Specializzazione)
    VALUES (@Nome, @Cognome, @Email, @Specializzazione);

    SELECT SCOPE_IDENTITY() AS NuovoDocenteId;
END;
GO
