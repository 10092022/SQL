-- Exists Condition
create table mart
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
)
insert into mart values(10,'Mark','Honda');
insert into mart values(20,'John','Toyota');
insert into mart values(30,'Amy','Ford');
insert into mart values(20,'Mark','Toyota');
insert into mart values(10,'Adam','Honda');
insert into mart values(40,'John','Hyundai');
insert into mart values(20,'Eddie','Toyota');

create table nisan
(
urun_id int,
musteri_isim varchar(50),
urun_isim varchar(50)
)
insert into nisan values(10,'Hasan','Honda');
insert into nisan values(10,'Kemal','Honda');
insert into nisan values(20,'Ayse','Toyota');
insert into nisan values(50,'Yasar','Volvo');
insert into nisan values(20,'Mine','Toyota');

select * from mart
select * from nisan

/*   mart ve nisan aylarında aynı urun Id ile satılan urunlerin urun ıd lerini listeleyen ve 
aynı zamanda bu urunleri mart ayında alan musteri_isim lerini listeleyen bir sorgu yazın  */
select urun_id, musteri_isim from mart
where exists(select urun_id from nisan where mart.urun_id=nisan.urun_id)

/*   her ikiayda birden satılan urunlerin urun isim lerni ve bub urunleri 
nisan ayında satın alan musteri isim lerini listeleyen bir sorgu yaz  */
select urun_isim,musteri_isim from nisan 
where exists (select urun_isim from martwhere mart.urun_isim=nisan.urun_isim)


-- DML --> UPDATE 
create table tedarikciler1  -- parent
(
vergi_no int primary key,
firma_isim varchar(50),
irtibat_isim varchar(50)
);
insert into tedarikciler1 values(101,'IBM','Kim Yon');
insert into tedarikciler1 values(102,'Huawei','Cin LiN');
insert into tedarikciler1 values(103,'Erikson','Maki Tammen');
insert into tedarikciler1 values(104,'Apple','Adam Eve');

create table urunler1 --child
(
ted_vergino int,
urun_id int,
urun_isim varchar(50),
musteri_isim varchar(50),
constraint fk_urunler foreign key(ted_vergino) references tedarikciler1(vergi_no)
on delete cascade																   
);
insert into urunler1 values(101,1001,'laptop','Ayse Can');
insert into urunler1 values(102,1002,'phone','Fatma Aka');
insert into urunler1 values(102,1003,'TV','Ramazan Oz');
insert into urunler1 values(102,1004,'laptop','Veli Han');
insert into urunler1 values(103,1005,'phone','ACanan Ak');
insert into urunler1 values(104,1006,'TV','Ali Bak');
insert into urunler1 values(104,1007,'phone','Aslan Yilmaz');

select * from tedarikciler1
select * from urunler1

-- vergi nosu 102 olan tedarikcinin firma ismini 'vestel' olarak güncelle
update tedarikciler1
set firma_isim = 'Vestel' where vergi_no=102;

--vergi nosu 101 olan tedarikcinin firma ismini 'casper ve irtibat ismini 'ali Veli' olarak güncelle
update tedarikciler1 set firma_isim = 'Casper' where vergi_no = 101;
update tedarikciler1 set irtibat_isim = 'Ali Veli where' vergi_no =101;

update tedarikciler1 set firma_isim =  'Casper', irtibat_isim = 'Ali Veli' where vergi_no = 101;

--urunler tablosunda 'phone' değerlerini 'telefon' olarak güncelle
update urunler1 set urun_isim = 'telefon' where urun_isim = 'phone';

--urunler tablosundaki urun id değeri 1004 ten büyük olanların urun id sini 1 arttırın
update urunler1 set urun_id = urun_id+1 where urun_id>1004;

--urunler tablosundaki tüm urunlerin urun id değerini ted vergisino sutun değerleri ile toplayarak güncelle
update urunler1 set urun_id = urun_id + ted_vergino

delete from urunler1

--urunler tablosundan Ali bak ın aldığı urunun ismini, tedarikci tablosunda irtibat ismi
--'Adam Eve' olan firmanın ismi ile dğiştirin
update urunler1 set urun_isim 
=(select firma_isim from tedarikciler1 where irtibat_isim = 'Adam Eve' )
where musteri_isim = 'Ali Bak';

-- urunler tablosunda laptop satın alan musterielrin ismini, firma ismi Apple ın irtibat ismi ile değiştirin
update urunler1 set musteri_isim 
=(select irtibat_isim from tedarikciler1 where firma_isim = 'Apple')
where urun_isim ='laptop'







