/*

	JOIN / INNER JOIN 

	 Una JOIN serve per unire dati
		provenienti da più tabelle.

		Tipi principali:
			INNER JOIN / JOIN
			LEFT JOIN
			RIGHT JOIN
			FULL JOIN
	___________________________________________________________________________
	JOIN — PERCHÉ SERVE?

	Fino a questo punto abbiamo lavorato principalmente con una tabella.

	Ma un database relazionale è composto da più tabelle collegate tra loro.

	Nel nostro database "ScuolaDb" abbiamo, per esempio:

	Studenti
	   |
	   ↓
	Iscrizioni
	   |
	   ↓
	Corsi

	Uno studente può essere iscritto a un corso.

	Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.
	___________________________________________________________________________________


	Sitassi base della JOIN / INNER JOIN 
	unisce 2 tabella che hanno qualcosa in comune 

	Select
		t1.colonne1
		t1.colonne2
		t1.colonne3
		t2.colonne1
		....
	From tabella1 as t1
	Inner join tabella2 as t2
		ON Condizione (t1.id = t2.Id) 
*/

-- Restituire la lista degli studenti scritti
SELECT * FROM Studenti, Iscrizioni; -- da non fare⚠️⚠️⚠️

-- Nome completo
-- Data Nascita
-- Codice fiscale
-- Data Iscrizione

-- Restituire la lista deli tudenti scritti
SELECT 
	*
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId;

SELECT 
	s.Nome + ' ' + s.Cognome as [Nome Completo],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione]
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId;

select * from Iscrizioni;


-- Esempio 2:
-- Restituisce la lista degli studenti iscritti ad un corso.
SELECT 
	s.Nome + ' ' + s.Cognome as [Nome Completo],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione],
	c.NomeCorso + ' - ' + c.Descrizione as [Corso],
	c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
	On i.CorsoId = c.CorsoId;


-- Esempio 3:
-- Restituisce la lista degli studenti iscritti ad un corso con la data di nascita null.
SELECT 
	s.Nome + ' ' + s.Cognome as [Nome Completo],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione],
	c.NomeCorso + ' - ' + c.Descrizione as [Corso],
	c.Durata
FROM Studenti as s
INNER JOIN Iscrizioni as i
	On s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
	On i.CorsoId = c.CorsoId
Where s.DataNascita is null;


/*
	Docenti, Corsi, Aule Lezioni
	Lezioni <-> Aule <-Corsi
	Iscrizioni <-> Studenti <- Corsi
	DocentiCorsi <- Docenti

	Restituire:
		il nome dello studente,
		il corso,
		l'aula
		Docente,
		lezione
*/
Select * from Studenti;
Select * from Iscrizioni; 
Select * from Corsi;
Select * from DocentiCorso;
Select * from Docenti;
Select * from Lezioni;
Select * from Aule;




SELECT DISTINCT 
	s.Nome + ' ' + s.Cognome as [Nome Studente],
	s.DataNascita as [Data di nascita],
	s.CodiceFiscale as CF,
	i.DataIscrizione as [Data Iscrizione],
	c.NomeCorso + ' - ' + c.Descrizione as [Corso],
	c.Durata,
	d.Nome + ' ' + d.Cognome as [Nome Docente],
	d.Specializzazione,
	a.NomeAula as [Nome Aula],
	a.Capacita as Capacità
FROM Studenti as s
JOIN Iscrizioni as i
	ON s.StudenteId = i.StudenteId
JOIN Corsi as c
	ON c.CorsoId = i.CorsoId
JOIN DocentiCorso as dc
	ON dc.CorsoId = c.CorsoId
JOIN Docenti as d
	ON d.DocenteId = dc.DocenteId
JOIN Lezioni as l
	ON c.CorsoId = l.CorsoId
JOIN Aule as a
	ON a.AulaId = l.AulaId;



----------------------------------------------------------------------

/*   
	LEFT JOIN 
		Mostra i record della tabella sinistra 
		anche se non esiste corristpondenza
		nella tabella destra.
*/
SELECT TOP 10 *
FROM Studenti as s
INNER JOIN Iscrizioni i
	ON i.StudenteId = s.StudenteId
WHERE DataNascita IS NOT NULL
	AND DataNascita >= '2000'
ORDER BY DataNascita asc

SELECT TOP 10 *
FROM Studenti as s
JOIN Iscrizioni i
	ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
	ON i.CorsoId = c.CorsoId	
WHERE DataNascita IS NOT NULL
	AND DataNascita <> '2000'
ORDER BY DataNascita asc;

--------------------------------------------------------------------------------------------

-- Restituisce le lista degli studenti non scritti
SELECT 
	ISNULL(s.Nome + ' ' + s.Cognome, 'Studente non asseganto') AS Studente,
	ISNULL(CONVERT(VARCHAR, s.DataNascita, 105), 'N/D') AS [Data di Nascita],
	ISNULL(s.CodiceFiscale, 'CF00000') AS [CF],
	ISNULL(s.Email, 'Email non definita') AS Email,
	ISNULL(s.Telefono, '000000') AS Telefono,
	ISNULL(CONVERT(VARCHAR, i.DataIscrizione, 105), 'N/D'),
	ISNULL(c.NomeCorso, 'Non definito') AS [Nome Corso],
	ISNULL(c.Descrizione, 'Non definita') AS Descrizione,
	ISNULL(c.Crediti, 0) AS Crediti,
	ISNULL(c.Durata, 0)
FROM Studenti s 
LEFT JOIN Iscrizioni i
	On i.StudenteId = s.StudenteId
LEFT JOIN Corsi c
	On i.CorsoId = c.CorsoId


--------------------------------------------------------------------------------------------
-- Le funzione ISNULL() restituisce valore specifito se l'espressione è null
-- Convert()

SELECT 
	Nome,
	Cognome,
	ISNULL(CONVERT(VARCHAR, DataNascita, 104), 'N/D') AS DataNascita 
FROM Studenti
where DataNascita is null;

SELECT 
	Nome,
	Cognome,
	DataNascita 
FROM Studenti
where DataNascita is null;


SELECT 
	Titolo + ' ' + Descrizione AS [Materia],
	--ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 2), 'N/D') as Ora,
	ISNULL(LEFT(CONVERT(VARCHAR, OraInizio, 108), 5), 'N/D') as Minuti,
	ISNULL(DATEPART(HOUR, OraInizio), 2) AS Ora,
	DATEPART(MINUTE, OraInizio) AS Minuti
FROM Lezioni;


SELECT 
	Titolo + ' ' + Descrizione AS [Materia],
	'la lezione inizia alle ' +
	CAST(DATEPART(HOUR, OraInizio) AS nvarchar(2)) + ':' + 
	RIGHT('0' + CAST(DATEPART(MINUTE, OraInizio) as nvarchar(2)), 2 ) as Orario
FROM Lezioni;
-- 108 => 09:00

SELECT
    Titolo + ' ' + Descrizione AS [Materia],
	'la lezione inizia alle ' +
    ISNULL(CONVERT(VARCHAR(5), OraInizio, 108), 'N/D') AS Ora
FROM Lezioni;


SELECT 
	Titolo + ' ' + Descrizione AS [Materia],
	DATEPART(HOUR, OraInizio) AS Ora,
	DATEPART(MINUTE, OraInizio) AS Minuti,
	DATEPART(SECOND, OraInizio) AS Secondi
FROM Lezioni;

------------------------------------------------------------------------------------------
/*
	RIGHT JOIN
	Fa il contrario della "LEFT JOIN"
	Restituisce tutti i record della tabella destra
*/
SELECT 
	st.Nome + ' ' + st.Cognome as Studene,
	st.CodiceFiscale as CF,
	ISNULL(CONVERT(VARCHAR, i.DataIscrizione, 105), 'Data non definita') AS [Data Iscrizione]
FROM Studenti st
RIGHT JOIN Iscrizioni i
	ON i.StudenteId = st.StudenteId;

-----------------------------------------------------------------------------------------