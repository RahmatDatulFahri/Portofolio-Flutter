import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens untuk Swiss Style / International Typographic Style.
/// Semua warna, font, dan spacing di-centralize di sini supaya konsisten
/// dan gampang diubah dari satu tempat.
class AppColors {
  AppColors._();

  static const Color background = Color(0xFFF5F3EE); // off-white / cream
  static const Color black = Color(0xFF0A0A0A);
  static const Color accent = Color(0xFFE63946); // merah aksen Swiss style
  static const Color accentYellow = Color(0xFFFFD100); // alternatif aksen
  static const Color borderLight = Color(0xFFDCD9D1);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color cardBackground = Color(0xFFE9E5DB);
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 8;
  static const double sm = 16;
  static const double md = 24;
  static const double lg = 40;
  static const double xl = 64;
  static const double xxl = 96;

  /// Lebar maksimum konten (container) agar tetap rapi di layar besar.
  static const double maxContentWidth = 1200;

  /// Breakpoint sederhana untuk responsive layout.
  static const double mobileBreakpoint = 760;
  static const double tabletBreakpoint = 1024;
}

class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _headingFont => GoogleFonts.spaceGrotesk();
  static TextStyle get _bodyFont => GoogleFonts.inter();

  // Heading raksasa ala Swiss style (hero title)
  static TextStyle heroTitle(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    return _headingFont.copyWith(
      fontSize: isMobile ? 48 : 84,
      fontWeight: FontWeight.w700,
      height: 0.98,
      letterSpacing: -1.5,
      color: AppColors.black,
    );
  }

  // Heading section (ABOUT, EXPERIENCE, PROJECTS, dst)
  static TextStyle sectionTitle(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppSpacing.mobileBreakpoint;
    return _headingFont.copyWith(
      fontSize: isMobile ? 32 : 48,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      color: AppColors.black,
    );
  }

  static TextStyle cardTitle = _headingFont.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle statNumber = _headingFont.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle navLink = _bodyFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.black,
  );

  static TextStyle logo = _headingFont.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
    color: AppColors.black,
  );

  static TextStyle body = _bodyFont.copyWith(
    fontSize: 16,
    height: 1.5,
    color: AppColors.black,
  );

  static TextStyle bodySecondary = _bodyFont.copyWith(
    fontSize: 14,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static TextStyle indexLabel = _bodyFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: AppColors.accent,
  );

  static TextStyle label = _bodyFont.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
    color: AppColors.textSecondary,
  );

  static TextStyle button = _bodyFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );
}
