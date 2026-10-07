/*
============================================================
STORED PROCEDURES - LIVELLO BASE
03 - DOCENTI
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Docenti_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Docenti ORDER BY Cognome, Nome;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Docenti_GetById
    @DocenteId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Docenti WHERE DocenteId = @DocenteId;
END;
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

CREATE OR ALTER PROCEDURE dbo.sp_Docenti_Update
    @DocenteId INT,
    @Nome NVARCHAR(50),
    @Cognome NVARCHAR(50),
    @Email NVARCHAR(150) = NULL,
    @Specializzazione NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Docenti
    SET Nome = @Nome,
        Cognome = @Cognome,
        Email = @Email,
        Specializzazione = @Specializzazione
    WHERE DocenteId = @DocenteId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Docenti_Delete
    @DocenteId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Docenti WHERE DocenteId = @DocenteId;
END;
GO
