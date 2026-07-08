import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';
import '../theme/app_theme.dart';

/// Navbar sticky: nama di kiri, menu navigasi di kanan.
///
/// PENTING soal breakpoint: menu nav lengkap (6 item + nama) butuh ruang
/// horizontal yang cukup lebar. Kalau kita pakai breakpoint mobile biasa
/// (760px), rentang lebar "tablet/laptop kecil" (760px–1024px) akan tetap
/// mencoba render 6 menu sekaligus dan overflow (persis kasus yang terjadi
/// di layar ~972px). Karena itu navbar sengaja pakai breakpoint sendiri
/// yang lebih tinggi (AppSpacing.tabletBreakpoint = 1024px) khusus untuk
/// memutuskan kapan menampilkan menu penuh vs hamburger, terpisah dari
/// breakpoint konten section lain.
class Navbar extends StatelessWidget {
  final void Function(int index) onNavTap;

  const Navbar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isCompactPadding = width < AppSpacing.mobileBreakpoint;
        // Threshold khusus navbar: di bawah ini, tampilkan hamburger.
        final showFullNav = width >= AppSpacing.tabletBreakpoint;

        return Container(
          width: double.infinity,
          color: AppColors.background,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isCompactPadding ? AppSpacing.md : AppSpacing.xl,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Flexible supaya nama panjang tetap aman di layar sempit,
                    // teks akan mengecil/wrap alih-alih mendorong nav overflow.
                    Flexible(
                      child: Text(
                        PortfolioData.fullName,
                        style: AppTextStyles.logo,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    if (showFullNav) _buildNavLinks(context) else _buildMobileMenuButton(context),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavLinks(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(PortfolioData.navItems.length, (i) {
        return Padding(
          // Spacing sedikit lebih ringkas (sm, bukan md) supaya ada
          // headroom ekstra sebelum menyentuh batas overflow lagi.
          padding: const EdgeInsets.only(left: AppSpacing.sm),
          child: InkWell(
            onTap: () => onNavTap(i),
            hoverColor: Colors.transparent,
            child: Text(
              PortfolioData.navItems[i].toUpperCase(),
              style: AppTextStyles.navLink,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMobileMenuButton(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.menu, color: AppColors.black),
      color: AppColors.background,
      tooltip: 'Menu',
      onSelected: onNavTap,
      itemBuilder: (context) => List.generate(
        PortfolioData.navItems.length,
        (i) => PopupMenuItem(
          value: i,
          child: Text(PortfolioData.navItems[i], style: AppTextStyles.navLink),
        ),
      ),
    );
  }
}
