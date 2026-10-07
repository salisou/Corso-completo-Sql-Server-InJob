/*
============================================================
STORED PROCEDURE - sp_Iscrizioni_Delete
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_Delete
 @IscrizioneId INT
AS
BEGIN
 SET NOCOUNT ON;
 DELETE FROM Iscrizioni WHERE IscrizioneId=@IscrizioneId;
END;
GO