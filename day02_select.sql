/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.
-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/
CREATE TABLE meslek_lisesi (
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);
SELECT * FROM meslek_lisesi;
INSERT INTO meslek_lisesi VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');

-- Q1 : Derecesi 90'dan yuksek olan ogrencilerin tum bilgilerini getirin.

select * 
from  meslek_lisesi
where derece>90;
-- Q2 : Derecesi 80'dan kucuk olan ogrencilerin sadece isimlerini getirin.

select isim
from meslek_lisesi
where derece<80;

-- Q3 : Adresi ankara olan ogrencilerin isim ve derece bilgilerini listeleyin

select isim,derece
from meslek_lisesi
where adres='Ankara';

-- Q4 : okul nosu 1005 olan ogrencinin isim ve adres bilgilsini listeleyin

select isim,adres
from meslek_lisesi
where okul_no ='1005';

-- Q5 derecesi 70 ve 80 arasi olan ogrencilerin okul no ve adresini listeleyi
 select okul_no,adres
 from meslek_lisesi
 where derece>70 and derece<80;
 
 
 CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);
INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);
SELECT * FROM ogretmen_lisesi;

-- Q1 sinav notu 80 den buyuk olan ogrencilerin tum bilgilerini listeleyin

select *
from ogretmen_lisesi
where sinav_notu>80;

-- Q2 adresi ankara olan ogrencilerin isim ve adres bilgilerini listeleyin

select isim,adres
from ogretmen_lisesi
where adres='Ankara';

-- Q3 id si 114 olan ogrencilerin tum bilgilerini listeleyin

select *
from ogretmen_lisesi
where id=114;

/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 OR deger2;
=========================================================================================*/
/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/

-- Q4 sinav notu 70 ten buyuk 80 den kucuk olan ogrencilerin tum bilgilerini listeleyin

select *
from ogretmen_lisesi
where sinav_notu
between 70 and 80;

-- Q5 muhammet talha ve murat arasinda olan ogrencilerin isimlerini listeleyin

select isim
from ogretmen_lisesi
where isim
between 'Muhammet Talha ' and 'Murat';

-- NOT : String ifadeleri BetWEEN komutu ile kiyaslamak istedigimizde bize 
-- sonucu ASCII degerlerine gore siralayarak gonderir.

-- Q6 Ankara ile corum arasinda olan ogrencilerin isimlerini listeleyin

select isim,adres
from ogretmen_lisesi
where adres
between 'Ankara' and 'Corum';



CREATE TABLE personel(
id CHAR(5),
isim VARCHAR(50),
maas INT
);
INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000);
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);
SELECT * FROM personel;

-- Q7 idsi 10005 ile 10009 arasinda olan personlein bilgilerini listeleyin
 select *
 from personel
 where id
 between '10005' and '10009';
 -- Q8 Ismi mehmet yilmaz ile veli olan personel bilgilerini listeleyuin
 
 select *
 from personel
 where isim
 between 'Mehmet Yilmaz' and 'Veli';
 -- Q9 ismi ahmet ile ayse cano arasinda olan personel bilgilerini listeleyin\

select *
from personel
where isim
between 'Ahmet' and 'Ayse Cano';

-- Q10 maasi 7000 yada ismi ayse olan personel id lerini listeleyin

select id
from personel
where maas=7000 or isim= 'Ayse';

-- Q11 id si 10001, 10005 yada 10008 olan personel isimlerini list

select isim
from personel
where id=10001 or id =100005 or id =10008;


/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/



-- Q12 id si 10001, 10005 yada 10008 olan personel isimlerini list

select isim
from personel
where id
in('10001','10005','10008');

-- Q13 maasi sadece 7000 veya 12000 p;an personel bilgilerini list

select *
from personel
where maas
in(7000,12000);

/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
/*-------------------------------------------------------------------------
Q14: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE 'a%';
/*-------------------------------------------------------------------------
Q15: Isminde Ayse olan personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '%ayse%';
/*-------------------------------------------------------------------------
Q16: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '%n';

/*-------------------------------------------------------------------------
Q17: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '_e%';
/*-------------------------------------------------------------------------
Q18: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE '_e%' AND isim LIKE '%y%';
/*-------------------------------------------------------------------------
Q19: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim NOT LIKE '%a%';
/*-------------------------------------------------------------------------
Q20: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE maas LIKE '_____';
/*-------------------------------------------------------------------------
Q21: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/
SELECT *
FROM personel
WHERE isim LIKE 'a____a%';








 
