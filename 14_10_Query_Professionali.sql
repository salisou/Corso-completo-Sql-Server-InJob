/*
============================================================
14 - 10 QUERY PROFESSIONALI DI RIEPILOGO
============================================================
Questo file mette in pratica:
SELECT
WHERE
JOIN
LEFT JOIN
GROUP BY
HAVING
CASE
funzioni aggregate
sottoquery
NULL
date
ordinamento
*/

USE ScuolaDb;
GO

/* ============================================================
1. STUDENTI CON NOME COMPLETO
============================================================ */
SELECT
    StudenteId,
    CONCAT(Nome, ' ', Cognome) AS NomeCompleto,
    Email
FROM Studenti
ORDER BY Cognome, Nome;
GO

/* ============================================================
2. STUDENTI ISCRITTI E CORSO
============================================================ */
SELECT
    CONCAT(s.Nome, ' ', s.Cognome) AS Studente,
    c.NomeCorso,
    i.DataIscrizione,
    i.Stato
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId;
GO

/* ============================================================
3. STUDENTI CON MEDIA VOTI
============================================================ */
SELECT
    CONCAT(s.Nome, ' ', s.Cognome) AS Studente,
    CAST(AVG(v.Voto) AS DECIMAL(5,2)) AS MediaVoti
FROM Studenti s
INNER JOIN Voti v ON s.StudenteId = v.StudenteId
GROUP BY s.StudenteId, s.Nome, s.Cognome
ORDER BY MediaVoti DESC;
GO

/* ============================================================
4. CORSI CON NUMERO DI ISCRITTI
============================================================ */
SELECT
    c.NomeCorso,
    COUNT(i.IscrizioneId) AS NumeroIscritti
FROM Corsi c
LEFT JOIN Iscrizioni i ON c.CorsoId = i.CorsoId
GROUP BY c.CorsoId, c.NomeCorso
ORDER BY NumeroIscritti DESC;
GO

/* ============================================================
5. CORSI CON ALMENO UN CERTO NUMERO DI ISCRITTI
============================================================ */
SELECT
    c.NomeCorso,
    COUNT(i.IscrizioneId) AS NumeroIscritti
FROM Corsi c
LEFT JOIN Iscrizioni i ON c.CorsoId = i.CorsoId
GROUP BY c.CorsoId, c.NomeCorso
HAVING COUNT(i.IscrizioneId) >= 1;
GO

/* ============================================================
6. LEZIONI CON ORARIO FORMATTATO
============================================================ */
SELECT
    l.Titolo,
    c.NomeCorso,
    CONVERT(VARCHAR(5), l.OraInizio, 108) AS OraInizio,
    CONVERT(VARCHAR(5), l.OraFine, 108) AS OraFine,
    l.DataLezione
FROM Lezioni l
INNER JOIN Corsi c ON l.CorsoId = c.CorsoId
ORDER BY l.DataLezione, l.OraInizio;
GO

/* ============================================================
7. STUDENTI SENZA DATA DI NASCITA
============================================================ */
SELECT
    Nome,
    Cognome,
    ISNULL(CONVERT(VARCHAR(10), DataNascita, 105), 'N/D') AS DataNascita
FROM Studenti
WHERE DataNascita IS NULL;
GO

/* ============================================================
8. CLASSIFICAZIONE DEI CORSI
============================================================ */
SELECT
    NomeCorso,
    Durata,
    CASE
        WHEN Durata >= 60 THEN 'Avanzato/Lungo'
        WHEN Durata >= 50 THEN 'Intermedio'
        ELSE 'Base'
    END AS Categoria
FROM Corsi
ORDER BY Durata DESC;
GO

/* ============================================================
9. STUDENTI SOPRA LA MEDIA GENERALE
============================================================ */
SELECT DISTINCT
    CONCAT(s.Nome, ' ', s.Cognome) AS Studente,
    v.Voto
FROM Studenti s
INNER JOIN Voti v ON s.StudenteId = v.StudenteId
WHERE v.Voto > (
    SELECT AVG(Voto)
    FROM Voti
)
ORDER BY v.Voto DESC;
GO

/* ============================================================
10. REPORT COMPLETO
Studente -> iscrizione -> corso -> docente -> lezione -> aula
============================================================ */
SELECT DISTINCT
    CONCAT(s.Nome, ' ', s.Cognome) AS Studente,
    c.NomeCorso,
    CONCAT(d.Nome, ' ', d.Cognome) AS Docente,
    a.NomeAula,
    l.Titolo,
    l.DataLezione,
    CONVERT(VARCHAR(5), l.OraInizio, 108) AS OraInizio,
    CONVERT(VARCHAR(5), l.OraFine, 108) AS OraFine,
    l.Durata
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId
LEFT JOIN DocentiCorso dc ON c.CorsoId = dc.CorsoId
LEFT JOIN Docenti d ON dc.DocenteId = d.DocenteId
LEFT JOIN Lezioni l ON c.CorsoId = l.CorsoId
LEFT JOIN Aule a ON l.AulaId = a.AulaId
ORDER BY Studente, c.NomeCorso;
GO
