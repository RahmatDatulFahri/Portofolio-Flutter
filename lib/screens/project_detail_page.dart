import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/section_wrapper.dart';

/// Halaman detail satu project, dibuka saat card di Projects section
/// diklik. Menampilkan mockup UI, ringkasan, detail implementasi teknis,
/// dan tech stack — mirip pola "case study" di portofolio developer
/// profesional.
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
              // _buildTopBar(context),
              _buildHero(context),
              _buildMockupGallery(context),
              _buildOverviewSection(context),
              _buildImplementationSection(context),
              _buildTechStackSection(context),
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
    );
  }

  // --- HERO: kategori, judul, ringkasan, meta info ---
  Widget _buildHero(BuildContext context) {
    return SectionWrapper(
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
              _metaBlock('DURATION', project.duration),
            ],
          ),
        ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '', title: 'UI MOCKUP'),
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
    );
  }

  /// Frame phone-mockup yang otomatis pintar:
  /// - Kalau [screen.imagePath] sudah diisi DAN file-nya ada -> tampilkan
  ///   gambar asli (cover, sudut membulat mengikuti frame).
  /// - Kalau imagePath null ATAU file belum ditemukan -> fallback ke
  ///   placeholder "MOCKUP BELUM DITAMBAHKAN" secara otomatis (errorBuilder),
  ///   jadi tidak akan crash meski path diisi duluan sebelum filenya ada.
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

  /// Isi placeholder default saat gambar mockup belum tersedia.
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
              color: AppColors.textSecondary.withValues(alpha: 0.4), size: 36),
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

  // --- OVERVIEW (ringkasan konteks, sedikit lebih panjang dari hero) ---
  Widget _buildOverviewSection(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '', title: 'RINGKASAN PROJECT'),
          const SizedBox(height: AppSpacing.lg),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(project.overview, style: AppTextStyles.body),
          ),
        ],
      ),
    );
  }

  // --- IMPLEMENTATION DETAIL (list bernomor, poin teknis) ---
  Widget _buildImplementationSection(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '', title: 'IMPLEMENTASI TEKNIS'),
          const SizedBox(height: AppSpacing.lg),
          const ThinRule(),
          for (var i = 0; i < project.implementationPoints.length; i++)
            _buildImplementationRow(i + 1, project.implementationPoints[i]),
        ],
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

  // --- TECH STACK (chip tags) ---
  Widget _buildTechStackSection(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '', title: 'TECH STACK'),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: project.techStackDetailed
                .map((tech) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration:
                          Border.all(color: AppColors.black).toBoxDecoration(),
                      child: Text(
                        tech.toUpperCase(),
                        style: AppTextStyles.button
                            .copyWith(color: AppColors.black),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  // --- FOOTER CTA: kembali + lihat GitHub ---
  Widget _buildFooterCta(BuildContext context) {
    return SectionWrapper(
      showBottomDivider: false,
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: [
          ElevatedButton(
            onPressed: () => _openUrl(project.githubUrl),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: Colors.white,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            child: Text('BACK TO PROJECTS',
                style: AppTextStyles.button.copyWith(color: AppColors.black)),
          ),
        ],
      ),
    );
  }
}

/// Extension kecil supaya Border bisa langsung dipakai sebagai
/// BoxDecoration tanpa menulis ulang BoxDecoration(border: ...) tiap kali.
extension _BorderToDecoration on Border {
  BoxDecoration toBoxDecoration() => BoxDecoration(border: this);
}
