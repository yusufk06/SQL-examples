SELECT * FROM sys.fen_lisesi;

use sys;


-- Yorum satiri
-- bu da 2. yorum satiri
/*
yorum
paragrafi
ornegi
*/
USE sys;
/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.
CREATE TABLE ogrenciler1(
id CHAR(4),
isim VARCHAR(25),
not_ortalamasi DOUBLE,
adres VARCHAR(100),
son_degistirme_tarihi DATE
);
DROP TABLE ogrenciler1;
SELECT * FROM ogrenciler1;
/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/
CREATE TABLE tedarikciler(
tedarikci_id CHAR(4),
tedarikci_ismi VARCHAR(25),
tedarikci_adres VARCHAR(100),
ulasim_tarihi DATE
);
/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.
CREATE TABLE ogrenci_derece
AS
SELECT isim, not_ortalamasi
FROM ogrenciler1; 
SELECT * FROM ogrenci_derece;
/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/
CREATE TABLE tedarikciler_son
AS
SELECT tedarikci_ismi, ulasim_tarihi
FROM tedarikciler;
SELECT * FROM tedarikciler_son;

/*========================================
               VERI GIRISI
========================================*/
-- INSERT INTO + tablo adi + VALUES + (std_id CHAR(4),std_name VARCHAR(25),std_age int)
-- Degerleri girerken dikkat edilmesi gereken Tabloyu 
-- olustururken degerleri atadigimiz veri cinsinden olmasi
-- String ifadeleri tek tirnak icinde yaziyoruz.
-- Date data tipi de String gibi tek tirnak icine yazilir,
-- ayrica MySQL 'in default tarih formati YYYY-MM-DD seklindedir.
/*******************************************************
-> Bir field'a kaydedilecek verileri UNIQUE yapmak icin 
 table olustururken field isminin yanina UNIQUE yaziyoruz.
-> Bir field'a kaydedilecek verilerde null olmasin istiyorsak 
table olustururken field isminin yanina NOT NULL yaziyoruz.
*********************************************************/
-- Fen Lisesi ogrencilerinin okul no , isim , derece, adres ve 
-- son degisiklik tarihi field'lari olan tablosunu hazirlayalim.
-- okul no field'i UNIQUE olmali, isim field'i da bos birakilmasin.
USE sys;
CREATE TABLE fen_lisesi(
okul_no INT UNIQUE,
isim VARCHAR(25) NOT NULL,
derece DOUBLE,
adres VARCHAR(50),
son_degisiklik_tarihi DATE
);
SELECT * FROM fen_lisesi;
INSERT INTO fen_lisesi VALUES (101, 'Mehmet Dag', 4.5, 'Ankara','2023-01-20');
INSERT INTO fen_lisesi VALUES (102, 'Berrin Hanim', 4.6, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (103, 'Mehmet Erden', 3.9, 'Izmir','2023-01-19');
INSERT INTO fen_lisesi VALUES (104, 'Sinan Bey', 4.7, 'Istanbul','2023-01-20');
INSERT INTO fen_lisesi VALUES (105, 'Esra Turker', 4.9, 'Ankara','2023-01-18');
INSERT INTO fen_lisesi VALUES (106, 'Gulhayat Guder', 4.3, 'Izmir','2023-01-18');
INSERT INTO fen_lisesi VALUES (107, 'Berivan Gencdal', 4.3, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (108, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi (isim,adres) VALUES ('Abdullah Ak','Istanbul');
INSERT INTO fen_lisesi (okul_no,isim,adres) VALUES (109,'Yucel Bey','Istanbul');
INSERT INTO fen_lisesi (isim,adres,okul_no) VALUES ('Yucel Bey','Istanbul',110);
-- UNIQUE olarak belirledigimiz bir field'a istedigimiz kadar NULL deger kaydedebiliriz
-- ancak data tipi String ise hiclik ifadesini sadece 1 kere kaydeder, 
-- diger kayitlarda duplicate hatasi verir.
/* ----------------------------------------------
Q1 : okul_no , isim , adres, derece fieldlari olan 
anadolu lisesi table olusturun. okul_no CHAR ve UNIQUE, 
isim NOT NULL olacak
------------------------------------------------- */
CREATE TABLE anadolu_lisesi(
okul_no VARCHAR(4) UNIQUE,
isim VARCHAR(25) NOT NULL,
adres VARCHAR(10),
derece DOUBLE
);
SELECT * FROM anadolu_lisesi;
DROP TABLE anadolu_lisesi;
INSERT INTO fen_lisesi VALUES (101, 'Mehmet Dag', 4.5, 'Ankara','2023-01-20');
INSERT INTO fen_lisesi VALUES (102, 'Berrin Hanim', 4.6, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (103, 'Mehmet Erden', 3.9, 'Izmir','2023-01-19');
INSERT INTO fen_lisesi VALUES (104, 'Sinan Bey', 4.7, 'Istanbul','2023-01-20');
INSERT INTO fen_lisesi VALUES (105, 'Esra Turker', 4.9, 'Ankara','2023-01-18');
INSERT INTO fen_lisesi VALUES (106, 'Gulhayat Guder', 4.3, 'Izmir','2023-01-18');
INSERT INTO fen_lisesi VALUES (107, 'Berivan Gencdal', 4.3, 'Istanbul','2023-01-18');
INSERT INTO fen_lisesi VALUES (108, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi VALUES (null, 'Berivan Gencdal', null, null,null);
INSERT INTO fen_lisesi (isim,adres) VALUES ('Abdullah Ak','Istanbul');
INSERT INTO fen_lisesi (okul_no,isim,adres) VALUES (109,'Yucel Bey','Istanbul');
INSERT INTO fen_lisesi (isim,adres,okul_no) VALUES ('Yucel Bey','Istanbul',110);

CREATE TABLE anadolu_lisesi(
okul_no VARCHAR(4) UNIQUE,
isim VARCHAR(25) NOT NULL,
adres VARCHAR(10),
derece DOUBLE
);
SELECT * FROM anadolu_lisesi;
DROP TABLE anadolu_lisesi;
INSERT INTO anadolu_lisesi VALUES ('1001','Ayse Nuriye','Istanbul',4.7);
INSERT INTO anadolu_lisesi VALUES ('1002','Zafer Bey','Ankara',4.6);
INSERT INTO anadolu_lisesi VALUES ('1003','Furkan Veli Inal','Istanbul',3.9);
INSERT INTO anadolu_lisesi VALUES ('1004','Humeyra Uysal','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('1005','Mehmet Harun','Istanbul',3.8);
INSERT INTO anadolu_lisesi VALUES ('','Berivan Gencdal','Izmir',4.8);
INSERT INTO anadolu_lisesi VALUES ('','Ilyas Bey','Istanbul',3.8);
INSERT INTO anadolu_lisesi VALUES ('1006','Neo Bey','Istanbul',3.8);

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
SELECT *
FROM meslek_lisesi
WHERE derece>90;
-- Q2 : Derecesi 80'den kucuk olan ogrencilerin isimlerini listeleyin.
SELECT isim
FROM meslek_lisesi
WHERE derece<80;

-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.

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
SELECT *
FROM meslek_lisesi
WHERE derece>90;
-- Q2 : Derecesi 80'den kucuk olan ogrencilerin isimlerini listeleyin.
SELECT isim
FROM meslek_lisesi
WHERE derece<80;
-- Q3 : Adresi Ankara olan ogrencilerin isim ve derece bilgilerini listeleyin.
SELECT isim, derece
FROM meslek_lisesi
WHERE adres='Ankara';