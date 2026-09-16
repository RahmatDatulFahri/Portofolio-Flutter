import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
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
    final body = switch (context.screenTier) {
      ScreenTier.compact => _buildCompactBody(context),
      ScreenTier.medium => _buildMediumBody(context),
      ScreenTier.expanded => _buildExpandedBody(context),
    };

    return SectionWrapper(
      // SizedBox(width: double.infinity) mencegah Column menyusut ke lebar
      // judul besarnya sendiri lalu ikut ke-tengah oleh Center di
      // SectionWrapper.
      child: SizedBox(
        width: double.infinity,
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
            body,
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedBody(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child:
                    Text(PortfolioData.heroSubtitle, style: AppTextStyles.body),
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

  Widget _buildMediumBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Text(PortfolioData.heroSubtitle, style: AppTextStyles.body),
        ),
        const SizedBox(height: AppSpacing.md),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildButtons(),
            const SizedBox(width: AppSpacing.md),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  PortfolioData.heroTags,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.label,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCompactBody(BuildContext context) {
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
            backgroundColor: AppColors.accent,
            foregroundColor: AppColors.black,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            elevation: 0,
          ),
          child: Text('VIEW PROJECTS',
              style: AppTextStyles.button.copyWith(color: AppColors.black)),
        ),
        OutlinedButton(
          onPressed: onDownloadCv,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.white,
            side: const BorderSide(color: AppColors.borderStrong),
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          child: Text('DOWNLOAD CV',
              style: AppTextStyles.button.copyWith(color: AppColors.white)),
        ),
      ],
    );
  }
}
