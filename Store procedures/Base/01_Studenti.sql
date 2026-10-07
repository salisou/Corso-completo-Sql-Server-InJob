/*
============================================================
STORED PROCEDURES - LIVELLO BASE
01 - STUDENTI
============================================================
COS'È?
Una Stored Procedure è un programma SQL salvato nel database.

A COSA SERVE?
Per eseguire più volte una stessa operazione senza riscrivere
la query.

In questo file impariamo il CRUD sulla tabella Studenti:
CREATE/INSERT, READ, UPDATE, DELETE.
============================================================
*/
USE ScuolaDb;
GO

-- 1. READ - Leggere tutti gli studenti
CREATE OR ALTER PROCEDURE dbo.sp_Studenti_GetAll
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Studenti
    ORDER BY Cognome, Nome;
END;
GO

-- Esempio
EXEC dbo.sp_Studenti_GetAll;
GO

-- 2. READ - Cercare uno studente per ID
CREATE OR ALTER PROCEDURE dbo.sp_Studenti_GetById
    @StudenteId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Studenti
    WHERE StudenteId = @StudenteId;
END;
GO

-- Esempio
EXEC dbo.sp_Studenti_GetById @StudenteId = 1;
GO

-- 3. CREATE - Inserire uno studente
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

-- Esempio
-- EXEC dbo.sp_Studenti_Insert
--     @Nome = 'Mario',
--     @Cognome = 'Rossi',
--     @DataNascita = '2005-04-15',
--     @Email = 'mario.rossi@email.it',
--     @Telefono = '3331234567',
--     @CodiceFiscale = 'RSSMRA05D15H501A';
-- GO

-- 4. UPDATE - Modificare uno studente
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

-- 5. DELETE - Eliminare uno studente
CREATE OR ALTER PROCEDURE dbo.sp_Studenti_Delete
    @StudenteId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Studenti
    WHERE StudenteId = @StudenteId;
END;
GO
