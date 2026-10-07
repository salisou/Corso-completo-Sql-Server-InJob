/*
============================================================
STORED PROCEDURE - sp_Iscrizioni_Update
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_Update
 @IscrizioneId INT,@StudenteId INT,@CorsoId INT,@DataIscrizione DATE,@Stato NVARCHAR(30)
AS
BEGIN
 SET NOCOUNT ON;
 UPDATE Iscrizioni SET StudenteId=@StudenteId,CorsoId=@CorsoId,DataIscrizione=@DataIscrizione,Stato=@Stato
 WHERE IscrizioneId=@IscrizioneId;
END;
GO