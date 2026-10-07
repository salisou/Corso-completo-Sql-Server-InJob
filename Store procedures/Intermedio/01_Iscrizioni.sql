/*
============================================================
STORED PROCEDURES - LIVELLO INTERMEDIO
01 - ISCRIZIONI
============================================================
Qui iniziamo a lavorare con una tabella che collega studenti
e corsi tramite chiavi esterne.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Iscrizioni ORDER BY DataIscrizione DESC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_GetById
    @IscrizioneId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Iscrizioni WHERE IscrizioneId = @IscrizioneId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_Insert
    @StudenteId INT,
    @CorsoId INT,
    @DataIscrizione DATE = NULL,
    @Stato NVARCHAR(30) = 'Attiva'
AS
BEGIN
    SET NOCOUNT ON;

    IF @DataIscrizione IS NULL
        SET @DataIscrizione = CAST(GETDATE() AS DATE);

    INSERT INTO Iscrizioni (StudenteId, CorsoId, DataIscrizione, Stato)
    VALUES (@StudenteId, @CorsoId, @DataIscrizione, @Stato);

    SELECT SCOPE_IDENTITY() AS NuovaIscrizioneId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_Update
    @IscrizioneId INT,
    @StudenteId INT,
    @CorsoId INT,
    @DataIscrizione DATE,
    @Stato NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Iscrizioni
    SET StudenteId = @StudenteId,
        CorsoId = @CorsoId,
        DataIscrizione = @DataIscrizione,
        Stato = @Stato
    WHERE IscrizioneId = @IscrizioneId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_Delete
    @IscrizioneId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Iscrizioni WHERE IscrizioneId = @IscrizioneId;
END;
GO
