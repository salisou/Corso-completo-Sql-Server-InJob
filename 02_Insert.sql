USE ScuolaDb;
go


-- Insert = la funzione insert permette di inserire dati all'interno di una tabella


/*
	INSERT INTO <TABLE> 
			(
			 Colonna1, 
			 Colonna2, 
			 Colonna3, 
			 Colonna4, 
			 Colonna5, 
			 colonna...
			 )
		VALUES 
			(
			 valore numerico, 
			 'valore testo', 
			 valore3, 
			 valore4, 
			 valore5, 
			 valore...
			 )
*/



INSERT INTO Studenti 
            (
             Nome, 
             Cognome, 
             DataNascita, 
             Email, 
             Telefono, 
             Codicefiscale
             )
        VALUES 
            (
             'katia', 
             'Casale', 
             '1973-03-27', 
             'k.casale@mail.com', 
             '+39 324569871', 
             'KCL73PZY123TGP5P'
             );


INSERT INTO Studenti 
			(
			 Nome, 
			 Cognome, 
			 DataNascita, 			
			 Email, 				
			 Telefono, 				
			 Codicefiscale			
			 )						
		VALUES 						
			('Maio', 'Rossi', '2000-01-10', 'mario.sossi@gmail.com', '+33 1236547899','CO7T12H501Z');
		

SELECT * FROM Studenti;

-- EXEC = ESEGUE 
-- sp_rename = rinomina il nome della tabella o colonna 
/*
	esempio: 
			EXEC sp_rename (vechio nome della tabella), (nuovo valore)
			EXEC sp_rename (vechio nome della tabella.colonna), (nuovo nome della colonna)
*/

EXEC sp_rename 'studenti.Data_Nascita', 'DataNascita'; -- modifica il nome della colonna
EXEC sp_rename 'students', 'Studenti'; -- Modifica il nome della tabella


INSERT INTO 
		Studenti(Nome, Cognome, Email, CodiceFiscale, DataNascita, Telefono)
VALUES 
	   ('Marco', 'Di Moro', 'marco.dimoro@gmail.com', 'DMRMRC87T12H501Z', '1987/05/12', '+393478945612'),
	   ('Stefania', 'Bianca', 's.bianca@ferrari.it', 'BNCSTF90A41F205X', '1990/01/25', '+393478945613'),
	   ('Luca', 'Rossi', 'luca.rossi@gmail.com', 'RSSLCU95C15F839K', '1995/03/15', '+393478945614'),
	   ('Anna', 'Verdi', 'anna.verdi@gmail.com', 'VRDNNA92D55H501T', '1992/04/15', '+393478945615'),
	   ('Giulia', 'Ferrari', 'giulia.ferrari@gmail.com', 'FRRGLI98L22F205A', '1998/07/22', '+393478945616');


-- Popolamento completo della tabella studenti 
INSERT INTO Studenti
	(
		Nome,
		Cognome,
		DataNascita,
		Email,
		Telefono,
		CodiceFiscale
	)
VALUES
	('Mario', 'Rossi', NULL, 'mario2.rossi@libero.it', '+393874665', 'HFJFNVJIEIWJSFB'),
	('Luca', 'Bianchi', NULL, 'luca.bianchi@libero.it', '+393874659', 'LCABNC01A01H501'),
	('Giulia', 'Verdi', NULL, 'giulia.verdi@gmail.com', '+393874660', 'GLIVRD02B12F205'),
	('Anna', 'Ferrari', NULL, 'anna.ferrari@yahoo.it', '+393874661', 'NNAFRR03C23L219'),
	('Marco', 'Romano', NULL, 'marco.romano@outlook.it', '+393874662', 'MRCRMN04D14G273'),
	('Sara', 'Gallo', NULL, 'sara.gallo@icloud.com', '+393874663', 'SRAGLL05E55C351'),
	('Davide', 'Conti', NULL, 'davide.conti@virgilio.it', '+393874664', 'DVDCNT06F66D612'),
	('Mario','Rossi',NULL,'mario.rossi@libero.it','+393823493834','RSIMRT45E33T494K'),

	('Mario','Rossi','2000-01-10','mario.rossi1@email.com','300000001','RSSMRA00A10H501A'),
	('Luca','Bianchi','1999-03-15','luca.bianchi2@email.com','300000002','BNCLCU99C15F205B'),
	('Anna','Verdi','2001-07-20','anna.verdi3@email.com','300000003','VRDANN01L20H501C'),
	('Marco','Neri','1998-11-05','marco.neri4@email.com','300000004','NRIMRC98S05F205D'),
	('Sara','Blu','2002-02-28','sara.blu5@email.com','300000005','BLUSRA02B28H501E'),
	('Paolo','Gialli',NULL,'paolo.gialli6@email.com','300000006','GLLPLA90A01H501F'),
	('Giulia','Rosa','2000-06-12','giulia.rosa7@email.com','300000007','RSOGLI00H12F205G'),
	('Davide','Conti','1997-09-09','davide.conti8@email.com','300000008','CNTDVD97P09H501H'),
	('Elena','Ferrari','2001-04-18','elena.ferrari9@email.com','300000009','FRRLNE01D18F205I'),
	('Simone','Greco','1999-12-30','simone.greco10@email.com','300000010','GRCSMN99T30H501J'),

	('Alessia','Romano','2002-08-14','alessia.romano11@email.com','300000011','RMNLSS02M14F205K'),
	('Matteo','Colombo','2000-10-01','matteo.colombo12@email.com','300000012','CLMMTT00R01H501L'),
	('Francesca','Ricci','1998-01-22','francesca.ricci13@email.com','300000013','RCCFNC98A22F205M'),
	('Andrea','Marino','2001-05-05','andrea.marino14@email.com','300000014','MRNNDR01E05H501N'),
	('Chiara','Lombardi','1999-07-17','chiara.lombardi15@email.com','300000015','LMBCHR99L17F205O'),
	('Stefano','Moretti',NULL,'stefano.moretti16@email.com','300000016','MRTSFN90A01H501P'),
	('Valentina','Barbieri','2000-03-03','valentina.barbieri17@email.com','300000017','BRBVLT00C03F205Q'),
	('Giorgio','Fontana','1997-06-25','giorgio.fontana18@email.com','300000018','FNTGRG97H25H501R'),
	('Martina','Santoro','2002-09-11','martina.santoro19@email.com','300000019','SNTMRT02P11F205S'),
	('Alberto','Rinaldi','1998-02-07','alberto.rinaldi20@email.com','300000020','RNLALB98B07H501T'),

	('Federica','Caruso','2001-11-19','federica.caruso21@email.com','300000021','CRSFDR01S19F205U'),
	('Daniele','Leone','1999-04-23','daniele.leone22@email.com','300000022','LNEDNL99D23H501V'),
	('Silvia','Serra','2000-12-12','silvia.serra23@email.com','300000023','SRRSLV00T12F205W'),
	('Roberto','Testa','1997-08-30','roberto.testa24@email.com','300000024','TSTRRT97M30H501X'),
	('Laura','De Luca','2002-01-09','laura.deluca25@email.com','300000025','DLCLRA02A09F205Y'),
	('Antonio','Pellegrini','1998-05-16','antonio.pellegrini26@email.com','300000026','PLLNTN98E16H501Z'),
	('Claudia','Fiore','2001-06-06','claudia.fiore27@email.com','300000027','FIOCLD01H06F205A'),
	('Fabio','Costa',NULL,'fabio.costa28@email.com','300000028','CSTFBA90A01H501B'),
	('Irene','Gatti','2000-09-27','irene.gatti29@email.com','300000029','GTTIRN00P27F205C'),
	('Emanuele','Villa','1999-10-10','emanuele.villa30@email.com','300000030','VLLMNL99R10H501D');


	INSERT INTO Corsi
(
    NomeCorso,
    Descrizione,
    Crediti,
    Durata
)
VALUES
('Programmazione C#', 'Fondamenti della programmazione con C#', 6, 60),
('Programmazione Python', 'Programmazione Python da zero', 6, 60),
('SQL Server', 'Database relazionali e SQL Server', 5, 50),
('HTML e CSS', 'Sviluppo di pagine web', 4, 40),
('JavaScript', 'Programmazione web lato client', 5, 50),
('ASP.NET Core', 'Sviluppo di applicazioni web con .NET', 6, 60),
('Blazor', 'Sviluppo web con Blazor', 5, 50),
('Entity Framework Core', 'Accesso ai dati con Entity Framework', 5, 50),
('Git e GitHub', 'Controllo versione e collaborazione', 3, 30),
('Linux', 'Fondamenti del sistema Linux', 4, 40),
('PHP', 'Programmazione web con PHP', 5, 50),
('Laravel', 'Framework Laravel per applicazioni web', 6, 60),
('MySQL', 'Database relazionali con MySQL', 5, 50),
('MongoDB', 'Database NoSQL con MongoDB', 5, 50),
('Data Analysis', 'Analisi dei dati con Python', 6, 60),
('Pandas', 'Analisi dati con Pandas', 5, 50),
('NumPy', 'Calcolo numerico con NumPy', 4, 40),
('Matplotlib', 'Visualizzazione dei dati', 4, 40),
('Tkinter', 'Interfacce grafiche con Python', 5, 50),
('FastAPI', 'Creazione di API con Python', 6, 60),
('Flask', 'Sviluppo web con Flask', 5, 50),
('Django', 'Sviluppo web con Django', 6, 60),
('Java', 'Fondamenti della programmazione Java', 6, 60),
('Android', 'Sviluppo applicazioni Android', 6, 60),
('Git avanzato', 'Funzionalità avanzate di Git', 4, 40),
('Docker', 'Containerizzazione delle applicazioni', 5, 50),
('REST API', 'Progettazione e sviluppo di API REST', 5, 50),
('Microservizi', 'Architetture a microservizi', 6, 60),
('Cloud Computing', 'Fondamenti del cloud computing', 5, 50),
('Cyber Security', 'Fondamenti della sicurezza informatica', 5, 50);
GO


/* ============================================================
   3. DOCENTI
   ============================================================ */

INSERT INTO Docenti
(
    Nome,
    Cognome,
    Email,
    Specializzazione
)
VALUES
('Moussa', 'Salisou', 'moussa.salisou@scuola.it', 'C# e .NET'),
('Paolo', 'Rossi', 'paolo.rossi@scuola.it', 'Python'),
('Laura', 'Bianchi', 'laura.bianchi@scuola.it', 'SQL Server'),
('Marco', 'Ferrari', 'marco.ferrari@scuola.it', 'JavaScript'),
('Anna', 'Romano', 'anna.romano@scuola.it', 'HTML e CSS'),
('Luca', 'Colombo', 'luca.colombo@scuola.it', 'ASP.NET'),
('Sara', 'Ricci', 'sara.ricci@scuola.it', 'Blazor'),
('Andrea', 'Marino', 'andrea.marino@scuola.it', 'Entity Framework'),
('Giulia', 'Greco', 'giulia.greco@scuola.it', 'Git'),
('Davide', 'Bruno', 'davide.bruno@scuola.it', 'Linux'),
('Elena', 'Gallo', 'elena.gallo@scuola.it', 'PHP'),
('Stefano', 'Conti', 'stefano.conti@scuola.it', 'Laravel'),
('Francesca', 'De Luca', 'francesca.deluca@scuola.it', 'MySQL'),
('Simone', 'Mancini', 'simone.mancini@scuola.it', 'MongoDB'),
('Valentina', 'Costa', 'valentina.costa@scuola.it', 'Data Analysis'),
('Federico', 'Fontana', 'federico.fontana@scuola.it', 'Pandas'),
('Martina', 'Moretti', 'martina.moretti@scuola.it', 'NumPy'),
('Gabriele', 'Barbieri', 'gabriele.barbieri@scuola.it', 'Matplotlib'),
('Irene', 'Rinaldi', 'irene.rinaldi@scuola.it', 'Tkinter'),
('Alessandro', 'Caruso', 'alessandro.caruso@scuola.it', 'FastAPI'),
('Chiara', 'Leone', 'chiara.leone@scuola.it', 'Flask'),
('Lorenzo', 'Longo', 'lorenzo.longo@scuola.it', 'Django'),
('Beatrice', 'Pellegrini', 'beatrice.pellegrini@scuola.it', 'Java'),
('Nicola', 'Serra', 'nicola.serra@scuola.it', 'Android'),
('Marta', 'Villa', 'marta.villa@scuola.it', 'Git'),
('Pietro', 'Ferraro', 'pietro.ferraro@scuola.it', 'Docker'),
('Alice', 'Sanna', 'alice.sanna@scuola.it', 'REST API'),
('Riccardo', 'Testa', 'riccardo.testa@scuola.it', 'Microservizi'),
('Noemi', 'Piras', 'noemi.piras@scuola.it', 'Cloud Computing'),
('Emanuele', 'Fiore', 'emanuele.fiore@scuola.it', 'Cyber Security');
GO


/* ============================================================
   4. AULE
   ============================================================ */

INSERT INTO Aule
(
    NomeAula,
    Capacita
)
VALUES
('Aula A01', 20),
('Aula A02', 25),
('Aula A03', 30),
('Aula A04', 20),
('Aula A05', 25),
('Laboratorio B01', 20),
('Laboratorio B02', 25),
('Laboratorio B03', 30),
('Laboratorio B04', 20),
('Laboratorio B05', 25),
('Aula C01', 35),
('Aula C02', 40),
('Aula C03', 30),
('Aula C04', 35),
('Aula C05', 40),
('Laboratorio D01', 20),
('Laboratorio D02', 25),
('Laboratorio D03', 30),
('Laboratorio D04', 20),
('Laboratorio D05', 25),
('Aula E01', 35),
('Aula E02', 40),
('Aula E03', 30),
('Aula E04', 35),
('Aula E05', 40),
('Laboratorio F01', 20),
('Laboratorio F02', 25),
('Laboratorio F03', 30),
('Laboratorio F04', 20),
('Laboratorio F05', 25);
GO


/* ============================================================
   5. ISCRIZIONI
   ============================================================ */

INSERT INTO Iscrizioni
(
    StudenteId,
    CorsoId,
    DataIscrizione,
    Stato
)
VALUES
(1, 1, '2026-01-10', 'Attiva'),
(2, 2, '2026-01-11', 'Attiva'),
(3, 3, '2026-01-12', 'Attiva'),
(4, 4, '2026-01-13', 'Attiva'),
(5, 5, '2026-01-14', 'Attiva'),
(6, 6, '2026-01-15', 'Attiva'),
(7, 7, '2026-01-16', 'Attiva'),
(8, 8, '2026-01-17', 'Attiva'),
(9, 9, '2026-01-18', 'Attiva'),
(10, 10, '2026-01-19', 'Attiva'),
(11, 11, '2026-01-20', 'Attiva'),
(12, 12, '2026-01-21', 'Attiva'),
(13, 13, '2026-01-22', 'Attiva'),
(14, 14, '2026-01-23', 'Attiva'),
(15, 15, '2026-01-24', 'Attiva'),
(16, 16, '2026-01-25', 'Attiva'),
(17, 17, '2026-01-26', 'Attiva'),
(18, 18, '2026-01-27', 'Attiva'),
(19, 19, '2026-01-28', 'Attiva'),
(20, 20, '2026-01-29', 'Attiva'),
(21, 21, '2026-01-30', 'Attiva'),
(22, 22, '2026-02-01', 'Attiva'),
(23, 23, '2026-02-02', 'Attiva'),
(24, 24, '2026-02-03', 'Attiva'),
(25, 25, '2026-02-04', 'Attiva'),
(26, 26, '2026-02-05', 'Attiva'),
(27, 27, '2026-02-06', 'Attiva'),
(28, 28, '2026-02-07', 'Attiva'),
(29, 29, '2026-02-08', 'Attiva'),
(30, 30, '2026-02-09', 'Attiva');
GO


/* ============================================================
   6. DOCENTICORSO
   ============================================================ */

INSERT INTO DocentiCorso
(
    DocenteId,
    CorsoId,
    DataAssegnazione,
    Ruolo
)
VALUES
(1, 1, '2026-01-05', 'Docente'),
(2, 2, '2026-01-05', 'Docente'),
(3, 3, '2026-01-05', 'Docente'),
(4, 4, '2026-01-05', 'Docente'),
(5, 5, '2026-01-05', 'Docente'),
(6, 6, '2026-01-05', 'Docente'),
(7, 7, '2026-01-05', 'Docente'),
(8, 8, '2026-01-05', 'Docente'),
(9, 9, '2026-01-05', 'Docente'),
(10, 10, '2026-01-05', 'Docente'),
(11, 11, '2026-01-06', 'Docente'),
(12, 12, '2026-01-06', 'Docente'),
(13, 13, '2026-01-06', 'Docente'),
(14, 14, '2026-01-06', 'Docente'),
(15, 15, '2026-01-06', 'Docente'),
(16, 16, '2026-01-06', 'Docente'),
(17, 17, '2026-01-06', 'Docente'),
(18, 18, '2026-01-06', 'Docente'),
(19, 19, '2026-01-06', 'Docente'),
(20, 20, '2026-01-06', 'Docente'),
(21, 21, '2026-01-07', 'Docente'),
(22, 22, '2026-01-07', 'Docente'),
(23, 23, '2026-01-07', 'Docente'),
(24, 24, '2026-01-07', 'Docente'),
(25, 25, '2026-01-07', 'Docente'),
(26, 26, '2026-01-07', 'Docente'),
(27, 27, '2026-01-07', 'Docente'),
(28, 28, '2026-01-07', 'Docente'),
(29, 29, '2026-01-07', 'Docente'),
(30, 30, '2026-01-07', 'Docente');
GO


/* ============================================================
   7. LEZIONI
   ============================================================ */

INSERT INTO Lezioni
(
    CorsoId,
    AulaId,
    Titolo,
    Descrizione,
    DataLezione,
    OraInizio,
    OraFine,
    Durata
)
VALUES
(1, 1, 'Introduzione a C#', 'Introduzione al linguaggio C#', '2026-02-02', '09:00', '11:00', 120),
(2, 2, 'Introduzione a Python', 'Fondamenti di Python', '2026-02-03', '09:00', '11:00', 120),
(3, 3, 'Introduzione a SQL', 'Fondamenti dei database', '2026-02-04', '09:00', '11:00', 120),
(4, 4, 'HTML Base', 'Struttura di una pagina HTML', '2026-02-05', '09:00', '11:00', 120),
(5, 5, 'JavaScript Base', 'Introduzione a JavaScript', '2026-02-06', '09:00', '11:00', 120),
(6, 6, 'ASP.NET Core', 'Creazione di applicazioni web', '2026-02-09', '09:00', '11:00', 120),
(7, 7, 'Blazor', 'Introduzione a Blazor', '2026-02-10', '09:00', '11:00', 120),
(8, 8, 'Entity Framework', 'Accesso al database', '2026-02-11', '09:00', '11:00', 120),
(9, 9, 'Git Base', 'Fondamenti di Git', '2026-02-12', '09:00', '11:00', 120),
(10, 10, 'Linux Base', 'Comandi Linux fondamentali', '2026-02-13', '09:00', '11:00', 120),
(11, 11, 'PHP Base', 'Introduzione a PHP', '2026-02-16', '09:00', '11:00', 120),
(12, 12, 'Laravel Base', 'Introduzione a Laravel', '2026-02-17', '09:00', '11:00', 120),
(13, 13, 'MySQL', 'Database MySQL', '2026-02-18', '09:00', '11:00', 120),
(14, 14, 'MongoDB', 'Database NoSQL', '2026-02-19', '09:00', '11:00', 120),
(15, 15, 'Data Analysis', 'Analisi dei dati', '2026-02-20', '09:00', '11:00', 120),
(16, 16, 'Pandas', 'DataFrame e analisi dati', '2026-02-23', '09:00', '11:00', 120),
(17, 17, 'NumPy', 'Calcolo numerico', '2026-02-24', '09:00', '11:00', 120),
(18, 18, 'Matplotlib', 'Grafici e visualizzazioni', '2026-02-25', '09:00', '11:00', 120),
(19, 19, 'Tkinter', 'Interfacce grafiche', '2026-02-26', '09:00', '11:00', 120),
(20, 20, 'FastAPI', 'Creazione API', '2026-02-27', '09:00', '11:00', 120),
(21, 21, 'Flask', 'Applicazioni web Flask', '2026-03-02', '09:00', '11:00', 120),
(22, 22, 'Django', 'Applicazioni web Django', '2026-03-03', '09:00', '11:00', 120),
(23, 23, 'Java', 'Programmazione Java', '2026-03-04', '09:00', '11:00', 120),
(24, 24, 'Android', 'Sviluppo Android', '2026-03-05', '09:00', '11:00', 120),
(25, 25, 'Git Avanzato', 'Funzioni avanzate Git', '2026-03-06', '09:00', '11:00', 120),
(26, 26, 'Docker', 'Container Docker', '2026-03-09', '09:00', '11:00', 120),
(27, 27, 'REST API', 'API REST', '2026-03-10', '09:00', '11:00', 120),
(28, 28, 'Microservizi', 'Architetture a microservizi', '2026-03-11', '09:00', '11:00', 120),
(29, 29, 'Cloud', 'Introduzione al cloud', '2026-03-12', '09:00', '11:00', 120),
(30, 30, 'Cyber Security', 'Sicurezza informatica', '2026-03-13', '09:00', '11:00', 120);
GO


/* ============================================================
   8. VOTI
   ============================================================ */

INSERT INTO Voti
(
    StudenteId,
    CorsoId,
    Voto,
    DataVoto,
    Note,
    Superato
)
VALUES
(1, 1, 28.00, '2026-03-20', 'Ottima preparazione', 1),
(2, 2, 25.00, '2026-03-20', 'Buona preparazione', 1),
(3, 3, 30.00, '2026-03-21', 'Eccellente', 1),
(4, 4, 24.00, '2026-03-21', 'Buon lavoro', 1),
(5, 5, 27.00, '2026-03-22', 'Molto buona', 1),
(6, 6, 22.00, '2026-03-22', 'Sufficiente', 1),
(7, 7, 29.00, '2026-03-23', 'Ottimo risultato', 1),
(8, 8, 26.00, '2026-03-23', 'Buona prova', 1),
(9, 9, 30.00, '2026-03-24', 'Eccellente', 1),
(10, 10, 21.00, '2026-03-24', 'Sufficiente', 1),
(11, 11, 28.00, '2026-03-25', 'Ottimo', 1),
(12, 12, 23.00, '2026-03-25', 'Buono', 1),
(13, 13, 27.00, '2026-03-26', 'Molto buona', 1),
(14, 14, 25.00, '2026-03-26', 'Buona', 1),
(15, 15, 30.00, '2026-03-27', 'Eccellente', 1),
(16, 16, 26.00, '2026-03-27', 'Buona prova', 1),
(17, 17, 24.00, '2026-03-28', 'Buon risultato', 1),
(18, 18, 29.00, '2026-03-28', 'Ottimo', 1),
(19, 19, 22.00, '2026-03-29', 'Sufficiente', 1),
(20, 20, 28.00, '2026-03-29', 'Ottimo risultato', 1),
(21, 21, 20.00, '2026-03-30', 'Da migliorare', 1),
(22, 22, 27.00, '2026-03-30', 'Buona preparazione', 1),
(23, 23, 30.00, '2026-03-31', 'Eccellente', 1),
(24, 24, 24.00, '2026-03-31', 'Buona prova', 1),
(25, 25, 26.00, '2026-04-01', 'Buon risultato', 1),
(26, 26, 23.00, '2026-04-01', 'Sufficiente', 1),
(27, 27, 29.00, '2026-04-02', 'Ottimo', 1),
(28, 28, 25.00, '2026-04-02', 'Buona prova', 1),
(29, 29, 28.00, '2026-04-03', 'Molto buona', 1),
(30, 30, 21.00, '2026-04-03', 'Sufficiente', 1);
GO