/*
============================================================
STORED PROCEDURE - sp_Voti_GetAll
Livello: Avanzato
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_GetAll
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM Voti ORDER BY DataVoto DESC;
END;
GO