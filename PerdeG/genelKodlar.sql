

-- TABLOLARI OLUÞTURMA

-- Müþteriler tablosu oluþturma
CREATE TABLE Musteriler (
    MusteriID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    IletisimBilgileri NVARCHAR(255)
);
-- Þubeler tablosu oluþturma
CREATE TABLE Subeler (
    SubeID INT PRIMARY KEY IDENTITY(1,1),
    Adres NVARCHAR(255) NOT NULL
);


-- Çalýþanlar tablosu oluþturma
CREATE TABLE Calisanlar (
    CalisanID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    SubeID INT NOT NULL,       -- Çalýþan ile þube arasýndaki iliþki
    FOREIGN KEY (SubeID) REFERENCES Subeler(SubeID)
);



-- Sipariþler tablosu oluþturma
CREATE TABLE Siparisler (
    SiparisID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT NOT NULL,
    SiparisTarihi DATE NOT NULL,
    Durum NVARCHAR(50),
    SubeID INT NOT NULL,       -- Þube ile iliþki
    CalisanID INT,             -- Çalýþan ile iliþki
    FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID),
    FOREIGN KEY (SubeID) REFERENCES Subeler(SubeID),
    FOREIGN KEY (CalisanID) REFERENCES Calisanlar(CalisanID)
);

-- Ödemeler tablosu oluþturma
CREATE TABLE Odemeler (
    OdemeID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    OdemeTuru NVARCHAR(50),
    OdemeTarihi DATE,
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID)
);

-- Kategoriler tablosu oluþturma
CREATE TABLE Kategoriler (
    KategoriID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL
);

-- Ürünler tablosu oluþturma
CREATE TABLE Urunler (
    UrunID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    Fiyat DECIMAL(10, 2) NOT NULL,
    Stok INT NOT NULL,
    KategoriID INT NOT NULL,
    FOREIGN KEY (KategoriID) REFERENCES Kategoriler(KategoriID)
);

-- Tedarikçiler tablosu oluþturma
CREATE TABLE Tedarikciler (
    TedarikciID INT PRIMARY KEY IDENTITY(1,1),
    Ad NVARCHAR(50) NOT NULL,
    IletisimBilgileri NVARCHAR(255)
);

--  Ürünler ve Tedarikçiler için ara tablo oluþturma
CREATE TABLE UrunTedarikciler (
    UrunID INT NOT NULL,
    TedarikciID INT NOT NULL,
    PRIMARY KEY (UrunID, TedarikciID),
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID),
    FOREIGN KEY (TedarikciID) REFERENCES Tedarikciler(TedarikciID)
);

-- Sipariþ Detaylarý tablosu oluþturma
CREATE TABLE SiparisDetay (
    SiparisDetayID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    UrunID INT NOT NULL,
    Miktar INT NOT NULL,
    FOREIGN KEY (SiparisID) REFERENCES Siparisler(SiparisID),
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);


-- Þube-Ürün Stok Takibi için ara tablo oluþturma
CREATE TABLE SubeUrunStok (
    SubeID INT NOT NULL,
    UrunID INT NOT NULL,
    Stok INT NOT NULL,
    PRIMARY KEY (SubeID, UrunID),
    FOREIGN KEY (SubeID) REFERENCES Subeler(SubeID),
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);
-- MusteriLog Tablosunu Oluþturma

CREATE TABLE MusteriLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    MusteriID INT,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    IslemTarihi DATETIME

);

--SiparisDurumLog Tablosunu Oluþturma
CREATE TABLE SiparisDurumLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    SiparisID INT NOT NULL,
    EskiDurum NVARCHAR(50),
    YeniDurum NVARCHAR(50),
    GuncellenmeTarihi DATETIME
);



CREATE TABLE StokHareketleri (
    HareketID INT PRIMARY KEY IDENTITY(1,1),
    UrunID INT NOT NULL,
    EskiStok INT,
    YeniStok INT,
    HareketTarihi DATETIME,
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);
CREATE TABLE StokUyari (
    UyariID INT PRIMARY KEY IDENTITY(1,1),
    UrunID INT NOT NULL,
    Stok INT,
    UyariTarihi DATETIME,
    FOREIGN KEY (UrunID) REFERENCES Urunler(UrunID)
);

CREATE TABLE CalisanLog (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    CalisanID INT,
    Ad NVARCHAR(50),
    Soyad NVARCHAR(50),
    GuncellenmeTarihi DATETIME,
    FOREIGN KEY (CalisanID) REFERENCES Calisanlar(CalisanID)
);





-- TABLOLARA VERÝ EKLEME

--  Musteriler tablosu veri ekleme
INSERT INTO Musteriler (Ad, Soyad, IletisimBilgileri) VALUES
('Ahmet', 'Yilmaz', 'ahmet.yilmaz@example.com'),
('Ayse', 'Demir', 'ayse.demir@example.com'),
('Mehmet', 'Kaya', 'mehmet.kaya@example.com'),
('Fatma', 'Celik', 'fatma.celik@example.com'),
('Ali', 'Can', 'ali.can@example.com'),
('Burcu', 'Dogan', 'burcu.dogan@example.com'),
('Cem', 'Karaca', 'cem.karaca@example.com'),
('Derya', 'Aydin', 'derya.aydin@example.com'),
('Eren', 'Yildirim', 'eren.yildirim@example.com'),
('Selin', 'Orhan', 'selin.orhan@example.com'),
('Tuncay', 'Arslan', 'tuncay.arslan@example.com'),
('Sibel', 'Ekinci', 'sibel.ekinci@example.com'),
('Okan', 'Kurt', 'okan.kurt@example.com'),
('Nazan', 'Guler', 'nazan.guler@example.com'),
('Yusuf', 'Ozkan', 'yusuf.ozkan@example.com'),
('Aylin', 'Bozkurt', 'aylin.bozkurt@example.com'),
('Serkan', 'Aksoy', 'serkan.aksoy@example.com'),
('Betul', 'Yildiz', 'betul.yildiz@example.com'),
('Oguz', 'Turan', 'oguz.turan@example.com');

--  Subeler tablosu veri ekleme
INSERT INTO Subeler (Adres) VALUES
('Istanbul - Kadikoy'),
('Ankara - Cankaya'),
('Izmir - Konak'),
('Bursa - Nilüfer'),
('Antalya - Muratpasa'),
('Eskisehir - Odunpazari'),
('Trabzon - Ortahisar'),
('Adana - Seyhan'),
('Kayseri - Melikgazi'),
('Gaziantep - Sahinbey');

--  Calisanlar tablosu veri ekleme
INSERT INTO Calisanlar (Ad, Soyad, SubeID) VALUES
('Ebru', 'Altun', 1),
('Murat', 'Gul', 1),
('Zeynep', 'Korkmaz', 2),
('Hakan', 'Sahin', 2),
('Selin', 'Tekin', 3),
('Can', 'Ersoy', 4),
('Cansu', 'Acar', 4),
('Merve', 'Aslan', 5),
('Umut', 'Cetin', 5),
('Gizem', 'Kilic', 3),
('Deniz', 'Celik', 6),
('Kerem', 'Yilmaz', 7),
('Melis', 'Duman', 8),
('Furkan', 'Bas', 9),
('Irem', 'Ozkan', 10);

--  Siparisler tablosu veri ekleme
INSERT INTO Siparisler (MusteriID, SiparisTarihi, Durum, SubeID, CalisanID) VALUES
(1, '2025-01-01', 'Hazirlaniyor', 1, 1),
(2, '2025-01-02', 'Tamamlandi', 2, 3),
(3, '2025-01-03', 'Teslim Edildi', 3, 5),
(4, '2025-01-04', 'Hazirlaniyor', 4, 6),
(5, '2025-01-05', 'Tamamlandi', 5, 8),
(6, '2025-01-06', 'Teslim Edildi', 1, 2),
(7, '2025-01-07', 'Hazirlaniyor', 2, 4),
(8, '2025-01-08', 'Tamamlandi', 3, 10),
(9, '2025-01-09', 'Teslim Edildi', 4, 7),
(10, '2025-01-10', 'Hazirlaniyor', 5, 9),
(11, '2025-01-11', 'Tamamlandi', 6, 11),
(12, '2025-01-12', 'Teslim Edildi', 7, 12);

--  Odemeler tablosu veri ekleme
INSERT INTO Odemeler (SiparisID, OdemeTuru, OdemeTarihi) VALUES
(1, 'Kredi Karti', '2025-01-01'),
(2, 'Nakit', '2025-01-02'),
(3, 'Havale', '2025-01-03'),
(4, 'Kredi Karti', '2025-01-04'),
(5, 'Nakit', '2025-01-05'),
(6, 'Havale', '2025-01-06'),
(7, 'Kredi Karti', '2025-01-07'),
(8, 'Nakit', '2025-01-08'),
(9, 'Havale', '2025-01-09'),
(10, 'Kredi Karti', '2025-01-10'),
(11, 'Nakit', '2025-01-11'),
(12, 'Havale', '2025-01-12');

-- Kategoriler tablosu veri ekleme
INSERT INTO Kategoriler (Ad) VALUES
('Perde'),
('Nevresim Takýmý'),
('Yatak Örtüsü'),
('Havlu'),
('Banyo Halýsý'),
('Yastýk'),
('Stor Perde'),
('Tül Perde'),
('Fon Perde');

--  Urunler tablosu veri ekleme
INSERT INTO Urunler (Ad, Fiyat, Stok, KategoriID) VALUES
('Dantel Perde', 500, 100, 1),
('Saten Nevresim', 750, 50, 2),
('Pamuklu Yatak Örtüsü', 900, 40, 3),
('El Havlusu', 50, 300, 4),
('Kaymaz Taban Halý', 450, 20, 5),
('Ortopedik Yastýk', 200, 80, 6),
('Keten Stor Perde', 600, 30, 7),
('Modern Tül Perde', 350, 50, 8),
('Desenli Fon Perde', 800, 25, 9);

--  Tedarikciler tablosu veri ekleme
INSERT INTO Tedarikciler (Ad, IletisimBilgileri) VALUES
('Perdeci Tedarik', 'perdeci.tedarik@example.com'),
('EvTek Tedarik', 'evtek.tedarik@example.com'),
('Tekstil Lojistik', 'tekstil.lojistik@example.com'),
('Mega Ev', 'mega.ev@example.com'),
('Dekor Tedarik', 'dekor.tedarik@example.com'),
('Evim Tedarik', 'evim.tedarik@example.com'),
('Moda Ev Tekstil', 'moda.evtekstil@example.com');

--  UrunTedarikciler tablosu veri ekleme
INSERT INTO UrunTedarikciler (UrunID, TedarikciID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 1),
(8, 2),
(9, 3);

--  SiparisDetay tablosu veri ekleme
INSERT INTO SiparisDetay (SiparisID, UrunID, Miktar) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 1),
(5, 6, 2),
(6, 7, 1),
(7, 8, 3),
(8, 9, 2),
(9, 1, 1),
(10, 2, 2),
(11, 3, 4),
(12, 4, 1);

--  SubeUrunStok tablosu veri ekleme
INSERT INTO SubeUrunStok (SubeID, UrunID, Stok) VALUES
(1, 1, 20),
(1, 2, 30),
(2, 3, 25),
(3, 4, 50),
(4, 5, 15),
(5, 6, 10),
(6, 7, 12),
(7, 8, 20),
(8, 9, 5),
(9, 1, 10),
(10, 2, 15);



-- SORGULAMA KODLARI

-- Belirli bir müþteriyi ismine göre arama 
SELECT * FROM Musteriler WHERE Ad = 'Ahmet';


-- Belirli bir müþteri tarafýndan verilen sipariþleri listeleme
SELECT * FROM Siparisler WHERE MusteriID = 1;


-- Belirli bir fiyattan daha pahalý ürünleri listeleme
SELECT * FROM Urunler WHERE Fiyat > 500;


-- Her bir þubede stokta bulunan ürün miktarýný listeleme
SELECT SubeID, UrunID, Stok FROM SubeUrunStok;


-- Her bir þubede çalýþan çalýþanlarý listeleme
SELECT * FROM Calisanlar WHERE SubeID = 1;


-- Sipariþ detaylarý ile birlikte tüm sipariþleri listeleme
SELECT s.SiparisID, s.MusteriID, s.SiparisTarihi, sd.UrunID, sd.Miktar
FROM Siparisler s
JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID;



-- Her bir müþterinin yaptýðý toplam harcamayý hesaplama
SELECT m.MusteriID, m.Ad, m.Soyad, SUM(u.Fiyat * sd.Miktar) AS ToplamHarcamalar
FROM Musteriler m
JOIN Siparisler s ON m.MusteriID = s.MusteriID
JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
JOIN Urunler u ON sd.UrunID = u.UrunID
GROUP BY m.MusteriID, m.Ad, m.Soyad;


-- En çok satan ürünler
SELECT TOP 5 u.UrunID, u.Ad, SUM(sd.Miktar) AS ToplamSatis
FROM Urunler u
JOIN SiparisDetay sd ON u.UrunID = sd.UrunID
GROUP BY u.UrunID, u.Ad
ORDER BY ToplamSatis DESC;

-- Belirli bir tarih aralýðýndaki toplam satýþlar
SELECT SUM(u.Fiyat * sd.Miktar) AS ToplamSatis
FROM Siparisler s
JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
JOIN Urunler u ON sd.UrunID = u.UrunID
WHERE s.SiparisTarihi BETWEEN '2025-01-01' AND '2025-01-31';

-- Her bir çalýþan tarafýndan gerçekleþtirilen satýþlar
SELECT c.CalisanID, c.Ad, c.Soyad, SUM(u.Fiyat * sd.Miktar) AS ToplamSatis
FROM Calisanlar c
JOIN Siparisler s ON c.CalisanID = s.CalisanID
JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
JOIN Urunler u ON sd.UrunID = u.UrunID
GROUP BY c.CalisanID, c.Ad, c.Soyad;

-- En çok alýþveriþ yapan müþteriler
SELECT TOP 5 m.MusteriID, m.Ad, m.Soyad, SUM(u.Fiyat * sd.Miktar) AS ToplamHarcamalar
FROM Musteriler m
JOIN Siparisler s ON m.MusteriID = s.MusteriID
JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
JOIN Urunler u ON sd.UrunID = u.UrunID
GROUP BY m.MusteriID, m.Ad, m.Soyad
ORDER BY ToplamHarcamalar DESC;




-- STORED PROCEDURS (SAKLI YORDAMLAR)

-- Yeni Müþteri Ekleme
CREATE PROCEDURE spYeniMusteriEkle
    @Ad NVARCHAR(50),
    @Soyad NVARCHAR(50),
    @IletisimBilgileri NVARCHAR(255)
AS
BEGIN
    INSERT INTO Musteriler (Ad, Soyad, IletisimBilgileri)
    VALUES (@Ad, @Soyad, @IletisimBilgileri);
END
 -- saklý yordamý çalýþtýrma
 EXEC spYeniMusteriEkle @Ad = 'Deniz', @Soyad = 'Demir', @IletisimBilgileri = 'deniz.demir@example.com';


--Sipariþ Ekleme
CREATE PROCEDURE spSiparisEkle
    @MusteriID INT,
    @SiparisTarihi DATE,
    @Durum NVARCHAR(50),
    @SubeID INT,
    @CalisanID INT
AS
BEGIN
    INSERT INTO Siparisler (MusteriID, SiparisTarihi, Durum, SubeID, CalisanID)
    VALUES (@MusteriID, @SiparisTarihi, @Durum, @SubeID, @CalisanID);
END
-- saklý yordamý çalýþtýrma
EXEC spSiparisEkle @MusteriID = 1, @SiparisTarihi = '2025-01-15', @Durum = 'Hazirlaniyor', @SubeID = 1, @CalisanID = 1;

--Ürün Satýþlarýný Getirme
CREATE PROCEDURE spUrunSatislari
    @UrunID INT
AS
BEGIN
    SELECT sd.SiparisID, sd.Miktar, sd.UrunID, s.SiparisTarihi
    FROM SiparisDetay sd
    JOIN Siparisler s ON sd.SiparisID = s.SiparisID
    WHERE sd.UrunID = @UrunID;
END
 -- saklý yordamý çalýþtýrma
 EXEC spUrunSatislari @UrunID = 1;


-- Müþteri Detaylý Bilgilerini Getiren Stored Procedure

CREATE PROCEDURE spMusteriDetay
    @MusteriID INT
AS
BEGIN
    -- Müþteri bilgilerini al
    SELECT MusteriID, Ad, Soyad, IletisimBilgileri
    FROM Musteriler
    WHERE MusteriID = @MusteriID;

    -- Müþterinin sipariþlerini al
    SELECT s.SiparisID, s.SiparisTarihi, s.Durum, s.SubeID, s.CalisanID
    FROM Siparisler s
    WHERE s.MusteriID = @MusteriID;

    -- Müþterinin toplam harcamalarýný hesapla
    SELECT SUM(u.Fiyat * sd.Miktar) AS ToplamHarcamalar
    FROM Siparisler s
    JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
    JOIN Urunler u ON sd.UrunID = u.UrunID
    WHERE s.MusteriID = @MusteriID;
END
-- saklý yordamý çalýþtýrma
EXEC spMusteriDetay @MusteriID = 1;


-- Þube Performans Raporu Oluþturan Stored Procedure
CREATE PROCEDURE spSubePerformansRaporu
AS
BEGIN
    SELECT s.SubeID, SUM(u.Fiyat * sd.Miktar) AS ToplamSatisTutari, COUNT(DISTINCT s.SiparisID) AS ToplamSiparisSayisi
    FROM Siparisler s
    JOIN SiparisDetay sd ON s.SiparisID = sd.SiparisID
    JOIN Urunler u ON sd.UrunID = u.UrunID
    GROUP BY s.SubeID
    ORDER BY ToplamSatisTutari DESC;
END
-- saklý yordamý çalýþtýrma
EXEC spSubePerformansRaporu;


-- Ürün Kategorilerine Göre Satýþ Raporu Oluþturan Stored Procedure
CREATE PROCEDURE spKategoriBazliSatisRaporu
AS
BEGIN
    SELECT k.Ad AS KategoriAdi, SUM(u.Fiyat * sd.Miktar) AS ToplamSatisTutari, COUNT(DISTINCT sd.SiparisID) AS ToplamSiparisSayisi
    FROM Urunler u
    JOIN Kategoriler k ON u.KategoriID = k.KategoriID
    JOIN SiparisDetay sd ON u.UrunID = sd.UrunID
    GROUP BY k.Ad
    ORDER BY ToplamSatisTutari DESC;
END
-- saklý yordamý çalýþtýrma
EXEC spKategoriBazliSatisRaporu;




--TRÝGGERS 
-- Stok Güncelleme Trigger
CREATE TRIGGER trgStokGuncelle
ON SiparisDetay
AFTER INSERT
AS
BEGIN
    UPDATE Urunler
    SET Stok = Stok - inserted.Miktar
    FROM Urunler u
    JOIN inserted ON u.UrunID = inserted.UrunID;
END;

-- Sipariþ Durumu Güncelleme Trigger
CREATE TRIGGER trgSiparisTamamlandi
ON Odemeler
AFTER INSERT
AS
BEGIN
    UPDATE Siparisler
    SET Durum = 'Tamamlandi'
    WHERE SiparisID IN (SELECT SiparisID FROM inserted);
END;

-- Müþteri Log Oluþturma Trigger
CREATE TRIGGER trgMusteriLog
ON Musteriler
AFTER INSERT
AS
BEGIN
    INSERT INTO MusteriLog (MusteriID, Ad, Soyad, IslemTarihi)
    SELECT MusteriID, Ad, Soyad, GETDATE()
    FROM inserted;
END;

-- Kritik Stok Seviyesi Uyarý Trigger
CREATE TRIGGER trgStokKritikSeviye
ON Urunler
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Stok < 5)
    BEGIN
        INSERT INTO StokUyari (UrunID, Stok, UyariTarihi)
        SELECT UrunID, Stok, GETDATE()
        FROM inserted
        WHERE Stok < 5;
    END;
END;

-- Çalýþan Güncelleme Log Trigger
CREATE TRIGGER trgCalisanGuncelleLog
ON Calisanlar
AFTER UPDATE
AS
BEGIN
    INSERT INTO CalisanLog (CalisanID, Ad, Soyad, GuncellenmeTarihi)
    SELECT CalisanID, Ad, Soyad, GETDATE()
    FROM inserted;
END;

-- Sipariþ Ödeme Trigger
CREATE TRIGGER trgOdemeEkle
ON Siparisler
AFTER INSERT
AS
BEGIN
    INSERT INTO Odemeler (SiparisID, OdemeTuru, OdemeTarihi)
    SELECT SiparisID, 'Bekleniyor', NULL
    FROM inserted;
END;

-- Ürün Silme Trigger
CREATE TRIGGER trgUrunSil
ON Urunler
AFTER DELETE
AS
BEGIN
    DELETE FROM SiparisDetay WHERE UrunID IN (SELECT UrunID FROM deleted);
    DELETE FROM UrunTedarikciler WHERE UrunID IN (SELECT UrunID FROM deleted);
END;

-- Müþteri Silme Trigger
CREATE TRIGGER trgMusteriSilIliþkiliKayitlarSil
ON Musteriler
AFTER DELETE
AS
BEGIN
    DELETE sd
    FROM SiparisDetay sd
    JOIN Siparisler s ON sd.SiparisID = s.SiparisID
    WHERE s.MusteriID IN (SELECT MusteriID FROM deleted);

    DELETE FROM Odemeler
    WHERE SiparisID IN (SELECT SiparisID FROM Siparisler WHERE MusteriID IN (SELECT MusteriID FROM deleted));

    DELETE FROM Siparisler WHERE MusteriID IN (SELECT MusteriID FROM deleted);
END;

-- Stok Kontrol Trigger
CREATE TRIGGER trgStokKontrol
ON Urunler
AFTER UPDATE
AS
BEGIN
    INSERT INTO StokHareketleri (UrunID, EskiStok, YeniStok, HareketTarihi)
    SELECT d.UrunID, d.Stok, i.Stok, GETDATE()
    FROM deleted d
    JOIN inserted i ON d.UrunID = i.UrunID;

    IF EXISTS (SELECT 1 FROM inserted WHERE Stok < 10)
    BEGIN
        INSERT INTO StokUyari (UrunID, Stok, UyariTarihi)
        SELECT UrunID, Stok, GETDATE()
        FROM inserted
        WHERE Stok < 10;
    END;
END;

-- Sipariþ Durumu ve Log Trigger
CREATE TRIGGER trgSiparisDurumGuncelleLog
ON Siparisler
AFTER UPDATE
AS
BEGIN
    INSERT INTO SiparisDurumLog (SiparisID, EskiDurum, YeniDurum, GuncellenmeTarihi)
    SELECT d.SiparisID, d.Durum, i.Durum, GETDATE()
    FROM deleted d
    JOIN inserted i ON d.SiparisID = i.SiparisID;
END;

-- Sipariþ Stok Güncelleme Trigger
CREATE TRIGGER trgSiparisEkleStokGuncelle
ON SiparisDetay
AFTER INSERT
AS
BEGIN
    UPDATE Urunler
    SET Stok = Stok - i.Miktar
    FROM Urunler u
    JOIN inserted i ON u.UrunID = i.UrunID;
END;








--TRANSACTÝONLAR



-- Sipariþ ve Ödeme Eklemek için Transaction
BEGIN TRANSACTION;

BEGIN TRY
    -- Sipariþ ekleme
    INSERT INTO Siparisler (MusteriID, SiparisTarihi, Durum, SubeID, CalisanID)
    VALUES (1, '2025-01-15', 'Hazirlaniyor', 1, 1);

    -- Eklenen sipariþin ID'sini al
    DECLARE @SiparisID INT;
    SET @SiparisID = SCOPE_IDENTITY();

    -- Ödeme ekleme
    INSERT INTO Odemeler (SiparisID, OdemeTuru, OdemeTarihi)
    VALUES (@SiparisID, 'Kredi Karti', '2025-01-15');

    -- Ýþlemleri onayla
    COMMIT TRANSACTION;
    PRINT 'Sipariþ ve ödeme baþarýyla eklendi.';
END TRY
BEGIN CATCH
    -- Hata durumunda iþlemleri geri al
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluþtu. Ýþlemler geri alýndý.';
    THROW;
END CATCH;




-- Ürün Stoðunu Güncelleme ve Þube Stok Kaydý
BEGIN TRANSACTION;

BEGIN TRY
    -- Ürün stok miktarýný azalt
    UPDATE Urunler
    SET Stok = Stok - 5
    WHERE UrunID = 1;

    -- Þube stok miktarýný azalt
    UPDATE SubeUrunStok
    SET Stok = Stok - 5
    WHERE SubeID = 1 AND UrunID = 1;

    -- Ýþlemleri onayla
    COMMIT TRANSACTION;
    PRINT 'Ürün ve þube stoklarý baþarýyla güncellendi.';
END TRY
BEGIN CATCH
    -- Hata durumunda iþlemleri geri al
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluþtu. Ýþlemler geri alýndý.';
    THROW;
END CATCH;


--Sipariþ Durumu Güncelleme ve Log Kaydý

BEGIN TRANSACTION;

BEGIN TRY
    -- Sipariþ durumunu güncelle
    UPDATE Siparisler
    SET Durum = 'Tamamlandi'
    WHERE SiparisID = 1;

    -- Log kaydý ekle
    INSERT INTO SiparisDurumLog (SiparisID, EskiDurum, YeniDurum, GuncellenmeTarihi)
    VALUES (1, 'Hazirlaniyor', 'Tamamlandi', GETDATE());

    -- Ýþlemleri onayla
    COMMIT TRANSACTION;
    PRINT 'Sipariþ durumu baþarýyla güncellendi ve log kaydý eklendi.';
END TRY
BEGIN CATCH
    -- Hata durumunda iþlemleri geri al
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluþtu. Ýþlemler geri alýndý.';
    THROW;
END CATCH;


-- Stok Transferi (Bir Þubeden Diðerine)
BEGIN TRANSACTION;

BEGIN TRY
    -- Þubeden stok çýkar
    UPDATE SubeUrunStok
    SET Stok = Stok - 10
    WHERE SubeID = 1 AND UrunID = 1;

    -- Diðer þubeye stok ekle
    UPDATE SubeUrunStok
    SET Stok = Stok + 10
    WHERE SubeID = 2 AND UrunID = 1;

    -- Ýþlemleri onayla
    COMMIT TRANSACTION;
    PRINT 'Stok transferi baþarýyla gerçekleþtirildi.';
END TRY
BEGIN CATCH
    -- Hata durumunda iþlemleri geri al
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluþtu. Ýþlemler geri alýndý.';
    THROW;
END CATCH;





--Müþteri ve Ýlgili Sipariþlerin Silinmesi

BEGIN TRANSACTION;

BEGIN TRY
    -- 1. Ödemeleri sil
    DELETE FROM Odemeler
    WHERE SiparisID IN (
        SELECT SiparisID FROM Siparisler WHERE MusteriID = 1
    );

    -- 2. Sipariþ detaylarýný sil
    DELETE FROM SiparisDetay
    WHERE SiparisID IN (
        SELECT SiparisID FROM Siparisler WHERE MusteriID = 1
    );

    -- 3. Sipariþ loglarýný sil
    DELETE FROM SiparisDurumLog
    WHERE SiparisID IN (
        SELECT SiparisID FROM Siparisler WHERE MusteriID = 1
    );

    -- 4. Sipariþleri sil
    DELETE FROM Siparisler
    WHERE MusteriID = 1;

    -- 5. Müþteriyi sil
    DELETE FROM Musteriler
    WHERE MusteriID = 1;

    -- Ýþlemleri onayla
    COMMIT TRANSACTION;
    PRINT 'Müþteri ve iliþkili tüm kayýtlar baþarýyla silindi.';
END TRY

BEGIN CATCH
    -- Hata durumunda iþlemleri geri al
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluþtu. Tüm iþlemler geri alýndý.';
    THROW; -- Hata detaylarýný yeniden fýrlat
END CATCH;






