/* ESERCIZI BASE - SQL SERVER / DATA ANALYTICS
Ogni esercizio va svolto prima di consultare la correzione.
Temi: SELECT, WHERE, ORDER BY, DISTINCT, TOP, LIKE, IN, BETWEEN, NULL.
*/
USE ScuolaDb;
GO
-- 1. Mostra nome e cognome di tutti gli studenti.
-- 2. Ordina gli studenti per cognome.
-- 3. Mostra i primi 5 studenti.
-- 4. Trova i cognomi che iniziano con A.
-- 5. Mostra i corsi distinti.
-- 6. Trova gli studenti nati in un intervallo di date.
-- 7. Trova gli studenti con email valorizzata.
-- 8. Usa IN per filtrare un elenco di nomi.

/* CORREZIONE GUIDATA
SELECT Nome, Cognome FROM Studenti;
SELECT Nome, Cognome FROM Studenti ORDER BY Cognome, Nome;
SELECT TOP 5 * FROM Studenti;
SELECT * FROM Studenti WHERE Cognome LIKE 'A%';
SELECT DISTINCT NomeCorso FROM Corsi;
SELECT * FROM Studenti WHERE DataNascita BETWEEN '2000-01-01' AND '2010-12-31';
SELECT * FROM Studenti WHERE Email IS NOT NULL;
SELECT * FROM Studenti WHERE Nome IN ('Mario','Luca','Anna');
*/