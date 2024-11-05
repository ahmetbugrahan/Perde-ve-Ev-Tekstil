# Perde-ve-Ev-Tekstil
1. PERDE VE EV TEKSTİLİ SATIŞ YÖNETİM SİSTEMİ
     1.1 Müşteriler
Ürünleri Görüntüleme: Müşteriler yalnızca mevcut ürünleri ve stok durumunu görüntüleyebilir.
Sipariş Verme: Müşteriler, stokta olan ürünler için sipariş verebilir. Stokta olmayan ürünler için sipariş veremez.
Kendi Sipariş Durumunu Takip Etme: Müşteriler yalnızca kendi sipariş durumlarını (hazırlanıyor, sevkiyat aşamasında vb.) görüntüleyebilirler.
Sınırlı Erişim: Müşteriler, yalnızca okuma ve sipariş oluşturma yetkisine sahiptir, stok veya ürün bilgilerini güncelleme yetkisi yoktur.
1.2 Çalışanlar (Sipariş ve Stok Yöneticileri)
Stok Bilgilerini Görüntüleme ve Güncelleme: Çalışanlar, ürün stok seviyelerini izleyebilir ve güncelleyebilirler (örneğin, yeni ürün ekleme, stok yenileme).
Sipariş Durumunu Güncelleme: Çalışanlar, müşteri siparişlerinin durumunu (onaylandı, sevkiyatta vb.) güncelleyebilir.
Tedarik Sürecini Yönetme: Çalışanlar, ürün tedarikçi bilgilerini güncelleyebilir ve stok seviyesini sağlamak için tedarik süreçlerini yönetebilir.
Tam Yetki: Çalışanlar stok ve sipariş bilgilerine erişim, okuma, güncelleme yetkisine sahiptir, ancak müşteri bilgilerini yalnızca sipariş süreçleriyle ilgili olarak görüntüleyebilirler.
1.3 Yöneticiler
Tüm Verilere Erişim ve Yönetim Yetkisi: Yöneticiler, tüm stok, sipariş, müşteri ve tedarikçi bilgilerini görebilir, ekleyebilir, güncelleyebilir ve silebilir.
Yeni Ürün ve Tedarikçi Ekleme: Yöneticiler, sisteme yeni ürünler veya tedarikçiler ekleyebilir ve ürün kategorilerini güncelleyebilir.
Raporlama: Yöneticiler, stok durumu, tedarik performansı ve sipariş durumu hakkında detaylı raporlar alabilir.
Tam Erişim Yetkisi: Yöneticiler, sistemdeki tüm veriler üzerinde tam erişim, okuma, yazma, güncelleme ve silme yetkisine sahiptir.

2.TABLOLAR VE VARLIKLARIN ÖZELLİKLERİ
Müşteriler
Alanlar:
MüşteriID (PK): Benzersiz müşteri kimliği.
Ad: Müşterinin adı.
Soyad: Müşterinin soyadı.
İletişim Bilgileri: Telefon, e-posta gibi müşteri iletişim bilgileri.
İlişkiler:
Müşteriler - Siparişler: Her müşteri birden fazla sipariş verebilir (1
ilişkisi). Bu ilişki, "MüşteriID" alanı ile "Siparişler" tablosuna bağlanır.
2.2 Siparişler
Alanlar:
SiparişID (PK): Benzersiz sipariş kimliği.
MüşteriID (FK): Siparişi veren müşteri kimliği.
Sipariş Tarihi: Siparişin verildiği tarih.
Durum: Siparişin durumu (Örneğin: Beklemede, Tamamlandı, İptal Edildi).
İlişkiler:
Siparişler - Müşteriler: Her sipariş yalnızca bir müşteri tarafından verilir (N:1 ilişkisi).
Siparişler - Sipariş Detayları: Her sipariş bir veya daha fazla sipariş detayına sahip olabilir (1
ilişkisi).
2.3 Sipariş Detayları
Alanlar:
SiparişDetayID (PK): Benzersiz sipariş detayı kimliği.
SiparişID (FK): Siparişin kimliği.
ÜrünID (FK): Siparişte yer alan ürünün kimliği.
Miktar: Sipariş edilen ürün miktarı.
İlişkiler:
Sipariş Detayları - Siparişler: Her sipariş detayı yalnızca bir siparişe aittir (N:1 ilişkisi).
Sipariş Detayları - Ürünler: Her sipariş detayı yalnızca bir ürün ile ilişkilidir (N:1 ilişkisi).
2.3 Ürünler
Alanlar:
ÜrünID (PK): Benzersiz ürün kimliği.
Ad: Ürün adı.
Fiyat: Ürün fiyatı.
Stok: Ürünün mevcut stok miktarı.
TedarikçiID (FK): Ürünün tedarikçisi.
KategoriID (FK): Ürünün kategorisi.
İlişkiler:
Ürünler - Sipariş Detayları: Her ürün, birden fazla sipariş detayında bulunabilir (1
ilişkisi).
Ürünler - Tedarikçiler: Her ürün yalnızca bir tedarikçiden temin edilir (N:1 ilişkisi).
Ürünler - Kategoriler: Her ürün yalnızca bir kategoriye ait olabilir (N:1 ilişkisi).
Tedarikçiler
Alanlar:
TedarikçiID (PK): Benzersiz tedarikçi kimliği.
Ad: Tedarikçi adı.
İletişim Bilgileri: Tedarikçi iletişim bilgileri (örneğin telefon, e-posta).
İlişkiler:
Tedarikçiler - Ürünler: Her tedarikçi birden fazla ürünü sağlayabilir (1
ilişkisi).
2.5 Kategoriler
Alanlar:
KategoriID (PK): Benzersiz kategori kimliği.
Ad: Kategori adı (örneğin Elektronik, Giyim).
İlişkiler:
Kategoriler - Ürünler: Her kategori birden fazla ürüne sahip olabilir (1
ilişkisi).
2.6 Ödemeler
Alanlar:
ÖdemeID (PK): Benzersiz ödeme kimliği.
SiparişID (FK): Ödeme yapılan sipariş kimliği.
Ödeme Türü: Ödeme türü (örneğin kredi kartı, nakit).
Ödeme Tarihi: Ödeme yapıldığı tarih.
İlişkiler:
Ödemeler - Siparişler: Her ödeme yalnızca bir sipariş ile ilişkilidir (N:1 ilişkisi).
Çalışanlar
Alanlar:
ÇalışanID (PK): Benzersiz çalışan kimliği.
Ad: Çalışan adı.
Soyad: Çalışan soyadı.
ŞubeID (FK): Çalışanın görevli olduğu şube.
İlişkiler:
Çalışanlar - Şubeler: Her çalışan yalnızca bir şubede çalışır, ancak bir şubede birden fazla çalışan olabilir (N:1 ilişkisi).
Şubeler
Alanlar:
ŞubeID (PK): Benzersiz şube kimliği.
Adres: Şubenin adresi.
İlişkiler:
Şubeler - Çalışanlar: Her şubede birden fazla çalışan olabilir (1
ilişkisi).
3. İlişkiler ve Sayısal Kısıtlamalar
Müşteriler → Siparişler:
Her müşteri birden fazla sipariş verebilir ancak her sipariş yalnızca bir müşteriye ait olabilir. Bu ilişki 1
’dir.
Siparişler → Sipariş Detayları:
Her sipariş birden fazla sipariş detayına sahip olabilir (örn. bir siparişte birden fazla ürün olabilir). Her sipariş detayı ise yalnızca bir siparişe bağlıdır. Bu ilişki 1
’dir.
Ürünler → Sipariş Detayları:
Her sipariş detayı bir ürüne bağlıdır (örn. bir ürün için sipariş oluşturulmuş olabilir), ancak bir ürün birden fazla sipariş detayı içerebilir (birden fazla siparişte yer alabilir). Bu ilişki 1
’dir.
Ürünler → Tedarikçiler:
Her ürün yalnızca bir tedarikçi tarafından sağlanır, ancak bir tedarikçi birden fazla ürün sağlayabilir. Bu ilişki 1
’dir.
Ürünler → Kategoriler:
Her ürün yalnızca bir kategoriye ait olabilir, ancak bir kategori birden fazla ürüne sahip olabilir. Bu ilişki 1
’dir.
Siparişler → Ödemeler:
Her sipariş yalnızca bir ödeme kaydı ile ilişkilidir, ancak bir ödeme birden fazla siparişi kapsamaz. Bu ilişki 1:1’dir.
Çalışanlar → Şubeler:
Her çalışan yalnızca bir şubeye atanır, ancak bir şubede birden fazla çalışan olabilir. Bu ilişki 1
’dir.
Bu ilişkiler ve sayısal kısıtlamalar, ürün tedarik ve sipariş süreçlerinin verimli şekilde takip edilmesini sağlar.

