/*
============================================================
STORED PROCEDURE - sp_DocentiCorso_Delete
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_Delete
 @DocenteCorso INT
AS
BEGIN
 SET NOCOUNT ON;
 DELETE FROM DocentiCorso WHERE DocenteCorso=@DocenteCorso;
END;
GO