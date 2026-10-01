-- Creazione del Database in sql 
-- Create Database nome del databae
-- CREATE DATABASE ScuolaDb;-- 🎉🎉🎉🎉

-- Uso del Database
USE ScuolaDb;
GO

-- I TIPI DI DATI IN SQL SERVER

/*
	I TIPI DI DATI DI SQL
		INT      = INTERO
		CHAR     = CARATTERE (A)
		VARCHAR  = TESTO (STRINGA) 
		NVARCHAR = TESTO (STRINGA) 
		FLOAT    = DECIMALI (10, 2)
		DATE     = DATA 
*/
/*
CREATE TABLE Test(
    -- colonna 1,
    -- colonna 2,
    -- colonna 3,
    -- colonna 4,
    -- ...
);
*/

--EXEC sp_rename 'Studenti.StudentiID', 'StudenteId';

-- CREAZIONE TABELLE 
CREATE TABLE Studenti(

    -- ID univoco dello studente
    -- INT = numero intero
    -- PRIMARY KEY = chiave primaria (identifica ogni riga)
    -- IDENTITY(1,1) = auto incremento (parte da 1 e aumenta di 1)
    StudenteId INT NOT NULL PRIMARY KEY IDENTITY(1,1),

    -- Nome dello studente
    -- NVARCHAR(50) = testo Unicode (supporta caratteri speciali)
    -- NOT NULL = campo obbligatorio
    Nome NVARCHAR(50) NOT NULL,

    -- Cognome dello studente
    Cognome NVARCHAR(50) NOT NULL,

    -- Data di nascita
    -- DATE = formato YYYY-MM-DD
    -- NULL = opzionale
    DataNascita DATE NULL,

    -- Email
    -- UNIQUE = non possono esistere duplicati
    -- NOT NULL = obbligatorio
    Email NVARCHAR(150) UNIQUE NOT NULL,

    -- Numero di telefono
    -- VARCHAR = testo normale (no Unicode)
    Telefono VARCHAR(50) UNIQUE NOT NULL,

    -- Codice Fiscale
    -- CHAR(16) = lunghezza fissa di 16 caratteri
    CodiceFiscale CHAR(16) UNIQUE NOT NULL
);


-- Restuire tutte le righe della tabella Studenti
-- Select * from <Tabella> 
-- * = All (Tutte le righe)

SELECT * FROM Studenti;


-- Creazione della tabella Corsi
CREATE TABLE Corsi(
    CorsoId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NomeCorso NVARCHAR(100) NOT NULL,
    Descrizione NVARCHAR(255) NULL,
    Crediti INT NULL, 
    Durata INT NULL
);

-- Creazione della tabella Docenti

CREATE TABLE Docenti(
    DocenteId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) UNIQUE NULL,
    Specializzazione NVARCHAR(50) NOT NULL
);

-- Creazione della tabella Aule
CREATE TABLE Aule(
    AulaId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NomeAula NVARCHAR(150) NOT NULL,
	Capacita INT NOT NULL
);


-- => GiovanniId int primary key = 3 chiave primaria
-- => GiavanniId int foreign key= 3 chiave esterna

CREATE TABLE Voti(
    VotoId INT NOT NULL PRIMARY KEY IDENTITY(1,1),

    -- Colonne Foreign key 
    StudenteId INT NOT NULL,
    CorsoId INT NOT NULL,

    Voto DECIMAL(4,2) NOT NULL,
    DataVoto DATE NOT NULL,
    Note NVARCHAR(255) NULL,

    -- BIT = tipo boolan (true/false)
    Superato BIT NOT NULL DEFAULT 1,

    FOREIGN KEY (StudenteId) REFERENCES Studenti(StudenteId),
    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId)
);

select * from Corsi;


-- SELECT GETDATE(); Restituisce la date e l'ora del giorno stesso


/*
    Creazione della tabella Iscrizioni
    Relazionale:
    Studenti N: N Corsi

    Uno studente può frequentare più corsi
    un corso può avere più studenti
*/
CREATE TABLE Iscrizioni(
    IscrizioneId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    
    StudenteId INT NOT NULL,
    CorsoId INT NOT NULL,
    
    DataIscrizione DATE DEFAULT GETDATE() NOT NULL,
    Stato NVARCHAR(30) NOT NULL DEFAULT 'Attiva',

    FOREIGN KEY (StudenteId) REFERENCES StudentI(StudenteId),
    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),

    CONSTRAINT UQ_Iscrizione_Studente_Corso
        UNIQUE(StudenteId, CorsoId)
);

/* ============================================================
   Creazione della tabella ISCRIZIONI
   Relazione:
   Studenti N : N Corsi

   Uno studente può frequentare più corsi.
   Un corso può avere più studenti.
   ============================================================ */
CREATE TABLE DocentiCorso(
    DocenteCorso INT PRIMARY KEY IDENTITY(1,1),
    DocenteId INT NOT NULL,
    CorsoId INT NOT NULL,
    
    DataRegistrazione DATE NULL,
    DataAssegnazione DATE NULL,
    Ruolo NVARCHAR(50) NULL,
            --  📈               ->              📈
    FOREIGN KEY (DocenteId) REFERENCES Docenti(DocenteId),
    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),

    -- Evita di assegnare due volte
    -- lo stesso docente allo stesso corso
    CONSTRAINT UQ_Docente_Corso
        UNIQUE (DocenteId, CorsoId)
);

/* ============================================================
   Creazione della tabella LEZIONI
   Relazione:
   Corso 1 : N Lezioni
   Aula 1 : N Lezioni
   ============================================================ */
CREATE TABLE Lezioni(
    LezioneId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    CorsoId INT NOT NULL,
    AulaId INT NOT NULL,
    
    Titolo NVARCHAR(100) NOT NULL,
    Descrizione VARCHAR(MAX) NULL,
    DataLezione DATE NOT NULL,
    OraInizio TIME NOT NULL,
    OraFine TIME NOT NULL,
    Durata INT NULL,

    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId), 
    FOREIGN KEY (AulaId) REFERENCES Aule(AulaId)
);