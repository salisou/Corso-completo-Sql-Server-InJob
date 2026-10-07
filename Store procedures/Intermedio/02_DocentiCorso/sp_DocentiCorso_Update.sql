/*
============================================================
STORED PROCEDURE - sp_DocentiCorso_Update
Livello: Intermedio
Questo file contiene UNA SOLA Stored Procedure.
============================================================
*/
USE ScuolaDb;
GO

CREATE OR ALTER PROCEDURE dbo.sp_DocentiCorso_Update
 @DocenteCorso INT,@DocenteId INT,@CorsoId INT,@DataRegistrazione DATE=NULL,@DataAssegnazione DATE=NULL,@Ruolo NVARCHAR(50)=NULL
AS
BEGIN
 SET NOCOUNT ON;
 UPDATE DocentiCorso SET DocenteId=@DocenteId,CorsoId=@CorsoId,DataRegistrazione=@DataRegistrazione,DataAssegnazione=@DataAssegnazione,Ruolo=@Ruolo
 WHERE DocenteCorso=@DocenteCorso;
END;
GO