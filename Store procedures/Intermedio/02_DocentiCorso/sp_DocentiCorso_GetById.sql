/*
============================================================
STORED PROCEDURE - sp_DocentiCorso_GetById
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_GetById
 @DocenteCorso INT
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM DocentiCorso WHERE DocenteCorso=@DocenteCorso;
END;
GO