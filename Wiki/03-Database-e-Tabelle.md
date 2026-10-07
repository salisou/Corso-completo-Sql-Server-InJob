# 03 - Database e Tabelle

## Database

Un database è un contenitore organizzato di dati.

## Creazione

```sql
CREATE DATABASE ScuolaDb;
GO

USE ScuolaDb;
GO
```

## Tabella

Una tabella contiene colonne e righe.

```sql
CREATE TABLE Studenti (
    StudenteId INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) NULL
);
```

## Concetti fondamentali

- **colonna**: descrive un attributo;
- **riga**: rappresenta un record;
- **PRIMARY KEY**: identifica univocamente il record;
- **FOREIGN KEY**: collega due tabelle;
- **NULL**: indica un valore assente/non disponibile.
