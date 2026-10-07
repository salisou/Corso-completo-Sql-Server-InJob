/*
============================================================
12 - VISTE (VIEW) IN SQL SERVER
============================================================
COS'È UNA VIEW?
Una VIEW è una query salvata che può essere utilizzata come
se fosse una tabella.

A COSA SERVE?
Per semplificare query complesse e creare livelli di accesso
ai dati.

PERCHÉ USARLA?
- riutilizzo
- leggibilità
- centralizzazione delle query
- reporting
- nascondere la complessità dei JOIN

Le VIEW non duplicano normalmente i dati: memorizzano la
definizione della query.
*/

USE ScuolaDb;
GO

/* 1 - Elenco studenti */
CREATE OR ALTER VIEW dbo.vw_Studenti
AS
SELECT
    StudenteId,
    Nome,
    Cognome,
    Nome + ' ' + Cognome AS NomeCompleto,
    DataNascita,
    Email,
    Telefono,
    CodiceFiscale
FROM Studenti;
GO

/* 2 - Elenco corsi */
CREATE OR ALTER VIEW dbo.vw_Corsi
AS
SELECT
    CorsoId,
    NomeCorso,
    Descrizione,
    Crediti,
    Durata
FROM Corsi;
GO

/* 3 - Studenti iscritti ai corsi */
CREATE OR ALTER VIEW dbo.vw_StudentiCorsi
AS
SELECT
    s.StudenteId,
    s.Nome + ' ' + s.Cognome AS Studente,
    c.CorsoId,
    c.NomeCorso,
    i.DataIscrizione,
    i.Stato
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId;
GO

/* 4 - Docenti e corsi */
CREATE OR ALTER VIEW dbo.vw_DocentiCorsi
AS
SELECT
    dc.DocenteCorso,
    d.DocenteId,
    d.Nome + ' ' + d.Cognome AS Docente,
    d.Specializzazione,
    c.CorsoId,
    c.NomeCorso,
    dc.Ruolo,
    dc.DataAssegnazione
FROM DocentiCorso dc
INNER JOIN Docenti d ON dc.DocenteId = d.DocenteId
INNER JOIN Corsi c ON dc.CorsoId = c.CorsoId;
GO

/* 5 - Lezioni con aula */
CREATE OR ALTER VIEW dbo.vw_LezioniAule
AS
SELECT
    l.LezioneId,
    c.NomeCorso,
    l.Titolo,
    l.DataLezione,
    l.OraInizio,
    l.OraFine,
    l.Durata,
    a.NomeAula,
    a.Capacita
FROM Lezioni l
INNER JOIN Corsi c ON l.CorsoId = c.CorsoId
INNER JOIN Aule a ON l.AulaId = a.AulaId;
GO

/* 6 - Voti con studente e corso */
CREATE OR ALTER VIEW dbo.vw_VotiDettaglio
AS
SELECT
    v.VotoId,
    s.StudenteId,
    s.Nome + ' ' + s.Cognome AS Studente,
    c.CorsoId,
    c.NomeCorso,
    v.Voto,
    v.DataVoto,
    v.Superato,
    v.Note
FROM Voti v
INNER JOIN Studenti s ON v.StudenteId = s.StudenteId
INNER JOIN Corsi c ON v.CorsoId = c.CorsoId;
GO

/* 7 - Media voti per studente */
CREATE OR ALTER VIEW dbo.vw_MediaVotiStudenti
AS
SELECT
    s.StudenteId,
    s.Nome + ' ' + s.Cognome AS Studente,
    COUNT(v.VotoId) AS NumeroVoti,
    CAST(AVG(v.Voto) AS DECIMAL(5,2)) AS MediaVoti,
    MAX(v.Voto) AS VotoMassimo,
    MIN(v.Voto) AS VotoMinimo
FROM Studenti s
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId
GROUP BY s.StudenteId, s.Nome, s.Cognome;
GO

/* 8 - Report completo studente/corso/docente/aula */
CREATE OR ALTER VIEW dbo.vw_ReportDidattico
AS
SELECT DISTINCT
    s.StudenteId,
    s.Nome + ' ' + s.Cognome AS Studente,
    c.NomeCorso,
    c.Descrizione,
    d.Nome + ' ' + d.Cognome AS Docente,
    d.Specializzazione,
    a.NomeAula,
    a.Capacita,
    l.Titolo,
    l.DataLezione,
    l.OraInizio,
    l.OraFine,
    l.Durata
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId
LEFT JOIN DocentiCorso dc ON c.CorsoId = dc.CorsoId
LEFT JOIN Docenti d ON dc.DocenteId = d.DocenteId
LEFT JOIN Lezioni l ON c.CorsoId = l.CorsoId
LEFT JOIN Aule a ON l.AulaId = a.AulaId;
GO

/* 9 - Corsi con numero di iscritti */
CREATE OR ALTER VIEW dbo.vw_CorsiIscritti
AS
SELECT
    c.CorsoId,
    c.NomeCorso,
    c.Durata,
    COUNT(i.IscrizioneId) AS NumeroIscritti
FROM Corsi c
LEFT JOIN Iscrizioni i ON c.CorsoId = i.CorsoId
GROUP BY c.CorsoId, c.NomeCorso, c.Durata;
GO

/* 10 - Studenti senza voto */
CREATE OR ALTER VIEW dbo.vw_StudentiSenzaVoto
AS
SELECT
    s.StudenteId,
    s.Nome,
    s.Cognome,
    s.Email
FROM Studenti s
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId
WHERE v.VotoId IS NULL;
GO

/* ============================================================
10 ESEMPI DI UTILIZZO DELLE VIEW
============================================================ */

SELECT * FROM dbo.vw_Studenti;
GO

SELECT * FROM dbo.vw_Corsi;
GO

SELECT * FROM dbo.vw_StudentiCorsi;
GO

SELECT * FROM dbo.vw_DocentiCorsi;
GO

SELECT * FROM dbo.vw_LezioniAule;
GO

SELECT * FROM dbo.vw_VotiDettaglio;
GO

SELECT * FROM dbo.vw_MediaVotiStudenti
ORDER BY MediaVoti DESC;
GO

SELECT * FROM dbo.vw_ReportDidattico;
GO

SELECT * FROM dbo.vw_CorsiIscritti
ORDER BY NumeroIscritti DESC;
GO

SELECT * FROM dbo.vw_StudentiSenzaVoto;
GO
