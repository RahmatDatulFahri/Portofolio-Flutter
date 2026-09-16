import '../models/models.dart';

/// Data pengalaman magang/kerja. Tambah entri baru di sini kalau ada
/// pengalaman kerja baru -- tidak perlu sentuh file widget manapun.
class ExperiencesData {
  ExperiencesData._();

  static const List<ExperienceItem> all = [
    ExperienceItem(
      period: 'FEB–AGU 2024 · 6 BULAN',
      role: 'Mobile Developer · Magang',
      company: 'PT. Koding Teknologi Asia (Udacoding)',
      location: 'Batam, Onsite',
      highlights: [
        'Menerapkan Clean Architecture untuk struktur project Flutter yang terukur.',
        'Menggunakan BLoC untuk state management dan pemisahan logic UI.',
        'Integrasi REST API dengan Dio dan autentikasi Bearer Token.',
        'Mengembangkan UI E-AlBaik Store (fitur Wishlist & My Order) sesuai desain Figma.',
      ],
    ),
    ExperienceItem(
      period: 'MEI–JUN 2024 · 2 BULAN',
      role: 'Mobile Developer · Magang',
      company: 'COEDEV Technology',
      location: 'Malaysia, Remote',
      highlights: [
        'Mengembangkan App JHEIN untuk sistem informasi berbasis masjid.',
        'Bertanggung jawab penuh pada implementasi UI dan navigasi aplikasi.',
        'Integrasi REST API untuk sinkronisasi jadwal sholat, info masjid, dan donasi.',
      ],
    ),
  ];
}
