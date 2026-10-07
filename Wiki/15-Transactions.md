# 15 - Transactions

## Cos'è

Una transazione raggruppa più operazioni in un'unica unità logica.

## COMMIT

Conferma le modifiche.

## ROLLBACK

Annulla le modifiche della transazione.

## Esempio

```sql
BEGIN TRANSACTION;

UPDATE Studenti
SET Email = 'test@email.it'
WHERE StudenteId = 1;

COMMIT TRANSACTION;
```

In caso di errore:

```sql
ROLLBACK TRANSACTION;
```

Le transazioni sono fondamentali quando più modifiche devono essere eseguite tutte oppure nessuna.
