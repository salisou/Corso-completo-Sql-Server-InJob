/*
VIEW BASE - Corsi
Mostra le informazioni essenziali dei corsi in una struttura
riutilizzabile per report e analisi.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_Corsi
AS
SELECT CorsoId, NomeCorso, Descrizione
FROM Corsi;
GO
SELECT * FROM vw_Corsi;
