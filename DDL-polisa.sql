IF OBJECT_ID ('agencija.Preuzima_Primerke', 'U') is not null
drop table agencija.Preuzima_Primerke;
IF OBJECT_ID ('agencija.Isplacuje_Zaradu', 'U') is not null
drop table agencija.Isplacuje_Zaradu;
IF OBJECT_ID ('agencija.SeNavodi', 'U') is not null
drop table agencija.seNavodi;
IF OBJECT_ID ('agencija.Poseduje', 'U') is not null
drop table agencija.Poseduje;
IF OBJECT_ID ('agencija.Aneksiranje', 'U') is not null
drop table agencija.Aneksiranje;
IF OBJECT_ID ('agencija.Polisa', 'U') is not null
drop table agencija.Polisa;
IF OBJECT_ID ('agencija.Naslednik', 'U') is not null
drop table agencija.Naslednik;
IF OBJECT_ID ('agencija.Ugovarac', 'U') is not null
drop table agencija.Ugovarac;
IF OBJECT_ID ('agencija.Program', 'U') is not null
drop table agencija.Program;
IF OBJECT_ID ('agencija.Osiguravajuca_kuca', 'U') is not null
drop table agencija.Osiguravajuca_kuca;
IF OBJECT_ID ('agencija.Agencija', 'U') is not null
drop table agencija.Agencija;

IF EXISTS (select * from sys.sequences where name='ID_Agencije_seq') 
drop sequence agencija.ID_Agencije_seq
go
IF EXISTS (select * from sys.sequences where name='ID_OK_seq') 
drop sequence agencija.ID_OK_seq
go
IF EXISTS (select * from sys.sequences where name='ID_PR_seq') 
drop sequence agencija.ID_PR_seq
go
IF EXISTS (select * from sys.sequences where name='ID_KL_seq') 
drop sequence agencija.ID_KL_seq
go
IF EXISTS (select * from sys.sequences where name='ID_NAS_seq') 
drop sequence agencija.ID_NAS_seq
go
IF EXISTS (select * from sys.sequences where name='ID_POLI_seq') 
drop sequence agencija.ID_POLI_seq
go
IF EXISTS (select * from sys.sequences where name='ID_ANEKS_seq') 
drop sequence agencija.ID_ANEKS_seq
go

IF SCHEMA_ID('agencija') is not null
drop schema agencija;
go

CREATE SCHEMA agencija authorization dbo;
go

CREATE SEQUENCE agencija.ID_Agencije_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Agencija (
	ID_Agencije numeric(5) not null,
	Naziv varchar(15) not null,
	Mesto varchar(25),
	Adresa varchar(35),
	Sediste varchar(35),
	Email varchar(30),
	Telefon varchar(15)
	CONSTRAINT PK_Agencija PRIMARY KEY(ID_Agencije)
)


CREATE SEQUENCE agencija.ID_OK_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Osiguravajuca_kuca (
	ID_OK numeric(5) not null,
	Naziv_ok varchar(15) not null,
	Mesto_ok varchar(25),
	Adresa_ok varchar(35),
	Sediste_ok varchar(35),
	Email_ok varchar(30),
	Telefon_ok varchar(15),
	CONSTRAINT PK_Osiguravajuca_kuca PRIMARY KEY(ID_OK)
)


CREATE SEQUENCE agencija.ID_PR_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Program (
	ID_PR numeric(5) not null,
	Vrsta varchar(25) not null,
	Opis varchar(100) not null,
	CONSTRAINT PK_Program PRIMARY KEY(ID_PR)
)


CREATE SEQUENCE agencija.ID_KL_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Ugovarac (
	ID_KL numeric(5) not null,
	Jmbg_kl numeric(13) not null CHECK(len(Jmbg_kl)=13),
	Ime_kl varchar(10) not null,
	Prezime_kl varchar(15) not null,
	Mesto_kl varchar(25),
	Adresa_kl varchar(35),
	Email_kl varchar(30),
	Telefon_kl varchar(15),
	Br_racuna_kl varchar(20) not null CHECK(len(Br_racuna_kl)=20),
	CONSTRAINT PK_Ugovarac PRIMARY KEY(ID_KL)
)


CREATE SEQUENCE agencija.ID_NAS_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Naslednik (
	ID_NAS numeric(5) not null,
	Jmbg_nas numeric(13) not null CHECK(len(Jmbg_nas)=13),
	Ime_nas varchar(10) not null,
	Prezime_nas varchar(15) not null,
	Mesto_nas varchar(25),
	Adresa_nas varchar(35),
	Email_nas varchar(30),
	Telefon_nas varchar(15),
	Br_racuna_nas varchar(20) not null CHECK(len(Br_racuna_nas)=20),
	CONSTRAINT PK_Naslednik PRIMARY KEY(ID_Nas)
)


CREATE SEQUENCE agencija.ID_POLI_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Polisa (
	ID_POLI numeric(5) not null,
	Datum_izdavanja date,
	Datum_potpisivanja date,
	Datum_isteka date,
	Period_vazenja numeric(15),
	ID_OK numeric(5) not null,
	ID_KL numeric(5) not null,
	CONSTRAINT PK_Polisa PRIMARY KEY(ID_POLI),
	CONSTRAINT FK_Polisa_Osiguravajuca_kuca FOREIGN KEY (ID_OK) references agencija.Osiguravajuca_kuca(ID_OK),
	CONSTRAINT FK_Polisa_Ugovarac FOREIGN KEY (ID_KL) references agencija.Ugovarac(ID_KL)
)


CREATE SEQUENCE agencija.ID_ANEKS_seq as numeric
start with 1
minvalue 1
no cycle

CREATE TABLE agencija.Aneksiranje (
	ID_POLI numeric(5) not null unique,
	ID_ANEKS numeric(5) not null,
	Datum_aneksiranja date,
	CONSTRAINT PK_Aneksiranje PRIMARY KEY (ID_ANEKS),
	CONSTRAINT FK_Aneksiranje_Polisa FOREIGN KEY (ID_POLI) references agencija.Polisa(ID_POLI),
	CONSTRAINT FK_Aneksiranje_Polisa_Pol FOREIGN KEY(ID_ANEKS) references agencija.Polisa(ID_POLI)
)

CREATE TABLE agencija.Poseduje (
	ID_OK numeric(5) not null,
	ID_PR numeric(5) not null,
	CONSTRAINT PK_Poseduje PRIMARY KEY (ID_OK, ID_PR),
	CONSTRAINT FK_Poseduje_Osiguravajuca_kuca FOREIGN KEY (ID_OK) references agencija.Osiguravajuca_kuca(ID_OK),
	CONSTRAINT FK_Poseduje_Program FOREIGN KEY (ID_PR) references agencija.Program(ID_PR)
)

CREATE TABLE agencija.SeNavodi (
	ID_NAS numeric(5),
	ID_POLI numeric(5),
	CONSTRAINT PK_SeNavodi PRIMARY KEY (ID_NAS, ID_POLI),
	CONSTRAINT FK_SeNavodi_Naslednik FOREIGN KEY (ID_NAS) references agencija.Naslednik(ID_NAS),
	CONSTRAINT FK_SeNavodi_Polisa FOREIGN KEY (ID_POLI) references agencija.Polisa(ID_POLI)
)

CREATE TABLE agencija.Isplacuje_Zaradu (
	ID_Agencije numeric(5),
	ID_OK numeric(5),
	iznos numeric(30),
	CONSTRAINT PK_Isplacuje_Zaradu PRIMARY KEY (ID_Agencije, ID_OK),
	CONSTRAINT FK_Isplacuje_Zaradu_Agencija FOREIGN KEY (ID_Agencije) references agencija.Agencija(ID_Agencije),
	CONSTRAINT FK_Isplacuje_Zaradu_Osiguravajuca_kuca FOREIGN KEY (ID_OK) references agencija.Osiguravajuca_kuca(ID_OK)
)

CREATE TABLE agencija.Preuzima_Primerke (
	Redni_broj_primerka numeric(6),
	ID_Agencije numeric(5),
	ID_POLI numeric(5),
	ID_KL numeric(5) not null,
	vraca_ID_Agencije numeric(5) not null,
	CONSTRAINT PK_Preuzima_Primerke PRIMARY KEY (Redni_broj_primerka, ID_Agencije, ID_POLI),
	CONSTRAINT FK_Preuzima_Primerke_Agencija FOREIGN KEY (ID_Agencije) references agencija.Agencija(ID_Agencije),
	CONSTRAINT FK_Preuzima_Primerke_Polisa FOREIGN KEY (ID_POLI) references agencija.Polisa(ID_POLI),
	CONSTRAINT FK_Preuzima_Primerke_Ugovarac FOREIGN KEY (ID_KL) references agencija.Ugovarac(ID_KL),
	CONSTRAINT FK_Preuzima_Primerke_Agencija_ FOREIGN KEY (vraca_ID_Agencije) references agencija.Agencija(ID_Agencije)
)
