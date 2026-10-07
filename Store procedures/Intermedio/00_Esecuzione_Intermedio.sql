/*
============================================================
STORED PROCEDURES - INTERMEDIO
ESECUZIONE
============================================================
*/
USE ScuolaDb;
GO

EXEC dbo.sp_Iscrizioni_GetAll;
GO

EXEC dbo.sp_DocentiCorso_GetAll;
GO

EXEC dbo.sp_Lezioni_GetAll;
GO
