/*
	ALTER TABLE - Cos'è e perché si usa in sql server?
	Alter table serve per modificare una tabella già esistente, 
	senza doverla ricreare.
	Con Alter Table:
	. Aggiungere colonne
	. modifcare colonne
	. eliminare colonne
	. aggiungere vincoli(PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK)
	. eliminare vincoli
	. rinominare colonne
	. cambiare i tipi di dati
	. modificare una colonna in default
*/
-- Aggiunge una colonna nella tabella Studenti
ALTER TABLE Studenti
Add Indirizzo NVARCHAR(150) NULL,
	Nazione CHAR(50) NULL,
	Provincia NVARCHAR(150) null;

SELECT * FROM Studenti;

-- Add AGGIUNGE UNA NUOVA COLONNA
-- NULL significa che è opzionale 

-- Modificare una colonna(Tipo di dato)
-- Obiettivo:
-- Cambiare il tipo di dato della colonna Telefono da (NVARCHAR(50) A VARCHAR(20))
ALTER TABLE Studenti
ALTER COLUMN Telefono VARCHAR(50) NOT NULL;

-- RINOMINARE UNA COLONNA 
EXEC sp_rename 'Studenti.DataNascita', 'Data_di_Nascita';

-- RINOMINARE UNA TABELLA
EXEC sp_rename 'Studenti', 'Studentes';

-- ELIMINARE UNA COLONNA
ALTER TABLE Studenti
DROP COLUMN Indirizzo, Nazione,Provincia;

-- AGGIUNGERE UNA FOREIGN KEY 
-- Aggiungere un FK alla tabella dei Voti
ALTER TABLE Voti
ADD CONSTRAINT FK_Voti_Studenti  
FOREIGN KEY (StudenteId) REFERENCES Studenti(StudenteId);

-- ELIMINARE UNA FOREIGN KEY 
ALTER TABLE Voti
DROP CONSTRAINT FK_Voti_Studenti;

-- AGGIUNGERE UN VINCOLO UNIQUE
ALTER TABLE Studenti
ADD CONSTRAINT UQ_Studenti_Telefono UNIQUE(Telefono);

-- AGGIUNGERE UN VALORE DI DEFAULT
-- Impostare Superato = 1 nei voti
ALTER TABLE Voti
ADD CONSTRAINT DF_Voti_Superato DEFAULT 1 FOR Superato;

