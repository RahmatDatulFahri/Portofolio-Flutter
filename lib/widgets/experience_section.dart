import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  bool _isMobile(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < AppSpacing.mobileBreakpoint;
  }

  bool _isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppSpacing.mobileBreakpoint && width < AppSpacing.tabletBreakpoint;
  }


  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '03/06', title: 'EXPERIENCE'),
          const SizedBox(height: AppSpacing.lg),
          const ThinRule(),
          for (final exp in PortfolioData.experiences) _buildExperienceBlock(context, exp),
        ],
      ),
    );
  }

  Widget _buildExperienceBlock(BuildContext context, ExperienceItem exp) {
    final isMobile = _isMobile(context);
    final isTablet = _isTablet(context);

    // Lebar kolom periode dibuat adaptif: mobile full-width,
    // tablet lebih sempit dari desktop supaya highlight tidak terlalu rapat.
    final periodWidth = isMobile
        ? null
        : (isTablet ? 220.0 : 260.0);

    final periodWidget = Text(
      exp.period,
      style: AppTextStyles.label,
      softWrap: true,
      overflow: TextOverflow.visible,
    );

    final detailWidget = _ExperienceDetail(exp: exp);

    final headerRow = isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              periodWidget,
              const SizedBox(height: AppSpacing.sm),
              detailWidget,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: periodWidth,
                child: periodWidget,
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(child: detailWidget),
            ],
          );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headerRow,
          const SizedBox(height: AppSpacing.md),
          const ThinRule(),
        ],
      ),
    );
  }
}

class _ExperienceDetail extends StatelessWidget {
  final ExperienceItem exp;

  const _ExperienceDetail({required this.exp});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${exp.role} — ${exp.company}',
          style: AppTextStyles.cardTitle,
        ),
        const SizedBox(height: 4),
        Text(exp.location, style: AppTextStyles.bodySecondary),
        const SizedBox(height: AppSpacing.sm),
        ...exp.highlights.map((h) => _HighlightBullet(text: h)),
      ],
    );
  }
}

class _HighlightBullet extends StatelessWidget {
  final String text;

  const _HighlightBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    // Bullet dengan indent stabil: karakter bullet fixed, teks pakai Expanded
    // agar wrap-nya sejajar (mengurangi efek "gantung" yang tidak rapi).
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16, child: Text('•', style: AppTextStyles.body)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

