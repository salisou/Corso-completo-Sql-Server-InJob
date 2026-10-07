/*
VIEW INTERMEDIA - Studenti e Corsi
Utilizza JOIN per trasformare dati distribuiti in un dataset
semplice da interrogare.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_StudentiCorsi
AS
SELECT s.StudenteId, s.Nome, s.Cognome, c.CorsoId, c.NomeCorso
FROM Studenti s
JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
JOIN Corsi c ON i.CorsoId = c.CorsoId;
GO
SELECT * FROM vw_StudentiCorsi;
