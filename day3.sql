CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE,
maas int NOT NULL,
ise_baslama DATE
);

 
 INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10004', 'Mehmet Yilmaz', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10005', 'Mehmet Yilmaz', 5000, '2018-04-14');//uniqe
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--not null
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');//--unique
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');--not null
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--primary key
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');--primary key
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key


select *from calisanlar
delete from calisanlar;

-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
select * from adresler;
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;
DROP table calisanlar
--Parent tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir

delete from calisanlar where  id='10002' --parent tabloyu yada tablodaki veriyi childden silmeden silemezsiniz


delete from adresler where adres_id='10002';

--ON DELETE CASCADE --
--Her defasinda once child tablodaki verileri silmek yerine ON DELETE CASCADE silme ozelligini aktif hale getirebiliriz.
--Bunun icin fk olan satirin sonuna ON DELETE CASCADE komutunu yazmamiz yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);


select * from talebeler

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
on delete cascade
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from notlar

delete from notlar where talebe_id='123'

delete from talebeler where id='126'--on delete cascade kullandigimiz icin parent table'dan direk silebildik
--parent table dan sildigimiz icin child table'danda silinmis olur.

delete from talebeler;

drop table talebeler cascade;--parent tabloyu kaldirmak istersek drop table tablo_adin dan sonra cascade komutunu kullaniriz

--talebeler tablosundaki isim stununa notnull kisitlamasi ekleyiniz ve veri tipini varchar(30) olarak degistiriniz

alter table talebeler 
alter column isim  TYPE varchar(30),
alter column isim set not null;


--talebeler tablosundaki yazili notu sutununa 60 dan buyuk rakam girilebilsin
alter table talebeler
add constraint sinir check (yazili_notu>60);

INSERT INTO talebeler VALUES(127, 'habibe Yılmaz', 'Ayse',45);--60 sinirina uymadigi icin ekleme yapmaz.

create table ogrencilerr(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);


Create table ogrenci_adres
AS
SELECT id,adres from ogrencilerr;

select * from ogrencilerr
select * from ogrenci_adres

--tablodki bir sutune primary key ekleme
alter table ogrencilerr
add primary key(id);

--primary key olusturmada 2. yol
alter table ogrencilerr
add constraint pk_id PRIMARY KEY(id)


--pk den sonra fk atamasi
alter table ogrenci_adres
add foreign key (id) references ogrencilerr;

--child tabloyu parent tablodan olusturdugumuz icin sutun adi verilmedi

--PK'yi CONSTRAINT silme 
alter table ogrencilerr DROP CONSTRAINT pk_id
--fkyi constraint ile silme
alter table ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey

--yazili notu 85 ten buyuk olan talebe bilgilerini getirin
select * from talebeler where yazili_notu>85;

--ismi mustafa bak olan talebenin tum bilgilerini getirin
select * from talebeler where isim='Nesibe Yilmaz'

--select komutundan --BETWEEN kosulu 
-- BETWEEN belirttiginiz iki veri arasindaki bilgileri listeler
-- BETWEEN de belirttigimiz degerlerde listelemeye dahildir


create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

/*
      AND(ve):Belirtilen sartlarin her ikiside gerceklesiyorsa o kayit listelenir
bir tanesi gerceklelsmezse listelemez
Select * from matematik sinavi >50 AND sinav2>50
Hem sinavi hemde sinav2 alani ,50 den buyuk kayitlari siler.
     OR(veya): Belirtilen sartlardan biri gerceklesirse ;kayit listelenir 
 select * from matematik sinav> 50 or sinav2>50
 sinav1 veya sinav2 alani 50 den buyuk olan kayitlari listeler
*/	 
	 
select * from 	 personel 
	 
--id'si 1003 ile 1005 arasında olan personel bilgisini listeleyiniz
select * from personel where id BETWEEN '1003' and '1005';	 
	 
--2.yol
select * from personel WHERE id>='1003' and id<='1005'

--derya soylu ile yavuz bal arasindaki personel bilgisini listeleyiniz
select * from personel where isim between 'Ali Can' and 'Derya Soylu' 
	 
	 
--Maasi 7000 veya ismi sena olan personeli listele	 
 select * from personel where maas =70000 or isim ='Sena Beyaz'
 
 --IN : Birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komuuta yazabilme imkani verir
 --farkli sutunlar icin IN kullanilmaz
 --id'si 1001,1002,1004 personelin bilgilerini listele
 select * from personel where id ='1001' or id='1002' or id='1003'
 
 --2.yol
 select * from personel where id IN ('1001','1002','1003')
 
 --maasi sadece 7000 ve 10000 olan personeli listele
 select * from personel where maas in (70000,100000)
 
 /*
 SELECT -LIKE kosulu
 LIKE: sorgulama yaparken belirli (pattern) bir kalip ifadeleri kullanabilmemizi saglar
 ILIKE:sorgulama yaparken buyuk/kucuk harfe duyarsiz olarak eslestiriri
 LIKE:~~
 ILIKE: ~~*
 NOT LIKE:!~~
  NOT ILIKE: !~~*
 
 %--> 0 veya daha fazla karakteri belirtir
 _--> Tek bir karakteri belirtir 
 */
 
 --ismi A harfi ile baslayan personeli listele
 Select * from personel where isim Like 'A%' 
 
 --ismi t harfi ile biten
  Select * from personel where isim Like '%t' 

--ismini n ikinci harfi e olan personeli

  Select * from personel where isim Like '_e%' 






