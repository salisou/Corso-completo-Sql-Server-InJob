CREATE PROCEDURE sp_Studenti_Scritti
AS
BEGIN
	SELECT 
		*
	FROM Studenti as s
	INNER JOIN Iscrizioni as i
		On s.StudenteId = i.StudenteId;
END
GO