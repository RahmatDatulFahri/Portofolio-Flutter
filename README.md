# Portfolio — Rahmat Datul Fahri (Flutter Mobile Developer)

Portfolio pribadi bergaya **Swiss Style / International Typographic Style**,
dibangun dengan Flutter Web, berdasarkan data CV dan referensi desain Framer.

## Struktur Project

```
lib/
├── main.dart                  # Entry point, merangkai semua section
├── models/
│   └── portfolio_data.dart    # Semua data CV (edit di sini jika ada update)
├── theme/
│   └── app_theme.dart         # Design tokens: warna, font, spacing
└── widgets/
    ├── navbar.dart
    ├── hero_section.dart
    ├── about_section.dart
    ├── experience_section.dart
    ├── projects_section.dart
    ├── skills_section.dart
    ├── contact_section.dart
    ├── footer.dart
    └── section_wrapper.dart   # Widget helper (SectionWrapper, ThinRule, dll)
```

## Cara Menjalankan di Lokal

Pastikan Flutter SDK sudah terinstal (`flutter --version`), lalu:

```bash
flutter pub get
flutter run -d chrome
```

## Cara Update Konten

Semua data CV (nama, pengalaman, project, skill, kontak) ada di satu file:
`lib/models/portfolio_data.dart`. Cukup edit teks di sana, tidak perlu
menyentuh file widget.

## Cara Menambahkan Foto Profil Asli

1. Simpan foto di `assets/images/profile.jpg`
2. Di `lib/widgets/about_section.dart`, ganti isi `_buildPhotoBox()`
   dari `Container` placeholder menjadi:
   ```dart
   Image.asset('assets/images/profile.jpg', fit: BoxFit.cover)
   ```

## Cara Build untuk Production

```bash
flutter build web --release --base-href "/NAMA_REPO_KAMU/"
```

Ganti `NAMA_REPO_KAMU` dengan nama repository GitHub kamu persis.

## Deploy ke GitHub Pages (Otomatis)

Repo ini sudah dilengkapi `.github/workflows/deploy.yml` yang otomatis:
1. Build project setiap ada push ke branch `main`
2. Deploy hasil build ke branch `gh-pages`

**Langkah setup:**
1. Buat repository baru di GitHub, beri nama misalnya `portfolio-flutter`
2. **Edit `--base-href` di `.github/workflows/deploy.yml`** agar sesuai nama repo kamu
3. Push seluruh project ini ke branch `main`:
   ```bash
   git init
   git add .
   git commit -m "Initial commit: Flutter portfolio"
   git branch -M main
   git remote add origin https://github.com/RahmatDatulFahri/portfolio-flutter.git
   git push -u origin main
   ```
4. Di GitHub: **Settings → Pages → Source → pilih branch `gh-pages`, folder `/ (root)`**
5. Tunggu 1-2 menit, situs akan live di:
   `https://rahmatdatulfahri.github.io/portfolio-flutter/`

## Menghubungkan Form Kontak (Opsional)

Karena GitHub Pages adalah static hosting (tanpa backend), form kontak di
`contact_section.dart` saat ini memakai fallback `mailto:` (membuka aplikasi
email). Kalau ingin form benar-benar terkirim tanpa membuka email client,
hubungkan ke layanan seperti [Formspree](https://formspree.io) atau
[EmailJS](https://www.emailjs.com/) (keduanya gratis untuk penggunaan dasar).
