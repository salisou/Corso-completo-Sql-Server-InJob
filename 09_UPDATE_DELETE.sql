-- UPDATE è il commando sql che modifica i dati già esistenti dentro una tablla
SELECT * FROM Studenti
where StudenteId = 3;
-- katya

--⚠️🙅😭😭😭 
--UPDATE Studenti
--SET Nome = 'katya'


UPDATE Studenti
SET Nome = 'Katia'
WHERE StudenteId = 3; 


update Studenti
SET Nome = 'Mario',
	Cognome = 'Rossi',
	Email = 'm.rossi@software.it'
WHERE CodiceFiscale = 'BLUSRA02B28H501E';


SELECT * FROM Studenti WHERE CodiceFiscale = 'BLUSRA02B28H501E';