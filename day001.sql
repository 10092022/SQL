-- DATABASE(VeriTabanı) Oluşturma
Create dataBase evren; 

create database erol;

-- DDL - DATA DEFINITION LANG.
-- CREATE - TABLO OLUŞTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date    
);

--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogrenci_notlari
AS -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için normal tablo
-- oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız.
SELECT isim,soyisim,not_ort FROM ogrenciler2;

-- DML - DATA MANUPULATION LANG.
-- INSERT (Database'e veri ekleme)
insert into ogrenciler2 values('1234567','Ali Osman','Kayıkcı',82.5,now());

-- BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK
insert into ogrenciler2 (isim,soyisim) values('Aziz','Polat');

select * from ogrenciler2

-- DQL - DATA QUERY LANG.
-- SELECT

select * FROM ogrenciler2; -- Burdaki * sembolü herşeyi anlamındadır
