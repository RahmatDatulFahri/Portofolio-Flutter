# Portfolio — Rahmat Datul Fahri (Flutter Mobile Developer)

Portfolio pribadi bergaya **Swiss Style / International Typographic Style**,
dibangun dengan Flutter Web, berdasarkan data CV dan referensi desain Framer.

## Struktur Project

```
lib/
├── main.dart                  # Entry point, merangkai semua section
├── models/                    # Class/struct data (blueprint, bukan isinya)
│   ├── experience_item.dart
│   ├── mockup_screen.dart
│   ├── feature_item.dart
│   ├── project_item.dart
│   ├── skill_group.dart
│   └── models.dart            # barrel export -- 1 pintu impor semua model
├── data/                      # Isi data aktual (yang perlu kamu EDIT)
│   ├── profile_data.dart      # nama, bio, kontak, menu navigasi
│   ├── experiences_data.dart  # data pengalaman magang
│   ├── skills_data.dart       # data skill (6 kategori)
│   ├── portfolio_data.dart    # facade -- widget lama tetap panggil ini
│   └── projects/
│       ├── app_reporting_system.dart   # 1 file = 1 project
│       ├── e_albaik_store.dart
│       ├── app_jhein.dart
│       ├── tugas_akhir.dart
│       └── projects_data.dart # gabungkan ke 1 List
├── theme/
│   └── app_theme.dart         # Design tokens: warna, font, spacing
├── screens/
│   └── project_detail_page.dart  # Halaman detail per project
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
flutter run -d chrome | flutter run -d web-server --web-port=8080
```

## Cara Update Konten

Data sudah dipecah jadi file-file kecil per topik, supaya gampang dirawat:

| Mau Update Apa?                    | Buka File Ini                                                             |
| ---------------------------------- | ------------------------------------------------------------------------- |
| Progress/durasi 1 project tertentu | `lib/data/projects/nama_project.dart`                                     |
| Tambah project baru                | Buat file baru di `lib/data/projects/`, daftarkan di `projects_data.dart` |
| Nomor telepon / email / bio        | `lib/data/profile_data.dart`                                              |
| Data magang/pengalaman kerja       | `lib/data/experiences_data.dart`                                          |
| Kategori/list skill                | `lib/data/skills_data.dart`                                               |
| Struktur data (nambah field baru)  | File yang sesuai di `lib/models/`                                         |

**Tidak perlu sentuh file widget** (`hero_section.dart`, dst) sama sekali untuk
update konten -- semua widget otomatis membaca dari `PortfolioData.xxx` yang
datanya sekarang berasal dari file-file kecil di atas.

## Cara Menambahkan Foto Profil Asli

1. Simpan foto di `assets/images/profile.jpg`
2. Di `lib/widgets/about_section.dart`, ganti isi `_buildPhotoBox()`
   dari `Container` placeholder menjadi:
   ```dart
   Image.asset('assets/images/profile.jpg', fit: BoxFit.cover)
   ```

## Cara Menambahkan Screenshot Mockup UI di Halaman Detail Project

Setiap project punya galeri mockup UI di halaman detailnya (muncul saat
card project di-klik "LIHAT DETAIL"). Menambahkan screenshot asli **tidak
perlu edit kode UI sama sekali** — cukup 2 langkah:

1. Simpan screenshot di `assets/images/mockups/`, contoh:
   ```
   assets/images/mockups/app_reporting_splash.png
   assets/images/mockups/app_reporting_login.png
   ```
2. Buka `lib/models/portfolio_data.dart`, cari project yang mau diisi,
   lalu isi `imagePath` di dalam `mockups:` (yang tadinya `null`):
   ```dart
   mockups: [
     MockupScreen(label: 'Splash', imagePath: 'assets/images/mockups/app_reporting_splash.png'),
     MockupScreen(label: 'Login', imagePath: 'assets/images/mockups/app_reporting_login.png'),
     MockupScreen(label: 'Home Dashboard', imagePath: null), // masih placeholder
   ],
   ```

Selama `imagePath` masih `null` (atau filenya belum ada di folder), halaman
detail otomatis menampilkan placeholder "MOCKUP BELUM DITAMBAHKAN" — jadi
aman diisi bertahap, tidak akan bikin aplikasi crash.

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
