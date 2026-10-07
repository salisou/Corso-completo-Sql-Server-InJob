/*
============================================================
STORED PROCEDURES - AVANZATO
ESECUZIONE
============================================================
*/
USE ScuolaDb;
GO

EXEC dbo.sp_Voti_GetAll;
GO

EXEC dbo.sp_Voti_GetById @VotoId = 1;
GO
