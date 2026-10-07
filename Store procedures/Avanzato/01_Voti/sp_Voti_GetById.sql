/*
============================================================
STORED PROCEDURE - sp_Voti_GetById
Livello: Avanzato
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_GetById
 @VotoId INT
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM Voti WHERE VotoId=@VotoId;
END;
GO