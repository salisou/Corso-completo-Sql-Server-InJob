/*
VIEW INTERMEDIA - Dettaglio Voti
Collega studente e voto. È utile come base per analisi statistiche.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_VotiDettaglio
AS
SELECT s.StudenteId, s.Nome, s.Cognome, v.Voto
FROM Studenti s
JOIN Voti v ON s.StudenteId = v.StudenteId;
GO
SELECT * FROM vw_VotiDettaglio;
