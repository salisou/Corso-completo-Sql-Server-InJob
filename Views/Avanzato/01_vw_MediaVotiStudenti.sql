/*
VIEW AVANZATA - Media Voti
Trasforma i voti elementari in una metrica analitica.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_MediaVotiStudenti
AS
SELECT s.StudenteId, s.Nome, s.Cognome,
       COUNT(v.Voto) AS NumeroVoti,
       AVG(CAST(v.Voto AS DECIMAL(10,2))) AS MediaVoti,
       MIN(v.Voto) AS VotoMinimo,
       MAX(v.Voto) AS VotoMassimo
FROM Studenti s
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId
GROUP BY s.StudenteId, s.Nome, s.Cognome;
GO
SELECT * FROM vw_MediaVotiStudenti;
