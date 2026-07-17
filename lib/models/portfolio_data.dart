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

/// Satu layar dalam galeri mockup UI project.
///
/// [imagePath] bersifat OPSIONAL. Kalau null (belum diisi), halaman detail
/// akan otomatis menampilkan placeholder "MOCKUP BELUM DITAMBAHKAN". Begitu
/// kamu punya screenshot asli, cukup isi path-nya di sini -- tidak perlu
/// ubah kode UI sama sekali.
///
/// Cara pakai:
/// 1. Taruh file gambar di assets/images/mockups/nama_file.png
/// 2. Isi imagePath: 'assets/images/mockups/nama_file.png'
class MockupScreen {
  final String label;
  final String? imagePath;

  const MockupScreen({required this.label, this.imagePath});
}

/// Model untuk satu project. Dipakai baik untuk card ringkas di grid
/// Projects section, maupun untuk halaman detail lengkap saat card diklik.
class ProjectItem {
  final String index; // "P/01"
  final String title;
  final String
      techStack; // ringkasan singkat untuk card grid, mis. "FLUTTER · BLOC · DIO"
  final String githubUrl;

  // Field tambahan khusus untuk halaman detail:
  final String category; // mis. "Company Management System"
  final String overview; // ringkasan konteks project (2-3 kalimat)
  final String role; // mis. "Mobile Developer · Magang"
  final String duration; // mis. "6 bulan (Feb–Agu 2024) · Batam, Onsite"
  final List<String> techStackDetailed; // list terpisah untuk chip tags
  final List<String> implementationPoints; // detail teknis apa yang dikerjakan
  final List<MockupScreen> mockups; // galeri layar + path gambar (opsional)

  const ProjectItem({
    required this.index,
    required this.title,
    required this.techStack,
    required this.githubUrl,
    required this.category,
    required this.overview,
    required this.role,
    required this.duration,
    required this.techStackDetailed,
    required this.implementationPoints,
    required this.mockups,
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
      category: 'Company Management System',
      overview: 'Aplikasi reporting internal untuk PT. Koding Teknologi Asia '
          '(Udacoding), mencakup absensi digital, laporan kinerja, dan '
          'manajemen izin karyawan dalam satu platform terintegrasi.',
      role: 'Mobile Developer · Magang',
      duration: '6 bulan (Feb–Agu 2024) · Batam, Onsite',
      techStackDetailed: [
        'Flutter',
        'Dart',
        'BLoC',
        'Clean Architecture',
        'Dio',
        'REST API',
        'Bearer Token Auth',
      ],
      implementationPoints: [
        'Menerapkan Clean Architecture dengan BLoC sebagai state management, memisahkan logika bisnis dari UI agar kode modular dan mudah dikembangkan.',
        'Merancang routing & navigasi antar halaman (dashboard, absensi, laporan, penggajian) menggunakan Navigator agar alur aplikasi tetap terstruktur.',
        'Mengimplementasikan form input dan validasi data dengan memperhatikan null safety dan async/await untuk mencegah crash.',
        'Mengintegrasikan REST API menggunakan Dio, termasuk penanganan error, loading state, dan autentikasi Bearer Token.',
        'Berkolaborasi lewat pull request dan code review, termasuk melakukan resolve conflict secara mandiri sesuai arahan senior developer.',
      ],
      mockups: [
        MockupScreen(label: 'Splash', imagePath: null),
        MockupScreen(label: 'Login', imagePath: null),
        MockupScreen(label: 'Home Dashboard', imagePath: null),
        MockupScreen(label: 'Laporan', imagePath: null),
      ],
    ),
    ProjectItem(
      index: 'P/02',
      title: 'E-AlBaik Store',
      techStack: 'FLUTTER · FIGMA-TO-CODE · E-COMMERCE',
      githubUrl: githubUrl,
      category: 'E-Commerce Application',
      overview: 'Aplikasi e-commerce dengan fitur Wishlist dan My Order, '
          'dikembangkan berdasarkan desain UI/UX tim Figma perusahaan.',
      role: 'Mobile Developer · Magang',
      duration: 'PT. Koding Teknologi Asia · Batam, Onsite',
      techStackDetailed: [
        'Flutter',
        'Figma-to-Code',
        'Custom Widgets',
        'Coding Standard',
      ],
      implementationPoints: [
        'Mengembangkan tampilan dan komponen UI menggunakan Flutter widgets, mengacu pada desain Figma tim UI/UX.',
        'Membangun fitur Wishlist dan My Order sesuai spesifikasi desain yang ditentukan.',
        'Menerapkan coding standard dan struktur folder project (TextWidget, TextStyleUtils, SizingUtil) sesuai panduan senior developer.',
        'Melakukan push kode berkala ke GitHub dan berkolaborasi lewat pull request & code review, termasuk menangani resolve conflict.',
      ],
      mockups: [
        MockupScreen(label: 'Home', imagePath: null),
        MockupScreen(label: 'Product Detail', imagePath: null),
        MockupScreen(label: 'Wishlist', imagePath: null),
      ],
    ),
    ProjectItem(
      index: 'P/03',
      title: 'App JHEIN',
      techStack: 'FLUTTER · REST API · MOSQUE INFO SYSTEM',
      githubUrl: githubUrl,
      category: 'Mosque Information System',
      overview: 'Aplikasi informasi berbasis masjid untuk COEDEV Technology, '
          'mencakup jadwal sholat, info masjid, dan donasi — dikembangkan '
          'penuh dari desain UI/UX menjadi aplikasi Flutter yang responsif.',
      role: 'Mobile Developer · Magang',
      duration: '2 bulan (Mei–Jun 2024) · Malaysia, Remote',
      techStackDetailed: [
        'Flutter',
        'REST API',
        'Responsive Design',
        'Figma to Flutter',
      ],
      implementationPoints: [
        'Bertanggung jawab penuh membangun seluruh tampilan, fitur, dan navigasi aplikasi dari desain UI/UX menjadi aplikasi Flutter yang responsif.',
        'Menguji aplikasi secara berkala untuk memastikan tampilan responsif di berbagai ukuran layar HP, serta memperbaiki bug yang ditemukan.',
        'Berkoordinasi dengan tim Backend untuk menentukan data dan endpoint API yang dibutuhkan sesuai kebutuhan fitur.',
        'Mengintegrasikan REST API untuk menyinkronkan data antara web dan aplikasi mobile, memastikan informasi (jadwal sholat, info masjid, donasi) tetap konsisten.',
      ],
      mockups: [
        MockupScreen(label: 'Home', imagePath: null),
        MockupScreen(label: 'Jadwal Sholat', imagePath: null),
        MockupScreen(label: 'Donasi', imagePath: null),
      ],
    ),
    ProjectItem(
      index: 'P/04',
      title: 'Sistem Informasi App Reporting',
      techStack: 'FLUTTER · FIREBASE · FIRESTORE · BLOC — TUGAS AKHIR D3',
      githubUrl: githubUrl,
      category: 'Tugas Akhir D3 — Politeknik Negeri Padang',
      overview: 'Aplikasi mobile reporting sebagai tugas akhir, mencakup fitur '
          'absensi digital, laporan kinerja, dan manajemen izin dengan '
          'penyimpanan data real-time.',
      role: 'Pengembang Individu (Tugas Akhir)',
      duration: '2024 · Politeknik Negeri Padang',
      techStackDetailed: [
        'Flutter',
        'Firebase Auth',
        'Firestore',
        'BLoC',
        'Clean Architecture',
      ],
      implementationPoints: [
        'Merancang dan mengembangkan aplikasi mobile reporting menggunakan Flutter, mencakup fitur absensi digital, laporan kinerja, dan manajemen izin.',
        'Menggunakan Firebase Authentication untuk sistem login dan Firestore untuk penyimpanan data laporan secara real-time.',
        'Menerapkan arsitektur Clean Architecture dengan BLoC sebagai layer presentasi, menghasilkan kode yang terstruktur dan mudah diuji.',
      ],
      mockups: [
        MockupScreen(label: 'Login', imagePath: null),
        MockupScreen(label: 'Dashboard', imagePath: null),
        MockupScreen(label: 'Laporan Kinerja', imagePath: null),
      ],
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
