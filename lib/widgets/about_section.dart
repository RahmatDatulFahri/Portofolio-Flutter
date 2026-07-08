import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '02/06', title: 'ABOUT'),
          const SizedBox(height: AppSpacing.lg),
          isMobile ? _buildMobileContent(context) : _buildDesktopContent(context),
        ],
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPhotoBox(context),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(PortfolioData.aboutBio, style: AppTextStyles.body),
              const SizedBox(height: AppSpacing.lg),
              const ThinRule(),
              const SizedBox(height: AppSpacing.md),
              _buildStatsRow(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPhotoBox(context),
        const SizedBox(height: AppSpacing.md),
        Text(PortfolioData.aboutBio, style: AppTextStyles.body),
        const SizedBox(height: AppSpacing.lg),
        const ThinRule(),
        const SizedBox(height: AppSpacing.md),
        _buildStatsRow(),
      ],
    );
  }

  /// Kotak foto profil placeholder. Ganti Container ini dengan
  /// Image.asset('assets/images/profile.jpg') begitu foto asli tersedia.
  Widget _buildPhotoBox(BuildContext context) {
    return Container(
      width: 220,
      height: 260,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.borderLight),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Text('PROFILE PHOTO', style: AppTextStyles.label),
          Positioned(
            bottom: 0,
            left: 0,
            child: Text(
              'RF',
              style: AppTextStyles.sectionTitle(context).copyWith(
                    fontSize: 48,
                    color: AppColors.accent,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: List.generate(PortfolioData.aboutStats.length, (i) {
        final stat = PortfolioData.aboutStats[i];
        final isLast = i == PortfolioData.aboutStats.length - 1;
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            margin: EdgeInsets.only(right: isLast ? 0 : AppSpacing.md),
            decoration: BoxDecoration(
              border: Border(
                right: isLast
                    ? BorderSide.none
                    : const BorderSide(color: AppColors.borderLight),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stat['value']!, style: AppTextStyles.statNumber),
                const SizedBox(height: 4),
                Text(stat['label']!, style: AppTextStyles.label),
              ],
            ),
          ),
        );
      }),
    );
  }
}
