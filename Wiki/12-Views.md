# 12 - Views

## Cos'è

Una View è una query salvata che può essere utilizzata come una tabella logica.

## Esempio

```sql
CREATE OR ALTER VIEW vw_Studenti
AS
SELECT
    StudenteId,
    Nome,
    Cognome,
    Email
FROM Studenti;
GO
```

## Utilizzo

```sql
SELECT *
FROM vw_Studenti;
```

## Perché usarle?

Le View sono utili per:
- semplificare query complesse;
- creare dataset per report;
- nascondere la complessità dei JOIN;
- standardizzare la lettura dei dati.

Nel repository le View sono organizzate in Base, Intermedio e Avanzato.
