/*
============================================================
13 - GESTIONE DELLE ECCEZIONI CON TRY/CATCH
============================================================
COS'È TRY/CATCH?
È il meccanismo con cui SQL Server intercetta gli errori
durante l'esecuzione di uno script.

A COSA SERVE?
Permette di gestire gli errori senza lasciare l'operazione
in uno stato incoerente.

STRUTTURA:
BEGIN TRY
    istruzioni
END TRY
BEGIN CATCH
    gestione errore
END CATCH

Funzioni utili nel CATCH:
ERROR_NUMBER()
ERROR_MESSAGE()
ERROR_LINE()
ERROR_PROCEDURE()
ERROR_SEVERITY()
ERROR_STATE()

TRANSAZIONE:
BEGIN TRANSACTION
COMMIT
ROLLBACK

Per operazioni importanti possiamo usare:
SET XACT_ABORT ON;
*/

USE ScuolaDb;
GO

/* ============================================================
ESEMPIO 1 - Errore numerico
============================================================ */
BEGIN TRY
    SELECT 10 / 0 AS Risultato;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS Messaggio,
        ERROR_LINE() AS RigaErrore;
END CATCH;
GO

/* ============================================================
ESEMPIO 2 - Conversione non valida
============================================================ */
BEGIN TRY
    SELECT CAST('ABC' AS INT) AS Numero;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS Messaggio;
END CATCH;
GO

/* ============================================================
ESEMPIO 3 - Violazione della FOREIGN KEY
============================================================ */
BEGIN TRY
    INSERT INTO Iscrizioni
        (StudenteId, CorsoId, DataIscrizione, Stato)
    VALUES
        (999999, 1, CAST(GETDATE() AS DATE), 'Attiva');
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS Messaggio,
        ERROR_PROCEDURE() AS Procedura;
END CATCH;
GO

/* ============================================================
ESEMPIO 4 - Violazione UNIQUE
============================================================ */
BEGIN TRY
    INSERT INTO Studenti
        (Nome, Cognome, Email, Telefono, CodiceFiscale)
    SELECT
        Nome,
        Cognome,
        Email,
        Telefono,
        CodiceFiscale
    FROM Studenti
    WHERE StudenteId = 1;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS Messaggio;
END CATCH;
GO

/* ============================================================
ESEMPIO 5 - TRY/CATCH con INSERT
============================================================ */
BEGIN TRY
    INSERT INTO Aule (NomeAula, Capacita)
    VALUES ('Aula TRY CATCH', 20);

    PRINT 'Inserimento completato.';
END TRY
BEGIN CATCH
    PRINT 'Inserimento non riuscito.';
    SELECT ERROR_MESSAGE() AS Errore;
END CATCH;
GO

/* ============================================================
ESEMPIO 6 - TRANSAZIONE con COMMIT
============================================================ */
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Corsi
    SET Durata = Durata + 1
    WHERE CorsoId = 1;

    COMMIT TRANSACTION;

    PRINT 'Transazione completata.';
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT ERROR_MESSAGE() AS Errore;
END CATCH;
GO

/* ============================================================
ESEMPIO 7 - TRANSAZIONE con ROLLBACK
============================================================ */
BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Corsi
    SET Durata = Durata + 100
    WHERE CorsoId = 1;

    -- Errore intenzionale
    SELECT 1 / 0;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        'ROLLBACK eseguito' AS Stato,
        ERROR_MESSAGE() AS Errore;
END CATCH;
GO

/* ============================================================
ESEMPIO 8 - THROW
============================================================ */
BEGIN TRY
    DECLARE @Voto DECIMAL(4,2) = 35;

    IF @Voto > 30
        THROW 50010, 'Il voto non può essere superiore a 30.', 1;
END TRY
BEGIN CATCH
    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS Messaggio;
END CATCH;
GO

/* ============================================================
ESEMPIO 9 - Procedura con TRY/CATCH
============================================================ */
CREATE OR ALTER PROCEDURE dbo.sp_EsempioTryCatch
    @CorsoId INT,
    @NuovaDurata INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @NuovaDurata <= 0
            THROW 50011, 'La durata deve essere maggiore di zero.', 1;

        UPDATE Corsi
        SET Durata = @NuovaDurata
        WHERE CorsoId = @CorsoId;

        IF @@ROWCOUNT = 0
            THROW 50012, 'Corso non trovato.', 1;

        SELECT 'Aggiornamento completato.' AS Messaggio;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_NUMBER() AS NumeroErrore,
            ERROR_MESSAGE() AS Messaggio,
            ERROR_LINE() AS Riga,
            ERROR_PROCEDURE() AS Procedura;
    END CATCH;
END;
GO

/* ============================================================
ESEMPIO 10 - TRY/CATCH + TRANSAZIONE + XACT_STATE
============================================================ */
CREATE OR ALTER PROCEDURE dbo.sp_EsempioTransazioneSicura
    @StudenteId INT,
    @CorsoId INT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        IF NOT EXISTS (
            SELECT 1
            FROM Studenti
            WHERE StudenteId = @StudenteId
        )
            THROW 50020, 'Studente non trovato.', 1;

        IF NOT EXISTS (
            SELECT 1
            FROM Corsi
            WHERE CorsoId = @CorsoId
        )
            THROW 50021, 'Corso non trovato.', 1;

        INSERT INTO Iscrizioni
            (StudenteId, CorsoId, DataIscrizione, Stato)
        VALUES
            (@StudenteId, @CorsoId, CAST(GETDATE() AS DATE), 'Attiva');

        COMMIT TRANSACTION;

        SELECT 'Iscrizione completata.' AS Messaggio;
    END TRY
    BEGIN CATCH
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;

        SELECT
            ERROR_NUMBER() AS NumeroErrore,
            ERROR_MESSAGE() AS Messaggio,
            ERROR_LINE() AS RigaErrore,
            ERROR_PROCEDURE() AS ProceduraErrore;
    END CATCH;
END;
GO

/* ============================================================
RIEPILOGO
============================================================
TRY          -> blocco da controllare
CATCH        -> gestione dell'errore
THROW        -> genera un errore personalizzato
BEGIN TRAN   -> inizia una transazione
COMMIT       -> conferma
ROLLBACK     -> annulla
XACT_STATE   -> indica lo stato della transazione
XACT_ABORT   -> rende più sicura la gestione degli errori
============================================================
*/