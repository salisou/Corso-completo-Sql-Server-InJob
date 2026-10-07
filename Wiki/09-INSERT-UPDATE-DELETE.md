# 09 - INSERT, UPDATE, DELETE

## INSERT

Inserisce nuovi dati.

```sql
INSERT INTO Studenti (Nome, Cognome, Email)
VALUES ('Mario', 'Rossi', 'mario.rossi@email.it');
```

## UPDATE

Modifica dati esistenti.

```sql
UPDATE Studenti
SET Email = 'nuova@email.it'
WHERE StudenteId = 1;
```

## DELETE

Elimina dati.

```sql
DELETE FROM Studenti
WHERE StudenteId = 1;
```

## Regola professionale

Prima di UPDATE o DELETE eseguire sempre una SELECT con lo stesso WHERE per verificare i record coinvolti.
