/*
============================================================
STORED PROCEDURE - sp_DocentiCorso_GetAll
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_GetAll
AS
BEGIN
 SET NOCOUNT ON;
 SELECT * FROM DocentiCorso ORDER BY CorsoId,DocenteId;
END;
GO