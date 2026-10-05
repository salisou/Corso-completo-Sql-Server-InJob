/*
	COSA SONO LE SOTTOQUERY?
	Una sottoquery è una query dentro un’altra query.
	Serve per:
		filtrare dati usando risultati di altre tabelle
		calcolare valori intermedi
		sostituire JOIN quando vuoi logica più compatta
		creare condizioni avanzate nel WHERE, HAVING, SELECT
*/

-- 1. SOTTOQUERY nel WHERE
-- Obiettivo
--	Trovare gli studenti che hanno preso il voto massimo in tutti i corsi.

-- 🔎 passo 1 Trovare il voto massimo. Convertire in intero
SELECT CAST(MAX(Voto) AS INT) [Voto Massimo] FROM Voti; -- 30

-- 🔥Query finale sottoquery (SubQuery)
SELECT
	s.Nome,
	s.Cognome,
	v.Voto
FROM Studenti s
JOIN Voti v
	On s.StudenteId = v.StudenteId
where v.voto = (
	SELECT 
		MAX(Voto) [Voto Massimo] 
	FROM Voti
);
------------------------------------------------------------------------------


--2. SOTTOQUERY nel SELECT
-- Obiettivo
-- Mostrare ogni studente con la media dei suoi voti (senza GROUP BY).

-- Passo 1 Restituire la lista di tutti gli studenti
SELECT Nome, Cognome, CodiceFiscale FROM Studenti;

-- Passo 2 medie dei Voti
SELECT 
	 AVG(Voto) [Voto Medio]-- 25.900000
FROM Voti;

-- Passo 3 Unire le due query sopra per ottenere il risulato🎉
-- Per ogni studente, la sottoquery calcola la sua media 
SELECT 
	Nome, 
	Cognome, 
	CodiceFiscale,
	(
		SELECT 
			AVG(Voto) [Voto Medio]
		FROM Voti
	) AS [Media Voti]
FROM Studenti;

------------------------------------------------------------------------------
--3. SOTTOQUERY con IN
-- Obiettivo
-- Trovare gli studenti che hanno preso almeno un voto ≥ 28.

-- Passo 1 Restituire la lista di tutti gli studenti
SELECT Nome, Cognome, CodiceFiscale FROM Studenti;

-- Passo 2 Testituire i voti ≥ 28
SELECT 
	Voto
FROM Voti
WHERE voto >= 28;

-- Passo 3 Unire i due passi usando il filtro seguito da in 
SELECT 
	Nome, 
	Cognome
FROM Studenti
WHERE StudenteId IN (
					SELECT
						StudenteId
					FROM Voti
					WHERE voto >= 28
					);

------------------------------------------------------------------------------


--4. SOTTOQUERY con EXISTS
-- Obiettivo
-- Mostrare gli studenti che hanno almeno un voto registrato.
-- PASSO 1 Elenco del nome e cognome di tutti gli studeti
SELECT 
	Nome, 
	Cognome
FROM Studenti;

-- Passo 2: Exists 1
SELECT *
FROM Voti
WHERE StudenteId = 31

-- Query finale 
SELECT 
	Nome, 
	Cognome
FROM Studenti s
WHERE EXISTS ( -- EXISTS Controlla se la stottoquery trova almeno una riga 
	SELECT 1
	FROM Voti v
	WHERE s.StudenteId = v.StudenteId
);

------------------------------------------------------------------------------

--5. SOTTOQUERY correlata (avanzata)
-- Obiettivo
-- Mostrare gli studenti che hanno preso un voto superiore alla media generale.
------------------------------------------------------------------------------

-- Passo 1 Media dei voti
SELECT
	AVG(Voto) [La media dei voti] ---> 25.90
FROM Voti

-- La query completa 
SELECT 
	Nome, 
	Cognome
FROM Studenti s
INNER JOIN Voti v
	On s.StudenteId = v.StudenteId
WHERE v.Voto > ( -- La sotto query calcola la media
	SELECT
		AVG(Voto)
	FROM Voti
);

--6. SOTTOQUERY con JOIN (super avanzata)
-- Obiettivo
-- Mostrare i corsi che hanno una media voti superiore alla media di tutti i corsi.


--7. SOTTOQUERY per trovare studenti senza data di nascita
-- Obiettivo
--Mostrare studenti iscritti a corsi senza data di nascita, usando sottoquery invece dei JOIN.




