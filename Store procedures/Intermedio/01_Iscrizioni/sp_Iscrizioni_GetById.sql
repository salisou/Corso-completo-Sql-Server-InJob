/*
============================================================
STORED PROCEDURE - sp_Iscrizioni_GetById
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_GetById
 @IscrizioneId INT
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM Iscrizioni WHERE IscrizioneId=@IscrizioneId;
END;
GO