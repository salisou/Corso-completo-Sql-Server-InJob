/*
============================================================
CORREZIONI - DATA ANALYTICS AVANZATO
============================================================
*/
USE ScuolaDb;
GO

-- 1. CTE: rende leggibile una trasformazione intermedia.
WITH MediaStudenti AS
(
    SELECT StudenteId, AVG(CAST(Voto AS DECIMAL(10,2))) AS Media
    FROM Voti
    GROUP BY StudenteId
)
SELECT * FROM MediaStudenti;

-- 2. RANK classifica senza perdere i pari merito.
WITH MediaStudenti AS
(
    SELECT StudenteId, AVG(CAST(Voto AS DECIMAL(10,2))) AS Media
    FROM Voti GROUP BY StudenteId
)
SELECT *, RANK() OVER (ORDER BY Media DESC) AS Posizione
FROM MediaStudenti;

-- 3. ROW_NUMBER assegna un numero progressivo dentro ogni studente.
SELECT StudenteId, Voto,
       ROW_NUMBER() OVER (PARTITION BY StudenteId ORDER BY Voto DESC) AS NumeroVoto
FROM Voti;

-- 4. DENSE_RANK classifica i corsi senza buchi nelle posizioni.
WITH CorsiConteggio AS
(
    SELECT c.CorsoId, c.NomeCorso, COUNT(i.StudenteId) AS Iscritti
    FROM Corsi c
    LEFT JOIN Iscrizioni i ON c.CorsoId = i.CorsoId
    GROUP BY c.CorsoId, c.NomeCorso
)
SELECT *, DENSE_RANK() OVER (ORDER BY Iscritti DESC) AS Posizione
FROM CorsiConteggio;

-- 5. Confronto con la media generale.
SELECT StudenteId, Voto,
       AVG(Voto) OVER () AS MediaGenerale,
       Voto - AVG(Voto) OVER () AS Scostamento
FROM Voti;

-- 6. LAG recupera il valore precedente.
SELECT StudenteId, Voto,
       LAG(Voto) OVER (PARTITION BY StudenteId ORDER BY Voto) AS VotoPrecedente
FROM Voti;

-- 7. Calcolo dello scostamento dal voto precedente.
SELECT StudenteId, Voto,
       Voto - LAG(Voto) OVER (PARTITION BY StudenteId ORDER BY Voto) AS Differenza
FROM Voti;

-- 8. KPI principali.
SELECT
    (SELECT COUNT(*) FROM Studenti) AS NumeroStudenti,
    (SELECT COUNT(*) FROM Corsi) AS NumeroCorsi,
    (SELECT AVG(CAST(Voto AS DECIMAL(10,2))) FROM Voti) AS MediaVoti,
    (SELECT MAX(Voto) FROM Voti) AS VotoMassimo,
    CAST(100.0 * (SELECT COUNT(DISTINCT StudenteId) FROM Voti)
         / NULLIF((SELECT COUNT(*) FROM Studenti),0) AS DECIMAL(10,2))
         AS PercentualeStudentiConVoto;

-- 9. Migliore studente per corso.
WITH Medie AS
(
    SELECT i.CorsoId, s.StudenteId,
           s.Nome, s.Cognome,
           AVG(CAST(v.Voto AS DECIMAL(10,2))) AS Media
    FROM Iscrizioni i
    JOIN Studenti s ON s.StudenteId = i.StudenteId
    JOIN Voti v ON v.StudenteId = s.StudenteId
    GROUP BY i.CorsoId, s.StudenteId, s.Nome, s.Cognome
),
Classifica AS
(
    SELECT *, RANK() OVER (PARTITION BY CorsoId ORDER BY Media DESC) AS Posizione
    FROM Medie
)
SELECT * FROM Classifica WHERE Posizione = 1;

-- 10. Dataset finale per analisi/report.
SELECT
    s.StudenteId,
    s.Nome + ' ' + s.Cognome AS Studente,
    COUNT(v.Voto) AS NumeroVoti,
    AVG(CAST(v.Voto AS DECIMAL(10,2))) AS MediaVoti,
    MAX(v.Voto) AS VotoMassimo,
    MIN(v.Voto) AS VotoMinimo
FROM Studenti s
LEFT JOIN Voti v ON s.StudenteId = v.StudenteId
GROUP BY s.StudenteId, s.Nome, s.Cognome
ORDER BY MediaVoti DESC;
