USE ScuolaDb;

-- ESECUZIONE DELLE STORE PROCEDURE 
-- LISTA DEGLI STUDENTI
EXEC sp_select_all_studenti;


-- Restituisce lo studente
EXECUTE sp_GetStudenteByName 'Matteo';
EXECUTE sp_GetStudenteById 3;

-- Restituirsce la lista deli tudenti scritti
EXECUTE sp_Studenti_Scritti;


EXEC sp_Update_StudenteByName 3, 'Moussa'