-- create table satici(
-- satici_kimligi Integer
-- isim varChar(20),
-- sehir VarChar(20),
-- komisyon real
-- );

-- insert into satici values(5005,'Elifnaz Ceyhan','Bolu',0.11)
-- select * from satici

-- create table musteri(
-- musteri_kimligi Integer,
-- cust_name varChar(20),
-- sehir VarChar(20),
-- derece Integer,
-- satici_kimligi Integer
-- );

-- insert into musteri values (3007,'Yagiz Sefa','izmir',100,5002)
Create table siparisler (
siparis_no INTEGER,
fiyat real,
siparis_tarihi date,
musteri_kimligi integer,
satici_kimligi INTEGER	
);

insert into siparisler values(7001,150.5,'2020-10-5',3005,5001)
insert into siparisler values(7009,250.5,'2021-12-4',3002,5001)
insert into siparisler values(7002,130.45,'2021-8-4',3007,5002)
insert into siparisler values(7004,10.57,'2020-10-25',3008,5005)
insert into siparisler values(7007,300.7,'2021-2-12',3004,5007)
insert into siparisler values(7005,2450.5,'2020-5-14',3009,5008)
insert into siparisler values(7008,15.5,'2020-6-19',3003,5002)

select * from siparisler
select * from musteri


-- SORU1 :
--Aynı şehirde ikamet eden satış elemanını ve müşteriyi bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın. 
-- select cust_name ,isim ,musteri.sehir
-- from musteri inner join satici
-- on  musteri.sehir=satici.sehir

-- select  cust_name ,isim ,musteri.sehir from musteri,satici where musteri.sehir=satici.sehir

--SORU 2
-- tablolardan satış görevlisini/personellerini ve temsil ettiği müşteriyi/müşterileri bulmak için bir SQL sorgusu yazın.musteri adi ve sehri ,satici adi ve komisyonu
select musteri.cust_name as musteri_adi,musteri.sehir,satici.isim as satici_isim,satici.komisyon 
from satici inner join musteri 
on satici.satici_kimligi=musteri.satici_kimligi

--SORU 3
--şirketten yüzde 12'den fazla komisyon alan satış görevlilerini bulmak için bir SQL sorgusu yazın.  Müşteri Adı, müşteri şehri, Satıcı, komisyon. 
select musteri.cust_name,musteri.sehir,satici.isim,satici.komisyon
from satici inner join musteri 
on satici.satici_kimligi=musteri.satici_kimligi
where komisyon>0.12

--SORU 4
--müşterilerinin yaşadığı şehirde yaşamayan ve şirketten %12'den fazla komisyon alan satış görevlilerini bulmak için bir SQL sorgusu yazın.
--Müşteri Adı, müşteri şehri, Satıcı, satıcı şehri, komisyon. 
select b.cust_name as musteri_isim ,b.sehir as musteri_sehir ,a.isim as satici_isim,a.komisyon,a.sehir as satici_sehir
from satici a inner join musteri  b
on a.sehir!=b.sehir and a.satici_kimligi=b.satici_kimligi
where komisyon>0.12

--2.yol

select b.cust_name as musteri_isim ,b.sehir as musteri_sehir ,a.isim as satici_isim,a.komisyon,a.sehir as satici_sehir
from satici a inner join musteri  b
on   a.satici_kimligi=b.satici_kimligi
where komisyon>0.12 and a.sehir<>b.sehir

--SORU 5
-- sipariş tutarının 100 ile 200 arasında olduğu siparişleri bulmak için bir SQL sorgusu yazın. siparis_no, fiyat, cust_name, sehir.
select a.cust_name , a.sehir, b.siparis_no,b.fiyat 
from  musteri a inner join siparisler b
on a.satici_kimligi=b.satici_kimligi
where fiyat>100 and fiyat<200


--SORU 6
--Bir siparişin ayrıntılarını bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın. siparis_no, fiyat,siparis tarihi  Müşteri Adı,  Satıcı, komisyon
select a.siparis_no,a.fiyat,a.siparis_tarihi,b.cust_name,c.isim,c.komisyon
from siparisler a inner join musteri b
 on a.satici_kimligi=b.satici_kimligi
inner join satici c
on a.satici_kimligi=c.satici_kimligi

--SORU 8
--Satıcı, müşteri ve sipariş tablolarını birleştirmek için bir SQL ifadesi yazın, böylece her tablonun aynı sütunu bir kez görünecek ve sadece ilişkisel satırlar döndürülecek.  

SELECT * 
FROM siparisler 
NATURAL JOIN musteri  
NATURAL JOIN satici;

select * from musteri
--SORU 9:
--Aşağıdaki tablolardan, derecesi 300'den düşük olan müşterileri bulmak için bir SQL sorgusu yazın. Sonuç, artan musteri_kimligi ile sıralanmalıdır.
 select * from musteri where derece<300 order by musteri_kimligi

select * from siparisler
--SORU 10:
--Mevcut müşterilerden herhangi birinin sipariş verip vermediğini belirlemek için sipariş tarihine göre
--artan sırada müşteri adı, şehir, sipariş numarası, sipariş tarihi ve sipariş tutarı ile bir SQL ifadesi yazın

select cust_name,sehir,siparis_no,fiyat,siparis_tarihi 
from musteri left join siparisler 
on musteri.satici_kimligi=siparisler.satici_kimligi
order by siparis_tarihi

--SORU 11:
--Müşteri adı, şehir, sipariş numarası, sipariş tarihi, sipariş tutarı, satış elemanı adı ve komisyon ile mevcut müşterilerden herhangi birinin 
--sipariş vermediğini veya kendi satıcısı veya satıcısı aracılığıyla sipariş verip vermediğini belirlemek için SQL deyimi
select a.cust_name,a.sehir,b.siparis_no,b.fiyat,b.siparis_tarihi,c.isim,c.komisyon
from musteri a left  join siparisler b
on a.satici_kimligi=b.satici_kimligi
left  join satici c
on b.satici_kimligi=c.satici_kimligi

--SORU 12:
--Bir veya daha fazla müşteri için çalışan veya henüz hiçbir müşteriye katılmamış satış görevlilerinin 
--artan sırasına göre bir liste oluşturmak için bir SQL ifadesi yazın
select a.cust_name as musteri_ismi , a.sehir as musteri_sehri , a.derece, b.isim as satici_ismi ,b.sehir as satici_sehri
from musteri a right join satici b
on a.satici_kimligi=b.satici_kimligi
order by b.satici_kimligi
















