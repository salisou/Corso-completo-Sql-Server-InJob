/*
============================================================
STORED PROCEDURES - LIVELLO INTERMEDIO
03 - LEZIONI
============================================================
Gestione delle lezioni collegate a corso e aula.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Lezioni ORDER BY DataLezione, OraInizio;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_GetById
    @LezioneId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Lezioni WHERE LezioneId = @LezioneId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_Insert
    @CorsoId INT,
    @AulaId INT,
    @Titolo NVARCHAR(100),
    @Descrizione VARCHAR(MAX) = NULL,
    @DataLezione DATE,
    @OraInizio TIME,
    @OraFine TIME,
    @Durata INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Lezioni
        (CorsoId, AulaId, Titolo, Descrizione, DataLezione, OraInizio, OraFine, Durata)
    VALUES
        (@CorsoId, @AulaId, @Titolo, @Descrizione, @DataLezione, @OraInizio, @OraFine, @Durata);

    SELECT SCOPE_IDENTITY() AS NuovaLezioneId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_Update
    @LezioneId INT,
    @CorsoId INT,
    @AulaId INT,
    @Titolo NVARCHAR(100),
    @Descrizione VARCHAR(MAX) = NULL,
    @DataLezione DATE,
    @OraInizio TIME,
    @OraFine TIME,
    @Durata INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Lezioni
    SET CorsoId = @CorsoId,
        AulaId = @AulaId,
        Titolo = @Titolo,
        Descrizione = @Descrizione,
        DataLezione = @DataLezione,
        OraInizio = @OraInizio,
        OraFine = @OraFine,
        Durata = @Durata
    WHERE LezioneId = @LezioneId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_Delete
    @LezioneId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Lezioni WHERE LezioneId = @LezioneId;
END;
GO
