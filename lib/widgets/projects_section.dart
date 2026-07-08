import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

/// Grid project ala Swiss style.
///
/// CATATAN PENTING: Versi sebelumnya pakai GridView dengan
/// `childAspectRatio` tetap, yang memaksa semua card punya rasio
/// lebar:tinggi yang sama. Masalahnya, panjang judul & tech stack tiap
/// project berbeda-beda (mis. "Sistem Informasi App Reporting" 2 baris,
/// vs "App JHEIN" 1 baris) sehingga tinggi konten aktual tidak selalu
/// muat di tinggi yang "dipaksa" oleh aspect ratio tersebut -> overflow.
///
/// Solusinya di sini: bangun grid manual per baris menggunakan
/// [IntrinsicHeight] + [Row] + [Expanded]. Dengan pendekatan ini, setiap
/// baris otomatis mengambil tinggi dari card TERTINGGI di baris itu, dan
/// semua card di baris yang sama ikut "stretch" mengikuti tinggi
/// tersebut. Hasilnya: grid tetap rapi rata (garis border antar card
/// tetap sejajar), tapi tidak pernah overflow berapa pun panjang teks
/// di dalamnya.
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    final columns = isMobile ? 1 : 2;

    final rows = _chunkIntoRows(PortfolioData.projects, columns);

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '04/06', title: 'PROJECTS'),
          const SizedBox(height: AppSpacing.lg),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderLight),
                left: BorderSide(color: AppColors.borderLight),
              ),
            ),
            child: Column(
              children: [
                for (final rowItems in rows) _buildRow(rowItems, columns),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Membagi list project jadi kelompok-kelompok sesuai jumlah kolom,
  /// misal [P1,P2,P3,P4] dengan columns=2 -> [[P1,P2],[P3,P4]].
  List<List<ProjectItem>> _chunkIntoRows(List<ProjectItem> items, int columns) {
    final rows = <List<ProjectItem>>[];
    for (var i = 0; i < items.length; i += columns) {
      final end = (i + columns > items.length) ? items.length : i + columns;
      rows.add(items.sublist(i, end));
    }
    return rows;
  }

  Widget _buildRow(List<ProjectItem> rowItems, int columns) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final project in rowItems) Expanded(child: _buildProjectCard(project)),
          // Kalau jumlah project ganjil di layout 2 kolom, baris terakhir
          // hanya berisi 1 card - isi sisa slot dengan ruang kosong supaya
          // card tidak melebar penuh 2 kolom dan grid tetap simetris.
          if (rowItems.length < columns)
            for (var i = 0; i < columns - rowItems.length; i++) const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _buildProjectCard(ProjectItem project) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.borderLight),
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(project.index, style: AppTextStyles.indexLabel),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(project.title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 6),
                Text(project.techStack, style: AppTextStyles.label),
              ],
            ),
          ),
          InkWell(
            onTap: () => _openUrl(project.githubUrl),
            hoverColor: Colors.transparent,
            child: Text(
              'VIEW ON GITHUB →',
              style: AppTextStyles.button.copyWith(
                color: AppColors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
