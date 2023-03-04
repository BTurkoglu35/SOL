/*================================ ORDER BY  ===================================
   ORDER BY komutu bir SORGU deyimi içerisinde belli bir SUTUN'a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
	ORDER BY sutun_adı              İNT==>KÜÇÜKTEN BÜYÜGE  STRİNG==>A-Z
	ORDER BY sutun_adı DESC         İNT==>BÜYÜKTEN KÜÇÜGE  STRİNG==>Z-A
==============================================================================*/   

CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50), 
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
    	
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Kan', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');

-- SORU1: meslekler tablosunu isim'e göre kucukten buyuge sıralayarak listeleyiniz.

select * from meslekler  order by isim ;

select * from meslekler;

-- SORU2: meslekler tablosunu maas'i buyukten kucuge sıralayarak listeleyiniz
select * from meslekler order by  maas desc;

-- SORU3: meslekler tablosunda isim'i 'Ali' olanları,
-- maas'a göre büyükten küçüge sıralayarak listeleyiniz
select * from meslekler where isim='Ali' order by maas desc;


-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- maas'a gore sıralayarak listeleyiniz.
select * from meslekler where soyisim='Bulut' order by maas ;

--Limit komutu sinir koymak icin kullanilir 

create table musteriler
(
id int,
musteri_isim varchar(50),
maas int
);


insert into musteriler values(1,'Ayse',10000);
insert into musteriler values(2,'Adem',15000);
insert into musteriler values(3,'Halit',20000);
insert into musteriler values(4,'Hasan',25000);
insert into musteriler values(5,'Recep',30000);
insert into musteriler values(6,'Harun',35000);
insert into musteriler values(7,'Hatice',40000);
insert into musteriler values(8,'Poyraz',50000);
insert into musteriler values(9,'Ayse',60000);
insert into musteriler values(10,'Adem',70000);

--SORU1: musteriler tablosundaki ilk 5 kisinin bilgilerini listeleyiniz.

select * from musteriler limit 5;


-- SORU2: musteriler tablosunda id degeri 2 den büyük olan,
-- ilk 3 veriyi listeleyiniz
select * from musteriler where id>2 limit 3;



-- SORU3: musteriler tablosunda maas degeri 20000 den büyük olan,
-- ilk 3 veriyi listeleyiniz
select * from musteriler where maas>20000 limit 3;


-- SORU4: musteriler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz

select * from musteriler order by maas desc limit 3;


-- SORU6: musteriler tablosunda en yüksek maaşı alan 3. 4. 5. 6. kişilerin bilgilerini listeleyiniz


select * from musteriler order by maas desc offset 2 limit 4;


















