# Perde-ve-Ev-Tekstil
# Perde ve Ev Tekstili Satış Yönetim Sistemi

Bu proje, bir perde ve ev tekstili satış mağazası için geliştirilen yönetim sistemi olup müşteri, çalışan ve yöneticilere farklı yetkiler tanımlayan bir sistem sunmaktadır.

## Özellikler

### Müşteriler
- Ürünleri görüntüleyebilir, stok durumunu inceleyebilir.
- Sipariş verebilir ve sipariş durumunu takip edebilir.

### Çalışanlar
- Stok ve sipariş durumlarını güncelleyebilir, tedarik süreçlerini yönetebilir.

### Yöneticiler
- Tüm veriler üzerinde tam yetkiye sahiptir. Ürün, tedarikçi ve kategori yönetimi ile detaylı raporlama yapabilir.

## Veri Tabanı Tasarımı

### Tablo Yapısı
1. **Müşteriler**: Müşteri bilgilerini içerir.
2. **Siparişler**: Müşteri siparişlerini takip eder.
3. **Ürünler**: Ürün bilgilerini ve stok seviyesini içerir.
4. **Tedarikçiler**: Ürün tedarikçileri hakkında bilgi sağlar.
5. **Kategoriler**: Ürün kategorilerini içerir.
6. **Ödemeler**: Sipariş ödemelerini kayıt eder.
7. **Çalışanlar** ve **Şubeler**: Çalışan bilgileri ve çalışma şubelerini içerir.

## İlişkiler ve Kısıtlamalar

Tablolar arasındaki ilişkiler ve sayısal kısıtlamalar:
- Her müşteri birden fazla sipariş verebilir (1:N).
- Her ürün yalnızca bir tedarikçi tarafından sağlanır (N:1).

...


