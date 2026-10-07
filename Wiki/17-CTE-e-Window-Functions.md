# 17 - CTE e Window Functions

## CTE

Una Common Table Expression permette di costruire una query complessa in passaggi logici.

```sql
WITH MediaStudenti AS (
    SELECT
        StudenteId,
        AVG(Voto) AS Media
    FROM Voti
    GROUP BY StudenteId
)
SELECT *
FROM MediaStudenti;
```

## ROW_NUMBER

```sql
SELECT
    StudenteId,
    Voto,
    ROW_NUMBER() OVER (ORDER BY Voto DESC) AS Posizione
FROM Voti;
```

## RANK e DENSE_RANK

Sono utilizzati per creare classifiche.

## LAG e LEAD

Permettono di confrontare un valore con quello precedente o successivo.

Queste tecniche sono centrali nella Data Analytics professionale.
