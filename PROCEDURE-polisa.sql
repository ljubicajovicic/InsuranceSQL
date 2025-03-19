/*Ova procedura prima ID osiguravajuće kuće i prikazuje podatke o ugovaračima kojima su izdate polise u toj kući

U osiguravajućoj kući: <Naziv> sa id: <ID>, nalaze se sledeći klijenti:

<Redni broj> polisa je izdata klijentu: <Ime i prezime>, na dan: <Datum izdavanja>

Broj izdatih polisa u okviru ove osiguravajuće kuće: <Broj>
Broj različitih klijenata kojima je izdata polisa: <Broj>

-- Ako nema ugovaraca kojima je izdata polisa u toj osig kuci ispisati odgovarajucu poruku

U osiguravajućoj kući: <Naziv>, čiji je ID: <ID>, nije izdata nijedna polisa.

Nema podataka o traženoj osiguravajućoj kući.
*/

if object_id ('agencija.procedura1', 'P') is not null
drop procedure agencija.procedura1 
go

CREATE PROCEDURE agencija.procedura1
	@id_ok as numeric(5)
as 
BEGIN
	declare @rbr as numeric(5) = 0
	declare @broj_izdatih_pol as numeric(5) = (select count(ID_POLI) from agencija.Polisa  where ID_OK=@id_ok)
	declare @br_klijenata as numeric(5) = (select count(distinct ID_KL) from agencija.Polisa where ID_OK=@id_ok)
	declare @naziv_ok as varchar(15) = (select Naziv_ok from agencija.Osiguravajuca_kuca where ID_OK=@id_ok)
	declare @ime_kl as varchar(15)
	declare @prz_kl as varchar(15)
	declare @datum_izdavanja as date

	if (@broj_izdatih_pol > 0)
	begin
		print 'U osiguravajucoj kuci: ' + @naziv_ok + ' sa id: ' + convert(varchar, @id_ok) + ' , nalaze se sledeci klijenti: '

		declare cursor_osig cursor for
		select Ime_kl, Prezime_kl, convert(varchar,Datum_izdavanja)
		from agencija.Ugovarac u  join agencija.Polisa p on (u.ID_KL=p.ID_KL) join agencija.Osiguravajuca_kuca o on (o.ID_OK=p.ID_OK)
		where o.ID_OK = @id_ok

		open cursor_osig
		set @rbr = 1 
		
		fetch next from cursor_osig into @ime_kl, @prz_kl, @datum_izdavanja

		while @@FETCH_STATUS = 0
		begin
			print concat(convert(varchar, @rbr), ' polisa je izdata klijentu: ', @ime_kl, ' ', @prz_kl, ', na dan: ', convert(varchar,@datum_izdavanja))
			fetch next from cursor_osig into @ime_kl, @prz_kl, @datum_izdavanja
			set @rbr = @rbr + 1 
		end

		close cursor_osig

		deallocate cursor_osig

		print concat('Broj izdatih polisa u okviru ove osiguravajuce kuce: ', convert(varchar,@broj_izdatih_pol))
		print concat('Broj razlicitih klijenata kojima je izdata polisa: ', convert(varchar, @br_klijenata))
	end
	else if(@broj_izdatih_pol=0 and @id_ok in (select ID_OK from agencija.Osiguravajuca_kuca))
	begin
		print concat('U osiguravajucoj kuci: ', @naziv_ok, ' , ciji je id: ', convert(varchar, @id_ok), ' nije izdata ni jedna polisa')
	end
	else
	begin
		print 'Nema podata o trazenoj osiguravajucoj kuci'
	end
END
GO

exec agencija.procedura1 2 
exec agencija.procedura1 11
exec agencija.procedura1 90


/*Napisati proceduru koja za prosledjen id nas
ispisuje podatke o ugovaracima koji su u okviru polise naveli naslednike sa prosledjenim id

 <ime_nas>  <prezime_nas> su kao naslednika naveli: 

<redni broj> ime ugovaraca <ime> prezime  <prezime> , adresa i mesto <adresa> <mesto> 

Ukupno ugovaraca: <br.ugovaraca>
Broj polisa u kojima je naveden prosledjen naslednik <br>

-- Ako nema podataka o nasledniku ispisati odgovarajucu poruku:

Naslednika čiji je ID prosleđen nije naveo nijedan ugovarač.

Nema podataka o traženom nasledniku!

*/

if object_id ('agencija.procedura2', 'P') is not null
drop procedure agencija.procedura2
go

create procedure agencija.procedura2 (
	@id_nas as numeric(5)
)
as
begin
	declare @ime_nas as varchar(15) = (select Ime_nas from agencija.Naslednik where ID_NAS=@id_nas)
	declare @prezime_nas as varchar(15) = (select Prezime_nas from agencija.Naslednik where ID_NAS=@id_nas)
	declare @ukupnoUgovaraca as numeric(5) = (select count(ID_KL) from agencija.Polisa)
	declare @brNavedenih as numeric(5) = (select count(ID_POLI) from agencija.SeNavodi where ID_NAS = @id_nas)
	declare @rbr as numeric(5) = 0
	declare @ime_kl as varchar(15)
	declare @prz_kl as varchar(15)
	declare @mesto as varchar(25)
	declare @adresa as varchar(35)

	if(@brNavedenih > 0)
	begin
		print @ime_nas + ' ' + @prezime_nas + ' su kao naslednika naveli sledeci klijenti'

		declare cursor_pol cursor for
		select Ime_kl, Prezime_kl, mesto_kl, adresa_kl
		from agencija.Ugovarac u join agencija.Polisa p on (u.ID_KL=p.ID_KL) join agencija.SeNavodi sn on (p.ID_POLI=sn.ID_POLI)
		where ID_NAS=@id_nas

		open cursor_pol
		set @rbr = 1

		fetch next from cursor_pol into @ime_kl, @prz_kl, @mesto, @adresa

		while @@FETCH_STATUS = 0
		begin
			print concat(convert(varchar, @rbr), ' ime ugovaraca: ', @ime_kl, ', prezime ugovaraca: ', @prz_kl, ', mesto: ', @mesto, ', adresa: ', @adresa)
			fetch next from cursor_pol into @ime_kl, @prz_kl, @mesto, @adresa
			set @rbr = @rbr + 1
		end

		close cursor_pol
		deallocate cursor_pol

		print concat('Broj polisa u kojima je naveden prosledjen naslednik: ', convert(varchar, @brNavedenih))
		print concat('Ukupno ugovaraca: ', convert(varchar, @ukupnoUgovaraca))
	end
	else if (@brNavedenih = 0 and @id_nas in (select ID_NAS from agencija.Naslednik))
	begin
		print 'Naslednika ciji je id prosledjen nije naveo ni jedan ugovarac'
	end
	else
	begin 
		print 'Nema podataka o trazenom nasledniku! '
	end
end
go

exec agencija.procedura2 2
exec agencija.procedura2 12
exec agencija.procedura2 50

