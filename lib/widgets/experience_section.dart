import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '03/06', title: 'EXPERIENCE'),
          const SizedBox(height: AppSpacing.lg),
          const ThinRule(),
          for (final exp in PortfolioData.experiences)
            _buildExperienceRow(context, exp),
        ],
      ),
    );
  }

  Widget _buildExperienceRow(BuildContext context, ExperienceItem exp) {
    final isMobile = context.isCompact;

    final periodWidget = SizedBox(
      width: isMobile ? double.infinity : 180,
      child: Text(exp.period, style: AppTextStyles.label),
    );

    // detailWidgetContent adalah Column murni tanpa Expanded.
    // Expanded HANYA boleh dipakai saat berada di dalam Row (desktop/tablet),
    // BUKAN di dalam Column mobile yang berada di scroll view vertikal.
    final detailWidgetContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${exp.role} — ${exp.company}',
          style: AppTextStyles.cardTitle,
        ),
        const SizedBox(height: 4),
        Text(exp.location, style: AppTextStyles.bodySecondary),
        const SizedBox(height: AppSpacing.sm),
        ...exp.highlights.map(
          (h) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('•  ', style: AppTextStyles.body),
                Expanded(child: Text(h, style: AppTextStyles.body)),
              ],
            ),
          ),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    periodWidget,
                    const SizedBox(height: AppSpacing.sm),
                    detailWidgetContent,
                  ],
                )
              : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      periodWidget,
                      Expanded(child: detailWidgetContent),
                    ],
                  ),
                ),
          const SizedBox(height: AppSpacing.md),
          const ThinRule(),
        ],
      ),
    );
  }
}
