/*
============================================================
STORED PROCEDURES - LIVELLO BASE
02 - CORSI
============================================================
Obiettivo: applicare il CRUD alla tabella Corsi.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Corsi_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Corsi ORDER BY NomeCorso;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Corsi_GetById
    @CorsoId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Corsi WHERE CorsoId = @CorsoId;
END;
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

CREATE OR ALTER PROCEDURE dbo.sp_Corsi_Update
    @CorsoId INT,
    @NomeCorso NVARCHAR(100),
    @Descrizione NVARCHAR(255) = NULL,
    @Crediti INT = NULL,
    @Durata INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Corsi
    SET NomeCorso = @NomeCorso,
        Descrizione = @Descrizione,
        Crediti = @Crediti,
        Durata = @Durata
    WHERE CorsoId = @CorsoId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Corsi_Delete
    @CorsoId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Corsi WHERE CorsoId = @CorsoId;
END;
GO
