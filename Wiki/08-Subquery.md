# 08 - Subquery

## Cos'è

Una subquery è una query inserita dentro un'altra query.

## Esempio

Trovare gli studenti con un voto superiore alla media:

```sql
SELECT *
FROM Voti
WHERE Voto > (
    SELECT AVG(Voto)
    FROM Voti
);
```

## Perché usarla?

È utile quando il risultato di una query deve essere utilizzato come condizione o origine dati di un'altra query.

## Alternative avanzate

Quando una subquery diventa complessa, può essere preferibile usare una CTE.
