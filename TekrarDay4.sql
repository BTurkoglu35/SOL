CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
    INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
    INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

select * from kelimeler

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
-- Veya işlemi için | karakteri kullanılır

select kelime from kelimeler where kelime similar to '%(at|ot|At|Ot|oT|aT)%'
select kelime from kelimeler where  kelime  ~~* '%at%' or  kelime  ~~* '%ot%'

select kelime from kelimeler where kelime ~* 'at' or  kelime  ~* 'ot'

-- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz

select kelime from kelimeler where kelime similar to '(ho|Ho|hi|Hi)%' 
select kelime from kelimeler where kelime ~~* 'ho%' or kelime ~~*  'hi%'
select kelime from kelimeler where kelime ~* 'h[oi](.*)'

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
select kelime from kelimeler where kelime similar to '%t|%m'
select kelime from kelimeler where kelime ~~ '%t' or kelime ~~'%m'
select kelime from kelimeler where kelime ~'(.*)[tm]$'

--h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz

select kelime from kelimeler where kelime similar to '[h|H]_t'
select kelime from kelimeler where kelime ~~* 'h_t'
select kelime from kelimeler where kelime ~*'h[A-Z,a-z]t'

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan 
--“kelime" değerlerini çağırın.
select kelime from kelimeler where kelime similar to 'h[a-e]%t'
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'

----İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime similar to '[say]%'
select kelime from kelimeler where kelime ~* '^[say](.*)'

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime similar to '%[maf]'
select kelime from kelimeler where kelime ~ '(.*)[maf]$'


-- İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
select kelime  from kelimeler where kelime similar to 'h[ai]t'
select kelime from kelimeler where kelime ~ '^h[ai]t$'

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın. 
select kelime from kelimeler where kelime similar to '[b-s][a-z,A-Z]l%'

--içerisinde en az 2 adet o o barıdıran kelimelerin tüm bilgilerini listeleyiniz
select kelime from kelimeler where kelime similar to '%[o][o]%'
select kelime from kelimeler where kelime ~'[o]{2}'

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.

select kelime from kelimeler where kelime ~'[o]{4}'

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select kelime from kelimeler where kelime  ~* '^[asy](.*)[mf]$'














