import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Wrapper standar untuk setiap section: memberi max-width, padding
/// horizontal responsif, dan garis pemisah tipis di bawah (rule line
/// ala Swiss style).
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final bool showBottomDivider;
  final Key? sectionKey;

  const SectionWrapper({
    super.key,
    this.sectionKey,
    required this.child,
    this.showBottomDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < AppSpacing.mobileBreakpoint;
    final horizontalPadding = isMobile ? AppSpacing.md : AppSpacing.xl;
    final verticalPadding = isMobile ? AppSpacing.xl : AppSpacing.xxl;

    return Container(
      key: sectionKey,
      width: double.infinity,
      decoration: showBottomDivider
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderLight, width: 1),
              ),
            )
          : null,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// Badge nomor urut ala Swiss style, misal "01/06".
class IndexBadge extends StatelessWidget {
  final String text;
  const IndexBadge(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.indexLabel);
  }
}

/// Judul section standar (mis. "ABOUT", "PROJECTS") didahului index badge,
/// tersusun rapi dalam grid dua kolom kecil (index di kiri, judul di kanan)
/// mengikuti tata letak Swiss style pada referensi desain.
class SectionHeading extends StatelessWidget {
  final String index;
  final String title;

  const SectionHeading({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isMobile ? 48 : 96,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: IndexBadge(index),
          ),
        ),
        Expanded(
          child: Text(title, style: AppTextStyles.sectionTitle(context)),
        ),
      ],
    );
  }
}

/// Garis horizontal tipis, dipakai sebagai pemisah antar blok konten
/// di dalam satu section.
class ThinRule extends StatelessWidget {
  final Color color;
  const ThinRule({super.key, this.color = AppColors.borderLight});

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: color);
  }
}
