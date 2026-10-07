/*
============================================================
10 - CONDIZIONI IN SQL SERVER
============================================================
COS'È?
Una condizione permette di decidere quali righe leggere o
quale percorso eseguire.

A COSA SERVE?
Serve per filtrare dati e controllare situazioni.

PERCHÉ USARLA?
Per trasformare una richiesta dell'utente in una query precisa.

Operatori principali:
= <> != > < >= <=
AND OR NOT
IN NOT IN
BETWEEN NOT BETWEEN
LIKE NOT LIKE
IS NULL / IS NOT NULL
CASE
IF / ELSE
IIF
*/

USE ScuolaDb;
GO

/* ============================================================
ESEMPIO 1 - Uguaglianza
Mostrare gli studenti con StudenteId = 1.
============================================================ */
SELECT *
FROM Studenti
WHERE StudenteId = 1;
GO

/* ============================================================
ESEMPIO 2 - Maggiore di
Mostrare i corsi con durata superiore a 50 ore.
============================================================ */
SELECT NomeCorso, Durata
FROM Corsi
WHERE Durata > 50;
GO

/* ============================================================
ESEMPIO 3 - AND
Entrambe le condizioni devono essere vere.
============================================================ */
SELECT Nome, Cognome, DataNascita
FROM Studenti
WHERE DataNascita IS NOT NULL
  AND DataNascita >= '2000-01-01';
GO

/* ============================================================
ESEMPIO 4 - OR
È sufficiente che una delle condizioni sia vera.
============================================================ */
SELECT NomeCorso, Durata
FROM Corsi
WHERE Durata = 40
   OR Durata = 50;
GO

/* ============================================================
ESEMPIO 5 - NOT
Esclude una condizione.
============================================================ */
SELECT *
FROM Iscrizioni
WHERE NOT Stato = 'Terminata';
GO

/* ============================================================
ESEMPIO 6 - IN
Controlla se un valore appartiene a un elenco.
============================================================ */
SELECT *
FROM Corsi
WHERE CorsoId IN (1, 2, 3, 4, 5);
GO

/* ============================================================
ESEMPIO 7 - BETWEEN
Controlla un intervallo inclusivo.
============================================================ */
SELECT NomeCorso, Crediti, Durata
FROM Corsi
WHERE Durata BETWEEN 40 AND 60;
GO

/* ============================================================
ESEMPIO 8 - LIKE
Cerca un testo secondo un modello.
D% = inizia con D
%SQL% = contiene SQL
============================================================ */
SELECT *
FROM Corsi
WHERE NomeCorso LIKE '%SQL%';
GO

/* ============================================================
ESEMPIO 9 - CASE
CASE permette di trasformare una condizione in un risultato.
============================================================ */
SELECT
    NomeCorso,
    Durata,
    CASE
        WHEN Durata >= 60 THEN 'Corso lungo'
        WHEN Durata >= 40 THEN 'Corso medio'
        ELSE 'Corso breve'
    END AS Categoria
FROM Corsi;
GO

/* ============================================================
ESEMPIO 10 - IF / ELSE
IF/ELSE controlla una condizione prima di eseguire istruzioni.
È utilizzabile in script e stored procedure.
============================================================ */
DECLARE @NumeroStudenti INT;

SELECT @NumeroStudenti = COUNT(*)
FROM Studenti;

IF @NumeroStudenti > 0
BEGIN
    PRINT 'Il database contiene studenti.';
END
ELSE
BEGIN
    PRINT 'La tabella Studenti è vuota.';
END;
GO

/* ============================================================
RIEPILOGO DIDATTICO
============================================================
WHERE       -> filtra le righe
AND         -> tutte le condizioni devono essere vere
OR          -> almeno una condizione deve essere vera
NOT         -> nega una condizione
IN          -> confronta con più valori
BETWEEN     -> cerca in un intervallo
LIKE        -> ricerca testuale
IS NULL     -> cerca valori NULL
CASE        -> restituisce un valore in base a condizioni
IF/ELSE     -> esegue blocchi diversi in base a una condizione
============================================================
*/