import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
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
        final double horizontalPadding;
        if (width < AppSpacing.mobileBreakpoint) {
          horizontalPadding = AppSpacing.md;
        } else if (width < AppSpacing.tabletBreakpoint) {
          horizontalPadding = AppSpacing.lg;
        } else {
          horizontalPadding = AppSpacing.xl;
        }

        // Tampilkan menu penuh pada layar desktop, dan drawer button pada tablet/mobile
        final showFullNav = width >= AppSpacing.tabletBreakpoint;

        return Container(
          width: double.infinity,
          color: AppColors.background,
          child: Center(
            child: ConstrainedBox(
              constraints:
                  const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
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
                    if (showFullNav)
                      _buildNavLinks(context)
                    else
                      _buildMobileMenuButton(context),
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
          padding: const EdgeInsets.only(left: 4),
          child: InkWell(
            onTap: () => onNavTap(i),
            borderRadius: BorderRadius.circular(2),
            hoverColor: AppColors.accent.withValues(alpha: 0.12),
            child: ConstrainedBox(
              // Menjamin hit-box minimal 44x44px sesuai standar WCAG 2.5.5 / 2.5.8
              constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: Center(
                  child: Text(
                    PortfolioData.navItems[i].toUpperCase(),
                    style: AppTextStyles.navLink,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMobileMenuButton(BuildContext context) {
    return Builder(
      builder: (btnContext) => IconButton(
        icon: const Icon(Icons.menu, color: AppColors.white),
        tooltip: 'Menu',
        onPressed: () => Scaffold.of(btnContext).openEndDrawer(),
      ),
    );
  }
}
