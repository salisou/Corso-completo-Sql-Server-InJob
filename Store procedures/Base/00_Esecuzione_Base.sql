/*
============================================================
STORED PROCEDURES - BASE
ESECUZIONE
============================================================
*/
USE ScuolaDb;
GO

EXEC dbo.sp_Studenti_GetAll;
GO

EXEC dbo.sp_Studenti_GetById @StudenteId = 1;
GO

EXEC dbo.sp_Corsi_GetAll;
GO

EXEC dbo.sp_Docenti_GetAll;
GO

EXEC dbo.sp_Aule_GetAll;
GO
