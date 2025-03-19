/*Prva funkcija kao ulazni parametar prima id_polise koji je tipa numeric, a vraca tip podatka varchar. 
Cilj kreiranja ove funkcije jeste izračunavanje perioda važenja polise uz pomoć ugrađene funkcije DATEDIFF koja vraća razliku između dva datuma,
u okviru ovog primera iskorišćena su obeležja datum izdavanja polise i datum isteka polise, čijom razlikom se dobija period važenja iste. 
Takođe, ona implementira pravilo u slučaju da su polise izdate utorkom (realizacija uz pomoć ugrađene funkcije DATENAME), 
ugovarači dobijaju bonus od 3 meseca na ugovoren period važenja polise.*/

If object_id ('agencija.funkcija1', 'FN') is not null
drop function agencija.funkcija1
go

CREATE FUNCTION agencija.funkcija1(
	@id_polise as numeric(5)
)
RETURNS varchar(150)
AS
BEGIN
	declare @datum_isteka as date = (select Datum_isteka from agencija.Polisa where ID_POLI=@id_polise)
	declare @datum_izdavanja as date = (select Datum_izdavanja from agencija.Polisa where ID_POLI= @id_polise)
	declare @periodV as numeric(15) = DATEDIFF(MONTH, @datum_izdavanja, @datum_isteka)
	declare @dan as varchar(20) = (select DATENAME(dw,@datum_izdavanja))

	if @dan = 'Tuesday'
	begin
		set @periodV = @periodV + 3 
		return 'Za polise izdate utorkom ostvaruje se bonus, nov period vazenja polise je ' + convert(varchar,@periodV) + ' meseci'
	end

	return 'Period vazenja za polisu izdatu: ' + ' ' + Convert(varchar, @datum_izdavanja ) + ' je: ' + convert(varchar,@periodV) + ' meseci'
END
go
select agencija.funkcija1(6) 
select agencija.funkcija1(2) 



/*Druga funkcija kao ulazni parametar prima id ugovaraca koji je tipa numeric, a vraća tabelu koja za ugovarača čiji je id prosleđen izlistava 
ime i prezime klijenta odnosno ugovaraca, njegovu adresu i mesto, zatim ime, prezime, adresu i mesto naslednika polise 
kojeg je ugovarač naveo u određenoj osiguravajućoj kući prilikom potpisivanja polise.*/

if object_id('agencija.funkcija2', 'IF') is not null
drop function agencija.funkcija2
go 

CREATE FUNCTION agencija.funkcija2(
	@ugovarac_id as numeric(5)
)
RETURNS TABLE
AS
RETURN
(
	select Ime_nas + ' ' + Prezime_nas as 'Ime i prezime naslednika',Adresa_nas + ' , ' + Mesto_nas 'Adresa i mesto naslednika',
	Ime_kl + ' ' + Prezime_kl as 'Ime i prezime klijenta', Adresa_kl + ' , ' + Mesto_kl 'Adresa i mesto klijenta' , Naziv_ok as 'Naziv osiguravajuce kuce',
	datum_potpisivanja as 'Datum potpisivanja' 
	from agencija.Naslednik n join agencija.SeNavodi sn on (n.ID_NAS=sn.ID_NAS) join agencija.Polisa p on (sn.ID_POLI=p.ID_POLI) 
	join agencija.Ugovarac u on (p.ID_KL=u.ID_KL) join agencija.Osiguravajuca_kuca o on (p.ID_OK=o.ID_OK)
	where u.ID_KL = @ugovarac_id
)
GO
select * from agencija.funkcija2(1)
