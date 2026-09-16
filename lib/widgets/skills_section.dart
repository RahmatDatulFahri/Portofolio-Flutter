import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
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

  List<List<SkillGroup>> _chunkIntoRows(List<SkillGroup> items, int columns) {
    final rows = <List<SkillGroup>>[];
    for (var i = 0; i < items.length; i += columns) {
      final end = (i + columns > items.length) ? items.length : i + columns;
      rows.add(items.sublist(i, end));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final columns = switch (context.screenTier) {
      ScreenTier.compact => 1,
      ScreenTier.medium => 2,
      ScreenTier.expanded => 3,
    };
    final rows = _chunkIntoRows(PortfolioData.skillGroups, columns);

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
            for (var r = 0; r < rows.length; r++) ...[
              if (r > 0) const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < rows[r].length; i++) ...[
                    if (i > 0) const SizedBox(width: AppSpacing.md),
                    Expanded(child: SkillCard(group: rows[r][i])),
                  ],
                  // Mengisi slot kosong jika jumlah card ganjil di baris terakhir
                  if (rows[r].length < columns)
                    for (var i = 0; i < columns - rows[r].length; i++) ...[
                      const SizedBox(width: AppSpacing.md),
                      const Expanded(child: SizedBox()),
                    ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Card skill interaktif dengan tinggi sejajar (equalized height),
/// chip tag terstruktur ala Swiss design, dan hover state halus.
class SkillCard extends StatefulWidget {
  final SkillGroup group;

  const SkillCard({super.key, required this.group});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final group = widget.group;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        constraints: const BoxConstraints(minHeight: 260),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppColors.cardBackground.withValues(alpha: 0.95)
              : AppColors.cardBackground,
          border: Border.all(
            color: _isHovered
                ? AppColors.accent.withValues(alpha: 0.6)
                : AppColors.borderLight,
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.accent.withValues(alpha: 0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  group.icon,
                  color: _isHovered ? AppColors.accentHover : AppColors.accent,
                  size: 24,
                ),
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
            Text(
              group.description,
              style: AppTextStyles.bodySecondary,
            ),
            const SizedBox(height: AppSpacing.md),
            const ThinRule(),
            const SizedBox(height: AppSpacing.md),
            // Tag chips terstruktur ala Swiss High-Tech style
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: group.items.map((item) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated.withValues(alpha: 0.7),
                    border: Border.all(color: AppColors.borderLight),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    item,
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.white,
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
