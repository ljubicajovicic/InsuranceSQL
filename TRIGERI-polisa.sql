/* Triger 'triger1' se koristi za aneksiranje polise prilikom ažuriranja ili unosa novih podataka u tabelu 'Polisa'.
Ako se promeni datum isteka polise ('Datum_isteka'), triger proverava da li je novi datum važeci prema periodu važenja.
Ako je datum isteka validan, triger ažurira tabelu 'Aneksiranje' sa starim datumom isteka i ispisuje poruku o uspešnom aneksiranju.
Ako datum nije validan, triger generiše grešku.
Takode, ako je u pitanju unos nove polise, triger unosi podatke u tabelu 'Polisa' i ispisuje poruku o uspešnom unosu.
*/

if object_id('agencija.triger1', 'TR') is not null
drop trigger agencija.triger1
go

CREATE TRIGGER agencija.triger1
on agencija.Polisa
INSTEAD OF INSERT,UPDATE
AS
BEGIN
	IF @@ROWCOUNT = 0 RETURN;

	IF UPDATE(Datum_isteka)
	begin
		declare @polisa_id as numeric = (select ID_POLI from inserted)
		declare @datum_izdavanja as date = (select Datum_izdavanja from inserted)
		declare @datum_potpisivanja as date = (select Datum_potpisivanja from inserted)
		declare @datum_isteka_novi as date = (select Datum_isteka from inserted)
		declare @datum_isteka_stari as date = (select Datum_isteka from deleted)
		declare @periodV as numeric(15) = (select Period_vazenja from inserted)
		declare @id_ok as numeric(5) = (select ID_OK from inserted)
		declare @id_kl as numeric(5) = (select ID_KL from inserted)

			if (select count(*) from inserted) != 0 and (select count(*) from deleted) != 0 
			begin
				if(@datum_isteka_novi > DATEADD(MONTH, @periodV, @datum_potpisivanja))
				begin 
					UPDATE agencija.Aneksiranje
					set Datum_aneksiranja = @datum_isteka_stari
					where ID_POLI = @polisa_id
					Print 'Uspesno ste aneksirali polisu: ' + convert(varchar,@polisa_id) + ' , datum aneksiranja: ' + convert(varchar,@datum_isteka_stari)
					+ ' , novi datum isteka: ' + convert(varchar,@datum_isteka_novi)
				end
				else
				begin
					raiserror('Datum isteka nije prošao',16,0)
				end
			end
			else if (select count(*) from inserted) != 0 and (select count(*) from deleted) = 0 
			begin
				insert into agencija.Polisa (ID_POLI, Datum_izdavanja, Datum_potpisivanja, Datum_isteka, Period_vazenja, ID_OK, ID_KL)
				values (@polisa_id, @datum_izdavanja, @datum_potpisivanja, @datum_isteka_novi, @periodV, @id_ok, @id_kl)
				Print 'Uspesno ste kreirali polisu dana: ' + convert(varchar, @datum_izdavanja)
			end
	end
END
GO

insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2022-06-01', '2022-06-01', '2023-06-01', '12', 2 , 1)

update agencija.Polisa
set Datum_isteka='2022-07-18'
where ID_POLI = 2

update agencija.Polisa
set Datum_isteka='2022-07-18'
where ID_POLI = 5

select * from agencija.Polisa
select * from agencija.Aneksiranje



/*ogranicenje da ugovarac ne moze imati vise od tri naslednika po polisi*/

if object_id('agencija.triger2', 'TR') is not null
drop trigger agencija.triger2
go 

CREATE TRIGGER agencija.triger2
on agencija.seNavodi
INSTEAD OF INSERT
AS
BEGIN
	IF @@ROWCOUNT = 0 RETURN

	if (select count(*) from inserted) != 0 and (select count(*) from deleted) = 0
	begin
		declare @polisa_id as numeric = (select ID_POLI from inserted)
		declare @id_nas as numeric(5) = (select ID_NAS from inserted)
		declare @ime_nas as varchar(15) = (select Ime_nas from agencija.Naslednik n join agencija.SeNavodi sn on (n.ID_NAS=sn.ID_NAS) where n.ID_NAS=@id_nas and ID_POLI=@polisa_id)
		declare @prz_nas as varchar(15) = (select Prezime_nas from agencija.Naslednik n join agencija.SeNavodi sn on (n.ID_NAS=sn.ID_NAS) where n.ID_NAS=@id_nas and ID_POLI=@polisa_id)
		declare @brnasl as numeric(5) = (select count(ID_NAS) from agencija.Polisa p join agencija.SeNavodi sn on (p.ID_POLI=sn.ID_POLI) where p.ID_POLI=@polisa_id)

		if @brnasl < 3
		begin
			insert into agencija.SeNavodi(ID_POLI,ID_NAS)
			values (@polisa_id, @id_nas)	
			print concat('Uspesno naveden naslednik ', @ime_nas, ' ', @prz_nas, ' za polisu sa id: ', convert(varchar,@polisa_id))
		end
		else
		begin
			raiserror('Greska! Nije moguce navesti vise od 3 naslednika po polisi!', 16, 0)
		end
		
	end
END
GO

insert into agencija.seNavodi (ID_NAS, ID_POLI)
values (10,1)

insert into agencija.seNavodi (ID_POLI, ID_NAS)
values (4,6)

