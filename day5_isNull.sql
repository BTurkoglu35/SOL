--IS NULL, IS NOT NULL, COALESECE--
/*
IS NULL ve IS NOT NULL Boolean operatorlerdir. Bir ifadenin Null olup olmadigini kontrol eder

COALESCCE (Birlestirme) ise bir fonksiyondur ve icerisindeki parametrelerden NULL olmayan ilk ifadeyi dondurur.
*/
CREATE TABLE insanlar (	
	ssn CHAR(9), --Social Security Number
	isim VARCHAR(50), 	
	adres VARCHAR(50) );
   INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
   INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
   INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
   INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
   INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
   INSERT INTO insanlar (adres) VALUES('Sakarya');
   INSERT INTO insanlar (ssn) VALUES('999111222');
   
   select * from insanlar
   
 --ismi null olanlari sirala
 select * from insanlar where isim is null
 
 --null olamayanalri listele
   select * from insanlar where isim is not null 
 
 --ismi null  olan kisiylerin ismine no name atayin
 update insanlar
 set isim='No Name' where isim is null
 
-- Tabloyu bir önceki soruyu çözmeden önceki haline geri getirin
 update insanlar
 set isim=null  where isim='No Name'
 
 --Not:coklu degisimde her degisim icin Set..where isim is null gibi
 --ifade yazmamak icin COALESCE(Birlestirme ) kullanilir.
 
 /* 
isim 'i NULL olanlara 'Henuz isim girilmedi'
adres 'i NULL olanlara 'Henuz adres girilmedi'
ssn 'i NULL olanlara ' no ssn' atayalım.
*/

update insanlar 
Set isim=coalesce(isim,'Henuz isim girilmedi'),
    adres=coalesce(adres,'Henuz adres girilmedi'),
    ssn=coalesce(ssn,'No ssn');
 
 
 
 
 
 
 
 
 
 
 
   
   