/*
============================================================
STORED PROCEDURE - sp_Voti_Delete
Livello: Avanzato
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_Voti_Delete
 @VotoId INT
AS
BEGIN
 SET NOCOUNT ON;
 DELETE FROM Voti WHERE VotoId=@VotoId;
END;
GO