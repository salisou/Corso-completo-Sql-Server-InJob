/*
============================================================
STORED PROCEDURE - sp_Lezioni_Insert
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Lezioni_Insert
 @CorsoId INT,@AulaId INT,@Titolo NVARCHAR(100),@Descrizione VARCHAR(MAX)=NULL,@DataLezione DATE,@OraInizio TIME,@OraFine TIME,@Durata INT=NULL
AS
BEGIN
 SET NOCOUNT ON;
 INSERT INTO Lezioni(CorsoId,AulaId,Titolo,Descrizione,DataLezione,OraInizio,OraFine,Durata)
 VALUES(@CorsoId,@AulaId,@Titolo,@Descrizione,@DataLezione,@OraInizio,@OraFine,@Durata);
 SELECT SCOPE_IDENTITY() AS NuovaLezioneId;
END;
GO