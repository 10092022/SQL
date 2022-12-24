-- JOINS 
-- Inner Join

create table sirketler (
sirket_id int,
sirket_isim varchar(20)
);
insert into sirketler values (100,'Toyota');
insert into sirketler values (101,'Honda');
insert into sirketler values (102,'Ford');
insert into sirketler values (103,'Hyundai');

create table siparisler (
siparis_id int,
sirket_id int,
siparis_tarihi date
);
insert into siparisler values(11,101,'2020-04-17');
insert into siparisler values(22,102,'2020-04-18');
insert into siparisler values(33,103,'2020-04-19');
insert into siparisler values(44,104,'2020-04-20');
insert into siparisler values(55,105,'2020-04-21');

select * from sirketler
select * from siparisler

--iki tabloda sirket id'si aynı olan sirket ismi, siparis id ve siparis tarihleri ile yeni tablo olustur
select sirketler.sirket_isim,siparis.siparis_id,siparisler.siparis_tarih
from sirketler inner join siparisler
on sirketler.sirket_id = siparisler.sirket_id

-- Left Joins
--iki tabloda sirket id'si aynı olan sirket ismi, siparis id ve siparis tarihleri ile yeni tablo olustur
select sirketler.sirket_isim,siparis.siparis_id,siparisler.siparis_tarih
from sirketler left join siparisler
on sirketler.sirket_id = siparisler.sirket_id

--RIGHT Join
select sirketler.sirket_isim,siparis.siparis_id,siparisler.siparis_tarih
from sirketler right join siparisler
on sirketler.sirket_id = siparisler.sirket_id

-- FULL join
select sirketler.sirket_isim,siparis.siparis_id,siparisler.siparis_tarih
from sirketler full join siparisler
on sirketler.sirket_id = siparisler.sirket_id

-- SELF joins
create table personel2 (
id int,
isim varchar(20),
title varchar(60),
yonetici_id int
);
insert into personel2 values(1,'Ali Can','SDET',2);
insert into personel2 values(2,'Veli Cem','QA',3);
insert into personel2 values(3,'Ayse Gul','QA Lead',4);
insert into personel2 values(4,'AFatma Can','CEO',5);

select * from personel

-- her personelin yanına yöneticicismiin yazdıran bir tablo olusturun
select isim from personel2

select p1.isim,p2.isim from personel2 p1 inner join personel2 p2 on p1.yonetici_id = p2.id

-- LIKE Condition

create table musteriler37 (
id int unique,
isim varchar(50) not null,
gelir int
);
insert into musteriler37 (id,isim,gelir) values(1001,'Ali',62000);
insert into musteriler37 (id,isim,gelir) values(1002,'Ayse',57500);
insert into musteriler37 (id,isim,gelir) values(1003,'Feride',71000);
insert into musteriler37 (id,isim,gelir) values(1004,'Fatma',42000);
insert into musteriler37 (id,isim,gelir) values(1005,'Kasim',44000);
insert into musteriler37 (id,isim,gelir) values(1006,'ahmet',82000);


--ismi 'A' harfi ile baslayan musterilerin tüm bilgilerini yazdıran QUERY yazın
select * from musteriler37 where isim Ilike 'A%' 
--like kullanımında büyük küçük gözetmeksizin sonuç almak istersek ILIKE kullanırız
-- LIKE yerine ~~ sembolleri de kullanabiliriz. IGNORCASE --> ~~*
select * from musteriler37 where isim ~~*'A%' 

--ismi 'e' harfi ile biten musterilerin isimleirini ve gelir lwerinin yazdırqan sorgu yazın
select isim,gelir from musteriler37 where isim ~~ '%e'

--isminin içinde er olan musterilerin isimlerini ve gelirşlerini yazdıran sorgu
select isim,gelir from musteriler37 where isim like '%er%' 

--ismi 5 harfli olup son 4 harfi atma olan msuterielrin tümbilgileeirni yazdıran sorgu yazın
select * from musteriler37 where isim ~~ '_atma'

--ikinci harfi a olan musterşlerin tüm bilgileirni yazdıran sorgu
select * from musteriler37 where isim like '_a%'

--ucuncu harfi s olan musterşlerin tüm bilgileirni yazdıran sorgu
select * from musteriler37 where isim like ~~ '__s%'

-- REGEXP_LIKE (~) kullanımı

create table kelimeler ( 
id int unique,
kelime varchar(50) not null,
HArf_sayisi int
);
insert into kelimeler values(1001,'hot',3);
insert into kelimeler values(1002,'hat',3);
insert into kelimeler values(1003,'hit',3);
insert into kelimeler values(1004,'hbt',3);
insert into kelimeler values(1005,'hct',3);
insert into kelimeler values(1006,'adem',4);
insert into kelimeler values(1007,'selim',5);
insert into kelimeler values(1008,'yusuf',5);
insert into kelimeler values(1009,'hAt',5);

--ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kleimelrin tüm bilgileirni yazdıran sorgu 
select * from kelimeler where kelime ~ 'h[ai]t'

--ilk harfi h,son harfi t olup 2.harfi a ile k arasında olan 3 harfli kleimelrin tüm bilgileirni yazdıran sorgu 
select * from kelimeler where kelime ~* 'h[a-k]t'

--a veya s ile baslayan kelimelerin tüm bilgilerini yazdıraan sorgu yaz
select * from kelimeler where kelime ~ '^[as]'

--m veya f ile baslayan kelimelerin tüm bilgilerini yazdıraan sorgu yaz
select * from kelimeler where kelime ~* '[mf]$'

-- UPPER - LOWER - INITCAP
/*    kelimeler tablosundaki kelime sutunundaki verileri önce hepsi büyük harf,sonra küçük harf ve 
ilk harfleri büyük harf oalcak sekilde yazdeıralım   */

select upper(kelime) from kelimeler
select lower(kelime) from kelimeler
select initcap(kelime) from kelimeler  -- ilk harfi büyük yazar

select lower (title), upper(isim) from personel2
/* birden fazla stuundaki verielri buyuk kucuk yapmak istersek böyle yaparız */