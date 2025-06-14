# TTNetCase - VPN Uygulaması

Bu uygulama, Flutter kullanılarak geliştirilmiş bir VPN uygulamasıdır. Uygulama içerisinde ülkeleri listeleyerek VPN bağlantısı başlatma, süre sayacı, tema değiştirme gibi temel özellikler bulunmaktadır.

## 🔧 Kullanılan Teknolojiler ve Sürüm

- **Flutter Sürümü:** 3.27.4
- **Mimari Yapı:** MVC (Model-View-Controller)

Küçük ölçekli bir uygulama geliştirdiğim için mimari seçimde sade ve anlaşılır bir yapıya yönelmek istedim. Bu yüzden MVC (Model-View-Controller) mimarisini tercih ettim. Bu yapı sayesinde  kodun düzenini sağlamak  mümkün oldu. Özellikle verilerin yönetimi, arayüzün güncellenmesi ve kullanıcı etkileşimlerinin kontrolü gibi alanları birbirinden ayırmak, kodun hem okunabilirliğini hem de sürdürülebilirliğini  artırdı.

---

## 📦 Kullanılan Paketler ve Nedenleri

| Paket Adı              | Sürüm   | Açıklama |
|------------------------|---------|----------|
| `get`                  | ^4.7.2  | GetX, state management, route management ve dependency injection için kullanıldı. Hafif yapısı ve öğrenme kolaylığı nedeniyle tercih edildi. |
| `shared_preferences`   | ^2.5.3  | Kullanıcının tema tercihi gibi verilerin kalıcı olarak saklanması için kullanıldı. |
| `country_flags`        | ^3.2.0  | Ülke listesinde bayrak görsellerini göstermek için kullanıldı. Hazır API bağlantısı olmadan ülke kodlarına göre bayrakları sunması nedeniyle seçildi. |
| `flutter_svg`          | ^2.1.0  | SVG formatındaki simgelerin gösterimi için kullanıldı. Uygulama içindeki vektörel ikon ihtiyaçlarını karşılamak amacıyla eklendi. |

---

## 🚀 Özellikler

- Ülkeye göre sunucu seçimi
- Ülkeleri arama
- VPN bağlantı durumu göstergesi
- Koyu ve açık tema desteği
- Süre sayacı (bağlantı süresi)
- GetX ile performanslı ve reaktif yönetim
- Shared Preferences ile kalıcı tema ayarı
- Shared Preferences ile kalıcı vip durumu

---

## 📁 Proje Yapısı

lib/
├── controllers/ # GetX controller dosyaları
├── core/ # Tema, constant vb. genel yapı dosyaları
├── models/ # Gerekli veri modelleri
├── views/ # Sayfa ve arayüz bileşenleri
├── main.dart # Giriş noktası
