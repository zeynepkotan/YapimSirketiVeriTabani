create database yapimsirketi
use yapimsirketi
create table ulke(
id int primary key identity(1,1),
adi varchar(30)
)
create table il(
id int primary key identity(1,1),
adi varchar(30),
ulke_id int foreign key references ulke(id)
)
create table adres(
id int primary key identity(1,1),
adres varchar(30),
posta_kodu int,
il_id int foreign key references il(id)
)

create table yapim_sirketi(
id int primary key identity(1,1),
adi varchar(30),
unvani varchar(30),
adres_id int foreign key references adres(id),
tel int,
mail varchar(30),
acilis_tarihi datetime
)
create table dil(
id int primary key identity(1,1),
adi varchar(30)
)

create table calisan_gorev(
id int primary key identity(1,1),
adi varchar(30),
maas int
)

create table dizi_platform(
id int primary key identity(1,1),
adi varchar(30)
)

create table calisan(
id int primary key identity(1,1),
tc int,
adi varchar(30),
soyadi varchar(30),
yas int,
tel int,
mail varchar(30),
yapim_id int foreign key references yapim_sirketi(id),
adres_id int foreign key references adres(id),
gorev_id int foreign key references calisan_gorev(id),
ise_giris_tarihi datetime,
cinsiyet varchar(30)
)

create table kategori(
id int primary key identity(1,1),
adi varchar(30)
)

create table dizi(
id int primary key identity(1,1),
baslik varchar(30),
cikis_tarihi datetime,
dizi_platform_id int foreign key references dizi_platform(id),
yapim_id int foreign key references yapim_sirketi(id),
dil_id int foreign key references dil(id)
)

create table dizi_kategori(
dizi_id   int foreign key references dizi(id),
kategori_id  int foreign key references kategori(id),
son_guncelleme_tarihi datetime
)
create table aktor(
id int primary key identity(1,1),
tc int,
adi varchar(30),
soyadi varchar(30),
yas int,
tel int,
mail varchar(30),
adres_id int foreign key references adres(id),
cinsiyet varchar(30)
)

create table film (
id int primary key identity(1,1),
baslik varchar(30),
cikis_tarihi datetime,
yapim_id int foreign key references yapim_sirketi(id),
dil_id int foreign key references dil(id)
)
create table bolum(
id int primary key identity(1,1),
dizi_id   int foreign key references dizi(id),
yayinlama_tarihi datetime,
yayin_suresi time
)
create table film_kategori(
film_id int foreign key references film(id),
kategori_id  int foreign key references kategori(id),
son_guncelleme_tarihi datetime
)

create table film_aktor(
aktor_id int foreign key references aktor(id),
film_id int foreign key references film(id),
ise_baslama_tarihi datetime,
kazanc int
)
create table dizi_aktor(
aktor_id int foreign key references aktor(id),
dizi_id int foreign key references dizi(id),
haftalik_kazanc int,
kazanc int,
ise_baslama_tarihi datetime
)
create table izleyici(
id int primary key identity(1,1),
tc int,
adi varchar(30),
soyadi varchar(30),
yas int,
tel int,
mail varchar(30),
cinsiyet varchar(30),
kullanici_adi varchar(30),
sifre int,
olusturma_tarihi datetime,
adres_id int foreign key references adres(id)
)
create table dizi_izleyici(
dizi_id int foreign key references dizi(id),
izleyici_id int foreign key references izleyici(id),
izlenme_tarihi datetime,
tekrar_izlenme_sayisi int,
bolum_id int foreign key references bolum(id)
)

create table film_izleyici(
film_id int foreign key references film(id),
izleyici_id int foreign key references izleyici(id),
son_izlenme_tarihi datetime,
tekrar_izlenme_sayisi int
)

create table odeme_turu(
id int primary key identity(1,1),
adi varchar(30)
)
create table odeme(
id int primary key identity(1,1),
izleyici_id int foreign key references izleyici(id),
ucret int,
odeme_tarihi datetime,
calisan_id int foreign key references calisan(id),
odeme_turu_id int foreign key references odeme_turu(id)
)

create table sinema(
id int primary key identity(1,1),
Adi varchar(30),
adres_id int foreign key references adres(id),
acilis_tarihi datetime
)
alter table sinema add  sinema_turu_id int
create table sinema_film(
sinema_id int foreign key references sinema(id),
film_id int foreign key references film(id),
gösterim_tarihi datetime
)
create table kanal(
id int primary key identity(1,1),
Adi varchar(30),
adres_id int foreign key references adres(id),
acilis_tarihi datetime
)
create table kanal_dizi(
kanal_id int foreign key references kanal(id),
dizi_id int foreign key references dizi(id),
gösterim_tarihi datetime

)
create table kanal_film(
kanal_id int foreign key references kanal(id),
film_id int foreign key references film(id),
gösterim_tarihi datetime

)

create table film_calisan(
film_id int foreign key references film(id),
calisan_id int foreign key references calisan(id),
ise_baslangic_tarihi datetime,
calistigi_gun_sayisi int)

create table dizi_calisan(
dizi_id int foreign key references dizi(id),
calisan_id int foreign key references calisan(id),
ise_baslangic_tarihi datetime,
calistigi_gun_sayisi int)


create table sinema_turu(
id int primary key identity(1,1),
Adi varchar(50)
)
--ürünler


insert into ulke values ('Türkiye')
insert into ulke values ('Amerika')
insert into ulke values ('Almanya')
insert into ulke values ('Çin')
insert into ulke values ('Güney Kore')
insert into ulke values ('Fransa')


insert into il values ('Ýstanbul',1)
insert into il values ('New York',2)
insert into il values ('Berlin',3)
insert into il values ('Pekin',4)
insert into il values ('Seul',5)
insert into il values ('Paris',6)


insert into adres values ('güneþli evren mah karaaðaç sok',34212,1)
insert into adres values ('güneþli 15temmuz mahallesi 1402 sok',34212,1)
insert into adres values ('esenler karabayýr',34213,1)
insert into adres values ('bayrampaþa ',34214,1)
insert into adres values ('ikitelli',34215,1)
insert into adres values ('beþiktaþ taksim',34219,1)
insert into adres values ('beþiktaþ mecidiyeköy',34220,1)


insert into yapim_sirketi values ('ay yapim','ltd þti',1,533,'zk@gmail','01/01/1997')
insert into yapim_sirketi values ('mia yapim','ltd þti',1,535,'mia@gmail','01/02/1997')


insert into dil values ('Türkçe')
insert into dil values ('almanca')
insert into dil values ('ingilizce')
insert into dil values ('fransýzca')
insert into dil values ('çince')

insert into calisan_gorev values ('yapýmcý',5000)
insert into calisan_gorev values ('yönetmen',7000)
insert into calisan_gorev values ('reji',4000)
insert into calisan_gorev values ('makyöz',3000)



insert into dizi_platform values ('televizyon')
insert into dizi_platform values ('internet')

insert into calisan values (100,'fatmanur','gömbeci',21,545,'fg@gmail.com',1,1,4,'2015/10/27','Kadýn')
insert into calisan values (101,'fatih','mandýralý',22,536,'fm@gmail.com',1,4,1,'2015/10/23','Erkek')
insert into calisan values (101,'ertuðrul','kuran',21,537,'ek@gmail.com',2,5,3,'2015/10/28','Erkek')
insert into calisan values (101,'büþra nur','güner',21,535,'bg@gmail.com',2,3,4,'2015/10/30','Kadýn')

insert into kategori values ('komedi')
insert into kategori values ('bilim-kurgu')
insert into kategori values ('dram')
insert into kategori values ('fantastik')
insert into kategori values ('macera')
insert into kategori values ('romantik')
insert into dizi values ('Hatýrla Sevgili','01/01/2007',1,1,1)
insert into dizi values ('Adýný feriha koydum','01/01/2015',1,1,1)
insert into dizi values ('Seksenler','01/01/2016',1,2,1)
insert into dizi values ('Cennet Mahhalesi','01/01/2006',1,2,1)
insert into dizi values ('Çocuklar duymasýn','01/01/2000',1,1,1)
insert into dizi values ('Akasya Duraðý','01/01/2013',1,2,1)

insert into dizi_kategori values (1,3,'01/01/2010')
insert into dizi_kategori values (2,6,'01/01/2017')
insert into dizi_kategori values (3,1,'01/01/2018')
insert into dizi_kategori values (4,1,'01/01/2010')
insert into dizi_kategori values (5,1,'01/01/2010')
insert into dizi_kategori values (6,1,'01/01/2010')

insert into aktor values (151,'beren','saat',32,548,'bs@gmail.com',6,'Kadýn')
insert into aktor values (152,'tamer','karadaðlý',49,549,'tk@gmail.com',4,'Erkek')
insert into aktor values (153,'melek','baykal',59,538,'mb@gmail.com',3,'Kadýn')
insert into aktor values (154,'hazal','kaya',28,545,'hk@gmail.com',5,'Kadýn')
insert into aktor values (151,'pýnar','altuð',45,532,'pa@gmail.com',4,'Kadýn')
insert into aktor values (151,'þoray','uzun',41,533,'su@gmail.com',3,'Erkek')

insert into film values ('deli bal','03/04/2015',1,1)
insert into film values ('arif ve 216','03/05/2018',1,1)
insert into film values ('zaman makinesi 1978','06/04/2015',2,1)
insert into film values ('ekþi elmalar','06/08/2018',2,1)
insert into film values ('ayla','12/05/2018',2,1)

insert into film_kategori values (1,6,'03/06/2016')
insert into film_kategori values (2,2,'03/06/2018')
insert into film_kategori values (3,2,'03/06/2016')
insert into film_kategori values (4,2,'03/06/2019')
insert into film_kategori values (5,3,'03/06/2019')

                                          --Views

--1.Tamer Karadaðlý adlý aktöre ait 2003 yýlýnda yayýnlanan romantik komedi kategorisindeki dizileri listeleyen view yazýnýz.
create view aktor_dizi
as
select dizi.baslik from dizi,aktor,dizi_aktor,dizi_kategori where dizi.id=dizi_aktor.dizi_id and aktor.id=dizi_aktor.aktor_id and dizi.id=dizi_kategori.dizi_id
and aktor.id in (select aktor.id from aktor where aktor.adi='tamer'and aktor.soyadi='karadaðlý' ) and dizi_kategori.kategori_id in
(select kategori.id from kategori where  kategori.Adi like ('%romantik komedi%')) and DATEPART(YEAR,dizi.cikis_tarihi)=2003

select * from aktor_dizi

--2.12.02.2000 tarihinde türkiye, Erzurum bölgesindeki yapým þirketlerinin fantastik kategorisindeki filmlerini listeleyen view yazýnýz.
create view film_list
as
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,
	(select ulke.adi as 'Ulke adi',il.adi as 'bölge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='Türkiye'and il.adi='Erzurum')t1
	where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%fantastik%') and film.cikis_tarihi='2000/02/12'

select * from film_list

--3. --23.12.2008 tarihinde Ýstanbulda oluþturulan tüm izleyicileri listeleyen view yazýnýz.
create view  ikizleyici
as
	select izleyici.adi,izleyici.soyadi,izleyici.olusturma_tarihi from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'
select * from ikizleyici

--4.-- Türkiye’de üniversite personelinin(eposta uzantýsý .edu.tr) izlediði macera kategorisindeki filmleri listeleyen view yazýnýz.
create view list
as
	select film.baslik, kategori.Adi,t1.id as 'izleyici numarasý' from film, kategori,film_kategori,(select izleyici.id from izleyici 
	where izleyici.mail like ('%.edu.tr%'))t1
	 where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi='macera'

select * from list

--5. Almanya, Frankfurt þehrinde welcome yapým þirketinde çalýþan personelin isim-soyisimini listeleyen view yazýnýz.
create view isim_soyisim
as
	select calisan.adi,calisan.soyadi from calisan,yapim_sirketi,ulke,il,adres 
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id and yapim_sirketi.adi='welcome' and ulke.adi='Almanya' and il.adi='Frankfurt'

	select * from isim_soyisim


--6. Almanya, Frankfurt þehrinde her bir yapým þirketinde çalýþan personelin isim-soyisimini listeleyen view yazýnýz.
create view calisanis
as
	select calisan.adi,calisan.soyadi,t1.id as 'yapim sirketi numarasi' 
	from calisan,yapim_sirketi,ulke,il,adres,
	(select yapim_sirketi.id from calisan,yapim_sirketi,ulke,il,adres
	 where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id  and ulke.adi='Almanya' and il.adi='Frankfurt'  group by yapim_sirketi.id)t1
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id  and ulke.adi='Almanya' and il.adi='Frankfurt' 
select * from calisanis

--7	-- Ýngiltere, Londra þehrinde bulunan tüm yapim þirketlerin teslim tarihi 22.03.2019 olan tüm filmlerini listeleyen view yazýnýz.
create view fl
as
	select film.baslik,film.cikis_tarihi from film,(select yapim_sirketi.id from ulke,il,yapim_sirketi,adres
	 where ulke.id=il.ulke_id and il.id=adres.il_id and yapim_sirketi.adres_id=adres.id and
	 ulke.adi='Ýngiltere' and il.adi='Londra' )t1 where film.cikis_tarihi='2019/03/22'
select * from fl

--8 Türkiye, Erzurum þehrinde sinema ücreti 20 – 40 lira arasýnda olan komedi filmleri listeleyen view yazýnýz.
create view flist
as
	 select film.baslik,film.cikis_tarihi,film.yapim_id   from sinema_film,ulke,il,adres ,film,sinema,film_kategori
	 where ulke.id=il.ulke_id and il.id=adres.il_id and film.id=sinema_film.film_id and sinema.id=sinema_film.sinema_id and film.id=film_kategori.film_id
	  and sinema_film.film_ucreti between  20 and 40 and ulke.adi='Türkiye' and il.adi='Erzurum' and kategori_id in (select kategori.id from kategori where kategori.adi='komedi')
select * from flist
--9--“Zaman Makinesi 1978” filmini Türkiye, Ýstanbul þehrinde max sinemada ki gösterim tarihini listeleyen view yazýnýz.
create view film_trh
as
select sinema_film.gösterim_tarihi,film.baslik from sinema_film,film,sinema 
where sinema_film.film_id=film.id and sinema.id=sinema_film.sinema_id and sinema.Adi='max' and film.baslik='ZAman Makinesi 1978'

select * from film_trh
--10.Dili Fransýzca olan 2010 yýlýnda çýkmýþ tüm dizileri listeleyen view yazýnýz.
create view d_list
as
select dizi.baslik,dizi.cikis_tarihi,dil.adi from dizi,dil where dizi.dil_id=dil.id and
Datepart(YEAR,cikis_tarihi)=2010 and dil.adi='Fransýzca'
select * from d_list


--11.Aktörlerin ad ve soyadlarýný birleþtirerek tek bir sütunda  listeleyen view yazýnýz.
create view sa
as
select t1.AdSoyad from (
select aktor.adi+' '+aktor.soyadi as 'AdSoyad' from aktor )t1
select * from sa

--12.Ýzleyici adý z ile baþlayanlayanlarý listeleyen view yazýnýz.
create view z_i
as
select * from izleyici where izleyici.adi like('z%') 
select * from z_i
--13.Aktor adýnýn ilk 3 hanesini geri döndüren view yazýnýz.
create view aktor_harf
as
select UPPER(SUBSTRING(aktor.adi,1,1))+'.'+aktor.soyadi as 'AdSoyad' from aktor 
select * from aktor_harf

--14.süresi 1 yýldan fazla olan projede görevli aktörlerden maaþý 3000 tl üzerinde olanlarýn ad soyad larýný listeleyen view yazýnýz.
create view max_aktor
as
select aktor.adi,aktor.soyadi from aktor,film_aktor ,film 
where  aktor.id=film_aktor.aktor_id and film.id=film_aktor.film_id and
(DATEPART(YEAR,film.cikis_tarihi)-DATEPART(YEAR,film_aktor.ise_baslama_tarihi))>1 
and film_aktor.kazanc>3000
select * from max_aktor

--15.reji isimli birimde çalýþan kadýn personellerin çalýþtýklarý film adlarýný listeleyen view yazýnýz.
create view film_ad
as
select film.baslik,calisan.adi from film,film_calisan,calisan,calisan_gorev where 
film.id=film_calisan.film_id and film_calisan.calisan_id=calisan.id and calisan_gorev.id=calisan.gorev_id
  and calisan_gorev.adi='reji' and calisan.cinsiyet='kadýn'
  select * from film_ad


 --16.mia yapýmýn 2014 yýlýnda komedi türünde türkçe yaptýðý dizi ve filmler sayýsýný listeleyen view yazýnýz.
 create view f_d
as
 select 
	(select Count(dizi.id) from dizi,yapim_sirketi,dizi_kategori where dizi.yapim_id=yapim_sirketi.id and dizi.id=dizi_kategori.dizi_id and
	dil_id in (select dil.id from dil where dil.adi='türkçe') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,dizi.cikis_tarihi)=2014) as 'dizi sayisi',
	(
	select Count(film.id) from film,yapim_sirketi,film_kategori where film.yapim_id=yapim_sirketi.id and film.id=film_kategori.film_id and
	dil_id in (select dil.id from dil where dil.adi='türkçe') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,film.cikis_tarihi)=2014
	) as 'film sayisi' 
 select * from f_d

 --17.KanalD de yayýnlanýpta diðer kanallarda yayýnlanmayan filmlerin isimlerini listeleyen viewi yazýnýz. 

 create view k_hayir
 as
	select film.baslik,film.cikis_tarihi,kanal.adi,kanal_film.gösterim_tarihi from film,kanal,kanal_film
where film.id=kanal_film.film_id and
kanal.id=kanal_film.kanal_id
and kanal_film.film_id
in(
select kanal_film.film_id from kanal,kanal_film where  kanal.id=kanal_film.kanal_id and kanal_film.film_id
not in
(select kanal_film.film_id from kanal,kanal_film where  kanal.id=kanal_film.kanal_id and kanal_film.film_id
not in 
(select kanal_film.film_id from kanal,kanal_film where kanal.id=kanal_film.kanal_id and kanal.adi='kanald')))
 select * from k_hayir



 --dizilerde oynayan ama hiç sinemalarda oynamayan aktor listesi
 	select distinct aktor.adi,aktor.soyadi from aktor,dizi_aktor
where aktor.id=dizi_aktor.aktor_id 
and dizi_aktor.aktor_id
in(
select dizi_aktor.aktor_id from aktor,dizi_aktor  where  aktor.id=dizi_aktor.aktor_id and 
 dizi_aktor.aktor_id
not in
(select film_aktor.aktor_id from aktor,film_aktor where  aktor.id=film_aktor.aktor_id and 
  film_aktor.aktor_id
not in 
(select dizi_aktor.aktor_id from aktor,dizi_aktor where aktor.id=dizi_aktor.aktor_id  )

)
)


 	select aktor.adi,aktor.soyadi from aktor,dizi_aktor,film_aktor
where aktor.id=dizi_aktor.aktor_id and  aktor.id=film_aktor.aktor_id
and aktor.id
in(
select dizi_aktor.aktor_id from aktor,dizi_aktor  where  aktor.id=dizi_aktor.aktor_id ) and 
aktor.id not in
 (select dizi_aktor.aktor_id from aktor,dizi_aktor where aktor.id=dizi_aktor.aktor_id )

                                           --Stored Procedure

--1. film kategorisi bilim kurgu olan , dili ingilizce olan ve cýkýþ tarihi 10/10/2007 den sonra olan filmleri
--listeleyen bir store prosedür yazýnýz.
create procedure film_liste
with recompile
as
begin
select film.baslik,film.cikis_tarihi,kategori.adi as 'Kategori Adi'
	from film,(select dil.id from dil where dil.adi='ingilizce' )t1,film_kategori,kategori 
		where film.id=film_kategori.film_id and
			film_kategori.kategori_id=kategori.id and kategori.adi like('%bilim-kurgu%') and  cikis_tarihi>'2007/10/10' 
end
go 
exec film_liste


--2.KanalD de yayýnlanýpta diðer kanallarda yayýnlanmayan filmlerin isimlerini listeleyen yordamý yazýnýz. 

create procedure film_listee
with recompile
as
begin
select film.baslik,film.cikis_tarihi,kanal.adi,kanal_film.gösterim_tarihi from film,kanal,kanal_film
where film.id=kanal_film.film_id and
kanal.id=kanal_film.kanal_id
and kanal_film.film_id
in(
select kanal_film.film_id from kanal,kanal_film where  kanal.id=kanal_film.kanal_id and kanal_film.film_id
not in
(select kanal_film.film_id from kanal,kanal_film where  kanal.id=kanal_film.kanal_id and kanal_film.film_id
not in 
(select kanal_film.film_id from kanal,kanal_film where kanal.id=kanal_film.kanal_id and kanal.Adi='KanalD')))
end
go 
exec  film_listee

--3.her bir izleyicinin kaç tane dizi izlediðini listeleyecek stored prosedur yaz
create procedure  izleyici_dizi_say
as
begin

	select dizi_izleyici.izleyici_id,COUNT(dizi_izleyici.dizi_id) as 'Ýzlenilen dizi sayisi' from dizi_izleyici group by dizi_izleyici.izleyici_id 
end
go

exec izleyici_dizi_say


--4.kendisine gelen izleyici numarasýna göre izleyicinin kaç tane dizi izlediðini  döndüren yordamý yazýnýz.

create procedure i_dizi(@id int)
as 
begin
 select COUNT(dizi_izleyici.dizi_id)as 'izlenilen dizi sayýsý' from dizi_izleyici where dizi_izleyici.izleyici_id=@id
 end
 go 
 exec i_dizi 1


  --5.kendisine gelen izleyici numarasýna göre hangi kategoriden kaç tane dizi izlediðini gösteren stored procedur yaz.

 create proc i_kategori(@id int)
 as
 begin
 select kategori.adi,dizi_izleyici.izleyici_id,COUNT(dizi_kategori.dizi_id) as 'dizi sayýsý' from kategori,dizi_kategori,dizi_izleyici where
 kategori.id=dizi_kategori.kategori_id and dizi_kategori.dizi_id=dizi_izleyici.dizi_id and izleyici_id=@id group by kategori.adi,dizi_izleyici.izleyici_id
 end 
 go
 exec i_kategori 1
  exec i_kategori 2

  
--6. mia yapým þirketindeki çalýþan personellerin maaþ ortalamasýný OUTPUT olarak veren yordamý yazýnýz.
create proc ortmaas(@ortalama int output)
as
set @ortalama=(select AVG(calisan_gorev.maas) as 'Ortalama Maas' from calisan_gorev,(select yapim_sirketi.adi from yapim_sirketi
 group by yapim_sirketi.adi having(yapim_sirketi.adi like('%mia%')))t1) 
go
declare @sonuc int
exec ortmaas @sonuc output
print('ortalama '+cast(@sonuc as varchar(5)))

--7 kanal_film tablosu kanallarda bulunan filmleri tutmaktadýr. Hazýrlayacaðýnýz yordam
--yardýmýyla, belirlediðiniz bir filmi, belirlediðiniz kanala ekleme iþlemi yapýlacaktýr. Belirtilen
--film ayný kanalda var ise film vardýr yazdýrýlacak, ayný kanalda yok ise yeni kayýt olarak girilecektir.


create proc kanal_film_ekle
@kanalid int,
@filmid int,
@gosterimtarihi datetime

as

declare @filmsayisi int
set @filmsayisi=(select Count(kanal_film.film_id) 'film sayisi'from kanal,kanal_film
where kanal_film.kanal_id=kanal.id and kanal.id=@kanalid and kanal_film.film_id=@filmid )
if(@filmsayisi>0)
	begin 
	 print('film vardýr...')
	end
else 
begin
insert into kanal_film(kanal_film.film_id,kanal_film.kanal_id,kanal_film.gösterim_tarihi)
 values(@filmid,@kanalid,@gosterimtarihi)
end
exec kanal_film_ekle 1,1,'11/05/2019'

--8. Yapým þirketi  olan veri tabaný içerisinde, kanallarda bulunan filmlerin isimlerini yazdýran
--stored procedure oluþturunuz.
create procedure kanal_film_goster
as
select kanal_film.kanal_id as 'kanal numarasý', film.baslik as 'Film Adý' from kanal_film,film where kanal_film.film_id=film.id 
exec kanal_film_goster

--9.Dýþarýdan parametre olarak verilen aktörün oynadýðý dizileri listeleyen gerekli yordamý
--yazýnýz.
create proc aktor_dizi_listele(@aktorid int)
as
select dizi.baslik,dizi.dil_id,dizi.cikis_tarihi from dizi,aktor,dizi_aktor where dizi_aktor.dizi_id=dizi.id and dizi_aktor.aktor_id=aktor.id
 and aktor.id=@aktorid
go

exec aktor_dizi_listele 2

--10. Parametre olarak  numarasý verilen bir filmin, ismini, hangi sinemada
--olduðunu ve ücretini döndüren yordamý yazýnýz.

create proc sinema_filmadi(@a int=0,@sinemadi varchar(50) output,@filmadi varchar(50) output, @filmucfreti varchar(50) output)
as
begin
select @sinemadi=sinema.adi,@filmadi=film.baslik , @filmucfreti=sinema_film.film_ucreti from sinema,film,sinema_film
where sinema.id=sinema_film.sinema_id and sinema_film.film_id=film.id and film.id=@a
end
go
declare @sinemadi1 varchar(50),@filmadi1 varchar(50), @filmucfreti1 varchar(50)
exec sinema_filmadi 4, @sinemadi1 output,@filmadi1 output, @filmucfreti1 output

print(' '+cast(@sinemadi1 as varchar(50))+' Maðazasýnda gösteriliyor. '+cast(@filmadi1 as varchar(50))+' fiyatý '+cast(@filmucfreti1 as varchar(50))+' tl dir.')



--11.Melek Baykal adlý aktöre ait 2015 yýlýnda yayýnlanan filmleri kensine gelen kategoriye göre listeyen yordamý yazýn.
  create proc aktor_film_listele(@kategorid int)
as
select film.baslik,film.cikis_tarihi,aktor.adi as 'Aktör'from film,film_kategori,
film_aktor,aktor where film.id=film_aktor.film_id and aktor.id=film_aktor.aktor_id and film.id=film_kategori.film_id
and aktor.adi='Melek'and aktor.soyadi='Baykal' 
  and DATEPART(YEAR,film.cikis_tarihi)=2015 and film_kategori.kategori_id=@kategorid
go

exec aktor_film_listele 2

--12.Parametre olarak numarasý verilen yapým þirketinin 21.02.2014 tarihinde Amerika, Ohio bölgesindeki bilim-kurgu kategorisindeki filmlerinin listeleyiniz.
create proc yapim_film_listele(@yapimid int)
as
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,yapim_sirketi,
	(select ulke.adi as 'Ulke adi',il.adi as 'bölge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='amerika'and il.adi='Ohio')t1
	where film.id=film_kategori.film_id and yapim_sirketi.id=film.yapim_id and 
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%bilim-kurgu%') and film.cikis_tarihi='2014/02/21' and yapim_sirketi.id=@yapimid
go 

exec yapim_film_listele 3

--13. 23.12.2008 tarihinde Ýstanbulda oluþturulan tüm izleyicilerin sayýsýný geri döndüren yordam.

create proc izleyici_sayisi
as
return (
select COUNT(izleyici.id) as 'izleyici sayýsý' from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'
)
go
declare @sonuc int
exec @sonuc= izleyici_sayisi

print('Ýzleyici Sayýsý '+cast(@sonuc as varchar(5)))



--14.Ýzleyicilerin soyisimlerini büyük yazan procedur
create proc buyukharf(@izleyiciid int)
as
begin
select izleyici.adi, upper(izleyici.soyadi) as 'soyadý' from izleyici where izleyici.id=@izleyiciid
end
exec buyukharf 1

--15.en yüksek  fiyatlý filmin adýný geri döndüren yordam
			
create proc film_fyt
as
begin
select film.baslik from film,sinema_film where film.id=sinema_film.film_id and sinema_film.film_ucreti=(select max(film_ucreti) from sinema_film) 
end
go
exec film_fyt


--16.kendine gelen film adýna göre sinemalarda filmin kaç kere yayýnlandýðýný geriye döndüren bir procedur yazýnýz
			create proc flm_yayin(@adi varchar(max))
			as
			begin
			select film.baslik,
			(select count(sinema_film.film_id) as 'x' from sinema_film where film_id in (select id from film where baslik=@adi)) as'film yayýnlanma sayýsý'
			from film where baslik=@adi
			end
			go
			exec flm_yayin 'hýzlý ve öfkeli'
		
--17.kendine gelen film adýna göre kanallarda filmin kaç kere yayýnlandýðýný geriye döndüren bir yordam yazýnýz
	 create proc tbl_film_yayin(@filmadi varchar(max))
			
			as
			begin
			
			select film.baslik,
			(select count(kanal_film.film_id) from kanal_film where film_id in (select id from film where baslik=@filmadi)) as'film yayýnlanma sayýsý'
			from film where baslik=@filmadi
			
			end
			go
	
	exec tbl_film_yayin'hýzlý ve öfkeli'

	
 --18.dizi adlarýnýn  'r' harfi ile bitenleri listeleyen Stored Procedure yazýnýz.

create proc d_a 
with recompile
as
begin
select dizi.baslik from dizi where baslik LIKE '%r'
end
go
exec d_a


		--19. Parametre olarak aldýðý film ismini otomatik olarak büyük harflerle yeniden yazan yordam
--yazýnýz.

		create proc film_bslk(@filmadi varchar(max))
			as
			begin
			select UPPER(film.baslik) as 'Büyük harfe çevirdi' from film where film.baslik=@filmadi 
			end
			go
			exec film_bslk 'zaman makinesi 1978' 



			--20.Kendisine gelen odeme numarasýna göre odemedki toplam tutarý geri döndüren yordamý yazýnýz.
create proc toplm_tutar(@odemeno int)
as
begin
declare @ucret int
set @ucret=(select odeme.ucret from odeme where @odemeno=odeme.id)
return @ucret
end
exec toplm_tutar 1

--21.Adý soyadý girilen bir çalýþanýn  hangi birimde ve hangi filmlerde çalýþtýðýný bulan yordamý yazýnýz.
create proc gorev_prje(@adi varchar(50), @soyadi varchar(50))
as
begin
select film.baslik, calisan_gorev.adi from calisan, calisan_gorev, film,film_calisan where
calisan.gorev_id=calisan_gorev.id and film_calisan.calisan_id=calisan.id and film.id=film_calisan.calisan_id
 and calisan.adi=@adi and calisan.soyadi=@soyadi
 end
go

 exec gorev_prje 'fatmanur','gömbeci' 
 
 --22.mia yapýmýn 2014 yýlýnda komedi türünde türkçe yaptýðý dizi ve filmler sayýsýný listeleyen procedur yazýnýz.
 create proc d_f
as
begin
 select 
	(select Count(dizi.id) from dizi,yapim_sirketi,dizi_kategori where dizi.yapim_id=yapim_sirketi.id and dizi.id=dizi_kategori.dizi_id and
	dil_id in (select dil.id from dil where dil.adi='türkçe') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,dizi.cikis_tarihi)=2014) as 'dizi sayisi',
	(
	select Count(film.id) from film,yapim_sirketi,film_kategori where film.yapim_id=yapim_sirketi.id and film.id=film_kategori.film_id and
	dil_id in (select dil.id from dil where dil.adi='türkçe') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,film.cikis_tarihi)=2014
	) as 'film sayisi' 
	end
	go
	 exec d_f

	

  


													 --iç içe sorgu

  --1.Hazal Kaya adlý aktöre ait 2015 yýlýnda yayýnlanan romantik komedi kategorisindeki dizileri listeleyin
select dizi.baslik,dizi.cikis_tarihi,t1.Adi,aktor.adi as 'Aktör',t1.Adi,t2.[yayin tarihi] from dizi,(select kategori.Adi from kategori where kategori.Adi like ('%romantik komedi%'))t1,
(select bolum.yayinlama_tarihi as 'yayin tarihi' from bolum where DATEPART(YEAR,bolum.yayinlama_tarihi)=2015)t2,
dizi_aktor,aktor where dizi.id=dizi_aktor.dizi_id and aktor.id=dizi_aktor.aktor_id
and aktor.adi='Hazal'and aktor.soyadi='Kaya' 

--2.21.02.2014 tarihinde Amerika, Ohio bölgesindeki yapým þirketlerinin bilim-kurgu kategorisindeki filmlerinin listeleyiniz.
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,
	(select ulke.adi as 'Ulke adi',il.adi as 'bölge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='amerika'and il.adi='Ohio')t1
	where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%bilim-kurgu%') and film.cikis_tarihi='2014/02/21'

--3. --23.12.2008 tarihinde Ýstanbulda oluþturulan tüm izleyicilerin listesi.
	select izleyici.adi,izleyici.soyadi,izleyici.olusturma_tarihi from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'



--4.-- Türkiye’de üniversite personelinin(eposta uzantýsý .edu.tr) izlediði macera kategorisindeki filmlerin listesi.
	select film.baslik, kategori.Adi,t1.id as 'izleyici numarasý' from film, kategori,film_kategori,(select izleyici.id from izleyici 
	where izleyici.mail like ('%.edu.tr%'))t1
	 where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi='macera'


--5. Almanya, Frankfurt þehrinde welcome yapým þirketinde çalýþan personelin isim-soyisim listesi.
	select calisan.adi,calisan.soyadi from calisan,yapim_sirketi,ulke,il,adres 
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id and yapim_sirketi.adi='welcome' and ulke.adi='Almanya' and il.adi='Frankfurt'

	--6. Almanya, Frankfurt þehrinde her bir yapým þirketinde çalýþan personelin isim-soyisim listesi.
	select calisan.adi,calisan.soyadi,t1.id as 'yapim sirketi numarasi' 
	from calisan,yapim_sirketi,ulke,il,adres,
	(select yapim_sirketi.id from calisan,yapim_sirketi,ulke,il,adres
	 where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id  and ulke.adi='Almanya' and il.adi='Frankfurt'  group by yapim_sirketi.id)t1
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id  and ulke.adi='Almanya' and il.adi='Frankfurt' 

--7	-- Ýngiltere, Londra þehrinde bulunan tüm yapim þirketlerin teslim tarihi 22.03.2019 olan tüm filmlerinin listesi.
	select film.baslik,film.cikis_tarihi from film,(select yapim_sirketi.id from ulke,il,yapim_sirketi,adres
	 where ulke.id=il.ulke_id and il.id=adres.il_id and yapim_sirketi.adres_id=adres.id and
	 ulke.adi='Ýngiltere' and il.adi='Londra' )t1 where film.cikis_tarihi='2019/03/22'


	 alter  table sinema_film  add     film_ucreti  money
--8	 -- Türkiye, Erzurum þehrinde sinema ücreti 20 – 40 lira arasýnda olan komedi filmleri listesi.
	 select film.baslik,film.cikis_tarihi,film.yapim_id   from sinema_film,ulke,il,adres ,film,sinema,film_kategori
	 where ulke.id=il.ulke_id and il.id=adres.il_id and film.id=sinema_film.film_id and sinema.id=sinema_film.sinema_id and film.id=film_kategori.film_id
	  and sinema_film.film_ucreti between  20 and 40 and ulke.adi='Türkiye' and il.adi='Erzurum' and kategori_id in (select kategori.id from kategori where kategori.adi='komedi')


--9--“Zaman Makinesi 1978” filmini Türkiye, Ýstanbul þehrinde max sinemada ki gösterim tarihini listele

select sinema_film.gösterim_tarihi,film.baslik from sinema_film,film,sinema 
where sinema_film.film_id=film.id and sinema.id=sinema_film.sinema_id and sinema.Adi='max' and film.baslik='ZAman Makinesi 1978'

--10.Dili Fransýzca olan 2010 yýlýnda çýkmýþ tüm dizilerin listesi.

select dizi.baslik,dizi.cikis_tarihi,dil.adi from dizi,dil where dizi.dil_id=dil.id and
Datepart(YEAR,cikis_tarihi)=2010 and dil.adi='Fransýzca'

--11.Aktörlerin ad ve soyadlarýný birleþtirerek tek bir sütunda artan sýrada listele
select aktor.adi+' '+aktor.soyadi as 'AdSoyad' from aktor order by  AdSoyad asc
--12.Ýzleyici adý z ile baþlayanlayanlarý büyükten küçüðe sýrala
select * from izleyici where izleyici.adi like('z%') order by adi desc
--13.Aktor adýnýn ilk 3 hanesini geri döndüren sql sorgusu yazýnýz.
select UPPER(SUBSTRING(aktor.adi,1,1))+'.'+aktor.soyadi as 'AdSoyad' from aktor order by  AdSoyad desc

--14.süresi 1 yýldan fazla olan projede görevli aktörlerden maaþý 3000 tl üzerinde olanlarýn ad soyad larýný listeleyiniz
select aktor.adi,aktor.soyadi from aktor,film_aktor ,film 
where  aktor.id=film_aktor.aktor_id and film.id=film_aktor.film_id and
(DATEPART(YEAR,film.cikis_tarihi)-DATEPART(YEAR,film_aktor.ise_baslama_tarihi))>1 
and film_aktor.kazanc>3000


--15.reji isimli birimde çalýþan kadýn personellerin çalýþtýklarý film adlarýný yazýnýz.
select film.baslik,calisan.adi from film,film_calisan,calisan,calisan_gorev where 
film.id=film_calisan.film_id and film_calisan.calisan_id=calisan.id and calisan_gorev.id=calisan.gorev_id
  and calisan_gorev.adi='reji' and calisan.cinsiyet='kadýn'

 --16.mia yapýmýn 2014 yýlýnda komedi türünde türkçe yaptýðý dizi ve filmler sayýsýný listeleyiniz.

 select 
	(select Count(dizi.id) from dizi,yapim_sirketi,dizi_kategori where dizi.yapim_id=yapim_sirketi.id and dizi.id=dizi_kategori.dizi_id and
	dil_id in (select dil.id from dil where dil.adi='türkçe') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,dizi.cikis_tarihi)=2014) as 'dizi sayisi',
	(
	select Count(film.id) from film,yapim_sirketi,film_kategori where film.yapim_id=yapim_sirketi.id and film.id=film_kategori.film_id and
	dil_id in (select dil.id from dil where dil.adi='türkçe') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,film.cikis_tarihi)=2014
	) as 'film sayisi' 

--17.ay yapým  filmlerine ait çýkýþ tarihinin gün ismini bulmak için gerekli sql sorgusu
select datename(weekday,film.cikis_tarihi) as 'gunlerden' from film where yapim_id in (select yapim_sirketi.id from yapim_sirketi where adi='asd')
--18.Her bir görevde çalýþan personellerin sayýsýný bulan sql ifadesi
select calisan_gorev.adi 'Görev Adý',COUNT(calisan.id) 'Personel sayýsý' from calisan_gorev,calisan where calisan.gorev_id=calisan_gorev.id group by calisan_gorev.adi
--19.Ýzleyicilerin isimlerini ve soy isimlerini tersten yazdýran sorgu
select REVERSE(izleyici.adi) 'ters isim',REVERSE(izleyici.soyadi) 'ters soyisim' from izleyici
---Tablo tipi deðiþkenler
--1.
declare @izleyiciliste table(
id int
)
insert into @izleyiciliste values(1)
insert into @izleyiciliste values(3)
insert into @izleyiciliste values(4)
select * from izleyici where izleyici.id IN(select id from @izleyiciliste)

--2. max isimli sinemada zaman makinesi 1978 isimli filmin gösterimi var ise filmin aktörlerini listeleyen yoksa “Bu
--filmin gösterimi yoktur” þeklinde mesaj veren T-SQL ifadesini yazýnýz.
declare @filmidi int

select @filmidi=Count(film.id) from sinema,film,sinema_film where 
sinema.id=sinema_film.sinema_id and film.id=sinema_film.film_id and sinema.Adi='max' and film.baslik like('%zaman makinesi 1978%')

if(@filmidi>0)
	begin
		select aktor.adi,aktor.soyadi from film_aktor,aktor,sinema,film,sinema_film where  film_aktor.aktor_id=aktor.id and 
		film_aktor.film_id=film.id and
		sinema.id=sinema_film.sinema_id and film.id=sinema_film.film_id and sinema.Adi='max' and film.baslik like('%zaman makinesi 1978%')
	end
else 
	begin
		print('Bu filmin gösterimi yoktur')
	end
go

--3. odeme tablosunda bulunan odemelerden ücreti 50 TL ve üzeri olan üodemelerin fiyatlarýnda %5 indirim
--yapan T-SQL ifadesini yazýnýz.

declare @odeme float
set @odeme=(select odeme.ucret from odeme where (odeme.ucret>=50))
set @odeme=((@odeme*5)/100)+@odeme
  print(@odeme)

--4.çalýþanlarýn bilgilerini (ad, soyad, adres, tel, vb.) @calisanBilgi isimli tablo deðiþkenine ekleyerek tablo
--deðiþkeninin içeriðini yazdýran T-SQL ifadesini yazýnýz.
declare @calisanbilgi table(
tc int,
adi varchar(50),
soyadi varchar(50),
mail varchar(50),
tel int
)
insert into @calisanbilgi values(1,'yenizeynep','kotan','@gmail.com',539565)

select * from @calisanbilgi

--5.max  isimli sinemada en çok izlenen filmi bularak bularak @MMaxfilm isimli deðiþkene atan ve bu filmi izleyen kiþilerin
--yaþ ortalamasýný bulan T-SQL ifadesini yazýnýz.
declare @MMaxfilm int,@ortyas int
select @ortyas=AVG(izleyici.yas),@MMaxfilm=Max(t1.[filmi izleyen kiþi sayýsý]) from sinema,sinema_film,film_izleyici,izleyici,(
select Count(film_izleyici.izleyici_id) as 'filmi izleyen kiþi sayýsý' from film_izleyici,film where film.id=film_izleyici.film_id
group by film.id)t1 where
sinema.id=sinema_film.sinema_id and sinema_film.film_id=film_izleyici.film_id and izleyici.id=film_izleyici.izleyici_id and
sinema.Adi='max'
print(@MMaxfilm)
print(@ortyas)


--6.Ýzleyici sayýsný bulup deðerlendiren T-SQL ifadesini yazýnýz.
declare @izleyici_sayisi int
select @izleyici_sayisi=Count(*) from izleyici
print @izleyici_sayisi

if(@izleyici_sayisi>=0 and @izleyici_sayisi<=6)
begin
  print('Ýzleyici Sayýsý'+cast(@izleyici_sayisi as varchar(10)))
  print( 'az')
  end

  else if(@izleyici_sayisi>=6and @izleyici_sayisi<=10)
  begin
  print('Ýzleyici Sayýsý'+cast(@izleyici_sayisi as varchar(10)))
  print( 'orta')

  end
   
else 
   begin
   print('Ýzleyici Sayýsý çok')
   end

--7.Ýzleyici tablosuna girilen Cinsiyete göre  sayýsal deðerler atayan T-SQL ifadesini yazýnýz. 
select izleyici.adi,izleyici.soyadi,izleyici.cinsiyet, 'Cinsiyet'=
        case izleyici.cinsiyet
		    when 'Erkek' then '1'
			when 'Kadýn' then '0'
		end
		from izleyici

--8.Ýnsan kaynaklarý isimli birimde çalýþan kadýn personellerin maas ortalamasýný output olarak veren tsql ifadesini yazýnýz.
declare @ort  int
select @ort= AVG(calisan_gorev.maas) from calisan_gorev,calisan where calisan.gorev_id=calisan_gorev.id and calisan_gorev.adi='Ýnsan Kaynaklarý'
			and calisan.cinsiyet='Kadýn'
			begin
print('ORtalama maas '+cast (@ort as varchar(10)))
end

--9.if yapýsýný kullanarak fiyati 30 liradan düþük olan filmlerin sayýsýný listeleyen tsql ifadesini yazýnýz.
declare @film_sayisi int
select @film_sayisi=Count(*) from sinema_film where film_ucreti<30
IF (@film_sayisi>0)
begin
PRINT('film sayýsý '+cast(@film_sayisi as varchar(5))+' dir.')
end
else
begin
print('30 tl den düþük fiyatlý olan film yoktur:)')
end



--10.Maasý en yüksek olan calisan görevini 'yapýmcý' olarak deðiþtiren T-sql sorgusu
declare @enyuksek int

SELECT @enyuksek = max(calisan_gorev.maas) from calisan_gorev
UPDATE calisan_gorev SET maas=@enyuksek  where adi = 'yapýmcý'
select calisan_gorev.adi,calisan_gorev.maas from calisan_gorev 

--HATA YAKALAMA

--1“Zaman Makinesi 1978” filmini Türkiye, Ýstanbul þehrinde max sinemada ki gösterim tarihini listeleyen sorgunun  hatasýný yazdýr
begin try 
	select sinema_film.gösterim_tarihi,film.baslik from sinema_film,film,sinema 
where sinema_film.film_id=film.id and sinema.id=sinema_film.sinema_id and sinema.id='max' and film.baslik='ZAman Makinesi 1978'
end try
begin catch
	select  ERROR_NUMBER() as 'hata numarasý',
			ERROR_SEVERITY() as 'Hata derecesi', 
			ERROR_LINE() as 'Hata satýr numarasý',
			ERROR_MESSAGE() as 'Hata mesajý'

end catch


---OUTPUT

--1.izleyici tablosunda yeni bir izleyici eklerken eklenen izleyicinin bilgilerini listeleyen output
declare @izleyici table(
		   tc int,
           adi varchar(50),
		   soyadi varchar(50),
		   yas int,
		   tel int,
		   mail varchar(50),
		   Cins varchar(20),
		   kullaniciadi varchar(50),
		   sifre int,
		   olusturmatarihi datetime,
		   adresid int
		   
)
insert into  izleyici
  output 
  inserted.tc,inserted.adi,inserted.soyadi,inserted.yas,inserted.tel,inserted.mail,inserted.cinsiyet,inserted.kullanici_adi
  ,inserted.sifre,inserted.olusturma_tarihi,inserted.adres_id into @izleyici
        values(325,'zeyno','kotan',21,5658,'zk@gmail.com','Kadýn','zeynepkotan1',1018,'2015/09/28',3)
select * from @izleyici

--2.izleyici tablosunda içerisinde z harfi geçen izleyiciyi silerken silinen izleyicinin bilgilerini listeleyen output
declare @izleyici table(
		   tc int,
           adi varchar(50),
		   soyadi varchar(50),
		   yas int,
		   tel int,
		   mail varchar(50),
		   Cins varchar(20),
		   kullaniciadi varchar(50),
		   sifre int,
		   olusturmatarihi datetime,
		   adresid int
		   
)
delete from izleyici
  output
   deleted.tc,deleted.adi,deleted.soyadi,deleted.yas,deleted.tel,deleted.mail,deleted.cinsiyet,deleted.kullanici_adi
  ,deleted.sifre,deleted.olusturma_tarihi,deleted.adres_id into @izleyici
where  adi like('z%')
select * from @izleyici


--3.izleyici tablosunda içerisinde z harfi geçen izleyicinin mail bilgisini güncellerken güncellenen izleyicinin bilgilerini listeleyen output

declare @izleyici table(
		   tc int,
           adi varchar(50),
		   soyadi varchar(50),
		   yas int,
		   tel int,
		   mail varchar(50),
		   ymail varchar(50),
		   Cins varchar(20),
		   kullaniciadi varchar(50),
		   sifre int,
		   olusturmatarihi datetime,
		   adresid int
		   
)
update izleyici set mail='yenizk1'
  output
    inserted.tc,inserted.adi,inserted.soyadi,inserted.yas,inserted.tel,deleted.mail[eski mail],inserted.mail,inserted.cinsiyet
	,inserted.kullanici_adi,inserted.sifre,inserted.olusturma_tarihi,inserted.adres_id  into @izleyici
where  adi like('%z%')
select * from @izleyici

--4.Film ücretlerini yüzde 10 indiren max sinemasýnýn eski ve yeni fiyatlarýný gösteren output yazýnýz.

declare @indirim table(
		sinema_id int,
		film_id int,
		gosterim_tarihi datetime,
		efucret money,
		yfucret money

)
update sinema_film set  film_ucreti=film_ucreti-(film_ucreti*0.1)  
	output 
	inserted.sinema_id,inserted.film_id,inserted.gösterim_tarihi,deleted.film_ucreti[efucret],inserted.film_ucreti into @indirim
where sinema_film.sinema_id=(select sinema.id from sinema where sinema.Adi='max')

select * from @indirim

--5.Adý deðiþen yapým þirketi için, bu yapým þirketinin eski ve yeni bilgilerini gösterecek output
declare @yeni table(
yno int,
adi varchar(50),
yadi varchar(50),
unvani varchar(50),
adres_id int,
tel int,
mail varchar(50),
acilistarihi datetime
)
update yapim_sirketi set yapim_sirketi.adi='asd' 
output
inserted.id,deleted.adi[eski adý],inserted.adi[yeni adý],inserted.unvani,inserted.adres_id,inserted.tel,inserted.mail,inserted.acilis_tarihi into @yeni
where yapim_sirketi.id=1
select * from @yeni



--transaction

--1. Tüm çalýþanlarýn maaslarýný 7000 yapacak daha sonra bu iþlemi iptal edecek transaction
begin transaction
update calisan_gorev set maas=7000
select * from calisan_gorev
rollback
select * from calisan_gorev
 --2.odeme Fiyatýný %10 arttýrýp daha sonra bu iþlemi iptal eden transaction yazýnýz
 begin transaction
 update odeme set ucret=ucret+(ucret*10)/100
 select * from odeme
 rollback

 select * from odeme
 
--3.film kategorisi komedi  olanlarý silen daha sonra  bu iþlemi iptal eden transaction yazýnýz.
 begin transaction
 delete from film_kategori where kategori_id in (select kategori.id from kategori where kategori.adi='komedi')
 select * from film_kategori
 rollback
 select * from film_kategori



                                                       ---Fonksiyonlar


--1.Ýzleyicilerin soyisimlerini büyük yazan fonksiyon
create function bharf(@izleyiciadi varchar(max))
returns varchar(max)
as
begin
return upper(@izleyiciadi)
end
select  izleyici.adi,dbo.bharf(izleyici.soyadi) as 'soyadý' from izleyici
--2.en yüksek  fiyatlý filmin adýný geri döndüren fonksiyon
			
create function film_fiyat()
returns varchar(15)
as
begin
declare @filmadi varchar(15)
select @filmadi=film.baslik from film,sinema_film where film.id in (select id from sinema_film where sinema_film.film_ucreti=(select max(film_ucreti) from sinema_film) )
return(@filmadi)
end
go
select dbo.film_fiyat() as 'film adý'

--3.kendine gelen film adýna göre sinemalarda filmin kaç kere yayýnlandýðýný geriye döndüren bir fonksiyon yazýnýz
			create function film_yayin(@adi varchar(max))
			returns table
			as
			return(
			select film.baslik,
			(select count(sinema_film.film_id) from sinema_film where film_id in (select id from film where baslik=@adi)) as'film yayýnlanma sayýsý'
			from film where baslik=@adi
			)
			go
			select * from dbo.film_yayin('hýzlý ve öfkeli')

--4.kendine gelen film adýna göre sinemalarda filmin kaç kere yayýnlandýðýný geriye döndüren bir birleþtirilmiþ fonksiyon yazýnýz
	 create function tablo_film_yayin(@filmadi varchar(max))
			returns @tablo table(
									filmadi varchar(15),
									yayinsayisi int
			)
			as
			begin
			insert into @tablo(filmadi,yayinsayisi)
			select film.baslik,
			(select count(sinema_film.film_id) from sinema_film where film_id in (select id from film where baslik=@filmadi)) as'film yayýnlanma sayýsý'
			from film where baslik=@filmadi
			return
			end
			go
	
	select * from tablo_film_yayin('hýzlý ve öfkeli')


--5.dizi adlarýnýn  'r' harfi ile bitenleri listeleyen fonksiyon yazýnýz.

create function d_ara ()
returns table
as
return
select dizi.baslik from dizi where baslik LIKE '%r'
go
select * from dbo.d_ara()
--6. Parametre olarak aldýðý film ismini otomatik olarak büyük harflerle yeniden yazan fonksiyonu
--yazýnýz.

		create function film_baslik(@filmadi varchar(max))
			returns table
			as
			return(
			select UPPER(film.baslik) as 'Büyük harfe çevirdi' from film where film.baslik=@filmadi 
			 )
			go
			select * from dbo.film_baslik('zaman makinesi 1978')
--7.Kendisine gelen odeme numarasýna göre odemedki toplam tutarý geri döndüren fonksiyon yazýnýz.
create function toplam_tutar(@odemeno int)
returns int
as
begin
declare @ucret int
set @ucret=(select odeme.ucret from odeme where @odemeno=odeme.id)
return @ucret
end
select dbo.toplam_tutar(2)

--8.Adý soyadý girilen bir çalýþanýn  hangi birimde ve hangi filmlerde çalýþtýðýný bulan fonksiyonu yazýnýz.
create function gorev_proje(@adi varchar(50), @soyadi varchar(50))
returns table 
as
return
select film.baslik, calisan_gorev.adi from calisan, calisan_gorev, film,film_calisan where
calisan.gorev_id=calisan_gorev.id and film_calisan.calisan_id=calisan.id and film.id=film_calisan.calisan_id
 and calisan.adi=@adi and calisan.soyadi=@soyadi
go

select * from dbo.gorev_proje('fatmanur','gömbeci')



--9. film kategorisi bilim kurgu olan , dili ingilizce olan ve cýkýþ tarihi 10/10/2014 den sonra olan filmleri
--listeleyen bir fonksiyon yazýnýz.
create function film_l()
returns table
as
return
select film.baslik,film.cikis_tarihi,kategori.adi as 'Kategori Adi'
	from film,(select dil.id from dil where dil.adi='ingilizce' )t1,film_kategori,kategori 
		where film.id=film_kategori.film_id and
			film_kategori.kategori_id=kategori.id and kategori.adi like('%bilim-kurgu%') and  cikis_tarihi>'2014/10/10' 

go 
select * from dbo.film_l()

--10.KanalD de yayýnlanýpta diðer kanallarda yayýnlanmayan filmlerin isimlerini listeleyen fonksiyonu yazýnýz. 

create function flm_list()
returns table
as
return
select film.baslik,film.cikis_tarihi,kanal.adi,kanal_film.gösterim_tarihi from film,kanal,kanal_film
where film.id=kanal_film.film_id and
kanal.id=kanal_film.kanal_id
and kanal_film.film_id
in(
select kanal_film.film_id from kanal,kanal_film where  kanal.id=kanal_film.kanal_id and kanal_film.film_id
not in
(select kanal_film.film_id from kanal,kanal_film where  kanal.id=kanal_film.kanal_id and kanal_film.film_id
not in 
(select kanal_film.film_id from kanal,kanal_film where kanal.id=kanal_film.kanal_id and kanal.adi='KanalD')))
go 
select * from dbo.flm_list()

--11.her bir izleyicinin kaç tane dizi izlediðini listeleyecek fonksiyonu yaz
create function  i_dizi_say()
returns table
as
return

	select dizi_izleyici.izleyici_id,COUNT(dizi_izleyici.dizi_id) as 'Ýzlenilen dizi sayisi' from dizi_izleyici group by dizi_izleyici.izleyici_id 

go

select * from dbo.i_dizi_say()


--12.kendisine gelen izleyici numarasýna göre izleyicinin kaç tane dizi izlediðini  döndüren fonksiyonu yazýnýz.

create function i_dzi(@id int)
returns table
as 
return
 select COUNT(dizi_izleyici.dizi_id)as 'izlenilen dizi sayýsý' from dizi_izleyici where dizi_izleyici.izleyici_id=@id

 go 
select * from dbo.i_dzi(1)
  --13.kendisine gelen izleyici numarasýna göre hangi kategoriden kaç tane dizi izlediðini gösteren fonksiyonu  yaz.

 create function i_ktgr(@id int)
 returns table
 as
 return
 select kategori.adi,dizi_izleyici.izleyici_id,COUNT(dizi_kategori.dizi_id) as 'dizi sayýsý' from kategori,dizi_kategori,dizi_izleyici where
 kategori.id=dizi_kategori.kategori_id and dizi_kategori.dizi_id=dizi_izleyici.dizi_id and izleyici_id=@id group by kategori.adi,dizi_izleyici.izleyici_id

 go
select * from dbo.i_ktgr(1)
select * from dbo.i_ktgr(2)
--14 mia yapým þirketindeki çalýþan personellerin maaþ ortalamasýný veren fonksiyonu yazýnýz.
create function ortlmmaas()
returns float
as

begin
declare @ort float
set @ort=(select AVG(calisan_gorev.maas) as 'Ortalama Maas' from calisan_gorev,calisan,yapim_sirketi where
calisan.gorev_id=calisan_gorev.id and calisan.yapim_id=yapim_sirketi.id and yapim_sirketi.adi in
(select yapim_sirketi.adi from yapim_sirketi
 group by yapim_sirketi.adi having(yapim_sirketi.adi like('%mia%')))) 
 return @ort
 end
go

select dbo.ortlmmaas()

--15. Yapým þirketi  olan veri tabaný içerisinde, kanallarda bulunan filmlerin isimlerini yazdýran
-- fonksiyonu oluþturunuz.
create function k_flm_goster()
returns table
as
return
select kanal_film.kanal_id as 'kanal numarasý', film.baslik as 'Film Adý' from kanal_film,film where kanal_film.film_id=film.id 
go

 select * from dbo.k_flm_goster()


 --16.Dýþarýdan parametre olarak verilen aktörün oynadýðý dizileri listeleyen gerekli fonksiyonu
--yazýnýz.
create function a_d_listele(@aktorid int)
returns table
as
return
select dizi.baslik,dizi.dil_id,dizi.cikis_tarihi from dizi,aktor,dizi_aktor where dizi_aktor.dizi_id=dizi.id and dizi_aktor.aktor_id=aktor.id
 and aktor.id=@aktorid
go
 select * from dbo.a_d_listele(5)

 --17. Parametre olarak  numarasý verilen bir filmin, ismini, hangi sinemada
--olduðunu ve ücretini döndüren fonksiyonu yazýnýz.

create function sinema_flmadi(@a int=0)
returns table
as
return
select sinema.adi,film.baslik ,sinema_film.film_ucreti from sinema,film,sinema_film
where sinema.id=sinema_film.sinema_id and sinema_film.film_id=film.id and film.id=@a

go
select * from dbo.sinema_flmadi(3)
--18.Melek Baykal adlý aktöre ait 2015 yýlýnda yayýnlanan filmleri kensine gelen kategoriye göre listeyen fonksiyonu yazýn.
  create function aktor_flm_listele(@kategorid int)
  returns table
as
return
select film.baslik,film.cikis_tarihi,aktor.adi as 'Aktör'from film,film_kategori,
film_aktor,aktor where film.id=film_aktor.film_id and aktor.id=film_aktor.aktor_id and film.id=film_kategori.film_id
and aktor.adi='Melek'and aktor.soyadi='Baykal' 
  and DATEPART(YEAR,film.cikis_tarihi)=2015 and film_kategori.kategori_id=@kategorid
go

select * from dbo.aktor_flm_listele(2)

--19.Parametre olarak numarasý verilen yapým þirketinin 21.02.2014 tarihinde Amerika, Ohio bölgesindeki bilim-kurgu kategorisindeki filmlerinin listeleyiniz.
create function yapim_flm_listele(@yapimid int)
returns table
as
return
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,yapim_sirketi,
	(select ulke.adi as 'Ulke adi',il.adi as 'bölge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='amerika'and il.adi='Ohio')t1
	where film.id=film_kategori.film_id and yapim_sirketi.id=film.yapim_id and 
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%bilim-kurgu%') and film.cikis_tarihi='2014/02/21' and yapim_sirketi.id=@yapimid
go 

select * from dbo.yapim_flm_listele(3)

--dizilerde oynayan ama hiç sinemalarda oynamayan aktor listesi



--20. 23.12.2008 tarihinde Ýstanbulda oluþturulan tüm izleyicilerin sayýsýný geri döndüren  fonksiyon yazýnýz.

create function i_sayisi()
returns int
as
begin
declare @sayi int
set @sayi=( 
select COUNT(izleyici.id) as 'izleyici sayýsý' from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'
	)
return @sayi
end
go
select dbo.i_sayisi()

--21.ay yapým  filmlerine ait çýkýþ tarihinin gün ismini bulmak için gerekli fonksiyonu yazýnýz.
create function f_gun()
returns table
as
return
select datename(weekday,film.cikis_tarihi) as 'gunlerden' from film where 
yapim_id in (select yapim_sirketi.id from yapim_sirketi where adi='asd')
go
select * from dbo.f_gun()


--trigger

--1.Çýkýþ tarihi güncellenen  bir filmin  sinemadaki gösterim tarihini güncelleyen trigger yazýnýz. eski ve yeni gösterim tarihini gösteriniz
		create trigger gnceleme
	on film
	for update
	as 
		begin
			declare @fid int, @et datetime,@yt datetime
			select @fid=id from inserted 
			select @et=cikis_tarihi from deleted
			select @yt=cikis_tarihi from inserted
			
			update sinema_film set sinema_film.gösterim_tarihi=@yt where @fid=film_id

		end
		go

	update film set cikis_tarihi='2019/02/16' where film.id=4

	--2.yapim þirketi  bir  diziye yeni bölümü eklediðinde dizinin bilgilerinin güncelleyen trigger yazýnýz.
	alter table dizi add bolumsayisi int
	create trigger b_sayisi
	on bolum
	for insert
	as
	begin
	 declare @d_id int
	 select @d_id=dizi_id from  inserted
       update dizi set bolumsayisi=bolumsayisi+1  where  @d_id=id
	end
	go

	insert into bolum values(1,' ','')
	
	----Açýk hava türünden olan sinemayý  sinemayý silen trigger
	--create trigger sinema_iflas
	--on sinema_turu
	--after insert
	--as
	--begin
	--declare @sinemaid int, @tur int
	--select @sinemaid=id,@tur=id from inserted
	--delete from sinema where sinema.id=@sinemaid
	--end
	--go
	--delete from sinema_turu   where adi='acik hava'
	--select * from sinema_turu
	--select * from sinema


	--sýkýntýlýýý
----3.veritabanýndan bir film silindiðinde diðer tablolardaki kayýtlarýda silen bir trigger yazýnýz.
--	create trigger dz_sil
--	on dizi
--	for delete
--	as
--	begin 
--	declare @id int
--	select @id=id from deleted
--	delete  from dizi_izleyici where dizi_id=@id
--	end
--	go

--	delete from dizi where  id=7

	

