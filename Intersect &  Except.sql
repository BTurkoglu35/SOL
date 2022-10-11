--Intersect , Except ,Union , UnionAll
select * from bolum2
intersect
select * from bolum3
						 
--iki tablo arasindaki ortak verileri vermek icin kullanilir

select * from bolum2
except
select * from bolum3

--except belirtilen ilk tablonun deger tablodan farkli olan verilerini getirir.

select * from bolum3
except
select * from bolum2

select * from bolum2
union
select * from bolum3

--Union iki tabloyu birlestirir. TAblolar icinde birden fazla olan degeri bir kere alir
select * from bolum2
union all
select * from bolum3

--union all iki tabloyu birlestirir. Ortak olan degerleride birden fazla yazdirir.
