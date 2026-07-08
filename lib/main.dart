import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/portfolio_data.dart';
import 'theme/app_theme.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/about_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/contact_section.dart';
import 'widgets/footer.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rahmat Datul Fahri — Flutter Mobile Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  // Key untuk setiap section, dipakai untuk scroll-to-section saat nav diklik.
  final _homeKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _contactKey = GlobalKey();

  late final List<GlobalKey> _sectionKeys;

  @override
  void initState() {
    super.initState();
    _sectionKeys = [
      _homeKey,
      _aboutKey,
      _experienceKey,
      _projectsKey,
      _skillsKey,
      _contactKey,
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _downloadCv() async {
    // Ganti URL ini dengan link CV kamu (bisa file di assets, atau link
    // Google Drive/GitHub raw jika dihosting terpisah).
    final uri = Uri.parse(PortfolioData.githubUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Navbar(onNavTap: _scrollToSection),
            const Divider(height: 1, color: AppColors.borderLight),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(
                      key: _homeKey,
                      onViewProjects: () => _scrollToSection(3),
                      onDownloadCv: _downloadCv,
                    ),
                    AboutSection(key: _aboutKey),
                    ExperienceSection(key: _experienceKey),
                    ProjectsSection(key: _projectsKey),
                    SkillsSection(key: _skillsKey),
                    ContactSection(key: _contactKey),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
