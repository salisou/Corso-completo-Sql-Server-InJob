/*
============================================================
CORREZIONI - ESERCIZI INTERMEDI
Le query sono pensate per mostrare la logica del Data Analyst.
============================================================
*/
USE ScuolaDb;
GO

-- 1. JOIN collega tabelle attraverso una relazione.
SELECT s.Nome, s.Cognome, c.NomeCorso
FROM Studenti s
INNER JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
INNER JOIN Corsi c ON i.CorsoId = c.CorsoId;

-- 2. Collegamento corso-docente.
SELECT c.NomeCorso, d.Nome, d.Cognome, d.Specializzazione
FROM Corsi c
INNER JOIN DocentiCorso dc ON c.CorsoId = dc.CorsoId
INNER JOIN Docenti d ON dc.DocenteId = d.DocenteId;

-- 3. COUNT + GROUP BY calcola il numero per gruppo.
SELECT c.NomeCorso, COUNT(i.StudenteId) AS NumeroStudenti
FROM Corsi c
LEFT JOIN Iscrizioni i ON c.CorsoId = i.CorsoId
GROUP BY c.NomeCorso;

-- 4. HAVING filtra i gruppi dopo GROUP BY.
SELECT c.NomeCorso, COUNT(i.StudenteId) AS NumeroStudenti
FROM Corsi c
LEFT JOIN Iscrizioni i ON c.CorsoId = i.CorsoId
GROUP BY c.NomeCorso
HAVING COUNT(i.StudenteId) >= 2;

-- 5. Funzioni aggregate per analizzare i voti.
SELECT StudenteId, AVG(Voto) AS Media, MIN(Voto) AS Minimo, MAX(Voto) AS Massimo
FROM Voti
GROUP BY StudenteId;

-- 6. CASE trasforma un valore numerico in una categoria.
SELECT StudenteId, Voto,
CASE
    WHEN Voto < 18 THEN 'Insufficiente'
    WHEN Voto < 24 THEN 'Sufficiente'
    WHEN Voto < 28 THEN 'Buono'
    ELSE 'Ottimo'
END AS Valutazione
FROM Voti;

-- 7. Studenti con almeno un voto.
SELECT DISTINCT s.StudenteId, s.Nome, s.Cognome
FROM Studenti s
INNER JOIN Voti v ON s.StudenteId = v.StudenteId;

-- 8. LEFT JOIN + IS NULL trova gli assenti.
SELECT s.StudenteId, s.Nome, s.Cognome
FROM Studenti s
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId
WHERE v.StudenteId IS NULL;

-- 9. Sottoquery per confronto con la media generale.
SELECT *
FROM Voti
WHERE Voto > (SELECT AVG(Voto) FROM Voti);

-- 10. Report multi-tabella.
SELECT s.Nome + ' ' + s.Cognome AS Studente,
       c.NomeCorso,
       d.Nome + ' ' + d.Cognome AS Docente,
       l.DataLezione,
       l.OraInizio,
       a.NomeAula
FROM Studenti s
JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
JOIN Corsi c ON i.CorsoId = c.CorsoId
LEFT JOIN DocentiCorso dc ON c.CorsoId = dc.CorsoId
LEFT JOIN Docenti d ON dc.DocenteId = d.DocenteId
LEFT JOIN Lezioni l ON c.CorsoId = l.CorsoId
LEFT JOIN Aule a ON l.AulaId = a.AulaId;
