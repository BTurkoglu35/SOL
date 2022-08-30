select * from tedarikciler
select * from urunler

--vergi_no'su 102 olan tedarikcinin firma ismini 'Vestel' olarak guncelleyiniz.
update tedarikciler
set firma_ismi='Vestel' where vergi_no='102'

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.
update tedarikciler
set firma_ismi='casper',irtibat_ismi='Ali Veli' where vergi_no='101'

--  urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler
set urun_isim='Telefon' where urun_isim='Phone'

--  urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id’sini 1 arttırın.
update urunler 
set urun_id=urun_id+1 where urun_id>'1004'

--urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.

update urunler
set urun_isim= (select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve' )  where musteri_isim='Ali Bak'

-- Urunler tablosunda laptop satin alan musterilerin ismini, firma_ismi Apple’in irtibat_isim'i ile degistirin.
update urunler
set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Apple') where urun_isim='Laptop'

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

select * from personel

 --ismi A harfi ile baslayan personeli listele
 
 select isim from personel where isim like 'A%'

 --ismi t harfi ile biten
  select isim from personel where isim like '%t'
 

--isminin ikinci harfi e olan personeli
  select isim from personel where isim like '_e%'

   
 -- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
 select isim from personel where isim Ilike 'a%n'
 
-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
 select isim from personel where isim Ilike '_a_u%'
 
 -- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz

  select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'
 
 -- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
select isim from personel where isim ~~* '_e%y%'
 
 ---- a harfi olmayan personeli listeleyin
select isim from personel where isim !~~* '%a%'

 
-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select isim from personel where isim !~~* '%a%'
 
 
 --Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.

select isim from personel  where isim  ~~* '%r_'

 



