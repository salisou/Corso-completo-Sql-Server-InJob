/*
============================================================
STORED PROCEDURE - sp_DocentiCorso_Insert
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_Insert
 @DocenteId INT,@CorsoId INT,@DataRegistrazione DATE=NULL,@DataAssegnazione DATE=NULL,@Ruolo NVARCHAR(50)=NULL
AS
BEGIN
 SET NOCOUNT ON;
 INSERT INTO DocentiCorso(DocenteId,CorsoId,DataRegistrazione,DataAssegnazione,Ruolo)
 VALUES(@DocenteId,@CorsoId,@DataRegistrazione,@DataAssegnazione,@Ruolo);
 SELECT SCOPE_IDENTITY() AS NuovoDocenteCorsoId;
END;
GO