CREATE PROCEDURE sp_Update_StudenteByName
	@Id INT,
	@Nome_studente NVARCHAR(100)
AS
BEGIN
	Update Studenti
	SET Nome = @Nome_studente
	WHERE StudenteId = @Id;
END
GO