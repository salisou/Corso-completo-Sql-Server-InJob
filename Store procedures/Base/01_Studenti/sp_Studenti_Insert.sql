/*
============================================================
STORED PROCEDURE
Livello: Base
Procedura: sp_Studenti_Insert
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

CREATE OR ALTER PROCEDURE dbo.sp_Studenti_Insert
    @Nome NVARCHAR(50),
    @Cognome NVARCHAR(50),
    @DataNascita DATE = NULL,
    @Email NVARCHAR(150),
    @Telefono VARCHAR(50),
    @CodiceFiscale CHAR(16)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Studenti
        (Nome, Cognome, DataNascita, Email, Telefono, CodiceFiscale)
    VALUES
        (@Nome, @Cognome, @DataNascita, @Email, @Telefono, @CodiceFiscale);

    SELECT SCOPE_IDENTITY() AS NuovoStudenteId;
END;
GO
