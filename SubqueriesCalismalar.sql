--SUBQUERIES
select * from musteri
select * from satici
select * from siparisler 

--Soru 1
-- Aşağıdaki tablolardan, satıcı 'Yagiz Sefa' tarafından verilen tüm siparişleri bulmak için bir SQL sorgusu yazın. 
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi döndürür
select * from siparisler where musteri_kimligi=(select musteri_kimligi from musteri where cust_name='Yagiz Sefa' )

--soru 2
--. Izmir merkezli satış görevlileri tarafından oluşturulan tüm siparişleri bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın. 
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi  döndürür
select * from siparisler where satici_kimligi in (select satici_kimligi from satici where sehir='Izmir')

---soru 3
--. Aşağıdaki tablolardan, kimliği 3007 olan müşteriler için çalışabilecek satış görevlileri
--tarafından oluşturulan tüm siparişleri bulmak için bir SQL sorgusu yazın. 
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi 

select * from siparisler where satici_kimligi=(SELECT DISTINCT satici_kimligi FROM siparisler    WHERE musteri_kimligi =3007);

--soru 4
--2020-10-05 ortalama sipariş değerinden daha büyük sipariş değerlerini bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın. 
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi 
select * from siparisler where fiyat>(select fiyat from siparisler where siparis_tarihi='2020-10-05')

--soru 5
-- Aşağıdaki tablolardan, izmir şehrinde oluşturulan tüm siparişleri bulmak için bir SQL sorgusu yazın. 
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi 

select * from siparisler where musteri_kimligi in (select musteri_kimligi from musteri where sehir='izmir')

--soru 6
-- istanbuldan veriln siparisin  satış görevlilerinin komisyonunu belirlemek için aşağıdaki tablolardan bir SQL sorgusu yazın. 
select komisyon  from satici where satici_kimligi=(select satici_kimligi from musteri where sehir='Istanbul')

--soru 7
--Aşağıdaki tablolardan, izmir'deki ortalamanın üzerinde derece sahip müşterilerin sayısını saymak için bir SQL sorgusu yazın. 
select derece, count(*) from musteri group by derece having  derece>(select avg(derece) from musteri where sehir='izmir')

--Aşağıdaki tablolardan, maksimum komisyonu kazanan satış görevlilerini bulmak için bir SQL sorgusu yazın.
--siparis_no, fiyat, siparis_tarihi, satici_kimligi dondurur

select siparis_no, fiyat, siparis_tarihi, satici_kimligi from siparisler 
where satici_kimligi=(select satici_kimligi from satici order by komisyon desc  limit 1)

--2.yol
SELECT siparis_no, fiyat, siparis_tarihi, satici_kimligi
FROM siparisler WHERE satici_kimligi IN(SELECT satici_kimligi FROM  satici WHERE komisyon = (SELECT MAX(komisyon) FROM satici));

--soru 8
--2021-02-12 tarihinde sipariş veren müşterileri bulmak için aşağıdaki tablolardan SQL sorgusu yazın.
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi ve musteri ismi
select a.*, b.cust_name from siparisler a,musteri b where  a.musteri_kimligi=b.musteri_kimligi and siparis_tarihi='2021-02-12 '

--soru 9
--Birden fazla müşterisi olan satış görevlilerini bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın. satici_kimligi  ve adını döndür. 

SELECT satici_kimligi ,isim 
FROM satici a 
WHERE 1 < 
    (SELECT COUNT(*) 
     FROM musteri 
     WHERE satici_kimligi=a.satici_kimligi);


--soru 10
--Aşağıdaki tablolardan, siparişlerin ortalama miktarından daha yüksek olan siparişleri bulmak için bir SQL sorgusu yazın.
--siparis_no, fiyat, siparis_tarihi, musterri_kimligi ve satici_kimligi 


select siparis_no, fiyat, siparis_tarihi, musteri_kimligi ,satici_kimligi from siparisler a where fiyat>
(select avg(fiyat) from siparisler )

--soru11
--Müşteri tablosundaki bir veya daha fazla müşteri izmir'de bulunuyorsa, müşteri tablosundan tüm verileri çıkarmak için bir sorgu yazın. 
select * from musteri where exists(select *from musteri where sehir='izmir' )

--Soru 12
--. Birden çok müşteriyle ilgilenen satış görevlilerini bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın.
--Salesman_id, ad, şehir ve komisyonu dondurun
SELECT * FROM satici WHERE satici_kimligi IN (  SELECT DISTINCT  satici_kimligi   FROM musteri a    WHERE EXISTS (
      SELECT *   FROM musteri b  WHERE b.satici_kimligi=a.satici_kimligi 
      AND b.cust_name<>a.cust_name));
--Soru 13
--Tek bir müşteriyle ilgilenen satış görevlilerini bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın. 

--Salesman_id, ad, şehir ve komisyonu dondurun

SELECT * FROM satici WHERE satici_kimligi IN (  SELECT DISTINCT  satici_kimligi   FROM musteri a    WHERE NOT EXISTS (
      SELECT *   FROM musteri b  WHERE b.satici_kimligi=a.satici_kimligi 
      AND b.cust_name<>a.cust_name));

---Soru 14
--Ilgilendigi  müşterilerle ayni sehirde yasayan satış görevlilerini bulmak için aşağıdaki tablolardan bir SQL sorgusu yazın.
--Salesman_id, ad, şehir ve komisyonu dondurun

select * from satici a where sehir=(select sehir from musteri b where a.sehir=b.sehir )
SELECT * FROM satici WHERE sehir=ANY  (SELECT sehir FROM musteri);

--Soru 15 
--Aşağıdaki tablolardan, ikamet yeri müşterilerin yaşadığı herhangi bir şehirle eşleşen satış görevlilerini bulmak için bir SQL sorgusu yazın. 
--Satıcı_kimliği, ad, şehir ve komisyonu
select * from satici a where sehir=(select sehir from musteri b where a.sehir=b.sehir )

--Soru16
--Musteri tablosunda alfabetik olarak afyon şehrinin altındaki tüm müşterilerden daha yüksek nota sahip tüm bu müşterileri bulmak için bir SQL sorgusu yazın. 
---Customer_id, cust_name, city, grade, salesman_id değerini döndür.

select * from musteri where derece>(select derece from musteri where sehir='Afyon')

--Soru17
--Aşağıdaki tablodan, sipariş tutarı "2021-12-04" de verilen siparişlerden en az birini aşan tüm siparişleri bulmak için bir SQL sorgusu yazın. 
--İade ord_no, purch_amt, ord_date, customer_id ve salesman_id.
select * from siparisler where fiyat>ANY(select fiyat from siparisler where siparis_tarihi='2021-12-04')

--soru 18
--Aşağıdaki tablolardan, sipariş tutarının Istanbul'da ikamet eden bir müşterinin sipariş tutarından az olduğu siparişleri bulmak için bir SQL sorgusu yazın.
--ord_no, purch_amt, ord_date, customer_id ve salesman_id döndürür.

select * from siparisler where fiyat<(select fiyat from siparisler where musteri_kimligi=(select musteri_kimligi from musteri where sehir='Istanbul') 

--Soru 19
--Aşağıdaki tablolardan, her sipariş tutarının izmir'de yaşayan bir müşterinin maksimum sipariş tutarından az olduğu siparişleri bulmak için bir SQL sorgusu yazın. ord_no, purch_amt, ord_date, customer_id ve salesman_id döndürür.									  

select * from siparisler  where fiyat<(select max(fiyat) from siparisler a ,musteri b where a.musteri_kimligi=b.musteri_kimligi and  sehir='izmir');


















