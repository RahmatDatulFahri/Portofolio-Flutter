import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(index: '05/06', title: 'SKILLS'),
          const SizedBox(height: AppSpacing.lg),
          const ThinRule(),
          const SizedBox(height: AppSpacing.lg),
          isMobile ? _buildMobileColumns(context) : _buildDesktopColumns(context),
        ],
      ),
    );
  }

  Widget _buildDesktopColumns(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(PortfolioData.skillGroups.length, (i) {
          final group = PortfolioData.skillGroups[i];
          final isLast = i == PortfolioData.skillGroups.length - 1;
          return Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: AppSpacing.lg),
              margin: EdgeInsets.only(right: isLast ? 0 : AppSpacing.lg),
              decoration: BoxDecoration(
                border: Border(
                  right: isLast
                      ? BorderSide.none
                      : const BorderSide(color: AppColors.borderLight),
                ),
              ),
              child: _buildGroupContent(group),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMobileColumns(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PortfolioData.skillGroups
          .map((g) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.lg),
                child: _buildGroupContent(g),
              ))
          .toList(),
    );
  }

  Widget _buildGroupContent(SkillGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${group.index} — ${group.title}', style: AppTextStyles.cardTitle.copyWith(fontSize: 18)),
        const SizedBox(height: AppSpacing.sm),
        ...group.items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(item, style: AppTextStyles.body),
          ),
        ),
      ],
    );
  }
}
