# 02 - Installazione SQL Server

## Obiettivo

Preparare l'ambiente di lavoro per esercitarsi con SQL Server.

## Componenti

Sono normalmente necessari:
- SQL Server Database Engine;
- SQL Server Management Studio (SSMS);
- eventualmente Azure Data Studio o VS Code con estensioni SQL.

## Verifica della connessione

Dopo l'installazione collegarsi all'istanza SQL Server e verificare:

```sql
SELECT @@VERSION;
SELECT DB_NAME() AS DatabaseCorrente;
```

## Consiglio didattico

Usare un database dedicato al corso, come `ScuolaDb`, per evitare di modificare database di sistema.
