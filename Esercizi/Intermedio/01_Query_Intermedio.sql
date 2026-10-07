/* ESERCIZI INTERMEDI - SQL SERVER / DATA ANALYTICS
Temi: JOIN, GROUP BY, HAVING, CASE, aggregazioni, sottoquery.
*/
USE ScuolaDb;
GO
-- 1. Mostra studente e corso usando JOIN.
-- 2. Mostra corso, docente e specializzazione.
-- 3. Conta gli studenti per corso.
-- 4. Mostra i corsi con almeno 2 iscritti.
-- 5. Calcola media, minimo e massimo voto per studente.
-- 6. Classifica i voti con CASE.
-- 7. Trova gli studenti con almeno un voto.
-- 8. Trova gli studenti senza voto.
-- 9. Trova i voti superiori alla media generale.
-- 10. Crea un report Studente -> Corso -> Docente -> Lezione -> Aula.

/* CORREZIONE GUIDATA
SELECT s.Nome,s.Cognome,c.NomeCorso FROM Studenti s JOIN Iscrizioni i ON s.StudenteId=i.StudenteId JOIN Corsi c ON i.CorsoId=c.CorsoId;
SELECT c.NomeCorso,d.Nome,d.Cognome,d.Specializzazione FROM Corsi c JOIN DocentiCorso dc ON c.CorsoId=dc.CorsoId JOIN Docenti d ON dc.DocenteId=d.DocenteId;
SELECT c.NomeCorso,COUNT(i.StudenteId) AS NumeroStudenti FROM Corsi c LEFT JOIN Iscrizioni i ON c.CorsoId=i.CorsoId GROUP BY c.NomeCorso;
SELECT c.NomeCorso,COUNT(i.StudenteId) AS NumeroStudenti FROM Corsi c LEFT JOIN Iscrizioni i ON c.CorsoId=i.CorsoId GROUP BY c.NomeCorso HAVING COUNT(i.StudenteId)>=2;
SELECT StudenteId,AVG(Voto) AS Media,MIN(Voto) AS Minimo,MAX(Voto) AS Massimo FROM Voti GROUP BY StudenteId;
SELECT StudenteId,Voto,CASE WHEN Voto<18 THEN 'Insufficiente' WHEN Voto<24 THEN 'Sufficiente' WHEN Voto<28 THEN 'Buono' ELSE 'Ottimo' END AS Valutazione FROM Voti;
SELECT DISTINCT s.StudenteId,s.Nome,s.Cognome FROM Studenti s JOIN Voti v ON s.StudenteId=v.StudenteId;
SELECT s.StudenteId,s.Nome,s.Cognome FROM Studenti s LEFT JOIN Voti v ON s.StudenteId=v.StudenteId WHERE v.StudenteId IS NULL;
SELECT * FROM Voti WHERE Voto>(SELECT AVG(Voto) FROM Voti);
*/