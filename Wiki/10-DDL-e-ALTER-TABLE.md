# 10 - DDL e ALTER TABLE

## DDL

Il Data Definition Language gestisce la struttura del database.

Comandi principali:
- CREATE
- ALTER
- DROP

## ALTER TABLE

```sql
ALTER TABLE Studenti
ADD Telefono NVARCHAR(30) NULL;
```

## Rinominare una colonna

```sql
EXEC sp_rename
    'Studenti.StudentiID',
    'StudenteId',
    'COLUMN';
```

## Attenzione

Le modifiche strutturali possono avere conseguenze sulle query, applicazioni e relazioni esistenti. Devono quindi essere eseguite con attenzione.
