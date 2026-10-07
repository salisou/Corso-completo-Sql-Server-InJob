/*
============================================================
STORED PROCEDURE
Livello: Base
Procedura: sp_Corsi_Insert
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

CREATE OR ALTER PROCEDURE dbo.sp_Corsi_Insert
    @NomeCorso NVARCHAR(100),
    @Descrizione NVARCHAR(255) = NULL,
    @Crediti INT = NULL,
    @Durata INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Corsi (NomeCorso, Descrizione, Crediti, Durata)
    VALUES (@NomeCorso, @Descrizione, @Crediti, @Durata);

    SELECT SCOPE_IDENTITY() AS NuovoCorsoId;
END;
GO
