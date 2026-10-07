/*
============================================================
STORED PROCEDURE - sp_Voti_Insert
Livello: Avanzato
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_Insert
 @StudenteId INT,@CorsoId INT,@Voto DECIMAL(4,2),@DataVoto DATE,@Note NVARCHAR(255)=NULL,@Superato BIT=1
AS
BEGIN
 SET NOCOUNT ON;
 IF @Voto<0 OR @Voto>30
 BEGIN
  THROW 50001,'Il voto deve essere compreso tra 0 e 30.',1;
 END;
 INSERT INTO Voti(StudenteId,CorsoId,Voto,DataVoto,Note,Superato)
 VALUES(@StudenteId,@CorsoId,@Voto,@DataVoto,@Note,@Superato);
 SELECT SCOPE_IDENTITY() AS NuovoVotoId;
END;
GO