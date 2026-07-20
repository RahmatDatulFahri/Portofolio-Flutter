import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

/// Skills section: menampilkan 6 kategori skill (Mobile Dev, Architecture,
/// Backend & Database, Tools & Workflow, Design & Multimedia, Soft Skill)
/// dalam bentuk card ber-icon dan deskripsi singkat, konsisten dengan gaya
/// Swiss style (bordered box, tipografi tegas, tanpa warna chip-chip).
///
/// Layout grid pakai LayoutBuilder (sama seperti Key Features di halaman
/// detail project) supaya lebar card dihitung dari ruang yang benar-benar
/// tersedia -- bukan angka konstan yang bisa salah di lebar layar
/// menengah, dan bukan Column/Wrap polos yang bisa menyusut lalu ke-center
/// (lihat riwayat panjang perbaikan bug alignment di project_detail_page.dart).
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppSpacing.mobileBreakpoint;
    final isTablet = !isMobile && width < AppSpacing.tabletBreakpoint;
    final columns = isMobile ? 1 : (isTablet ? 2 : 3);

    return SectionWrapper(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(index: '05/06', title: 'SKILLS'),
            const SizedBox(height: AppSpacing.lg),
            const ThinRule(),
            const SizedBox(height: AppSpacing.lg),
            LayoutBuilder(
              builder: (context, constraints) {
                const gap = AppSpacing.md;
                final cardWidth = isMobile
                    ? constraints.maxWidth
                    : (constraints.maxWidth - gap * (columns - 1)) / columns;

                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: PortfolioData.skillGroups.map((group) {
                    return SizedBox(
                      width: cardWidth,
                      child: _skillCard(group),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _skillCard(SkillGroup group) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration:
          BoxDecoration(border: Border.all(color: AppColors.borderLight)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(group.icon, color: AppColors.accent, size: 26),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  '${group.index} — ${group.title}',
                  style: AppTextStyles.cardTitle.copyWith(fontSize: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(group.description, style: AppTextStyles.bodySecondary),
          const SizedBox(height: AppSpacing.md),
          const ThinRule(),
          const SizedBox(height: AppSpacing.sm),
          ...group.items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(item, style: AppTextStyles.body),
            ),
          ),
        ],
      ),
    );
  }
}
