/*
============================================================
CORREZIONI - ESERCIZI BASE
Ogni soluzione è commentata per spiegare COSA fa,
A COSA serve e PERCHÉ viene utilizzata.
============================================================
*/
USE ScuolaDb;
GO

-- 1. Selezioniamo solo le colonne necessarie.
SELECT Nome, Cognome FROM Studenti;

-- 2. ORDER BY permette di ordinare il risultato.
SELECT Nome, Cognome FROM Studenti ORDER BY Cognome, Nome;

-- 3. TOP limita il numero di righe.
SELECT TOP 5 * FROM Studenti;

-- 4. LIKE con % cerca qualsiasi sequenza di caratteri.
SELECT * FROM Studenti WHERE Cognome LIKE 'A%';

-- 5. DISTINCT elimina i duplicati.
SELECT DISTINCT NomeCorso FROM Corsi;

-- 6. BETWEEN include gli estremi.
SELECT * FROM Studenti
WHERE DataNascita BETWEEN '2000-01-01' AND '2010-12-31';

-- 7. IS NOT NULL trova i valori presenti.
SELECT * FROM Studenti WHERE Email IS NOT NULL;

-- 8. IN confronta con più valori.
SELECT * FROM Studenti
WHERE Nome IN ('Mario', 'Luca', 'Anna');
