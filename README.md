# Mini Katalog Uygulaması

![Flutter](https://img.shields.io/badge/Flutter-3.47-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart&logoColor=white)
![Material Design](https://img.shields.io/badge/Material_Design-3.0-757575?logo=materialdesign&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?logo=docker&logoColor=white)
![Android SDK](https://img.shields.io/badge/Android_SDK-35-3DDC84?logo=android&logoColor=white)
![OpenJDK](https://img.shields.io/badge/OpenJDK-17-ED8B00?logo=openjdk&logoColor=white)

Flutter eğitimi kapsamında geliştirilmiş, harici pub bağımlılığı olmadan yalnızca Dart ve Flutter SDK olanaklarıyla hazırlanan örnek bir e-ticaret katalog ve ürün inceleme uygulamasıdır.

Tüm geliştirme, test ve derleme süreçleri **Docker** konteyneri içinde izole olarak gerçekleştirilmiştir. Bilgisayara herhangi bir harici araç veya SDK kurulmamıştır.

---

## 📱 Ekran Görüntüleri

| Ana Sayfa | Ürün Detayı | Sepete Ekleme | 
| :---: | :---: | :---: | 
| <img width="1080" height="2400" alt="Screenshot_1791883981" src="https://github.com/user-attachments/assets/42f9d244-78b4-4e21-9e38-8272fd4e2cf4" /> | <img width="1080" height="2400" alt="Screenshot_1791884002" src="https://github.com/user-attachments/assets/6d25c313-0f09-4385-a887-6456f1ba66d3" /> | <img width="1080" height="2400" alt="Screenshot_1791889577" src="https://github.com/user-attachments/assets/05a7118d-7cfc-454b-abae-1e3959ad7884" />

---

## 🚀 Özellikler

- **Yalnızca Flutter & Dart SDK:** `package:flutter/material.dart`, `dart:io` (`HttpClient`), `dart:convert` (`jsonDecode`). Ekstra pub paketi eklenmemiştir.
- **REST API Entegrasyonu:** `https://wantapi.com/products.php` üzerinden asenkron veri çekme ve `Product` modeline dönüştürme.
- **Banner ve Görsel Yönetimi:** `Image.network` ile `https://wantapi.com/assets/banner.png` ve ürün görsellerinin gösterimi; hata durumunda zarif fallback yönetimi.
- **Canlı Filtreleme & Arama:** `TextField` ile ürün adına göre dinamik arama ve "Ürün bulunamadı" durumu.
- **Detay & Rota Yönetimi:** Named routes (`/`, `/detail`, `/cart`) ve Route Arguments ile veri aktarımı.
- **Sepet Yönetimi (Cart Screen & CartService):** `CartService` (ChangeNotifier) ile merkezi sepet durumu, sepet sayfasında ürün adedi artırma/azaltma, silme, dinamik ara toplam / toplam tutar hesaplama ve sipariş tamamlama akışı.
- **Hata & Yükleme Yönetimi:** `CircularProgressIndicator`, sunucu veya ağ hatasında kullanıcı dostu hata ekranı ve "Tekrar Dene" desteği.

---

## 🛠️ Kullanılan Flutter Sürümü

Konteyner içi `flutter --version` çıktısı:

```
Flutter 3.47.7 • channel stable • https://github.com/flutter/flutter.git
Framework • revision abaf9c5237 (5 days ago) • 2026-10-08 09:51:21 -0700
Engine • hash d8a2d6c768c334d53e16277f837970ffa1e2de81 (revision deb287481e)
Tools • Dart 3.13.5 • DevTools 2.60.0
```

---

## 💻 Çalıştırma Adımları

### 1. Docker ile Geliştirme ve Derleme (Önerilen)

Projeyi bilgisayara Flutter/Android SDK kurmadan doğrudan Docker ile derleyebilirsiniz:

```bash
# Docker imajını oluşturun
docker compose build

# Kod analizi (Linter kontrolü)
docker compose run --rm flutter bash -c "cd mini_katalog && flutter pub get && flutter analyze"

# Testleri çalıştırın
docker compose run --rm flutter bash -c "cd mini_katalog && flutter test"

# Debug APK derleyin
docker compose run --rm flutter bash -c "cd mini_katalog && flutter build apk --debug"
```

Derlenen APK yolu:
`mini_katalog/build/app/outputs/flutter-apk/app-debug.apk`

---

### 2. Yerel Ortamda Çalıştırma

Bilgisayarınızda Flutter kurulu ise:

```bash
git clone <repo-url>
cd mini_katalog
flutter pub get
flutter run
```

---

## 📂 Proje Yapısı

```
mini_katalog/
├── assets/
│   └── images/                     # Yerel banner ve placeholder görselleri
├── lib/
│   ├── main.dart                   # Uygulama başlangıcı, routes & theme
│   ├── models/
│   │   └── product.dart            # Product modeli (fromJson / toJson)
│   ├── services/
│   │   ├── cart_service.dart       # Merkezi sepet durumu (ChangeNotifier)
│   │   └── product_service.dart    # HttpClient ile veri çekme servisi
│   └── screens/
│       ├── cart_screen.dart        # Sepet sayfası (liste, adet yönetimi, sipariş)
│       ├── home_screen.dart        # Ana sayfa (Banner, arama, grid)
│       └── product_detail_screen.dart # Ürün detay ekranı & sepete ekleme
├── test/
│   └── widget_test.dart            # Widget ve unit testleri
├── pubspec.yaml                    # Asset ve proje konfigürasyonu
├── README.md
└── screenshots/                    # Ekran görüntüleri
```
