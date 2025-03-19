-- TABELA AGENCIJA
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'Osiguranik.com', 'Beograd', 'Bulevar Zorana Djindjica 87','Beograd','info@osiguranik.com',' 011 7850-487')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'Agencija-IFC', 'Novi Sad', 'Augusta Cesarca 16','Novi Sad','office@ifc.rs','021 6618268')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'Agencija G', 'Novi Sad', 'Narodnog Fronta 27','Novi Sad','ekskluzivni.g@uniqa.rs','021 23 630 13')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'Agencija G', 'Novi Sad', 'Vase Pelagica 11','Novi Sad','petar.mihajlovic@uniqa.rs','021 66 181 99')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'Agencija G', 'Sremska Mitrovica', 'Zanatlijska 10','Novi Sad','ekskluzivni.g@uniqa.rs','022 61 26 46')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'BiroProfesional', 'Novi Sad', 'Augusta Cesarca 18','Novi Sad','office@biroprofesional.rs','021/520-035')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'DND TOP-DI', 'Beograd', 'jurija Gagarina 14D','Beograd','office@toposiguranje.rs','060 5813 979')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'SafeLife', 'Beograd', 'Bulevar Mihajla Pupina 115E/III','Beograd', null,'0(11) 78 53 848')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'KapitalExtra', 'Beograd', 'Danila Lekica Spanca 4','Beograd',null,'063 10 10 556')
insert into agencija.Agencija values (next value for agencija.ID_Agencije_seq, 'Zivotno.com', 'Beograd', 'Katiceva 6','Beograd','osiguranje@zivotno.com',null)

select * from agencija.Agencija
 


-- TABELA OSIGURAVAJUCA KUCA
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Grawe', 'Novi Beograd', 'Bulevar Mihajla Pupina 115D', 'Beograd', 'office.beograd@grawe', '(0)11 2092 600')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Grawe', 'Novi Sad', 'Novosadskog Sajma 23', 'Beograd', 'prodaja.novisad@grawe', '021 4727 908')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Grawe', 'Nis', 'Nikole Pasica 30/2', 'Beograd', 'prodaja.nis@grawe', null)
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Grawe', 'Pancevo', 'Cara Dusana 2', 'Beograd', 'prodaja.pancevo@grawe', '(0)11 2092 600')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Uniqa', 'Beograd', 'Milutina Milankovica 134g', 'Beograd', 'info@uniqa.rs', '011 20 24 100')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Uniqa', 'Cacak', 'Devet Jugovica 8', 'Beograd', null, '032/537-6680')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'Uniqa', 'Jagodina', 'Jug Bogdana 3', 'Beograd', null, '035 24 01 37')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'DDOR', 'Novi Sad', 'Bulevar Mihajla Pupina 8', 'Novi Sad', 'ddor@ddor.co.rs', '0800 303 301')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'DDOR', 'Backa Palanka', 'Zarka Zrenjanina 45', 'Novi Sad', 'backapalanka@ddor.co.rs', '021 6040 260')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'DunavOsiguranje', 'Bajina Basta', 'Svetosavska', 'Beograd', null, '031/865-649')
insert into agencija.Osiguravajuca_kuca values(next value for agencija.ID_OK_seq, 'DunavOsiguranje', 'Sremska Mitrovica', 'Kralja Petra I', 'Beograd', null, '031/865-649') 
select * from agencija.Osiguravajuca_kuca


 --TABELA PROGRAM
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Riziko osiguranje','Osiguranje za slucaj smrti')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Mesovito osiguranje','Za sebe i svoje najmilije obezbedite sigurnu i udobnu buducnost. ')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'No Risk','Garantuju stednju, dobit i osiguranje zivota')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Siguran profit','Sredstva fonda se usmeravaju u sigurne i profitabilne investicije')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Grawe premium','Rentno osiguranje')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Grawe total','Zastita za vas, vasu porodicu i dom')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Grawe horizont','Pokrice pogrebnih troskova')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Spektar','Fleksibilan progr')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Osiguranje od nezgode','Zastita od iznenadnih i nezeljenih dogadjaja')
insert into agencija.Program values(next value for agencija.ID_PR_seq, 'Favorit','Omogucava sigurnu buducnost vaseg deteta')

select * from agencija.Program


--TABELA UGOVARAC
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1307997502256','Milos', 'Milosevic', 'Novi Sad', 'Cara Lazara 5', null, null, '3405 3236 9894 33265')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '2502995563245','Marko', 'Markovic', 'Novi Sad', 'Krilova 12', 'markovic@gmail.com', '+381656225896', '5255 3236 2674 89625')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1508962536745','Jelena', 'Ralevic', 'Beograd', 'Bulevar oslobodjenja', null, '+381647552659', '5425 3136 9574 52625')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1308985326523','Anja', 'Milosevic', 'Novi Sad', 'Cara Lazara 5', null, null, '4707 3356 8896 56325')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1712993563125','Stanka', 'Rakic', 'Novi Sad', 'Svetozara Miletica 7', null, null, '1207 7756 8896 56325')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1307997502256','Ljiljana', 'Vukovic', 'Cacak', 'Lekina 22', 'ljilja@gmail.com', null, '2369 3356 8521 98325')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '2712998632546','Irena', 'Stojnic', 'Novi Sad', 'Cara Dusana 8', 'stojnic@gmail.com', null, '4707 2366 8196 69325')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '2907992531425','Dusan', 'Cvjetic', 'Sremska Mitrovica', 'Puskinova 89', null, '+381615692365', '3405 3236 6974 54625')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1906883659851','Nemanja', 'Popovic', 'Subotica', 'Kralja Petra 24', null, null, '5425 3236 9974 53625')
insert into agencija.Ugovarac values(next value for agencija.ID_KL_seq, '1509997502256','Nikola', 'Simic', 'Bajina Basta', 'Sekspirova 65', 'simic@gmail.com', null, '5065 5236 9874 53625')
select * from agencija.Ugovarac


--TABELA NASLEDNIK
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1203000698523', 'Milana', 'Milosevic', 'Novi Sad', 'Cara Lazara 5', null, null, '3405 3236 9894 33261')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '2503005896523', 'Jovana', 'Milosevic', 'Novi Sad', 'Cara Lazara 5', null, null, '3405 3236 9894 33262')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1809999365985', 'Katarina', 'Radic', 'Beograd', 'Bulevar oslobodjenja 12', 'katy@gmail.com', null, '5255 3236 2674 89625')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1506998235632', 'Dejan', 'Danilovic', 'Backa Palanka', 'Kralja Petra 49', null, null, '5065 5236 9274 53625')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1908996235852', 'Marija', 'Panic', 'Novi Sad', 'Sekspirova 5', null, null, '4065 5236 9874 54625')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '2912003265985', 'Bojana', 'Bojanic', 'Beograd', 'Puskinova 8', null, null, '5065 5326 9971 33635')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1709995236523', 'Danilo', 'Popovic', 'Subotica', 'Kralja Petra 24', 'dan@gmail.com', null, '5425 3236 9974 51125')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '2807998236525', 'Sara', 'Simic', 'Bajina Basta', 'Sekspirova 65', null, null, '3405 5236 9874 53625')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '2306995236589', 'Petar', 'Vukovic', 'Cacak', 'Lekina 22', null, null, '2369 3126 8521 98325')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1402989235875', 'Mitar', 'Cvjetic', 'Sremska Mitrovica', 'Puskinova 89', 'mitar@gmail.com', null, '3235 3236 6974 54625')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1307997502256','Milijana', 'Milosevic', 'Novi Sad', 'Cara Lazara 5', null, null, '3405 3236 9894 33265')
insert into agencija.Naslednik values(next value for agencija.ID_NAS_seq, '1307997502256','Milijana', 'Peric', 'Novi Sad', 'Cara Lazara 155', null, null, '3405 8836 9894 33265')

select * from agencija.Naslednik


--TABELA POLISA
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2022-05-12', '2022-05-12', '2024-05-12', '24', 2 , 1)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2021-07-10', '2021-07-10', '2022-07-10', '12', 8, 4)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2022-05-22', '2022-05-22', null, '24', 9, 5)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2020-11-28', '2020-11-29', '2025-11-28', '60', 10, 10)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2022-04-02', '2022-04-05', '2022-10-02', '6', 6, 6)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2021-02-09', '2021-02-12', '2022-02-09', '12', 1, 8)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2020-09-25', '2020-09-25', '2021-09-25', '12', 3, 3)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2021-11-17', '2021-11-17', '2023-11-17', '24', 7, 2)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2022-03-13', '2022-03-13', '2022-09-13', '6', 5, 7)
insert into agencija.Polisa values(next value for agencija.ID_POLI_seq, '2022-05-28', '2022-05-28', '2022-11-28', '6', 2, 9)

select * from agencija.Polisa

--TABELA ANEKSIRANJE
insert into agencija.Aneksiranje values(1, 1, '2024-05-12')
insert into agencija.Aneksiranje values(2, 2, '2022-07-10')
insert into agencija.Aneksiranje values(3, 3, null)
insert into agencija.Aneksiranje values(4, 4, '2025-11-28' )
insert into agencija.Aneksiranje values(5, 5, '2022-10-02')
insert into agencija.Aneksiranje values(6, 6, '2022-02-09')
insert into agencija.Aneksiranje values(7, 7, '2021-09-25')
insert into agencija.Aneksiranje values(8, 8, '2023-11-17')
insert into agencija.Aneksiranje values(9, 9, '2022-09-13')
insert into agencija.Aneksiranje values(10, 10, '2022-11-28')

select * from agencija.Aneksiranje


--TABELA POSEDUJE
insert into agencija.Poseduje values(2,6)
insert into agencija.Poseduje values(1,5)
insert into agencija.Poseduje values(3,7)
insert into agencija.Poseduje values(4,1)
insert into agencija.Poseduje values(5,2)
insert into agencija.Poseduje values(6,3)
insert into agencija.Poseduje values(7,4)
insert into agencija.Poseduje values(8,8)
insert into agencija.Poseduje values(9,10)
insert into agencija.Poseduje values(10,9)

select * from agencija.Poseduje


--TABELA SE NAVODI
insert into agencija.seNavodi values(1, 1)
insert into agencija.seNavodi values(3,3)
insert into agencija.seNavodi values(2,2)
insert into agencija.seNavodi values(8,4)
insert into agencija.seNavodi values(9,5)
insert into agencija.seNavodi values(10,6)
insert into agencija.seNavodi values(5,7)
insert into agencija.seNavodi values(6,8)
insert into agencija.seNavodi values(4,9)
insert into agencija.seNavodi values(7,10)
insert into agencija.seNavodi values(2, 1)
insert into agencija.seNavodi values(11, 1)

select * from agencija.SeNavodi


--TABELA ISPLACUJE ZARADU
insert into agencija.Isplacuje_Zaradu values(2, 2, '120000')
insert into agencija.Isplacuje_Zaradu values(1, 1, '100000')
insert into agencija.Isplacuje_Zaradu values(3, 5, '110000')
insert into agencija.Isplacuje_Zaradu values(4, 8, '100000')
insert into agencija.Isplacuje_Zaradu values(5, 9, '150000')
insert into agencija.Isplacuje_Zaradu values(6, 10, '115000')
insert into agencija.Isplacuje_Zaradu values(7, 6, '122000')
insert into agencija.Isplacuje_Zaradu values(8, 3, '115000')
insert into agencija.Isplacuje_Zaradu values(9, 4, '105000')
insert into agencija.Isplacuje_Zaradu values(10, 7, '120000')

select * from agencija.Isplacuje_Zaradu

--TABELA PREUZIMA PRIMERKE
insert into agencija.Preuzima_Primerke values( 1, 9, 1, 1, 9)
insert into agencija.Preuzima_Primerke values( 2, 4, 2, 4, 4)
insert into agencija.Preuzima_Primerke values( 3, 5, 3, 5, 5)
insert into agencija.Preuzima_Primerke values( 4, 6, 4, 10, 6)
insert into agencija.Preuzima_Primerke values( 5, 7, 5, 6, 7)
insert into agencija.Preuzima_Primerke values( 6, 1, 6, 8, 1)
insert into agencija.Preuzima_Primerke values( 7, 8, 7, 3, 8)
insert into agencija.Preuzima_Primerke values( 8, 10, 8, 2, 10)
insert into agencija.Preuzima_Primerke values( 9, 3, 9, 7, 3)
insert into agencija.Preuzima_Primerke values( 10, 2, 10, 9, 2)

select * from agencija.Preuzima_Primerke



