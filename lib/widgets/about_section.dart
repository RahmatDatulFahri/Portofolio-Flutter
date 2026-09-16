import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isCompact = context.isCompact;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '02/06', title: 'ABOUT'),
          const SizedBox(height: AppSpacing.lg),
          isCompact
              ? _buildMobileContent(context)
              : _buildDesktopContent(context),
        ],
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    final isMedium = context.isMedium;
    final photoWidth = isMedium ? 180.0 : 220.0;
    final photoHeight = isMedium ? 220.0 : 260.0;
    final gap = isMedium ? AppSpacing.md : AppSpacing.lg;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPhotoBox(context, width: photoWidth, height: photoHeight),
        SizedBox(width: gap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 680),
                child: Text(PortfolioData.aboutBio, style: AppTextStyles.body),
              ),
              const SizedBox(height: AppSpacing.lg),
              const ThinRule(),
              const SizedBox(height: AppSpacing.md),
              _buildStatsRow(context),
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
        _buildPhotoBox(context, width: 180, height: 220),
        const SizedBox(height: AppSpacing.md),
        Text(PortfolioData.aboutBio, style: AppTextStyles.body),
        const SizedBox(height: AppSpacing.lg),
        const ThinRule(),
        const SizedBox(height: AppSpacing.md),
        _buildStatsRow(context),
      ],
    );
  }

  /// Kotak foto profil placeholder. Ganti Container ini dengan
  /// Image.asset('assets/images/profile.jpg') begitu foto asli tersedia.
  Widget _buildPhotoBox(
    BuildContext context, {
    double width = 220,
    double height = 260,
  }) {
    return Container(
      width: width,
      height: height,
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

  Widget _buildStatsRow(BuildContext context) {
    // Pada layar ultra-kecil (< 380px), tata statistik dalam Wrap agar tidak berdesakan.
    final isVerySmall = context.screenWidth < 380;
    if (isVerySmall) {
      return Wrap(
        spacing: AppSpacing.md,
        runSpacing: AppSpacing.md,
        children: PortfolioData.aboutStats.map((stat) {
          return SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(stat['value']!, style: AppTextStyles.statNumber),
                ),
                const SizedBox(height: 4),
                Text(stat['label']!, style: AppTextStyles.label),
              ],
            ),
          );
        }).toList(),
      );
    }

    return Row(
      children: List.generate(PortfolioData.aboutStats.length, (i) {
        final stat = PortfolioData.aboutStats[i];
        final isLast = i == PortfolioData.aboutStats.length - 1;
        return Expanded(
          child: Container(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            margin: EdgeInsets.only(right: isLast ? 0 : AppSpacing.sm),
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
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(stat['value']!, style: AppTextStyles.statNumber),
                ),
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
