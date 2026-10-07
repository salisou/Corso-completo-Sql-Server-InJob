/*
============================================================
STORED PROCEDURES - LIVELLO INTERMEDIO
02 - DOCENTI CORSO
============================================================
Gestione della relazione tra docenti e corsi.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM DocentiCorso ORDER BY CorsoId, DocenteId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_GetById
    @DocenteCorso INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM DocentiCorso WHERE DocenteCorso = @DocenteCorso;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_Insert
    @DocenteId INT,
    @CorsoId INT,
    @DataRegistrazione DATE = NULL,
    @DataAssegnazione DATE = NULL,
    @Ruolo NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO DocentiCorso
        (DocenteId, CorsoId, DataRegistrazione, DataAssegnazione, Ruolo)
    VALUES
        (@DocenteId, @CorsoId, @DataRegistrazione, @DataAssegnazione, @Ruolo);

    SELECT SCOPE_IDENTITY() AS NuovoDocenteCorsoId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_Update
    @DocenteCorso INT,
    @DocenteId INT,
    @CorsoId INT,
    @DataRegistrazione DATE = NULL,
    @DataAssegnazione DATE = NULL,
    @Ruolo NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE DocentiCorso
    SET DocenteId = @DocenteId,
        CorsoId = @CorsoId,
        DataRegistrazione = @DataRegistrazione,
        DataAssegnazione = @DataAssegnazione,
        Ruolo = @Ruolo
    WHERE DocenteCorso = @DocenteCorso;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_Delete
    @DocenteCorso INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM DocentiCorso WHERE DocenteCorso = @DocenteCorso;
END;
GO
