-- =============================================
-- Author:		Docente Moussa
-- Create date: 2026-10-06
-- Description:	Restituire lo studente in base la nome passato nel parametro
-- =============================================
CREATE PROCEDURE sp_GetStudenteByName
	@Nome_ricerca NVARCHAR(100) -- scatola che salva i dati📦📊
AS
BEGIN
	SELECT 
		ISNULL(Nome + ' ' + Cognome, 'Studente non asseganto') AS [Nome completo dello Studente],
		ISNULL(CONVERT(VARCHAR, DataNascita, 105), 'N/D') AS [Data di Nascita],
		ISNULL(CodiceFiscale, 'CF00000') AS [CF],
		ISNULL(Email, 'Email non definita') AS Email,
		ISNULL(Telefono, '000000') AS Telefono
	FROM Studenti
	WHERE Nome = @Nome_ricerca;
END
GO
