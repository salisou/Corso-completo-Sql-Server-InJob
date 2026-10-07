/*
============================================================
STORED PROCEDURES - LIVELLO AVANZATO
01 - VOTI
============================================================
Qui introduciamo una Stored Procedure con validazione tramite
IF e THROW prima di modificare i dati.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Voti ORDER BY DataVoto DESC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_GetById
    @VotoId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Voti WHERE VotoId = @VotoId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_Insert
    @StudenteId INT,
    @CorsoId INT,
    @Voto DECIMAL(4,2),
    @DataVoto DATE,
    @Note NVARCHAR(255) = NULL,
    @Superato BIT = 1
AS
BEGIN
    SET NOCOUNT ON;

    IF @Voto < 0 OR @Voto > 30
    BEGIN
        THROW 50001, 'Il voto deve essere compreso tra 0 e 30.', 1;
    END;

    INSERT INTO Voti
        (StudenteId, CorsoId, Voto, DataVoto, Note, Superato)
    VALUES
        (@StudenteId, @CorsoId, @Voto, @DataVoto, @Note, @Superato);

    SELECT SCOPE_IDENTITY() AS NuovoVotoId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_Update
    @VotoId INT,
    @StudenteId INT,
    @CorsoId INT,
    @Voto DECIMAL(4,2),
    @DataVoto DATE,
    @Note NVARCHAR(255) = NULL,
    @Superato BIT
AS
BEGIN
    SET NOCOUNT ON;

    IF @Voto < 0 OR @Voto > 30
    BEGIN
        THROW 50002, 'Il voto deve essere compreso tra 0 e 30.', 1;
    END;

    UPDATE Voti
    SET StudenteId = @StudenteId,
        CorsoId = @CorsoId,
        Voto = @Voto,
        DataVoto = @DataVoto,
        Note = @Note,
        Superato = @Superato
    WHERE VotoId = @VotoId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_Delete
    @VotoId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Voti WHERE VotoId = @VotoId;
END;
GO
