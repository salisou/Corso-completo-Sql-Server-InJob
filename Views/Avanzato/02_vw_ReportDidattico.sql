/*
VIEW AVANZATA - Report Didattico
Dataset integrato per analisi e report.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_ReportDidattico
AS
SELECT
    s.StudenteId,
    s.Nome + ' ' + s.Cognome AS Studente,
    c.NomeCorso,
    d.Nome + ' ' + d.Cognome AS Docente,
    l.DataLezione,
    l.OraInizio,
    a.NomeAula,
    v.Voto
FROM Studenti s
LEFT JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi c ON i.CorsoId = c.CorsoId
LEFT JOIN DocentiCorso dc ON c.CorsoId = dc.CorsoId
LEFT JOIN Docenti d ON dc.DocenteId = d.DocenteId
LEFT JOIN Lezioni l ON c.CorsoId = l.CorsoId
LEFT JOIN Aule a ON l.AulaId = a.AulaId
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId;
GO
SELECT * FROM vw_ReportDidattico;
