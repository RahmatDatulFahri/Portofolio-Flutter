/// Data profil pribadi: identitas, kontak, navigasi, dan statistik
/// ringkas untuk section About. Cukup edit di sini kalau ada perubahan
/// data diri -- tidak perlu sentuh file lain.
class ProfileData {
  ProfileData._();

  static const String fullName = 'RAHMAT DATUL FAHRI';
  static const String role = 'FLUTTER MOBILE DEVELOPER';
  static const String heroSubtitle =
      'Building cross-platform mobile apps with Clean Architecture & BLoC';
  static const String heroTags =
      'FLUTTER · DART · FIREBASE · REST API · CLEAN ARCHITECTURE';

  static const String aboutBio =
      'Flutter Mobile Developer dengan pengalaman membangun aplikasi mobile '
      'lintas platform. Telah menyelesaikan 2 program magang profesional di '
      'PT. Koding Teknologi Asia (Udacoding) dan COEDEV Technology Malaysia, '
      'mengerjakan project e-commerce, sistem manajemen perusahaan, dan '
      'aplikasi berbasis masjid.';

  static const String email = 'rahmatdatulfahri505@gmail.com';
  static const String phone = '+62 838-5325-7501';
  static const String location = 'Sleman, Yogyakarta';
  static const String github = 'github.com/RahmatDatulFahri';
  static const String githubUrl = 'https://github.com/RahmatDatulFahri';
  static const String linkedin = 'linkedin.com/in/rahmat-datul-fahri-291553293';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/rahmat-datul-fahri-291553293/';

  static const List<String> navItems = [
    'Home',
    'About',
    'Experience',
    'Projects',
    'Skills',
    'Contact',
  ];

  static const List<Map<String, String>> aboutStats = [
    {'value': '2+', 'label': 'MAGANG PROFESIONAL'},
    {'value': '3+', 'label': 'PROJECT NYATA'},
    {'value': '3.37', 'label': 'IPK / 4.00'},
  ];
}
