/*
============================================================
STORED PROCEDURE - sp_Lezioni_Update
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_Update
 @LezioneId INT,@CorsoId INT,@AulaId INT,@Titolo NVARCHAR(100),@Descrizione VARCHAR(MAX)=NULL,@DataLezione DATE,@OraInizio TIME,@OraFine TIME,@Durata INT=NULL
AS
BEGIN
 SET NOCOUNT ON;
 UPDATE Lezioni SET CorsoId=@CorsoId,AulaId=@AulaId,Titolo=@Titolo,Descrizione=@Descrizione,DataLezione=@DataLezione,OraInizio=@OraInizio,OraFine=@OraFine,Durata=@Durata
 WHERE LezioneId=@LezioneId;
END;
GO