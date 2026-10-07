/*
============================================================
STORED PROCEDURE - sp_Iscrizioni_Insert
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Iscrizioni_Insert
 @StudenteId INT,@CorsoId INT,@DataIscrizione DATE=NULL,@Stato NVARCHAR(30)='Attiva'
AS
BEGIN
 SET NOCOUNT ON;
 IF @DataIscrizione IS NULL SET @DataIscrizione=CAST(GETDATE() AS DATE);
 INSERT INTO Iscrizioni(StudenteId,CorsoId,DataIscrizione,Stato)
 VALUES(@StudenteId,@CorsoId,@DataIscrizione,@Stato);
 SELECT SCOPE_IDENTITY() AS NuovaIscrizioneId;
END;
GO