/*
============================================================
STORED PROCEDURE - sp_Voti_Update
Livello: Avanzato
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_Update
 @VotoId INT,@StudenteId INT,@CorsoId INT,@Voto DECIMAL(4,2),@DataVoto DATE,@Note NVARCHAR(255)=NULL,@Superato BIT
AS
BEGIN
 SET NOCOUNT ON;
 IF @Voto<0 OR @Voto>30
 BEGIN
  THROW 50002,'Il voto deve essere compreso tra 0 e 30.',1;
 END;
 UPDATE Voti SET StudenteId=@StudenteId,CorsoId=@CorsoId,Voto=@Voto,DataVoto=@DataVoto,Note=@Note,Superato=@Superato
 WHERE VotoId=@VotoId;
END;
GO