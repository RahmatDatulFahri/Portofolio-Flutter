import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/portfolio_data.dart';
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
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;

    return Container(
      width: double.infinity,
      color: AppColors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.md : AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2026 ${PortfolioData.fullName}',
                  style: AppTextStyles.label.copyWith(color: Colors.white70),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.code, color: Colors.white, size: 20),
                      onPressed: () => _openUrl(PortfolioData.githubUrl),
                      tooltip: 'GitHub',
                    ),
                    IconButton(
                      icon: const Icon(Icons.business_center, color: Colors.white, size: 20),
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
