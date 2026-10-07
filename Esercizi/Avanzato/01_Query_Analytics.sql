/* ESERCIZI AVANZATI - DATA ANALYTICS
Temi: CTE, RANK, DENSE_RANK, ROW_NUMBER, LAG, KPI, report analitici.
*/
USE ScuolaDb;
GO
-- 1. Crea una CTE con la media per studente.
-- 2. Classifica gli studenti con RANK().
-- 3. Usa ROW_NUMBER() per numerare i voti di ogni studente.
-- 4. Classifica i corsi con DENSE_RANK().
-- 5. Confronta ogni voto con la media generale.
-- 6. Recupera il voto precedente con LAG().
-- 7. Calcola la differenza dal voto precedente.
-- 8. Costruisci KPI del corso.
-- 9. Trova il migliore studente per corso.
-- 10. Crea un dataset finale pronto per Excel/Power BI.

/* CORREZIONE GUIDATA
WITH MediaStudenti AS (SELECT StudenteId,AVG(CAST(Voto AS DECIMAL(10,2))) Media FROM Voti GROUP BY StudenteId) SELECT *,RANK() OVER(ORDER BY Media DESC) Posizione FROM MediaStudenti;
SELECT StudenteId,Voto,ROW_NUMBER() OVER(PARTITION BY StudenteId ORDER BY Voto DESC) NumeroVoto FROM Voti;
SELECT StudenteId,Voto,AVG(Voto) OVER() MediaGenerale,Voto-AVG(Voto) OVER() Scostamento FROM Voti;
SELECT StudenteId,Voto,LAG(Voto) OVER(PARTITION BY StudenteId ORDER BY Voto) VotoPrecedente FROM Voti;
SELECT StudenteId,Voto,Voto-LAG(Voto) OVER(PARTITION BY StudenteId ORDER BY Voto) Differenza FROM Voti;
*/