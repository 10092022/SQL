CREATE TABLE ogrenciler3
(
ogrenci_no char(7),-- Uzunluğunu bildiğimiz stringler için CHAR kullanılır
isim varchar(20), -- Uzunluğunu bilmediğimiz stringler için VARCHAR kullanırız
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date);
-- VAROLAN BİR TABLODAN YENİ BİR TABLO OLUŞTURMA
create table ezikler as select isim,not_ort from ogrenciler3;

select * from ezikler;
--INSERT- TABLO İÇİNE VERİ EKLEME
insert into ezikler values ('Esra',74.2);

select * from notlar;

select isim from notlar;

-- CONSTRAINT
--UNIQEU
--NOT NULL

CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(20) not null, 
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler7;
insert into ogrenciler7 values('12345','Ahmet','Cetin',70.7,now());
insert into ogrenciler7 values('12346','Ahmet','Cetin',70.7,now());
insert into ogrenciler7 values('12347','','Cetin',70.7,now());

-- PRIMARY KEY OLUŞTURMA

CREATE TABLE ogrenciler8
(
ogrenci_no char(7) primary key,
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler9

-- Primary Key ataması 2. yol
CREATE TABLE ogrenciler9
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
constraint ogr primary key (ogrenci_no)
);

-- Primary Key ataması 3. yol
CREATE TABLE ogrenciler10
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
primary key (ogrenci_no)
);

-- Foreign key
/* "tedarikciler3" isimli bir tablo oluşturun. tabloda "tedarikci_id", "tedarikci_ismi", "iletişim_ismi",
field'ları olsun ve "tedarikci_id"yi primary key yapın. "urunler" isminde başka bir tablo oluşturun 
"tedarikci_id" ve "urun_id" field'ları olsun ve "tedarikci_id" yi Foreign key yapın    */
create table tedarikciler3 (
tedarikci_id char(5) primary key,
tedarikci_isim varchar(20),
iletisim_isim varchar(10)
);
create table urunler (
tedarikci_id char(5),
urun_id varchar (10), 
foreign key (urun_id) references tedarikciler3(tedarikci_id)
);
select * from tedarikciler3;
select * from urunler;

/* çalışanlar isimli bir tablo oluşturun field'lari olsun. içinde "id", "isim", "maaş", "ise_baslama"
field'ları olsun. "id"yi Primary Key yapın, "isim" unique, "maas"i Not Null yapın. "adresler" isminde
baska bir tablo olusturun. içinde "adres_id", "sokak", "cadde" ve "sehir" field'ları olsun. 
"aderes_id" field'i ile Foreign key olusturun    */
 
create table calisanlar (
id varchar(20) primary key,
isim varchar(30) unique,
maas int not null,
baslama_tarih date
);
create table adresler (
adres_id varchar(20),
sokak varchar(20),
cadde varchar(20),
sehir varchar(20),
foreign key(adres_id) references calisanlar(id)
);

insert into calisanlar values ('10002', 'Ali Osman', 12000, '2018-04-14');
insert into calisanlar values ('10008', null, 5000, '2018-04-14');
--insert into calisanlar values ('10010', 'Ali Osman', 5000, '2018-04-14'); -- unique cons. kabul etmez
insert into calisanlar values ('10004', 'Ali Rıza', 5000, '2018-04-14');
insert into calisanlar values ('10005', 'Muhammed Ali', 5000, '2018-04-14');
--insert into calisanlar values ('10006', 'Canan Can', null, '2018-04-14'); -- not null cons. kabul etmez
insert into calisanlar values ('10007', 'Omar', 5000, '2018-04-14');
--insert into calisanlar values ('10003', 'Omar', 12000, '2018-04-14'); -- unique cons. kabul etmez
--insert into calisanlar values ('10002', 'Cem', '', '2018-04-14'); -- kabul etmez
insert into calisanlar values ('', 'Osman', 2000, '2018-04-14');
--insert into calisanlar values ('', 'Osman Efe', 3000, '2018-04-14'); -- primary key
--insert into calisanlar values ('10002', 'Natalia', 4000, '2018-04-14'); -- primary key
--insert into calisanlar values (null, 'Ali Osman', 12000, '2018-04-14'); -- primary key

insert into adresler values ('10003', 'Mutlu sok','40.cad', 'Istanbul');
insert into adresler values ('10003', 'Can sok', '50.cad', 'Ankara');
insert into adresler values ('10002', 'Aga sok', '30.cad', 'Antep');

-- parent tabloda olmayan id ile child a ekleme yapamayız
insert into adresler values('10012','Aga sok', '30.cad','Antep');

-- FK'ye null değeri atanabilir
insert into adresler values(null,'Aga sok','30.cad.','Antep');
insert into adresler values(null,'Aga sok','30.cad.','Maras');

select * from calisanlar;
select * from adresler;

-- Check Constraint
create table calisanlar1
(
id char (5) primary key,
isim varchar (29) unique,
maas int check (maas>10000),
ise_baslama date		
);

insert into calisanlar1 values('10002','Ali Osman',19000,'2018-04-14')

-- DQL -- where kullanımı

select * from calisanlar;
select isim from calisanlar;

-- Calisanlar tablosundan maaşı 5000 den büyük olanı listele
select * from calisanlar where maas>5000;

-- Calisanlar tablosundan ismi Ali Rıza olan tüm verileri listele
select * from calisanlar where isim = ('Ali Rıza');

-- Calisanlar tablosundan maaşı 5000 olan tüm verileri  listele
select * from calisanlar where maas = (5000);

-- DML --Delete komutu
delete from calisanlar; -- eğer parent table başka bir child ile ilişkili ise önce child tablo silinmeli

--adresler tablosundan sehir antep olanı sil
select * from adresler;