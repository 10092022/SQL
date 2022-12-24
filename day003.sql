create table ogrenciler5
(
id int,
isim varchar(50),
veli_isim varchar(50),
yazili_notu int
);
insert into ogrenciler5 values(123,'Ali Can','Hasan',75);
insert into ogrenciler5 values(125,'Merve Gul','ayse',85);
insert into ogrenciler5 values(125,'Kemal Yasa','Hasan',85);
insert into ogrenciler5 values(126,'Nesibe Yilmaz','Ayse',95);
insert into ogrenciler5 values(127,'Mustafa Bak','Can',99);
insert into ogrenciler5 values(128,'Mustafa Bak','Ali',99);

select * from ogrenciler5

-- ismi Mustafa bak ve nesibe yılmaz olanları sil
delete from ogrenciler5 where isim='Mustafa Bak' or isim='Nesibe Yilmaz'

--veli ismi hasan datayı sil
delete from ogrenciler5 where veli_isim='Hasan';

-- Truncate -- 
-- Bir Tablodaki tüm verileri geri alamayacağımız şekilde siler. şartlı silme yapmaz(where)

Truncate table ogrenciler5 

-- On Delete Cascade
drop table if exists adresler

create table talebeler
(
id char(3) primary key,
isim varchar(50),
veli_isim varchar(50),
yazli_notu int
);
create table notlar1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
constraint notlar_fk foreign key (talebe_id) references talebeler(id)
);
insert into talebeler values(123,'Ali Can','Hasan',75);
insert into talebeler values(124,'Merve Gul','ayse',85);
insert into talebeler values(125,'Kemal Yasa','Hasan',85);
insert into talebeler values(126,'Nesibe Yilmaz','Ayse',95);
insert into talebeler values(127,'Mustafa Bak','Can',99);

insert into notlar1 values ('123','kimya',75);
insert into notlar1 values ('124','fizik',65);
insert into notlar1 values ('125','tarih',90);
insert into notlar1 values ('126','matematik',90);

select * from talebeler;
select * from notlar1;

-- notlar tablosundan id'si 123 olan datayı silelim
delete from notlar1 where talebe_id='123'

--talebeler tablosundan id'si 126 olan datayı silelim

--delete from talebe where id='126'; burada hocanın karmaşıklığından bir halt anlamadım

/*  her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile 
parent tablodan da veri silebiliriz. yalnız ON DELETE CASCADE komutu kullanımında parent tablodan
sildiğimiz data child tablo dan da silinir.   */

-- IN condition
drop table if exists musteriler;

create table musteriler
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
insert into musteriler values (10,'Mark','Orange');
insert into musteriler values (10,'Mark','Orange');
insert into musteriler values (10,'Mark','Orange');
insert into musteriler values (20,'John','Apple');
insert into musteriler values (30,'Amy','Palm');
insert into musteriler values (20,'Mark','Apple');
insert into musteriler values (10,'Adem','Orange');
insert into musteriler values (40,'John','Apricot');
insert into musteriler values (20,'Eddie','Apple');

select * from musteriler;

-- musteriler tablosundan urun ismi orange, apple veya apricot olan dataları listeleyin 
select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';
select * from musteriler where urun_isim in('Orange','Apple','Apricot') -- in condition
select * from musteriler where urun_isim not in('Orange','Apple','Apricot')
 
-- Between condition
--musteriler tablosundan id'si 20 ile 40 arasında olan tüm verileri listeleyin
select * from musteriler where urun_id>=20 and urun_id<=40
select * from musteriler where urun_id between 20 and 40;
 
-- not between condition
select * from musteriler where urun_id not between 20 and 40;

-- SUBQUERIES --> sorgu içinde sorgu
create table calisanlar2
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
isyeri varchar (50)
);
insert into calisanlar2 values(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
insert into calisanlar2 values(123456790, 'Ayse Gul','Istanbul',1500,'LCW');
insert into calisanlar2 values(123456791, 'Veli Yilmaz','Ankara',3000,'Vakko');
insert into calisanlar2 values(123456792, 'Veli Yilmaz','Izmir',1000,'Pierre Cardin');
insert into calisanlar2 values(123456793, 'Veli Yilmaz','Ankara',1500,'Adidas');
insert into calisanlar2 values(123456794, 'Ayse Gul','Ankara',1500,'Pierre Cardin');
insert into calisanlar2 values(123456795, 'Fatma Yasa','Bursa',2500,'Vakko');
insert into calisanlar2 values(123456795, 'Fatma Yasa','Bursa',null,'Vakko');

create table markalar
(
marka_id int,
marka_isim varchar(20),
calisan_sayisi int
);
insert into markalar values(100, 'Vakko', 12000);
insert into markalar values(101, 'Pierre Cardin', 17000);
insert into markalar values(102, 'Adidas', 10000);
insert into markalar values(103, 'LCW', 21000);
insert into markalar values(104, 'Nike', 19000);

select * from calisanlar2
select * from  markalar

-- çalışan sayısı 15000 den fazla olan markaların isimleirni ve bu markada 
-- çalışan ların isimlerini ve maaşlarını listeleyin
select isim,maas,isyeri from calisanlar2
where isyeri in (select marka_isim from markalar where calisan_sayisi>15000);

-- marka_id si 101 den büyük olan marka çalışanlarının isim, maaş ve şehirlerini listele
select isim,sehir,maas from calisanlar2
where isyeri in (select marka_isim from markalar where marka_id>101);

-- Aggregate Method

-- çalısanlar tablosundan maksiöum maası listeleyelim
select max(maas) from calisanlar2;
select max(maas) as maksimum_maas from calisanlar2;

/*  eğer bir sutuna geçici olarak isim vermek isteredsek AS komutunu yazdıktan sonra 
vermek istediğimiz ismi yazarız  */

-- çalısanlar tablosundan minimum maası listeleyelim
select min(maas) as en_duduk_maas from calisanlar2;

-- calisanlar tablosundaki maasların toplamını listele
select sum(maas) from calisanlar2

--calisanlar tablosundaki maasların ortalamasını listele
select avg(maas) from calisanlar2
select round(avg(maas)) from calisanlar2
select round(avg(maas),2) from calisanlar2

-calisanlar tablosundaki maasların sayısını listele
select count(maas) from calisanlar2 --7
select count(*) from calisanlar2 --8

/*  eğer count(*) kullanırsak tablodaki tüm satırlarınn  sayısını verir.
sutun adı kullanırsak o sutundaki sayıları verir.  */ 

select * from calisanlar2
select * from markalar
--Aggregate methodlarda Subquery
--her markanın id'sini, ismini ve toplaam kaç sehirde bulunduğunu listeleyen bir sorgu yazın

select marka_id,marka_isim,
(select count(sehir) as sehir_sayisi from calisanlar2 where marka_isim=isyeri) from markalar;

--her markanın ismini, calisan sayisini ve o markaya ait calisanlarin toplam maasını listele
create view summmas
as
select marka_isim,calisan_sayisi,
(select sum(maas) from calisanlar2 where isyeri=marka_isim) 
from markalar

select * from summaas;

--her markanın ismini, calisan sayisini ve o markaya ait calisanlarin 
--max ve min maasini listeleyen bir sorgu yazın
select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim) as enYuksekMaas,
(select min(maas) from calisanlar2 where isyeri=marka_isim) as enDusukMaas
from markalar

--VİEW kullanımı
/*  yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yerine view'e 
atadığımız ismi select komutuyla çağırırız    */
create view MaxMinMaas
as
select marka_isim,calisan_sayisi,
(select max(maas) from calisanlar2 where isyeri=marka_isim) as enYuksekMaas,
(select min(maas) from calisanlar2 where isyeri=marka_isim) as enDusukMaas
from markalar

select * from MaxMinMaas;
