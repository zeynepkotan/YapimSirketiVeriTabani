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
g�sterim_tarihi datetime
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
g�sterim_tarihi datetime

)
create table kanal_film(
kanal_id int foreign key references kanal(id),
film_id int foreign key references film(id),
g�sterim_tarihi datetime

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
--�r�nler


insert into ulke values ('T�rkiye')
insert into ulke values ('Amerika')
insert into ulke values ('Almanya')
insert into ulke values ('�in')
insert into ulke values ('G�ney Kore')
insert into ulke values ('Fransa')


insert into il values ('�stanbul',1)
insert into il values ('New York',2)
insert into il values ('Berlin',3)
insert into il values ('Pekin',4)
insert into il values ('Seul',5)
insert into il values ('Paris',6)


insert into adres values ('g�ne�li evren mah karaa�a� sok',34212,1)
insert into adres values ('g�ne�li 15temmuz mahallesi 1402 sok',34212,1)
insert into adres values ('esenler karabay�r',34213,1)
insert into adres values ('bayrampa�a ',34214,1)
insert into adres values ('ikitelli',34215,1)
insert into adres values ('be�ikta� taksim',34219,1)
insert into adres values ('be�ikta� mecidiyek�y',34220,1)


insert into yapim_sirketi values ('ay yapim','ltd �ti',1,533,'zk@gmail','01/01/1997')
insert into yapim_sirketi values ('mia yapim','ltd �ti',1,535,'mia@gmail','01/02/1997')


insert into dil values ('T�rk�e')
insert into dil values ('almanca')
insert into dil values ('ingilizce')
insert into dil values ('frans�zca')
insert into dil values ('�ince')

insert into calisan_gorev values ('yap�mc�',5000)
insert into calisan_gorev values ('y�netmen',7000)
insert into calisan_gorev values ('reji',4000)
insert into calisan_gorev values ('maky�z',3000)



insert into dizi_platform values ('televizyon')
insert into dizi_platform values ('internet')

insert into calisan values (100,'fatmanur','g�mbeci',21,545,'fg@gmail.com',1,1,4,'2015/10/27','Kad�n')
insert into calisan values (101,'fatih','mand�ral�',22,536,'fm@gmail.com',1,4,1,'2015/10/23','Erkek')
insert into calisan values (101,'ertu�rul','kuran',21,537,'ek@gmail.com',2,5,3,'2015/10/28','Erkek')
insert into calisan values (101,'b��ra nur','g�ner',21,535,'bg@gmail.com',2,3,4,'2015/10/30','Kad�n')

insert into kategori values ('komedi')
insert into kategori values ('bilim-kurgu')
insert into kategori values ('dram')
insert into kategori values ('fantastik')
insert into kategori values ('macera')
insert into kategori values ('romantik')
insert into dizi values ('Hat�rla Sevgili','01/01/2007',1,1,1)
insert into dizi values ('Ad�n� feriha koydum','01/01/2015',1,1,1)
insert into dizi values ('Seksenler','01/01/2016',1,2,1)
insert into dizi values ('Cennet Mahhalesi','01/01/2006',1,2,1)
insert into dizi values ('�ocuklar duymas�n','01/01/2000',1,1,1)
insert into dizi values ('Akasya Dura��','01/01/2013',1,2,1)

insert into dizi_kategori values (1,3,'01/01/2010')
insert into dizi_kategori values (2,6,'01/01/2017')
insert into dizi_kategori values (3,1,'01/01/2018')
insert into dizi_kategori values (4,1,'01/01/2010')
insert into dizi_kategori values (5,1,'01/01/2010')
insert into dizi_kategori values (6,1,'01/01/2010')

insert into aktor values (151,'beren','saat',32,548,'bs@gmail.com',6,'Kad�n')
insert into aktor values (152,'tamer','karada�l�',49,549,'tk@gmail.com',4,'Erkek')
insert into aktor values (153,'melek','baykal',59,538,'mb@gmail.com',3,'Kad�n')
insert into aktor values (154,'hazal','kaya',28,545,'hk@gmail.com',5,'Kad�n')
insert into aktor values (151,'p�nar','altu�',45,532,'pa@gmail.com',4,'Kad�n')
insert into aktor values (151,'�oray','uzun',41,533,'su@gmail.com',3,'Erkek')

insert into film values ('deli bal','03/04/2015',1,1)
insert into film values ('arif ve 216','03/05/2018',1,1)
insert into film values ('zaman makinesi 1978','06/04/2015',2,1)
insert into film values ('ek�i elmalar','06/08/2018',2,1)
insert into film values ('ayla','12/05/2018',2,1)

insert into film_kategori values (1,6,'03/06/2016')
insert into film_kategori values (2,2,'03/06/2018')
insert into film_kategori values (3,2,'03/06/2016')
insert into film_kategori values (4,2,'03/06/2019')
insert into film_kategori values (5,3,'03/06/2019')

                                          --Views

--1.Tamer Karada�l� adl� akt�re ait 2003 y�l�nda yay�nlanan romantik komedi kategorisindeki dizileri listeleyen view yaz�n�z.
create view aktor_dizi
as
select dizi.baslik from dizi,aktor,dizi_aktor,dizi_kategori where dizi.id=dizi_aktor.dizi_id and aktor.id=dizi_aktor.aktor_id and dizi.id=dizi_kategori.dizi_id
and aktor.id in (select aktor.id from aktor where aktor.adi='tamer'and aktor.soyadi='karada�l�' ) and dizi_kategori.kategori_id in
(select kategori.id from kategori where  kategori.Adi like ('%romantik komedi%')) and DATEPART(YEAR,dizi.cikis_tarihi)=2003

select * from aktor_dizi

--2.12.02.2000 tarihinde t�rkiye, Erzurum b�lgesindeki yap�m �irketlerinin fantastik kategorisindeki filmlerini listeleyen view yaz�n�z.
create view film_list
as
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,
	(select ulke.adi as 'Ulke adi',il.adi as 'b�lge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='T�rkiye'and il.adi='Erzurum')t1
	where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%fantastik%') and film.cikis_tarihi='2000/02/12'

select * from film_list

--3. --23.12.2008 tarihinde �stanbulda olu�turulan t�m izleyicileri listeleyen view yaz�n�z.
create view  ikizleyici
as
	select izleyici.adi,izleyici.soyadi,izleyici.olusturma_tarihi from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'
select * from ikizleyici

--4.-- T�rkiye�de �niversite personelinin(eposta uzant�s� .edu.tr) izledi�i macera kategorisindeki filmleri listeleyen view yaz�n�z.
create view list
as
	select film.baslik, kategori.Adi,t1.id as 'izleyici numaras�' from film, kategori,film_kategori,(select izleyici.id from izleyici 
	where izleyici.mail like ('%.edu.tr%'))t1
	 where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi='macera'

select * from list

--5. Almanya, Frankfurt �ehrinde welcome yap�m �irketinde �al��an personelin isim-soyisimini listeleyen view yaz�n�z.
create view isim_soyisim
as
	select calisan.adi,calisan.soyadi from calisan,yapim_sirketi,ulke,il,adres 
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id and yapim_sirketi.adi='welcome' and ulke.adi='Almanya' and il.adi='Frankfurt'

	select * from isim_soyisim


--6. Almanya, Frankfurt �ehrinde her bir yap�m �irketinde �al��an personelin isim-soyisimini listeleyen view yaz�n�z.
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

--7	-- �ngiltere, Londra �ehrinde bulunan t�m yapim �irketlerin teslim tarihi 22.03.2019 olan t�m filmlerini listeleyen view yaz�n�z.
create view fl
as
	select film.baslik,film.cikis_tarihi from film,(select yapim_sirketi.id from ulke,il,yapim_sirketi,adres
	 where ulke.id=il.ulke_id and il.id=adres.il_id and yapim_sirketi.adres_id=adres.id and
	 ulke.adi='�ngiltere' and il.adi='Londra' )t1 where film.cikis_tarihi='2019/03/22'
select * from fl

--8 T�rkiye, Erzurum �ehrinde sinema �creti 20 � 40 lira aras�nda olan komedi filmleri listeleyen view yaz�n�z.
create view flist
as
	 select film.baslik,film.cikis_tarihi,film.yapim_id   from sinema_film,ulke,il,adres ,film,sinema,film_kategori
	 where ulke.id=il.ulke_id and il.id=adres.il_id and film.id=sinema_film.film_id and sinema.id=sinema_film.sinema_id and film.id=film_kategori.film_id
	  and sinema_film.film_ucreti between  20 and 40 and ulke.adi='T�rkiye' and il.adi='Erzurum' and kategori_id in (select kategori.id from kategori where kategori.adi='komedi')
select * from flist
--9--�Zaman Makinesi 1978� filmini T�rkiye, �stanbul �ehrinde max sinemada ki g�sterim tarihini listeleyen view yaz�n�z.
create view film_trh
as
select sinema_film.g�sterim_tarihi,film.baslik from sinema_film,film,sinema 
where sinema_film.film_id=film.id and sinema.id=sinema_film.sinema_id and sinema.Adi='max' and film.baslik='ZAman Makinesi 1978'

select * from film_trh
--10.Dili Frans�zca olan 2010 y�l�nda ��km�� t�m dizileri listeleyen view yaz�n�z.
create view d_list
as
select dizi.baslik,dizi.cikis_tarihi,dil.adi from dizi,dil where dizi.dil_id=dil.id and
Datepart(YEAR,cikis_tarihi)=2010 and dil.adi='Frans�zca'
select * from d_list


--11.Akt�rlerin ad ve soyadlar�n� birle�tirerek tek bir s�tunda  listeleyen view yaz�n�z.
create view sa
as
select t1.AdSoyad from (
select aktor.adi+' '+aktor.soyadi as 'AdSoyad' from aktor )t1
select * from sa

--12.�zleyici ad� z ile ba�layanlayanlar� listeleyen view yaz�n�z.
create view z_i
as
select * from izleyici where izleyici.adi like('z%') 
select * from z_i
--13.Aktor ad�n�n ilk 3 hanesini geri d�nd�ren view yaz�n�z.
create view aktor_harf
as
select UPPER(SUBSTRING(aktor.adi,1,1))+'.'+aktor.soyadi as 'AdSoyad' from aktor 
select * from aktor_harf

--14.s�resi 1 y�ldan fazla olan projede g�revli akt�rlerden maa�� 3000 tl �zerinde olanlar�n ad soyad lar�n� listeleyen view yaz�n�z.
create view max_aktor
as
select aktor.adi,aktor.soyadi from aktor,film_aktor ,film 
where  aktor.id=film_aktor.aktor_id and film.id=film_aktor.film_id and
(DATEPART(YEAR,film.cikis_tarihi)-DATEPART(YEAR,film_aktor.ise_baslama_tarihi))>1 
and film_aktor.kazanc>3000
select * from max_aktor

--15.reji isimli birimde �al��an kad�n personellerin �al��t�klar� film adlar�n� listeleyen view yaz�n�z.
create view film_ad
as
select film.baslik,calisan.adi from film,film_calisan,calisan,calisan_gorev where 
film.id=film_calisan.film_id and film_calisan.calisan_id=calisan.id and calisan_gorev.id=calisan.gorev_id
  and calisan_gorev.adi='reji' and calisan.cinsiyet='kad�n'
  select * from film_ad


 --16.mia yap�m�n 2014 y�l�nda komedi t�r�nde t�rk�e yapt��� dizi ve filmler say�s�n� listeleyen view yaz�n�z.
 create view f_d
as
 select 
	(select Count(dizi.id) from dizi,yapim_sirketi,dizi_kategori where dizi.yapim_id=yapim_sirketi.id and dizi.id=dizi_kategori.dizi_id and
	dil_id in (select dil.id from dil where dil.adi='t�rk�e') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,dizi.cikis_tarihi)=2014) as 'dizi sayisi',
	(
	select Count(film.id) from film,yapim_sirketi,film_kategori where film.yapim_id=yapim_sirketi.id and film.id=film_kategori.film_id and
	dil_id in (select dil.id from dil where dil.adi='t�rk�e') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,film.cikis_tarihi)=2014
	) as 'film sayisi' 
 select * from f_d

 --17.KanalD de yay�nlan�pta di�er kanallarda yay�nlanmayan filmlerin isimlerini listeleyen viewi yaz�n�z. 

 create view k_hayir
 as
	select film.baslik,film.cikis_tarihi,kanal.adi,kanal_film.g�sterim_tarihi from film,kanal,kanal_film
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



 --dizilerde oynayan ama hi� sinemalarda oynamayan aktor listesi
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

--1. film kategorisi bilim kurgu olan , dili ingilizce olan ve c�k�� tarihi 10/10/2007 den sonra olan filmleri
--listeleyen bir store prosed�r yaz�n�z.
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


--2.KanalD de yay�nlan�pta di�er kanallarda yay�nlanmayan filmlerin isimlerini listeleyen yordam� yaz�n�z. 

create procedure film_listee
with recompile
as
begin
select film.baslik,film.cikis_tarihi,kanal.adi,kanal_film.g�sterim_tarihi from film,kanal,kanal_film
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

--3.her bir izleyicinin ka� tane dizi izledi�ini listeleyecek stored prosedur yaz
create procedure  izleyici_dizi_say
as
begin

	select dizi_izleyici.izleyici_id,COUNT(dizi_izleyici.dizi_id) as '�zlenilen dizi sayisi' from dizi_izleyici group by dizi_izleyici.izleyici_id 
end
go

exec izleyici_dizi_say


--4.kendisine gelen izleyici numaras�na g�re izleyicinin ka� tane dizi izledi�ini  d�nd�ren yordam� yaz�n�z.

create procedure i_dizi(@id int)
as 
begin
 select COUNT(dizi_izleyici.dizi_id)as 'izlenilen dizi say�s�' from dizi_izleyici where dizi_izleyici.izleyici_id=@id
 end
 go 
 exec i_dizi 1


  --5.kendisine gelen izleyici numaras�na g�re hangi kategoriden ka� tane dizi izledi�ini g�steren stored procedur yaz.

 create proc i_kategori(@id int)
 as
 begin
 select kategori.adi,dizi_izleyici.izleyici_id,COUNT(dizi_kategori.dizi_id) as 'dizi say�s�' from kategori,dizi_kategori,dizi_izleyici where
 kategori.id=dizi_kategori.kategori_id and dizi_kategori.dizi_id=dizi_izleyici.dizi_id and izleyici_id=@id group by kategori.adi,dizi_izleyici.izleyici_id
 end 
 go
 exec i_kategori 1
  exec i_kategori 2

  
--6. mia yap�m �irketindeki �al��an personellerin maa� ortalamas�n� OUTPUT olarak veren yordam� yaz�n�z.
create proc ortmaas(@ortalama int output)
as
set @ortalama=(select AVG(calisan_gorev.maas) as 'Ortalama Maas' from calisan_gorev,(select yapim_sirketi.adi from yapim_sirketi
 group by yapim_sirketi.adi having(yapim_sirketi.adi like('%mia%')))t1) 
go
declare @sonuc int
exec ortmaas @sonuc output
print('ortalama '+cast(@sonuc as varchar(5)))

--7 kanal_film tablosu kanallarda bulunan filmleri tutmaktad�r. Haz�rlayaca��n�z yordam
--yard�m�yla, belirledi�iniz bir filmi, belirledi�iniz kanala ekleme i�lemi yap�lacakt�r. Belirtilen
--film ayn� kanalda var ise film vard�r yazd�r�lacak, ayn� kanalda yok ise yeni kay�t olarak girilecektir.


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
	 print('film vard�r...')
	end
else 
begin
insert into kanal_film(kanal_film.film_id,kanal_film.kanal_id,kanal_film.g�sterim_tarihi)
 values(@filmid,@kanalid,@gosterimtarihi)
end
exec kanal_film_ekle 1,1,'11/05/2019'

--8. Yap�m �irketi  olan veri taban� i�erisinde, kanallarda bulunan filmlerin isimlerini yazd�ran
--stored procedure olu�turunuz.
create procedure kanal_film_goster
as
select kanal_film.kanal_id as 'kanal numaras�', film.baslik as 'Film Ad�' from kanal_film,film where kanal_film.film_id=film.id 
exec kanal_film_goster

--9.D��ar�dan parametre olarak verilen akt�r�n oynad��� dizileri listeleyen gerekli yordam�
--yaz�n�z.
create proc aktor_dizi_listele(@aktorid int)
as
select dizi.baslik,dizi.dil_id,dizi.cikis_tarihi from dizi,aktor,dizi_aktor where dizi_aktor.dizi_id=dizi.id and dizi_aktor.aktor_id=aktor.id
 and aktor.id=@aktorid
go

exec aktor_dizi_listele 2

--10. Parametre olarak  numaras� verilen bir filmin, ismini, hangi sinemada
--oldu�unu ve �cretini d�nd�ren yordam� yaz�n�z.

create proc sinema_filmadi(@a int=0,@sinemadi varchar(50) output,@filmadi varchar(50) output, @filmucfreti varchar(50) output)
as
begin
select @sinemadi=sinema.adi,@filmadi=film.baslik , @filmucfreti=sinema_film.film_ucreti from sinema,film,sinema_film
where sinema.id=sinema_film.sinema_id and sinema_film.film_id=film.id and film.id=@a
end
go
declare @sinemadi1 varchar(50),@filmadi1 varchar(50), @filmucfreti1 varchar(50)
exec sinema_filmadi 4, @sinemadi1 output,@filmadi1 output, @filmucfreti1 output

print(' '+cast(@sinemadi1 as varchar(50))+' Ma�azas�nda g�steriliyor. '+cast(@filmadi1 as varchar(50))+' fiyat� '+cast(@filmucfreti1 as varchar(50))+' tl dir.')



--11.Melek Baykal adl� akt�re ait 2015 y�l�nda yay�nlanan filmleri kensine gelen kategoriye g�re listeyen yordam� yaz�n.
  create proc aktor_film_listele(@kategorid int)
as
select film.baslik,film.cikis_tarihi,aktor.adi as 'Akt�r'from film,film_kategori,
film_aktor,aktor where film.id=film_aktor.film_id and aktor.id=film_aktor.aktor_id and film.id=film_kategori.film_id
and aktor.adi='Melek'and aktor.soyadi='Baykal' 
  and DATEPART(YEAR,film.cikis_tarihi)=2015 and film_kategori.kategori_id=@kategorid
go

exec aktor_film_listele 2

--12.Parametre olarak numaras� verilen yap�m �irketinin 21.02.2014 tarihinde Amerika, Ohio b�lgesindeki bilim-kurgu kategorisindeki filmlerinin listeleyiniz.
create proc yapim_film_listele(@yapimid int)
as
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,yapim_sirketi,
	(select ulke.adi as 'Ulke adi',il.adi as 'b�lge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='amerika'and il.adi='Ohio')t1
	where film.id=film_kategori.film_id and yapim_sirketi.id=film.yapim_id and 
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%bilim-kurgu%') and film.cikis_tarihi='2014/02/21' and yapim_sirketi.id=@yapimid
go 

exec yapim_film_listele 3

--13. 23.12.2008 tarihinde �stanbulda olu�turulan t�m izleyicilerin say�s�n� geri d�nd�ren yordam.

create proc izleyici_sayisi
as
return (
select COUNT(izleyici.id) as 'izleyici say�s�' from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'
)
go
declare @sonuc int
exec @sonuc= izleyici_sayisi

print('�zleyici Say�s� '+cast(@sonuc as varchar(5)))



--14.�zleyicilerin soyisimlerini b�y�k yazan procedur
create proc buyukharf(@izleyiciid int)
as
begin
select izleyici.adi, upper(izleyici.soyadi) as 'soyad�' from izleyici where izleyici.id=@izleyiciid
end
exec buyukharf 1

--15.en y�ksek  fiyatl� filmin ad�n� geri d�nd�ren yordam
			
create proc film_fyt
as
begin
select film.baslik from film,sinema_film where film.id=sinema_film.film_id and sinema_film.film_ucreti=(select max(film_ucreti) from sinema_film) 
end
go
exec film_fyt


--16.kendine gelen film ad�na g�re sinemalarda filmin ka� kere yay�nland���n� geriye d�nd�ren bir procedur yaz�n�z
			create proc flm_yayin(@adi varchar(max))
			as
			begin
			select film.baslik,
			(select count(sinema_film.film_id) as 'x' from sinema_film where film_id in (select id from film where baslik=@adi)) as'film yay�nlanma say�s�'
			from film where baslik=@adi
			end
			go
			exec flm_yayin 'h�zl� ve �fkeli'
		
--17.kendine gelen film ad�na g�re kanallarda filmin ka� kere yay�nland���n� geriye d�nd�ren bir yordam yaz�n�z
	 create proc tbl_film_yayin(@filmadi varchar(max))
			
			as
			begin
			
			select film.baslik,
			(select count(kanal_film.film_id) from kanal_film where film_id in (select id from film where baslik=@filmadi)) as'film yay�nlanma say�s�'
			from film where baslik=@filmadi
			
			end
			go
	
	exec tbl_film_yayin'h�zl� ve �fkeli'

	
 --18.dizi adlar�n�n  'r' harfi ile bitenleri listeleyen Stored Procedure yaz�n�z.

create proc d_a 
with recompile
as
begin
select dizi.baslik from dizi where baslik LIKE '%r'
end
go
exec d_a


		--19. Parametre olarak ald��� film ismini otomatik olarak b�y�k harflerle yeniden yazan yordam
--yaz�n�z.

		create proc film_bslk(@filmadi varchar(max))
			as
			begin
			select UPPER(film.baslik) as 'B�y�k harfe �evirdi' from film where film.baslik=@filmadi 
			end
			go
			exec film_bslk 'zaman makinesi 1978' 



			--20.Kendisine gelen odeme numaras�na g�re odemedki toplam tutar� geri d�nd�ren yordam� yaz�n�z.
create proc toplm_tutar(@odemeno int)
as
begin
declare @ucret int
set @ucret=(select odeme.ucret from odeme where @odemeno=odeme.id)
return @ucret
end
exec toplm_tutar 1

--21.Ad� soyad� girilen bir �al��an�n  hangi birimde ve hangi filmlerde �al��t���n� bulan yordam� yaz�n�z.
create proc gorev_prje(@adi varchar(50), @soyadi varchar(50))
as
begin
select film.baslik, calisan_gorev.adi from calisan, calisan_gorev, film,film_calisan where
calisan.gorev_id=calisan_gorev.id and film_calisan.calisan_id=calisan.id and film.id=film_calisan.calisan_id
 and calisan.adi=@adi and calisan.soyadi=@soyadi
 end
go

 exec gorev_prje 'fatmanur','g�mbeci' 
 
 --22.mia yap�m�n 2014 y�l�nda komedi t�r�nde t�rk�e yapt��� dizi ve filmler say�s�n� listeleyen procedur yaz�n�z.
 create proc d_f
as
begin
 select 
	(select Count(dizi.id) from dizi,yapim_sirketi,dizi_kategori where dizi.yapim_id=yapim_sirketi.id and dizi.id=dizi_kategori.dizi_id and
	dil_id in (select dil.id from dil where dil.adi='t�rk�e') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,dizi.cikis_tarihi)=2014) as 'dizi sayisi',
	(
	select Count(film.id) from film,yapim_sirketi,film_kategori where film.yapim_id=yapim_sirketi.id and film.id=film_kategori.film_id and
	dil_id in (select dil.id from dil where dil.adi='t�rk�e') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,film.cikis_tarihi)=2014
	) as 'film sayisi' 
	end
	go
	 exec d_f

	

  


													 --i� i�e sorgu

  --1.Hazal Kaya adl� akt�re ait 2015 y�l�nda yay�nlanan romantik komedi kategorisindeki dizileri listeleyin
select dizi.baslik,dizi.cikis_tarihi,t1.Adi,aktor.adi as 'Akt�r',t1.Adi,t2.[yayin tarihi] from dizi,(select kategori.Adi from kategori where kategori.Adi like ('%romantik komedi%'))t1,
(select bolum.yayinlama_tarihi as 'yayin tarihi' from bolum where DATEPART(YEAR,bolum.yayinlama_tarihi)=2015)t2,
dizi_aktor,aktor where dizi.id=dizi_aktor.dizi_id and aktor.id=dizi_aktor.aktor_id
and aktor.adi='Hazal'and aktor.soyadi='Kaya' 

--2.21.02.2014 tarihinde Amerika, Ohio b�lgesindeki yap�m �irketlerinin bilim-kurgu kategorisindeki filmlerinin listeleyiniz.
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,
	(select ulke.adi as 'Ulke adi',il.adi as 'b�lge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='amerika'and il.adi='Ohio')t1
	where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%bilim-kurgu%') and film.cikis_tarihi='2014/02/21'

--3. --23.12.2008 tarihinde �stanbulda olu�turulan t�m izleyicilerin listesi.
	select izleyici.adi,izleyici.soyadi,izleyici.olusturma_tarihi from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'



--4.-- T�rkiye�de �niversite personelinin(eposta uzant�s� .edu.tr) izledi�i macera kategorisindeki filmlerin listesi.
	select film.baslik, kategori.Adi,t1.id as 'izleyici numaras�' from film, kategori,film_kategori,(select izleyici.id from izleyici 
	where izleyici.mail like ('%.edu.tr%'))t1
	 where film.id=film_kategori.film_id and
	film_kategori.kategori_id=kategori.id and kategori.Adi='macera'


--5. Almanya, Frankfurt �ehrinde welcome yap�m �irketinde �al��an personelin isim-soyisim listesi.
	select calisan.adi,calisan.soyadi from calisan,yapim_sirketi,ulke,il,adres 
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id and yapim_sirketi.adi='welcome' and ulke.adi='Almanya' and il.adi='Frankfurt'

	--6. Almanya, Frankfurt �ehrinde her bir yap�m �irketinde �al��an personelin isim-soyisim listesi.
	select calisan.adi,calisan.soyadi,t1.id as 'yapim sirketi numarasi' 
	from calisan,yapim_sirketi,ulke,il,adres,
	(select yapim_sirketi.id from calisan,yapim_sirketi,ulke,il,adres
	 where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id  and ulke.adi='Almanya' and il.adi='Frankfurt'  group by yapim_sirketi.id)t1
	where ulke.id=il.ulke_id and  calisan.yapim_id=yapim_sirketi.id and il.id=adres.il_id
	and adres.id=yapim_sirketi.adres_id  and ulke.adi='Almanya' and il.adi='Frankfurt' 

--7	-- �ngiltere, Londra �ehrinde bulunan t�m yapim �irketlerin teslim tarihi 22.03.2019 olan t�m filmlerinin listesi.
	select film.baslik,film.cikis_tarihi from film,(select yapim_sirketi.id from ulke,il,yapim_sirketi,adres
	 where ulke.id=il.ulke_id and il.id=adres.il_id and yapim_sirketi.adres_id=adres.id and
	 ulke.adi='�ngiltere' and il.adi='Londra' )t1 where film.cikis_tarihi='2019/03/22'


	 alter  table sinema_film  add     film_ucreti  money
--8	 -- T�rkiye, Erzurum �ehrinde sinema �creti 20 � 40 lira aras�nda olan komedi filmleri listesi.
	 select film.baslik,film.cikis_tarihi,film.yapim_id   from sinema_film,ulke,il,adres ,film,sinema,film_kategori
	 where ulke.id=il.ulke_id and il.id=adres.il_id and film.id=sinema_film.film_id and sinema.id=sinema_film.sinema_id and film.id=film_kategori.film_id
	  and sinema_film.film_ucreti between  20 and 40 and ulke.adi='T�rkiye' and il.adi='Erzurum' and kategori_id in (select kategori.id from kategori where kategori.adi='komedi')


--9--�Zaman Makinesi 1978� filmini T�rkiye, �stanbul �ehrinde max sinemada ki g�sterim tarihini listele

select sinema_film.g�sterim_tarihi,film.baslik from sinema_film,film,sinema 
where sinema_film.film_id=film.id and sinema.id=sinema_film.sinema_id and sinema.Adi='max' and film.baslik='ZAman Makinesi 1978'

--10.Dili Frans�zca olan 2010 y�l�nda ��km�� t�m dizilerin listesi.

select dizi.baslik,dizi.cikis_tarihi,dil.adi from dizi,dil where dizi.dil_id=dil.id and
Datepart(YEAR,cikis_tarihi)=2010 and dil.adi='Frans�zca'

--11.Akt�rlerin ad ve soyadlar�n� birle�tirerek tek bir s�tunda artan s�rada listele
select aktor.adi+' '+aktor.soyadi as 'AdSoyad' from aktor order by  AdSoyad asc
--12.�zleyici ad� z ile ba�layanlayanlar� b�y�kten k����e s�rala
select * from izleyici where izleyici.adi like('z%') order by adi desc
--13.Aktor ad�n�n ilk 3 hanesini geri d�nd�ren sql sorgusu yaz�n�z.
select UPPER(SUBSTRING(aktor.adi,1,1))+'.'+aktor.soyadi as 'AdSoyad' from aktor order by  AdSoyad desc

--14.s�resi 1 y�ldan fazla olan projede g�revli akt�rlerden maa�� 3000 tl �zerinde olanlar�n ad soyad lar�n� listeleyiniz
select aktor.adi,aktor.soyadi from aktor,film_aktor ,film 
where  aktor.id=film_aktor.aktor_id and film.id=film_aktor.film_id and
(DATEPART(YEAR,film.cikis_tarihi)-DATEPART(YEAR,film_aktor.ise_baslama_tarihi))>1 
and film_aktor.kazanc>3000


--15.reji isimli birimde �al��an kad�n personellerin �al��t�klar� film adlar�n� yaz�n�z.
select film.baslik,calisan.adi from film,film_calisan,calisan,calisan_gorev where 
film.id=film_calisan.film_id and film_calisan.calisan_id=calisan.id and calisan_gorev.id=calisan.gorev_id
  and calisan_gorev.adi='reji' and calisan.cinsiyet='kad�n'

 --16.mia yap�m�n 2014 y�l�nda komedi t�r�nde t�rk�e yapt��� dizi ve filmler say�s�n� listeleyiniz.

 select 
	(select Count(dizi.id) from dizi,yapim_sirketi,dizi_kategori where dizi.yapim_id=yapim_sirketi.id and dizi.id=dizi_kategori.dizi_id and
	dil_id in (select dil.id from dil where dil.adi='t�rk�e') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,dizi.cikis_tarihi)=2014) as 'dizi sayisi',
	(
	select Count(film.id) from film,yapim_sirketi,film_kategori where film.yapim_id=yapim_sirketi.id and film.id=film_kategori.film_id and
	dil_id in (select dil.id from dil where dil.adi='t�rk�e') and kategori_id in (select kategori.id from kategori where adi='komedi')
	and yapim_sirketi.adi='mia yapim' and DATEPART(YEAR,film.cikis_tarihi)=2014
	) as 'film sayisi' 

--17.ay yap�m  filmlerine ait ��k�� tarihinin g�n ismini bulmak i�in gerekli sql sorgusu
select datename(weekday,film.cikis_tarihi) as 'gunlerden' from film where yapim_id in (select yapim_sirketi.id from yapim_sirketi where adi='asd')
--18.Her bir g�revde �al��an personellerin say�s�n� bulan sql ifadesi
select calisan_gorev.adi 'G�rev Ad�',COUNT(calisan.id) 'Personel say�s�' from calisan_gorev,calisan where calisan.gorev_id=calisan_gorev.id group by calisan_gorev.adi
--19.�zleyicilerin isimlerini ve soy isimlerini tersten yazd�ran sorgu
select REVERSE(izleyici.adi) 'ters isim',REVERSE(izleyici.soyadi) 'ters soyisim' from izleyici
---Tablo tipi de�i�kenler
--1.
declare @izleyiciliste table(
id int
)
insert into @izleyiciliste values(1)
insert into @izleyiciliste values(3)
insert into @izleyiciliste values(4)
select * from izleyici where izleyici.id IN(select id from @izleyiciliste)

--2. max isimli sinemada zaman makinesi 1978 isimli filmin g�sterimi var ise filmin akt�rlerini listeleyen yoksa �Bu
--filmin g�sterimi yoktur� �eklinde mesaj veren T-SQL ifadesini yaz�n�z.
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
		print('Bu filmin g�sterimi yoktur')
	end
go

--3. odeme tablosunda bulunan odemelerden �creti 50 TL ve �zeri olan �odemelerin fiyatlar�nda %5 indirim
--yapan T-SQL ifadesini yaz�n�z.

declare @odeme float
set @odeme=(select odeme.ucret from odeme where (odeme.ucret>=50))
set @odeme=((@odeme*5)/100)+@odeme
  print(@odeme)

--4.�al��anlar�n bilgilerini (ad, soyad, adres, tel, vb.) @calisanBilgi isimli tablo de�i�kenine ekleyerek tablo
--de�i�keninin i�eri�ini yazd�ran T-SQL ifadesini yaz�n�z.
declare @calisanbilgi table(
tc int,
adi varchar(50),
soyadi varchar(50),
mail varchar(50),
tel int
)
insert into @calisanbilgi values(1,'yenizeynep','kotan','@gmail.com',539565)

select * from @calisanbilgi

--5.max  isimli sinemada en �ok izlenen filmi bularak bularak @MMaxfilm isimli de�i�kene atan ve bu filmi izleyen ki�ilerin
--ya� ortalamas�n� bulan T-SQL ifadesini yaz�n�z.
declare @MMaxfilm int,@ortyas int
select @ortyas=AVG(izleyici.yas),@MMaxfilm=Max(t1.[filmi izleyen ki�i say�s�]) from sinema,sinema_film,film_izleyici,izleyici,(
select Count(film_izleyici.izleyici_id) as 'filmi izleyen ki�i say�s�' from film_izleyici,film where film.id=film_izleyici.film_id
group by film.id)t1 where
sinema.id=sinema_film.sinema_id and sinema_film.film_id=film_izleyici.film_id and izleyici.id=film_izleyici.izleyici_id and
sinema.Adi='max'
print(@MMaxfilm)
print(@ortyas)


--6.�zleyici say�sn� bulup de�erlendiren T-SQL ifadesini yaz�n�z.
declare @izleyici_sayisi int
select @izleyici_sayisi=Count(*) from izleyici
print @izleyici_sayisi

if(@izleyici_sayisi>=0 and @izleyici_sayisi<=6)
begin
  print('�zleyici Say�s�'+cast(@izleyici_sayisi as varchar(10)))
  print( 'az')
  end

  else if(@izleyici_sayisi>=6and @izleyici_sayisi<=10)
  begin
  print('�zleyici Say�s�'+cast(@izleyici_sayisi as varchar(10)))
  print( 'orta')

  end
   
else 
   begin
   print('�zleyici Say�s� �ok')
   end

--7.�zleyici tablosuna girilen Cinsiyete g�re  say�sal de�erler atayan T-SQL ifadesini yaz�n�z. 
select izleyici.adi,izleyici.soyadi,izleyici.cinsiyet, 'Cinsiyet'=
        case izleyici.cinsiyet
		    when 'Erkek' then '1'
			when 'Kad�n' then '0'
		end
		from izleyici

--8.�nsan kaynaklar� isimli birimde �al��an kad�n personellerin maas ortalamas�n� output olarak veren tsql ifadesini yaz�n�z.
declare @ort  int
select @ort= AVG(calisan_gorev.maas) from calisan_gorev,calisan where calisan.gorev_id=calisan_gorev.id and calisan_gorev.adi='�nsan Kaynaklar�'
			and calisan.cinsiyet='Kad�n'
			begin
print('ORtalama maas '+cast (@ort as varchar(10)))
end

--9.if yap�s�n� kullanarak fiyati 30 liradan d���k olan filmlerin say�s�n� listeleyen tsql ifadesini yaz�n�z.
declare @film_sayisi int
select @film_sayisi=Count(*) from sinema_film where film_ucreti<30
IF (@film_sayisi>0)
begin
PRINT('film say�s� '+cast(@film_sayisi as varchar(5))+' dir.')
end
else
begin
print('30 tl den d���k fiyatl� olan film yoktur:)')
end



--10.Maas� en y�ksek olan calisan g�revini 'yap�mc�' olarak de�i�tiren T-sql sorgusu
declare @enyuksek int

SELECT @enyuksek = max(calisan_gorev.maas) from calisan_gorev
UPDATE calisan_gorev SET maas=@enyuksek  where adi = 'yap�mc�'
select calisan_gorev.adi,calisan_gorev.maas from calisan_gorev 

--HATA YAKALAMA

--1�Zaman Makinesi 1978� filmini T�rkiye, �stanbul �ehrinde max sinemada ki g�sterim tarihini listeleyen sorgunun  hatas�n� yazd�r
begin try 
	select sinema_film.g�sterim_tarihi,film.baslik from sinema_film,film,sinema 
where sinema_film.film_id=film.id and sinema.id=sinema_film.sinema_id and sinema.id='max' and film.baslik='ZAman Makinesi 1978'
end try
begin catch
	select  ERROR_NUMBER() as 'hata numaras�',
			ERROR_SEVERITY() as 'Hata derecesi', 
			ERROR_LINE() as 'Hata sat�r numaras�',
			ERROR_MESSAGE() as 'Hata mesaj�'

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
        values(325,'zeyno','kotan',21,5658,'zk@gmail.com','Kad�n','zeynepkotan1',1018,'2015/09/28',3)
select * from @izleyici

--2.izleyici tablosunda i�erisinde z harfi ge�en izleyiciyi silerken silinen izleyicinin bilgilerini listeleyen output
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


--3.izleyici tablosunda i�erisinde z harfi ge�en izleyicinin mail bilgisini g�ncellerken g�ncellenen izleyicinin bilgilerini listeleyen output

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

--4.Film �cretlerini y�zde 10 indiren max sinemas�n�n eski ve yeni fiyatlar�n� g�steren output yaz�n�z.

declare @indirim table(
		sinema_id int,
		film_id int,
		gosterim_tarihi datetime,
		efucret money,
		yfucret money

)
update sinema_film set  film_ucreti=film_ucreti-(film_ucreti*0.1)  
	output 
	inserted.sinema_id,inserted.film_id,inserted.g�sterim_tarihi,deleted.film_ucreti[efucret],inserted.film_ucreti into @indirim
where sinema_film.sinema_id=(select sinema.id from sinema where sinema.Adi='max')

select * from @indirim

--5.Ad� de�i�en yap�m �irketi i�in, bu yap�m �irketinin eski ve yeni bilgilerini g�sterecek output
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
inserted.id,deleted.adi[eski ad�],inserted.adi[yeni ad�],inserted.unvani,inserted.adres_id,inserted.tel,inserted.mail,inserted.acilis_tarihi into @yeni
where yapim_sirketi.id=1
select * from @yeni



--transaction

--1. T�m �al��anlar�n maaslar�n� 7000 yapacak daha sonra bu i�lemi iptal edecek transaction
begin transaction
update calisan_gorev set maas=7000
select * from calisan_gorev
rollback
select * from calisan_gorev
 --2.odeme Fiyat�n� %10 artt�r�p daha sonra bu i�lemi iptal eden transaction yaz�n�z
 begin transaction
 update odeme set ucret=ucret+(ucret*10)/100
 select * from odeme
 rollback

 select * from odeme
 
--3.film kategorisi komedi  olanlar� silen daha sonra  bu i�lemi iptal eden transaction yaz�n�z.
 begin transaction
 delete from film_kategori where kategori_id in (select kategori.id from kategori where kategori.adi='komedi')
 select * from film_kategori
 rollback
 select * from film_kategori



                                                       ---Fonksiyonlar


--1.�zleyicilerin soyisimlerini b�y�k yazan fonksiyon
create function bharf(@izleyiciadi varchar(max))
returns varchar(max)
as
begin
return upper(@izleyiciadi)
end
select  izleyici.adi,dbo.bharf(izleyici.soyadi) as 'soyad�' from izleyici
--2.en y�ksek  fiyatl� filmin ad�n� geri d�nd�ren fonksiyon
			
create function film_fiyat()
returns varchar(15)
as
begin
declare @filmadi varchar(15)
select @filmadi=film.baslik from film,sinema_film where film.id in (select id from sinema_film where sinema_film.film_ucreti=(select max(film_ucreti) from sinema_film) )
return(@filmadi)
end
go
select dbo.film_fiyat() as 'film ad�'

--3.kendine gelen film ad�na g�re sinemalarda filmin ka� kere yay�nland���n� geriye d�nd�ren bir fonksiyon yaz�n�z
			create function film_yayin(@adi varchar(max))
			returns table
			as
			return(
			select film.baslik,
			(select count(sinema_film.film_id) from sinema_film where film_id in (select id from film where baslik=@adi)) as'film yay�nlanma say�s�'
			from film where baslik=@adi
			)
			go
			select * from dbo.film_yayin('h�zl� ve �fkeli')

--4.kendine gelen film ad�na g�re sinemalarda filmin ka� kere yay�nland���n� geriye d�nd�ren bir birle�tirilmi� fonksiyon yaz�n�z
	 create function tablo_film_yayin(@filmadi varchar(max))
			returns @tablo table(
									filmadi varchar(15),
									yayinsayisi int
			)
			as
			begin
			insert into @tablo(filmadi,yayinsayisi)
			select film.baslik,
			(select count(sinema_film.film_id) from sinema_film where film_id in (select id from film where baslik=@filmadi)) as'film yay�nlanma say�s�'
			from film where baslik=@filmadi
			return
			end
			go
	
	select * from tablo_film_yayin('h�zl� ve �fkeli')


--5.dizi adlar�n�n  'r' harfi ile bitenleri listeleyen fonksiyon yaz�n�z.

create function d_ara ()
returns table
as
return
select dizi.baslik from dizi where baslik LIKE '%r'
go
select * from dbo.d_ara()
--6. Parametre olarak ald��� film ismini otomatik olarak b�y�k harflerle yeniden yazan fonksiyonu
--yaz�n�z.

		create function film_baslik(@filmadi varchar(max))
			returns table
			as
			return(
			select UPPER(film.baslik) as 'B�y�k harfe �evirdi' from film where film.baslik=@filmadi 
			 )
			go
			select * from dbo.film_baslik('zaman makinesi 1978')
--7.Kendisine gelen odeme numaras�na g�re odemedki toplam tutar� geri d�nd�ren fonksiyon yaz�n�z.
create function toplam_tutar(@odemeno int)
returns int
as
begin
declare @ucret int
set @ucret=(select odeme.ucret from odeme where @odemeno=odeme.id)
return @ucret
end
select dbo.toplam_tutar(2)

--8.Ad� soyad� girilen bir �al��an�n  hangi birimde ve hangi filmlerde �al��t���n� bulan fonksiyonu yaz�n�z.
create function gorev_proje(@adi varchar(50), @soyadi varchar(50))
returns table 
as
return
select film.baslik, calisan_gorev.adi from calisan, calisan_gorev, film,film_calisan where
calisan.gorev_id=calisan_gorev.id and film_calisan.calisan_id=calisan.id and film.id=film_calisan.calisan_id
 and calisan.adi=@adi and calisan.soyadi=@soyadi
go

select * from dbo.gorev_proje('fatmanur','g�mbeci')



--9. film kategorisi bilim kurgu olan , dili ingilizce olan ve c�k�� tarihi 10/10/2014 den sonra olan filmleri
--listeleyen bir fonksiyon yaz�n�z.
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

--10.KanalD de yay�nlan�pta di�er kanallarda yay�nlanmayan filmlerin isimlerini listeleyen fonksiyonu yaz�n�z. 

create function flm_list()
returns table
as
return
select film.baslik,film.cikis_tarihi,kanal.adi,kanal_film.g�sterim_tarihi from film,kanal,kanal_film
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

--11.her bir izleyicinin ka� tane dizi izledi�ini listeleyecek fonksiyonu yaz
create function  i_dizi_say()
returns table
as
return

	select dizi_izleyici.izleyici_id,COUNT(dizi_izleyici.dizi_id) as '�zlenilen dizi sayisi' from dizi_izleyici group by dizi_izleyici.izleyici_id 

go

select * from dbo.i_dizi_say()


--12.kendisine gelen izleyici numaras�na g�re izleyicinin ka� tane dizi izledi�ini  d�nd�ren fonksiyonu yaz�n�z.

create function i_dzi(@id int)
returns table
as 
return
 select COUNT(dizi_izleyici.dizi_id)as 'izlenilen dizi say�s�' from dizi_izleyici where dizi_izleyici.izleyici_id=@id

 go 
select * from dbo.i_dzi(1)
  --13.kendisine gelen izleyici numaras�na g�re hangi kategoriden ka� tane dizi izledi�ini g�steren fonksiyonu  yaz.

 create function i_ktgr(@id int)
 returns table
 as
 return
 select kategori.adi,dizi_izleyici.izleyici_id,COUNT(dizi_kategori.dizi_id) as 'dizi say�s�' from kategori,dizi_kategori,dizi_izleyici where
 kategori.id=dizi_kategori.kategori_id and dizi_kategori.dizi_id=dizi_izleyici.dizi_id and izleyici_id=@id group by kategori.adi,dizi_izleyici.izleyici_id

 go
select * from dbo.i_ktgr(1)
select * from dbo.i_ktgr(2)
--14 mia yap�m �irketindeki �al��an personellerin maa� ortalamas�n� veren fonksiyonu yaz�n�z.
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

--15. Yap�m �irketi  olan veri taban� i�erisinde, kanallarda bulunan filmlerin isimlerini yazd�ran
-- fonksiyonu olu�turunuz.
create function k_flm_goster()
returns table
as
return
select kanal_film.kanal_id as 'kanal numaras�', film.baslik as 'Film Ad�' from kanal_film,film where kanal_film.film_id=film.id 
go

 select * from dbo.k_flm_goster()


 --16.D��ar�dan parametre olarak verilen akt�r�n oynad��� dizileri listeleyen gerekli fonksiyonu
--yaz�n�z.
create function a_d_listele(@aktorid int)
returns table
as
return
select dizi.baslik,dizi.dil_id,dizi.cikis_tarihi from dizi,aktor,dizi_aktor where dizi_aktor.dizi_id=dizi.id and dizi_aktor.aktor_id=aktor.id
 and aktor.id=@aktorid
go
 select * from dbo.a_d_listele(5)

 --17. Parametre olarak  numaras� verilen bir filmin, ismini, hangi sinemada
--oldu�unu ve �cretini d�nd�ren fonksiyonu yaz�n�z.

create function sinema_flmadi(@a int=0)
returns table
as
return
select sinema.adi,film.baslik ,sinema_film.film_ucreti from sinema,film,sinema_film
where sinema.id=sinema_film.sinema_id and sinema_film.film_id=film.id and film.id=@a

go
select * from dbo.sinema_flmadi(3)
--18.Melek Baykal adl� akt�re ait 2015 y�l�nda yay�nlanan filmleri kensine gelen kategoriye g�re listeyen fonksiyonu yaz�n.
  create function aktor_flm_listele(@kategorid int)
  returns table
as
return
select film.baslik,film.cikis_tarihi,aktor.adi as 'Akt�r'from film,film_kategori,
film_aktor,aktor where film.id=film_aktor.film_id and aktor.id=film_aktor.aktor_id and film.id=film_kategori.film_id
and aktor.adi='Melek'and aktor.soyadi='Baykal' 
  and DATEPART(YEAR,film.cikis_tarihi)=2015 and film_kategori.kategori_id=@kategorid
go

select * from dbo.aktor_flm_listele(2)

--19.Parametre olarak numaras� verilen yap�m �irketinin 21.02.2014 tarihinde Amerika, Ohio b�lgesindeki bilim-kurgu kategorisindeki filmlerinin listeleyiniz.
create function yapim_flm_listele(@yapimid int)
returns table
as
return
	select film.baslik,film.cikis_tarihi from film,film_kategori,kategori,yapim_sirketi,
	(select ulke.adi as 'Ulke adi',il.adi as 'b�lge adi' from ulke,il where ulke.id=il.ulke_id and ulke.adi='amerika'and il.adi='Ohio')t1
	where film.id=film_kategori.film_id and yapim_sirketi.id=film.yapim_id and 
	film_kategori.kategori_id=kategori.id and kategori.Adi like('%bilim-kurgu%') and film.cikis_tarihi='2014/02/21' and yapim_sirketi.id=@yapimid
go 

select * from dbo.yapim_flm_listele(3)

--dizilerde oynayan ama hi� sinemalarda oynamayan aktor listesi



--20. 23.12.2008 tarihinde �stanbulda olu�turulan t�m izleyicilerin say�s�n� geri d�nd�ren  fonksiyon yaz�n�z.

create function i_sayisi()
returns int
as
begin
declare @sayi int
set @sayi=( 
select COUNT(izleyici.id) as 'izleyici say�s�' from izleyici,adres,il
	where il.id=adres.il_id and adres.id=izleyici.adres_id and il.adi='istanbul' 
	and izleyici.olusturma_tarihi='2008/12/23'
	)
return @sayi
end
go
select dbo.i_sayisi()

--21.ay yap�m  filmlerine ait ��k�� tarihinin g�n ismini bulmak i�in gerekli fonksiyonu yaz�n�z.
create function f_gun()
returns table
as
return
select datename(weekday,film.cikis_tarihi) as 'gunlerden' from film where 
yapim_id in (select yapim_sirketi.id from yapim_sirketi where adi='asd')
go
select * from dbo.f_gun()


--trigger

--1.��k�� tarihi g�ncellenen  bir filmin  sinemadaki g�sterim tarihini g�ncelleyen trigger yaz�n�z. eski ve yeni g�sterim tarihini g�steriniz
		create trigger gnceleme
	on film
	for update
	as 
		begin
			declare @fid int, @et datetime,@yt datetime
			select @fid=id from inserted 
			select @et=cikis_tarihi from deleted
			select @yt=cikis_tarihi from inserted
			
			update sinema_film set sinema_film.g�sterim_tarihi=@yt where @fid=film_id

		end
		go

	update film set cikis_tarihi='2019/02/16' where film.id=4

	--2.yapim �irketi  bir  diziye yeni b�l�m� ekledi�inde dizinin bilgilerinin g�ncelleyen trigger yaz�n�z.
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
	
	----A��k hava t�r�nden olan sinemay�  sinemay� silen trigger
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


	--s�k�nt�l���
----3.veritaban�ndan bir film silindi�inde di�er tablolardaki kay�tlar�da silen bir trigger yaz�n�z.
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

	

