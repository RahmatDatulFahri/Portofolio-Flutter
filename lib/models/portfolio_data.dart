/// Model untuk satu entri pengalaman kerja (magang).
class ExperienceItem {
  final String period;
  final String role;
  final String company;
  final String location;
  final List<String> highlights;

  const ExperienceItem({
    required this.period,
    required this.role,
    required this.company,
    required this.location,
    required this.highlights,
  });
}

/// Model untuk satu project di grid Projects.
class ProjectItem {
  final String index; // "P/01"
  final String title;
  final String techStack;
  final String githubUrl;

  const ProjectItem({
    required this.index,
    required this.title,
    required this.techStack,
    required this.githubUrl,
  });
}

/// Model untuk satu grup skill (Mobile Dev, Architecture, Tools, dst).
class SkillGroup {
  final String index;
  final String title;
  final List<String> items;

  const SkillGroup({
    required this.index,
    required this.title,
    required this.items,
  });
}

/// Semua data portofolio diambil dari CV Rahmat Datul Fahri.
/// Cukup ubah di sini kalau ada update CV, tidak perlu sentuh widget.
class PortfolioData {
  PortfolioData._();

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
  static const String linkedin =
      'linkedin.com/in/rahmat-datul-fahri-291553293';
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

  static const List<ExperienceItem> experiences = [
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

  static const List<ProjectItem> projects = [
    ProjectItem(
      index: 'P/01',
      title: 'App Reporting System',
      techStack: 'FLUTTER · BLOC · DIO · CLEAN ARCHITECTURE',
      githubUrl: githubUrl,
    ),
    ProjectItem(
      index: 'P/02',
      title: 'E-AlBaik Store',
      techStack: 'FLUTTER · FIGMA-TO-CODE · E-COMMERCE',
      githubUrl: githubUrl,
    ),
    ProjectItem(
      index: 'P/03',
      title: 'App JHEIN',
      techStack: 'FLUTTER · REST API · MOSQUE INFO SYSTEM',
      githubUrl: githubUrl,
    ),
    ProjectItem(
      index: 'P/04',
      title: 'Sistem Informasi App Reporting',
      techStack: 'FLUTTER · FIREBASE · FIRESTORE · BLOC — TUGAS AKHIR D3',
      githubUrl: githubUrl,
    ),
  ];

  static const List<SkillGroup> skillGroups = [
    SkillGroup(
      index: '01',
      title: 'Mobile Dev',
      items: [
        'Flutter',
        'Dart',
        'BLoC',
        'Provider',
        'REST API (Dio)',
        'Firebase',
        'SQLite',
      ],
    ),
    SkillGroup(
      index: '02',
      title: 'Architecture',
      items: ['Clean Architecture', 'MVVM', 'Repository Pattern'],
    ),
    SkillGroup(
      index: '03',
      title: 'Tools',
      items: ['Git', 'Figma', 'Postman', 'Android Studio'],
    ),
  ];
}
