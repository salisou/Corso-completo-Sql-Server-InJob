/*
============================================================
STORED PROCEDURE - sp_Lezioni_Delete
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_Delete
 @LezioneId INT
AS
BEGIN
 SET NOCOUNT ON;
 DELETE FROM Lezioni WHERE LezioneId=@LezioneId;
END;
GO