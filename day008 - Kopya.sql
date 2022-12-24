-- DISTINCT

create table musteri_urun (
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
);
insert into musteri_urun values(10,'Ali','Portakal');
insert into musteri_urun values(10,'Ali','Portakal');
insert into musteri_urun values(20,'Veli','Elma');
insert into musteri_urun values(30,'Ayse','Armut');
insert into musteri_urun values(20,'Ali','Elma');
insert into musteri_urun values(10,'Adem','Portakal');
insert into musteri_urun values(40,'Veli','Kayisi');
insert into musteri_urun values(20,'Elif','Elma');

select * from musteri_urun

--musteri urun tablosundan urun isimlerini tekrarsız (grup) listeleyin
select urun_isim from musteri_urun group by urun_isim  --GROUP BY çözümü
select distinct(urun_isim) from musteri_urun --DISTINCT çözümü

--tabloda kaç farklı meyve vardır
select urun_isim, count(urun_isim) from musteri_urun group by urun_isim -- gruplanmış
select urun_isim, count(distinct urun_isim) from musteri_urun group by urun_isim --tekrarsız

-- FETCH NEXT () ROW ONLY / OFSET / LIMIT

-- musteri urun tablosundan ilk üç kaydı listele
select * from musteri_urun order by urun_id fetch next 3 row only 
select * from musteri_urun order by urun_id limit 3  -- limit ile de yapılır

-- musteri urun tablosundan ilk kaydı listele
select * from musteri_urun order by urun_id limit 1

-- musteri urun tablosundan son 3 kaydı listele
select * from musteri_urun order by urun_id desc limit 3

create table maas (
id int,
musteri_isim varchar(50),
maas int
);
insert into maas values(10,'Ali',5000);
insert into maas values(10,'Ali',7500);
insert into maas values(20,'Veli',10000);
insert into maas values(30,'Ayse',9000);
insert into maas values(20,'Ali',6500);
insert into maas values(10,'Adem',8000);
insert into maas values(40,'Veli',8500);
insert into maas values(20,'Elif',5500);

select * from maas

-- en yuksek maası alan musteriyi listeleyin
select * from maas order by desc limit 1   -- en yuksek maas

/*  satır atlamak istediğimizde OFFSET komutunu kullanırız   */
select * from maas order by maas desc limit 1 offset 1  -- en yuksek 2. maas
select * from maas order by maas desc offset 1 row fetch next 1 row only -- üstteki ile aynı
select * from maas order by maas offset 3 limit 1   --üç satır atla 4. ve 5.iyi ver 

-- DDL --> ALTER tABLE STATEMENT

create table personel57 (
id int,
isim varchar(20),
sehir varchar(20),
maas int,
sirket varchar(20),
constraint personel57_pk primary key (id)
);
insert into personel57 values(123456789,'Ali Yilmaz','Istanbul',5500,'Honda');
insert into personel57 values(234567890,'Veli Sahin','Istanbul',4500,'Toyota');
insert into personel57 values(345678901,'Mehmet Ozturk','Ankara',3500,'Honda');
insert into personel57 values(456789012,'Mehmet Ozturk','Izmir',6000,'Ford');
insert into personel57 values(567890123,'Mehmet Ozturk','Ankara',7000,'Tofas');
insert into personel57 values(678901234,'Veli Sahin','Ankara',4500,'Ford');
insert into personel57 values(789012345,'Hatice Sahin','Bursa',4500,'Honda');

select * from personel57

alter table personel57 add ulke varchar(20) --tabloya field ekleme

alter table personel57 add adres varchar(30) default 'Turkiye' 
--oluşturduğumuza field'a belirttiğimiz veriyi tüm satırlara ekler

alter table personel57 drop column ulke
alter table personel57 drop adres,drop sirket --2 sutun birden sildik

--sutun ismi değiştirme
alter table personel57 rename column sehir to il 

-- tablo adı değiştirme
alter table personel57 rename to personel37

select * from  personel37

-- TYPE/SET (modify) sutunlarının özelliklerini değiştirşme
alter table personel37 alter column il type varchar(23),
alter column maas set not null;

alter column maas type varchar(30) using (maas::varchar(30))
/*  eğer numeric data türüne sahip bir sutunun data türüne string bir data türü atamak istersek 
  TYPE varchar(30) USING(maas::varchar(30)) formatını kullanırız   */

DROP TABLE ogrenciler

-- TRANSACTION --> (begin- savepoint-commit)
/*  transaction baslatmak için BEGIN komutu kullanmamız gerekir ve Transaction'ı sonlandırmak için
COMMIT komutunu calistirmaliyiz    */
create table ogrenciler25 (
id serial, --serial data türü otomatik olarak 1 den baslayarak sıralı olarak sayı ataması yapar
 -- insert into ile tabloya veri eklerken serial data türünü kullandığım veri değeri yerine default yazarız
isim varchar(50),
veli_isim varchar(50),
yazili_notu real
);
begin;
insert into ogrenciler25 values(default,'Ali Can','Hasan',75.5);
insert into ogrenciler25 values(default,'Merwe Gul','Ayse',85.3);
savepoint x;
insert into ogrenciler25 values(default,'Kemal Yasa','Hasan',85.6);
insert into ogrenciler25 values(default,'Nesibe Yilmaz','Ayse',95.3);
savepoint y;
insert into ogrenciler25 values(default,'Mustafa Bak','Can',99);
insert into ogrenciler25 values(default,'Can Bak','Ali',67.5);
rollback to x;
commit;

select * from ogrenciler25










