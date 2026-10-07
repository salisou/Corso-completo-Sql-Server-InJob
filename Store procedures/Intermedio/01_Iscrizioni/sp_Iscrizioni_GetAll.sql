/*
============================================================
STORED PROCEDURE - sp_Iscrizioni_GetAll
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_GetAll
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM Iscrizioni ORDER BY DataIscrizione DESC;
END;
GO