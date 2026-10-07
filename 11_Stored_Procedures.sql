/*
============================================================
11 - STORED PROCEDURES COMPLETE
============================================================
COS'È UNA STORED PROCEDURE?
È un programma SQL salvato direttamente nel database.

A COSA SERVE?
Permette di riutilizzare operazioni SQL tramite EXEC.

PERCHÉ USARLA?
- evita di riscrivere sempre la stessa query
- accetta parametri
- centralizza la logica
- può controllare errori
- può essere utilizzata da applicazioni C#, Python, PHP, Java ecc.

Le procedure sono organizzate per tutte le tabelle di ScuolaDb.
Ogni gruppo contiene CREATE, READ, UPDATE e DELETE.

ATTENZIONE:
Le procedure DELETE rispettano le relazioni FK. Se un record è
utilizzato da altre tabelle, SQL Server può impedire la cancellazione.
*/

USE ScuolaDb;
GO

/* ============================================================
1. STUDENTI
============================================================ */

CREATE OR ALTER PROCEDURE dbo.sp_Studenti_GetAll
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Studenti
    ORDER BY Cognome, Nome;
END;
GO

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

CREATE OR ALTER PROCEDURE dbo.sp_Studenti_Delete
    @StudenteId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM Studenti
    WHERE StudenteId = @StudenteId;
END;
GO

/* ============================================================
2. CORSI
============================================================ */

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

/* ============================================================
3. DOCENTI
============================================================ */

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

/* ============================================================
4. AULE
============================================================ */

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

/* ============================================================
5. ISCRIZIONI
============================================================ */

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

/* ============================================================
6. DOCENTICORSO
============================================================ */

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

/* ============================================================
7. LEZIONI
============================================================ */

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

/* ============================================================
8. VOTI
============================================================ */

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

/* ============================================================
10 ESEMPI DI UTILIZZO
============================================================ */

-- 1. Tutti gli studenti
EXEC dbo.sp_Studenti_GetAll;
GO

-- 2. Uno studente
EXEC dbo.sp_Studenti_GetById @StudenteId = 1;
GO

-- 3. Tutti i corsi
EXEC dbo.sp_Corsi_GetAll;
GO

-- 4. Tutti i docenti
EXEC dbo.sp_Docenti_GetAll;
GO

-- 5. Tutte le aule
EXEC dbo.sp_Aule_GetAll;
GO

-- 6. Tutte le iscrizioni
EXEC dbo.sp_Iscrizioni_GetAll;
GO

-- 7. Tutte le assegnazioni docente/corso
EXEC dbo.sp_DocentiCorso_GetAll;
GO

-- 8. Tutte le lezioni
EXEC dbo.sp_Lezioni_GetAll;
GO

-- 9. Tutti i voti
EXEC dbo.sp_Voti_GetAll;
GO

-- 10. Voto di uno studente
EXEC dbo.sp_Voti_GetById @VotoId = 1;
GO
