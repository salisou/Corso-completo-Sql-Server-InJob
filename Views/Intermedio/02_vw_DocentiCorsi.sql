/*
VIEW INTERMEDIA - Docenti e Corsi
Serve per ottenere rapidamente il collegamento docente-corso.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_DocentiCorsi
AS
SELECT d.DocenteId, d.Nome, d.Cognome,
       c.CorsoId, c.NomeCorso
FROM Docenti d
JOIN DocentiCorso dc ON d.DocenteId = dc.DocenteId
JOIN Corsi c ON dc.CorsoId = c.CorsoId;
GO
SELECT * FROM vw_DocentiCorsi;
