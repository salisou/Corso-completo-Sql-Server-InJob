/*
============================================================
STORED PROCEDURE - sp_Lezioni_GetAll
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_GetAll
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM Lezioni ORDER BY DataLezione,OraInizio;
END;
GO