--AGGREGATE METHOD KULLANIMI--
/*
AGGREGATE methodlari (SUM(topla),COUNT(say),MIN(en kucuk),MAX(en buyuk),AVG(ortalama))
-Sobquery icinde de kulllanilir
-Ancak sorgu tek bir deger donduruyor olmalidir
SYNTAX sum() seklinde olmali sum ()  arasinda bosluk olmali
*/
select * from calisanlar2

--calisanlar2 tablosundaki en yuksek maas degerini listeleyiniz
select max(maas) from calisanlar2

--alisanlar2 tablosundaki maaslarin toplamini listeleyiniz
select sum(maas) from calisanlar2

--Calisanlar 2 tablosundaki maas ortalamalarini inceleyiniz
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2

--calisanlar2 tablosundaki en dusuk maas degerini listeleyiniz
select min(maas) from calisanlar2

----calisanlar2 tablosundaki  kac kisinin maas aldigini  listeleyiniz
select count(maas) from calisanlar2

select * from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(select sum(maas) from calisanlar2 where marka_isim=isyeri)AS toplam_maas from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.


SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas,
                                 (SELECT min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yazin
select marka_id,marka_isim,(select count(sehir) from calisanlar2 where marka_isim=isyeri )as sehir_sayisi from markalar

--Interview Question: En yüksek ikinci maas değerini çağırın.
select  max(maas) AS enyuksek_ikinci_maas from  calisanlar2 where  maas < (select max(maas) from calisanlar2);

----Interview Question: En düşük ikinci maas değerini çağırın.
select  min(maas) AS endusuk_ikinci_maas from  calisanlar2 where  maas > (select min(maas) from calisanlar2);

----Interview Question: En yuksek  ucuncu maas değerini çağırın.
select  max(maas) AS enyuksek_ucuncu_maas from  calisanlar2
where  maas < (select max(maas) from calisanlar2  where maas <(select max(maas) from calisanlar2));




