/*
        UPPER- LOWER- INITCAP-DISTINCT 
        ------------------------------
UPPER ==> Sütunudaki verileri Büyük Harf ile listeler.
Syntax:
-------
select UPPER(Sutun_adi) from tablo_adi;



LOWER ==> Sütunudaki verileri Küçük Harf ile listeler.
Syntax:
-------
select LOWER(Sutun_adi) from tablo_adi;



INITCAP ==> Sütunudaki verileri ilk Harfi Büyük Diger Harfleri Küçük listeler.
Syntax:
-------
select INITCAP(Sutun_adi) from tablo_adi;



DISTINCT ==> Sütunudaki verileri tekrarsız listeler.
Syntax:
-------
select DISTINCT(Sutun_adi) from tablo_adi;

*/

create table ornek
(
isim varchar(20),
soyisim varchar(25)
);

insert into ornek values('Hasan','YAN');
insert into ornek values('Veli','TURK');
insert into ornek values('Ramiz','KARA');
insert into ornek values('Elif','GUL');
insert into ornek values('Hasan','VURAL');


-- SORU1: isim sutununu buyuk harflerle listeleyiniz

select upper(isim) from ornek;



-- SORU2: isim sutununu kucuk harflerle listeleyiniz

select lower(isim) from ornek;



-- SORU3: soyisim sutununu ilk harfi buyuk diger harfleri kücük listeleyiniz

select initcap(soyisim) from ornek;



-- SORU4: isim sutununu buyuk harflerle, soyisim sutununu kucuk harflerle listeleyiniz

select upper(isim), lower(soyisim) from ornek;



-- SORU5: isim sutununu tekrarsız listeleyiniz

select distinct(isim) from ornek;

select * from ornek;

/*
	IS NULL - IS NOT NULL
	
IS NULL ==> null olan verileri getirir

IS NOT NULL ==> null olmayan verileri getirir

*/


create table denemeler
(
id char(9),
isim varchar(50),
adres varchar(50)
);

insert into denemeler values(123456789,'Ali','Istanbul');
insert into denemeler values(159753284,'Veli','Ankara');
insert into denemeler values(741258963,'Mine','Izmir');
insert into denemeler values(963278452,null,'Ankara');

-- SORU1: isim sutununda null olan verileri listeleyiniz

select * from denemeler where isim is null;


-- SORU2: isim sutununda null olmayan verileri listeleyiniz

select * from denemeler where isim is not null;








