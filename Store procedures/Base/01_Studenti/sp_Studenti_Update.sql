/*
============================================================
STORED PROCEDURE
Livello: Base
Procedura: sp_Studenti_Update
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

CREATE OR ALTER PROCEDURE dbo.sp_Studenti_Update
    @StudenteId INT,
    @Nome NVARCHAR(50),
    @Cognome NVARCHAR(50),
    @DataNascita DATE = NULL,
    @Email NVARCHAR(150),
    @Telefono VARCHAR(50),
    @CodiceFiscale CHAR(16)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Studenti
    SET Nome = @Nome,
        Cognome = @Cognome,
        DataNascita = @DataNascita,
        Email = @Email,
        Telefono = @Telefono,
        CodiceFiscale = @CodiceFiscale
    WHERE StudenteId = @StudenteId;

    SELECT *
    FROM Studenti
    WHERE StudenteId = @StudenteId;
END;
GO
