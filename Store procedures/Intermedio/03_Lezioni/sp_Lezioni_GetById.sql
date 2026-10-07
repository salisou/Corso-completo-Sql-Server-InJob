/*
============================================================
STORED PROCEDURE - sp_Lezioni_GetById
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_GetById
 @LezioneId INT
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM Lezioni WHERE LezioneId=@LezioneId;
END;
GO