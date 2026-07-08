import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  final VoidCallback onDownloadCv;

  const HeroSection({
    super.key,
    required this.onViewProjects,
    required this.onDownloadCv,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IndexBadge('01/06'),
          const SizedBox(height: AppSpacing.md),
          Text(PortfolioData.role, style: AppTextStyles.heroTitle(context)),
          const SizedBox(height: AppSpacing.lg),
          // Garis aksen pendek di atas subheading, sesuai referensi desain
          Container(width: 80, height: 3, color: AppColors.accent),
          const SizedBox(height: AppSpacing.md),
          isMobile
              ? _buildMobileBody(context)
              : _buildDesktopBody(context),
        ],
      ),
    );
  }

  Widget _buildDesktopBody(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 420,
                child: Text(PortfolioData.heroSubtitle, style: AppTextStyles.body),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildButtons(),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              PortfolioData.heroTags,
              textAlign: TextAlign.right,
              style: AppTextStyles.label,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(PortfolioData.heroSubtitle, style: AppTextStyles.body),
        const SizedBox(height: AppSpacing.md),
        _buildButtons(),
        const SizedBox(height: AppSpacing.md),
        Text(PortfolioData.heroTags, style: AppTextStyles.label),
      ],
    );
  }

  Widget _buildButtons() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        ElevatedButton(
          onPressed: onViewProjects,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.black,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: 0,
          ),
          child: Text('VIEW PROJECTS', style: AppTextStyles.button.copyWith(color: Colors.white)),
        ),
        OutlinedButton(
          onPressed: onDownloadCv,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.black,
            side: const BorderSide(color: AppColors.black),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: Text('DOWNLOAD CV', style: AppTextStyles.button.copyWith(color: AppColors.black)),
        ),
      ],
    );
  }
}
