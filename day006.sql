-- Group by

create table personel
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
insert into personel values(123456789,'Ali Yilmaz','Istanbul',5500,'Honda');
insert into personel values(234567890,'Veli Sahin','Istanbul',4500,'Toyota');
insert into personel values(345678901,'Mehmet Ozturk','Ankara',3500,'Honda');
insert into personel values(456789012,'Mehmet Ozturk','Izmir',6000,'Ford');
insert into personel values(567890123,'Mehmet Ozturk','Ankara',7000,'Tofas');
insert into personel values(678901234,'Veli SAhin','Ankara',4500,'Ford');
insert into personel values(789012345,'Hatice Sahin','Bursa',4500,'Honda');

--isme göre toplam maasları bulun
select * from personel

select isim, sum(maas) from personel
group by isim

--personel tablosundaki isimleri gruplayın
select isim from personel
group by isim

-- HAVING kullanımı
/*  having komutu yalnızca group by komutu ile kulalnılır eğer grı-uplamadan sonra bir şart varsa 
having komutu kullanılır. where komutu ilşe aynı mantıkla çalışır     */

--1) her şirketin min maaslarını eğer 2000'den büyükse göster
select * from personel

select sirket, min(maas) as en_duduk_maas from personel
group by sirket
having min(maas)>4000

--aynı isimdeki kişilerin aldığı toplam gelir 10000 Tl den fazla ise ismi ve topalm maası gösteren sorgu yaz
select isim, sum(maas) as toplam_maas from personel
group by isim having sum(maas)>10000

--eğer bir sehirde calisan personel sayısı 1 den çoksa sehir ismini ve personel sayısını veren kodu yaz
select sehir,count(isim) as toplam_personel_sayisi from personel
group by sehir
having count(isim)>1

--eğer bir sehirde alınan max maas 5000'den dusukse sehir ismini ve max maası veren sorgu yazın
select sehir, max(maas) as en_yuksek_maas from personel
group by sehir
having max(maas)<5000

--UNION OPERATOR
/*   union işleim 2 veya daha cok select isleminin sonuc kumelerini birlestirmek icin kullanılır,
aynı kayıt birden fazla olursa sadece bir tanesini alır
UNION ALL ise tekrarlı elemanları tekrar sayısınca yazzar    */

--maası 4000 den çok olan isci isimleirni ve 5000 Tl den fazla maas alınan sehirleri gösteren sorguyu yazın
select isim,maas from personel where maas>4000
union
select sehir,maas from personel where maas<5000

--mehmet öztürk ismindekii kişileirin aldığı maasları ve istanbuldaki personelin maaslarını
--bir tabloda gösteren kodu yazın
select isim,maas from personel where isim='Mehmet Ozturk'
union
select sehir,maas from personel where sehir='Istanbul'
order by maas -- maasa göre sıralar

--
create table personel20
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20),
constraint personel_pk primary key (id)
);
insert into personel20 values(123456789,'Ali Yilmaz','Istanbul',5500,'Honda');
insert into personel20 values(234567890,'Veli Sahin','Istanbul',4500,'Toyota');
insert into personel20 values(345678901,'Mehmet Ozturk','Ankara',3500,'Honda');
insert into personel20 values(456789012,'Mehmet Ozturk','Izmir',6000,'Ford');
insert into personel20 values(567890123,'Mehmet Ozturk','Ankara',7000,'Tofas');
insert into personel20 values(678901234,'Veli SAhin','Ankara',4500,'Ford');
insert into personel20 values(789012345,'Hatice Sahin','Bursa',4500,'Honda');

create table personel_bilgi (
id int,
tel char(10) unique,
cocuk_sayisi int,
constraint personel_bilgi_fk foreign key (id) references personel20(id)
);
insert into personel_bilgi values(567890123,'5431234567',2);
insert into personel_bilgi values(678901234,'5451234567',2);
insert into personel_bilgi values(789012345,'5521234567',1);
insert into personel_bilgi values(123456789,'5321234567',5);
insert into personel_bilgi values(234567890,'5331234567',4);
insert into personel_bilgi values(345678901,'5351234567',3);
insert into personel_bilgi values(456789012,'5421234567',3);

select * from personel
select * from personel_bilgi

--id'si 123456789 olan personelin personel tablosundan sehir ve maasını,
--personel bilgi tablosundan da tel ce cocuk sayısını yazdırın
select sehir as sehir_ve_tel,maas as maas_ve_cocuksayisi from personel where id = 123456789
union
select tel,cocuk_sayisi from personel_bilgi where id = 123456789

--personel tablosunda da maası 5000 den az olan tum isimleri ve maasları bulunuz
select isim,maas from personel where maas<5000
union all
select isim,maas from personel where maas<5000

--personel tablosunda da maası 4000 den çok olan tum sehir va maasları yazdırın
select 

--INTERSECT -->kesişim kümesi -->farklı iki tablodaki kesişen bilgileeri getirir

--personel tablosundan istanbul veya Ankara'da calisanların id'lerini yzdır
--personel bilgi tablosundan 2 veya 3 cocugu olanların id lerini yazdır
select id from personel where sehir in ('Istanbul','Ankara')
intersect
select id from personel_bilgi where cocuk_sayisi in(2,3)

--Honda,Ford ve Tofas'ta calisan ortak isimde personel varsa listele
select isim from personel where sirket='Honda'
intersect
select isim from personel where sirket='Ford'
intersect
select isim from personel where sirket='Tofas'

--EXCEPT komutu
/*   iki sorgulamada harici bir sorgulama istenirse EXCEPT komutu kullanılır  */

--5000 den az maas alıp Honda'da calısmayanları yazdırın
select isim,sirket from personel where maas<5000
except
select isim,sirket from personel where sirket='Honda'








