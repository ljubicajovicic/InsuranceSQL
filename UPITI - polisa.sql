/*Rezultat prvog upita predstavljaju sve osiguravajuće kuće čije je sedište u Beogradu 
i koje poseduju odgovarajuće programe osiguranja. Sam ispis prikazuje naziv osiguravajuće kuće, 
adresu i mesto na kojoj je osiguravajuća kuća locirana, e-mail osiguravajuće kuće, 
kao i koju vrstu programa ona nudi uz sam opis programa. 
U slučaju nedostatka informacija o e-mail adresi osiguravajuće kuće ispis će biti 'nepoznato'.*/

select naziv_ok as 'Naziv', mesto_ok as 'Mesto', adresa_ok as 'Adresa', 
isnull(email_ok, 'nepoznato') as Email, vrsta as 'Vrsta programa', opis as 'Opis programa' 
from agencija.Osiguravajuca_kuca o join agencija.Poseduje p on (o.id_ok=p.id_ok) 
join agencija.Program pr on (p.id_pr=pr.id_pr)
where sediste_ok ='Beograd'

/*Rezultat drugog upita su podaci u vidu imena i prezimena ugovarača kojima je izdata polisa 
od strane osiguravajuće kuće, čiji je naziv takođe naveden, kao i datum potpisivanja 
i datum izdavanja polise. 
U slučaju da datum isteka nije naveden u okviru kolone za taj podatak ispis je 'Nije navedeno'. 
Rezultat se odnosi na one ugovarače koji su polisu potpisali u periodu od marta do jula. 
Ispis je sortiran rastuće po prezimenu.*/

select ime_kl + ' ' + prezime_kl as 'Ime i prezime', naziv_ok as Naziv, datum_izdavanja as Izdavanje, 
datum_potpisivanja as Potpisivanje, isnull(cast(datum_isteka as varchar),'Nije navedeno') as 'Datum isteka'
from agencija.Ugovarac u join agencija.Polisa p on (u.id_kl=p.id_kl) join agencija.Osiguravajuca_kuca o on (p.id_ok=o.id_ok)
where DATEPART(month, datum_potpisivanja) between 3 and 7
order by prezime_kl asc

/*Rezultat trećeg upita jesu naziv i mesto agencije za životno osiguranje koja je ostvarila najveći iznos zarade 
od strane jedne osiguravajuće kuće, naziv osiguravajuće kuće koja je isplatila taj iznos, 
kao i sam iznos u dinarima.*/

select naziv as 'Naziv agencije', mesto as 'Mesto agencije',
naziv_ok as 'Naziv osig kuce', sediste_ok as 'Sediste osig kuce',
iznos as 'Iznos'
from agencija.Agencija a join agencija.Isplacuje_Zaradu iz
on (a.id_agencije=iz.id_agencije) join agencija.Osiguravajuca_kuca o
on (iz.id_ok=o.id_ok)
where iznos in (select max(iznos) from agencija.Isplacuje_zaradu)

/*Rezultat četvrtog upita predstavlja broj primeraka polise potpisanih nakon 31.12.2020. 
i vraćenih u agencije čije je sedište u Novom Sadu. 
U okviru ispisa su prikazani naziv agencije i datum potpisivanja polise.*/

select count(redni_broj_primerka) as 'Broj primeraka', naziv as 'Naziv agencije', 
min(Datum_potpisivanja) as 'Datum potpisivanja'
from agencija.Preuzima_Primerke pp join agencija.Agencija a on (pp.ID_Agencije=a.id_agencije) 
join agencija.Polisa p on (pp.ID_POLI=p.ID_POLI)
where sediste = 'Novi Sad'
group by naziv
having min(Datum_potpisivanja) > '2020-12-31'
order by naziv desc

/*Rezultat poslednjeg upita predstavlja ukupan iznos na mesečnom nivou 
koji je osiguravajuća kuća isplatila kom broju agencija,
posmatrano samo za osiguravajuće kuće čiji je naziv Grawe ili Uniqa. 
Prikazano opadajuće po iznosu. */

select sum(iznos) as 'Ukupan iznos', naziv_ok as 'Naziv osiguravajuce kuce', 
count(id_agencije) as 'Broj agencija'
from agencija.Osiguravajuca_kuca o join agencija.Isplacuje_Zaradu iz on (o.id_ok=iz.id_ok)
join (select o.id_ok, count(a.id_agencije) br from agencija.Agencija a 
join agencija.Isplacuje_Zaradu iz on (a.ID_Agencije=iz.ID_Agencije)
join agencija.Osiguravajuca_kuca o on(iz.id_ok=o.id_ok) group by o.id_ok)
novatab on (novatab.id_ok=iz.id_ok)
where naziv_ok in ('Grawe','Uniqa')
group by naziv_ok
having count(id_agencije) = count(novatab.br)
order by sum(iznos) desc




