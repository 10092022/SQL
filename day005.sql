-- ALIASES 
create table calisanlar14
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
insert into calisanlar14 values (123456789,'Ali Can','Istanbul');
insert into calisanlar14 values (234567890,'Veli Cem','Anklara');
insert into calisanlar14 values (345678901,'Mine Bulut','Izmir');

select * from calisanlar

--iki sutunun verielrini birleştirmek istersek concet sembolu || kullanırız
select calisan_id as id, calisan_isim || ' ' || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar14
--2. yol
select calisan_id as id, concat (calisan_isim,' ',calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar

--IS NULL CONDITION
create table insanlar
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
insert into insanlar values (123456789,'Ali Can','Istanbul');
insert into insanlar values (234567890,'Veli Cem','Anklara');
insert into insanlar values (345678901,'Mine Bulut','Izmir');
insert into insanlar (ssn,adres) values (456789012,'Bursa');
insert into insanlar (ssn,adres) values (567890123,'Sinop');

select * from insanlar 

--name sutununda null olan değereleri listele
select name from insanlar where name is null

--insanlar tablosunda sadece null olamayan deeğerleri listele
select name from insanlar where name is not null

--insanlar tablosunda null değer almış verileri no name olarak değiştirin
update insanlar set name =  'no name' where name is null;

--ORDER BY komutu   
-- tablolardaki verileri sıralamak için kullanılır default olarak küçükten büyüğe sıralar.
-- büyükten küçüğe sıralamak istersek ORDER BY komutundan sonra DESC komutu kullanırız
create table insanlar5
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
insert into insanlar5 values (123456789,'Ali', 'Can','Istanbul');
insert into insanlar5 values (234567890,'Veli','Cem','Ankara');
insert into insanlar5 values (345678901,'Mine', 'Bulut','Ankara');
insert into insanlar5 values (123456789,'Mahmut', 'Bulut','Istanbul');
insert into insanlar5 values (234567890,'Mine', 'Yasa','Ankara');
insert into insanlar5 values (345678901,'Veli', 'Yilmaz','Istanbul');

select * from insanlar5

--insanlar tablosundaki dataları adrese göre sıralayın
select * from insanlar5 order by adres

--insanlar tablosundaki dataları isme göre sıralayın
select * from insanlar5 order by isim 

--insanlar tablosundaki ismi Mine olanları SSN sıralı olarak listeleyin
select * from insanlar5 where isim = 'Mine' order by ssn

--  not: orcder by komutundan sonra field ismi yerine field numarası da kullanılabilir

--insanlar tablosundaki soyismi bulut olanları isim sıralı olarak listele
select * from insanlar5 where soyisim = 'Bulut' order by 4

--insanlar tablosundaki tum kayıtları SSN numarası büyükten küçüğe göre sırala
select * from insanlar5 order by ssn desc;

--insanlar tablosundaki tum kayıtları isimle naturel sıralı, soyisimler ters sıralı olarak listele
select * from insanlar5 order by isim asc, soyisim desc;

--isim  ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayın
select isim,soyisim from insanlar5 order by length (soyisim) desc;

--tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sutun değerini uzunluğuna göre sıralayın
select isim || ' ' || soyisim as isim_soyisim from insanlar5 order by length (isim || soyisim)
select isim || ' ' || soyisim as isim_soyisim from insanlar5 order by length (isim)+length (soyisim)
select concat(isim,' ',soyisim) as isim_soyisim from insanlar5 order by length (isim)+length (soyisim)
select concat(isim,' ',soyisim) as isim_soyisim from insanlar5 order by length (concat(isim,soyisim))

--GROUP BY komutu
create table manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktari int
);
insert into manav values ('Ali','Elma',5);
insert into manav values ('Ayse','Armut',3);
insert into manav values ('Veli','Elma',2);
insert into manav values ('Hasan','Uzum',4);
insert into manav values ('Ali','Armut',2);
insert into manav values ('Ayse','Elma',3);
insert into manav values ('Veli','Uzum',5);
insert into manav values ('Ali','Armut',2);
insert into manav values ('Veli','Elma',3);
insert into manav values ('Ayse','Uzum',2);

select * from manav

--isme göre alınan toplam urunleri listele
select isim, sum(urun_miktari) as aldiği_toplam_urun from manav
group by isim;

--isme göre toplam urnleri bulun ve bu ürünleri büyükten küçüğe göre listele
select isim, sum(urun_miktari) as aldiği_toplam_urun from manav
group by isim
order by aldiği_toplam_urun desc;

--urun ismine göre urunu alan toplam kişi sayısı
select urun_adi, count(isim) from manav
group by urun_adi;

select isim,count(urun_adi) from manav
group by isim











