USE ScuolaDb;
Go

-- Primo passo con select 
SELECT * FROM Studenti;

-- Secondo passo con 'SELECT'
/*
	Esempio: 
		select 
			colonna1, 
			colonna2, 
			...
		from tabella 
*/

SELECT 
	Nome, 
	Cognome,
	CodiceFiscale
FROM Studenti;

-- Concatenazione di due colonne (+) 
-- Aliass = AS per definire il nome di una colonna durante la select 

--Esempio1
SELECT 
	Nome + ' ' + Cognome AS NomeCompleto,
	CodiceFiscale 
FROM Studenti;

--Esempio2
SELECT 
	Nome + ' ' + Cognome AS 'Nome Completo',
	CodiceFiscale
FROM Studenti;

--Esempio3
SELECT 
	Nome + ' ' + Cognome AS [Nome Completo],
	CodiceFiscale AS [CF]
FROM Studenti;

select * from Studenti;

-- Where filtra a secondo le condizione
-- Esmpio1
SELECT 
	Nome + ' ' + Cognome AS 'Nome Completo',
	CodiceFiscale,
	DataNascita
FROM Studenti;

-- IS NULL / IS NOT NULL CON IL FILTRO Where 
SELECT 
	Nome + ' ' + Cognome AS 'Nome Completo',
	CodiceFiscale,
	DataNascita
FROM Studenti
WHERE DataNascita IS NOT NULL;

/*
	Restituire la lista degli studenti 
	che non hanno la data di nascita.

	Campi da visualizzare: 
		Nome completo dello studente,
		Email,
		Data di nascita,
		Codice fiscale
*/
SELECT
	Nome + ' ' + Cognome AS [Nome completo dello studente],
	Email,
	DataNascita,
	CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL;

-- ORDER ordina le colonne ASC
SELECT
	Nome + ' ' + Cognome AS [Nome completo dello studente],
	Email,
	DataNascita,
	CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome completo dello studente] ASC;

-- ORDER ordina le colonne DESC
SELECT
	Nome + ' ' + Cognome AS [Nome completo dello studente],
	Email,
	DataNascita,
	CodiceFiscale
FROM Studenti
WHERE DataNascita IS NULL
ORDER BY [Nome completo dello studente] DESC;



