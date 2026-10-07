/*
============================================================
STORED PROCEDURES - LIVELLO BASE
04 - AULE
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Aule_GetAll
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Aule ORDER BY NomeAula;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Aule_GetById
    @AulaId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Aule WHERE AulaId = @AulaId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Aule_Insert
    @NomeAula NVARCHAR(150),
    @Capacita INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Aule (NomeAula, Capacita)
    VALUES (@NomeAula, @Capacita);

    SELECT SCOPE_IDENTITY() AS NuovaAulaId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Aule_Update
    @AulaId INT,
    @NomeAula NVARCHAR(150),
    @Capacita INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Aule
    SET NomeAula = @NomeAula,
        Capacita = @Capacita
    WHERE AulaId = @AulaId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Aule_Delete
    @AulaId INT
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM Aule WHERE AulaId = @AulaId;
END;
GO
