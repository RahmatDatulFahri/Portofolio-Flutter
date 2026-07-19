import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
import '../screens/project_detail_page.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

/// Grid project ala Swiss style.
///
/// RIWAYAT PERBAIKAN (penting untuk konteks jika ada overflow lagi nanti):
/// 1. Versi awal pakai GridView + childAspectRatio TETAP -> overflow kalau
///    ada judul/tech-stack yang lebih panjang dari card lain.
/// 2. Versi kedua pakai IntrinsicHeight + Row + Expanded supaya card dalam
///    satu baris stretch ke tinggi yang sama -> TERNYATA masih overflow,
///    karena kalkulasi intrinsic height Flutter untuk Text yang WRAPPING
///    (melipat ke baris baru) di dalam Row/Expanded memang tidak selalu
///    akurat (keterbatasan/quirk RenderIntrinsicHeight bawaan Flutter).
/// 3. Versi ini (final): TIDAK memaksa tinggi sama rata sama sekali.
///    Setiap card membiarkan tingginya mengikuti konten asli (natural
///    height, top-aligned). Konsekuensinya: kalau salah satu card di
///    baris yang sama lebih pendek, border bawahnya bisa tidak sejajar
///    persis dengan card sebelahnya (selisih beberapa pixel). Ini
///    trade-off yang jauh lebih aman daripada risiko overflow, dan masih
///    terlihat rapi & profesional karena grid border tiap card tetap utuh.
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
                for (final rowItems in rows) _buildRow(context, rowItems, columns),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<List<ProjectItem>> _chunkIntoRows(List<ProjectItem> items, int columns) {
    final rows = <List<ProjectItem>>[];
    for (var i = 0; i < items.length; i += columns) {
      final end = (i + columns > items.length) ? items.length : i + columns;
      rows.add(items.sublist(i, end));
    }
    return rows;
  }

  /// Row TANPA IntrinsicHeight/stretch. crossAxisAlignment.start memastikan
  /// semua card rata atas (top-aligned), dan masing-masing bebas punya
  /// tinggi sesuai kontennya sendiri -> tidak ada mekanisme yang bisa
  /// "salah hitung" dan menyebabkan overflow.
  Widget _buildRow(BuildContext context, List<ProjectItem> rowItems, int columns) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final project in rowItems) Expanded(child: _buildProjectCard(context, project)),
        // Baris terakhir dengan jumlah project ganjil di layout 2 kolom:
        // isi slot kosong supaya card tidak melebar penuh 2 kolom.
        if (rowItems.length < columns)
          for (var i = 0; i < columns - rowItems.length; i++) const Expanded(child: SizedBox()),
      ],
    );
  }

  void _openDetail(BuildContext context, ProjectItem project) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ProjectDetailPage(project: project)),
    );
  }

  /// Catatan desain: card ini sengaja TIDAK dibuat "tap di mana saja untuk
  /// buka detail", karena di dalamnya ada 2 aksi berbeda (Lihat Detail vs
  /// View on GitHub). Menaruh InkWell besar di seluruh card + InkWell kecil
  /// di dalam untuk link GitHub berisiko ambigu (tap di area link bisa
  /// memicu kedua aksi sekaligus akibat cara Flutter menangani gesture
  /// bersarang). Solusi paling aman & jelas secara UX: dua link terpisah
  /// yang eksplisit, masing-masing dengan area tap sendiri.
  Widget _buildProjectCard(BuildContext context, ProjectItem project) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppColors.borderLight),
          bottom: BorderSide(color: AppColors.borderLight),
        ),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        // mainAxisSize.min: tinggi Column mengikuti total konten di
        // dalamnya, TIDAK dipaksa mengisi tinggi tertentu. Ini kunci
        // utama kenapa versi ini tidak akan overflow.
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.index, style: AppTextStyles.indexLabel),
          const SizedBox(height: AppSpacing.sm),
          Text(project.title, style: AppTextStyles.cardTitle),
          const SizedBox(height: 6),
          Text(project.techStack, style: AppTextStyles.label),
          const SizedBox(height: AppSpacing.md),
          InkWell(
            onTap: () => _openDetail(context, project),
            hoverColor: Colors.transparent,
            child: Text(
              'LIHAT DETAIL →',
              style: AppTextStyles.button.copyWith(
                color: AppColors.accent,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.accent,
              ),
            ),
          ),
          const SizedBox(height: 8),
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
          // Spacer visual di akhir supaya card pendek tetap punya
          // sedikit "napas" bawah, konsisten dengan padding atas.
          const SizedBox(height: AppSpacing.xs),
        ],
      ),
    );
  }
}
