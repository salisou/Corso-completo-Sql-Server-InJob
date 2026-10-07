/*
VIEW BASE - Studenti
COS'È: una query salvata nel database.
A COSA SERVE: semplifica l'accesso ai dati.
*/
USE ScuolaDb;
GO
CREATE OR ALTER VIEW vw_Studenti
AS
SELECT StudenteId, Nome, Cognome, Email, Telefono, DataNascita
FROM Studenti;
GO
SELECT * FROM vw_Studenti;
