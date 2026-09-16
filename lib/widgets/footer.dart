import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = context.isCompact;

    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.md : AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.xs,
              children: [
                Text(
                  '© 2026 ${PortfolioData.fullName}',
                  style: AppTextStyles.label.copyWith(color: Colors.white70),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.code, color: Colors.white, size: 20),
                      onPressed: () => _openUrl(PortfolioData.githubUrl),
                      tooltip: 'GitHub',
                    ),
                    IconButton(
                      icon: const Icon(Icons.business_center,
                          color: Colors.white, size: 20),
                      onPressed: () => _openUrl(PortfolioData.linkedinUrl),
                      tooltip: 'LinkedIn',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
