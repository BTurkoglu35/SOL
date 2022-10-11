--Metinsel Fonksiyonlar
select ASCII ('A')

Select concat('gunaydin','sql','dersleri')

Select concat_ws('*','gunaydin','sql','dersleri')

select left ('left komutu girilen metinde soldan belirtilen deger kadar karakter verir',3)

select right('right komutu girilen metinde sagdan belirtilen deger kadar karakter verir',4)

select length ('length komutu girilen metinin uzunlugunu verir')

select id,replace(ad,'i','I')  from bolum3
--replace degisikli yapmak istedigimiz verilerde kullaniriz

select reverse(ad) from bolum3
--reverse belitilen sutundaki degerleri ters cevirir

select substring('Asude Can',4,3)

select lower (ad), upper(ad) from bolum3




