import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_wrapper.dart';

/// Halaman detail satu project, dibuka saat card di Projects section
/// diklik. Menampilkan mockup UI, ringkasan, detail implementasi teknis,
/// dan tech stack — mirip pola "case study" di portofolio developer
/// profesional.
///
/// CATATAN PENTING soal pola "SizedBox(width: double.infinity)" yang
/// berulang di file ini: SectionWrapper membungkus child dengan Center().
/// Kalau child (biasanya Column) tidak dipaksa selebar area section, ia
/// akan menyusut mengikuti lebar konten terlebarnya lalu ikut di-tengah-
/// kan oleh Center tersebut -- menyebabkan section terlihat tidak sejajar
/// dengan section lain. SizedBox(width: double.infinity) memaksa Column
/// selalu selebar area yang tersedia, sehingga CrossAxisAlignment.start
/// benar-benar menempel di tepi kiri sesungguhnya.
class ProjectDetailPage extends StatelessWidget {
  final ProjectItem project;

  const ProjectDetailPage({super.key, required this.project});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(context),
              _buildHero(context),
              _buildProblemSolutionSection(context),
              _buildMockupGallery(context),
              _buildKeyFeaturesSection(context),
              _buildImplementationSection(context),
              _buildTechStackSection(context),
              _buildTeamSection(context),
              _buildRelatedProjectsSection(context),
              _buildFooterCta(context),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  // --- TOP BAR: tombol kembali ---
  Widget _buildTopBar(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.borderLight)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.md : AppSpacing.xl,
              vertical: AppSpacing.sm,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  hoverColor: Colors.transparent,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_back,
                          size: 18, color: AppColors.black),
                      const SizedBox(width: 8),
                      Text('BACK TO PROJECTS', style: AppTextStyles.navLink),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- HERO: kategori, judul, ringkasan, meta info ---
  Widget _buildHero(BuildContext context) {
    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IndexBadge('${project.index} — ${project.category.toUpperCase()}'),
            const SizedBox(height: AppSpacing.md),
            Text(project.title.toUpperCase(),
                style: AppTextStyles.heroTitle(context)),
            const SizedBox(height: AppSpacing.md),
            Container(width: 80, height: 3, color: AppColors.accent),
            const SizedBox(height: AppSpacing.md),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(project.overview, style: AppTextStyles.body),
            ),
            const SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.lg,
              runSpacing: AppSpacing.sm,
              children: [
                _metaBlock('ROLE', project.role),
                _metaBlock('COMPANY', project.company),
                _metaBlock('DURATION', project.duration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _metaBlock(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: AppTextStyles.label),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.body),
      ],
    );
  }

  // --- MOCKUP GALLERY ---
  Widget _buildMockupGallery(BuildContext context) {
    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('UI MOCKUP', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 340,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: project.mockups.length,
                separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.md),
                itemBuilder: (context, i) =>
                    _buildMockupPlaceholder(project.mockups[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMockupPlaceholder(MockupScreen screen) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 180,
          height: 300,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.borderLight, width: 2),
          ),
          child: screen.imagePath != null
              ? Image.asset(
                  screen.imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _emptyMockupContent(),
                )
              : _emptyMockupContent(),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(screen.label.toUpperCase(), style: AppTextStyles.label),
      ],
    );
  }

  Widget _emptyMockupContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Spacer(),
          Icon(Icons.smartphone,
              color: AppColors.textSecondary.withOpacity(0.4), size: 36),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'MOCKUP\nBELUM DITAMBAHKAN',
            textAlign: TextAlign.center,
            style: AppTextStyles.label.copyWith(fontSize: 9),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  // --- PROBLEM & SOLUTION ---
  Widget _buildProblemSolutionSection(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PROBLEM & SOLUTION', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            isMobile
                ? Column(
                    // FIX PROAKTIF: crossAxisAlignment.start wajib di sini.
                    // Sebelumnya (default center) hanya "kebetulan" terlihat
                    // benar karena teks problem/solution cukup panjang untuk
                    // wrap ke lebar penuh. Kalau suatu saat teksnya diringkas
                    // jadi pendek, bug yang sama seperti Related Projects
                    // bisa muncul di sini juga.
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: _problemSolutionCard(
                            'PROBLEM', project.problem, AppColors.accent),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      SizedBox(
                        width: double.infinity,
                        child: _problemSolutionCard(
                            'SOLUTION', project.solution, AppColors.black),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: _problemSolutionCard(
                              'PROBLEM', project.problem, AppColors.accent)),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                          child: _problemSolutionCard(
                              'SOLUTION', project.solution, AppColors.black)),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _problemSolutionCard(String label, String text, Color accentColor) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: accentColor, width: 3),
          top: const BorderSide(color: AppColors.borderLight),
          right: const BorderSide(color: AppColors.borderLight),
          bottom: const BorderSide(color: AppColors.borderLight),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: AppTextStyles.label.copyWith(color: accentColor)),
          const SizedBox(height: AppSpacing.sm),
          Text(text, style: AppTextStyles.body),
        ],
      ),
    );
  }

  // --- KEY FEATURES ---
  Widget _buildKeyFeaturesSection(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    final columns = isMobile ? 1 : 2;

    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('KEY FEATURES', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                final halfWidth =
                    (constraints.maxWidth - AppSpacing.md) / columns;
                final features = project.keyFeatures;
                final isOddLastItem =
                    !isMobile && columns == 2 && features.length.isOdd;

                return Wrap(
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.md,
                  children: List.generate(features.length, (i) {
                    final feature = features[i];
                    final isLastLoneItem =
                        isOddLastItem && i == features.length - 1;
                    final cardWidth = isMobile
                        ? constraints.maxWidth
                        : (isLastLoneItem ? constraints.maxWidth : halfWidth);
                    return SizedBox(
                      width: cardWidth,
                      child: _featureCard(feature),
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureCard(FeatureItem feature) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.borderLight)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(feature.icon, color: AppColors.accent, size: 28),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(feature.title,
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 17)),
                const SizedBox(height: 4),
                Text(feature.description, style: AppTextStyles.bodySecondary),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- TEAM ---
  Widget _buildTeamSection(BuildContext context) {
    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TIM & KOLABORASI', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.groups_outlined,
                    color: AppColors.accent, size: 28),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                    child: Text(project.teamNote, style: AppTextStyles.body)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- RELATED PROJECTS (FIX UTAMA YANG DIMINTA) ---
  Widget _buildRelatedProjectsSection(BuildContext context) {
    final related = PortfolioData.projects
        .where((p) => p.index != project.index)
        .take(2)
        .toList();
    if (related.isEmpty) return const SizedBox.shrink();

    final isMobile =
        MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;

    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('RELATED PROJECTS', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            isMobile
                ? Column(
                    // FIX UTAMA: crossAxisAlignment.start. Sebelumnya
                    // Column ini default-nya center, sehingga card "App
                    // Reporting System" (lebih lebar) dan card "E-AlBaik
                    // Store" (lebih sempit) ke-center masing-masing secara
                    // independen -- card kedua terlihat bergeser ke kanan
                    // dibanding card pertama.
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: related
                        .map((p) => Padding(
                              padding:
                                  const EdgeInsets.only(bottom: AppSpacing.md),
                              // SizedBox(width: double.infinity): supaya
                              // SETIAP card juga sama lebar satu sama lain,
                              // bukan cuma rata kiri tapi beda lebar.
                              child: SizedBox(
                                width: double.infinity,
                                child: _relatedProjectCard(context, p),
                              ),
                            ))
                        .toList())
                : Row(
                    children: [
                      for (var i = 0; i < related.length; i++) ...[
                        if (i > 0) const SizedBox(width: AppSpacing.md),
                        Expanded(
                            child: _relatedProjectCard(context, related[i])),
                      ],
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _relatedProjectCard(BuildContext context, ProjectItem relatedProject) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (_) => ProjectDetailPage(project: relatedProject)),
        );
      },
      hoverColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.borderLight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(relatedProject.index, style: AppTextStyles.indexLabel),
            const SizedBox(height: 8),
            Text(relatedProject.title,
                style: AppTextStyles.cardTitle.copyWith(fontSize: 18)),
            const SizedBox(height: 4),
            Text(relatedProject.category, style: AppTextStyles.bodySecondary),
            const SizedBox(height: AppSpacing.sm),
            Text('LIHAT PROJECT →',
                style: AppTextStyles.button.copyWith(color: AppColors.accent)),
          ],
        ),
      ),
    );
  }

  // --- IMPLEMENTATION DETAIL ---
  Widget _buildImplementationSection(BuildContext context) {
    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IMPLEMENTASI TEKNIS', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            const ThinRule(),
            for (var i = 0; i < project.implementationPoints.length; i++)
              _buildImplementationRow(i + 1, project.implementationPoints[i]),
          ],
        ),
      ),
    );
  }

  Widget _buildImplementationRow(int number, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  number.toString().padLeft(2, '0'),
                  style: AppTextStyles.indexLabel,
                ),
              ),
              Expanded(child: Text(text, style: AppTextStyles.body)),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          const ThinRule(),
        ],
      ),
    );
  }

  // --- TECH STACK (FIX UTAMA YANG DIMINTA) ---
  Widget _buildTechStackSection(BuildContext context) {
    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TECH STACK', style: AppTextStyles.sectionTitle(context)),
            const SizedBox(height: AppSpacing.lg),
            // Align(centerLeft): chip tetap auto-width mengikuti teksnya
            // masing-masing (pola "tag" yang benar), tapi seluruh baris
            // Wrap dipastikan menempel di kiri -- tidak ke-center kalau
            // total lebar chip lebih sempit dari lebar section.
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: project.techStackDetailed
                    .map((tech) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: Border.all(color: AppColors.black)
                              .toBoxDecoration(),
                          child: Text(
                            tech.toUpperCase(),
                            style: AppTextStyles.button
                                .copyWith(color: AppColors.black),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- FOOTER CTA ---
  Widget _buildFooterCta(BuildContext context) {
    return SectionWrapper(
      showBottomDivider: false,
      child: SizedBox(
        width: double.infinity,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              ElevatedButton(
                onPressed: () => _openUrl(project.githubUrl),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  elevation: 0,
                ),
                child: Text('VIEW ON GITHUB',
                    style: AppTextStyles.button.copyWith(color: Colors.white)),
              ),
              OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.black,
                  side: const BorderSide(color: AppColors.black),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: Text('BACK TO PROJECTS',
                    style:
                        AppTextStyles.button.copyWith(color: AppColors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension _BorderToDecoration on Border {
  BoxDecoration toBoxDecoration() => BoxDecoration(border: this);
}
