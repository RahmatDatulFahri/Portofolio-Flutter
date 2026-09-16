import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens untuk Sapphire Navy High-Tech Enterprise Theme.
/// Mengadopsi palet persis dari gambar spesifikasi:
/// - 20306B (Primary Sapphire Navy - warna latar kartu referensi)
/// - 5599EE (Vibrant Sky Blue - aksen primer aktif)
/// - 050D2E (Deep Obsidian Midnight - kanvas gelap utama)
/// - 8C9BD9 (Soft Periwinkle - aksen sekunder, border, & teks pendukung)
/// - FFFFFF (Pure Crisp White - teks judul & elemen kontras tinggi)
class AppColors {
  AppColors._();

  /// Kanvas utama latar belakang halaman: Deep Obsidian Midnight (#050D2E)
  static const Color background = Color(0xFF050D2E);

  /// Surface kartu & kontainer: Primary Sapphire Navy (#20306B)
  static const Color cardBackground = Color(0xFF20306B);

  /// Elevated surface untuk kontras lapis ketiga (#0A1540)
  static const Color surfaceElevated = Color(0xFF0A1540);

  /// Aksen primer aktif: Vibrant Azure (#6EABFA)
  /// Ditingkatkan dari #5599EE agar rasio kontras terhadap cardBackground (#20306B)
  /// mencapai ~4.85:1 (memenuhi standar minimum WCAG 2.1 AA 4.5:1 untuk body text/tombol).
  static const Color accent = Color(0xFF6EABFA);

  /// State hover untuk elemen interaktif berbasis aksen
  static const Color accentHover = Color(0xFF8DC0FC);

  /// Aksen sekunder / border / tag: Soft Periwinkle Slate (#8C9BD9)
  static const Color accentSecondary = Color(0xFF8C9BD9);
  static const Color accentDark = accentSecondary;

  /// Teks utama & elemen kontras tinggi: Pure Crisp White (#FFFFFF)
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Teks hitam untuk kontras di atas tombol putih/terang (#050D2E)
  static const Color black = Color(0xFF050D2E);

  /// Garis pembatas tipis arsitektural (Periwinkle semi-transparan yang halus)
  static const Color borderLight = Color(0x338C9BD9);
  static const Color borderStrong = Color(0xFF8C9BD9);

  /// Teks sekunder, deskripsi, & metadata (#9BAAE3 untuk kontras lebih jelas)
  static const Color textSecondary = Color(0xFF9BAAE3);
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

  /// Breakpoint standar industri untuk responsive layout (Window Size Classes).
  /// Compact: < 600 (phone)
  /// Medium: 600 - 1024 (tablet / foldable / split screen)
  /// Expanded: >= 1024 (laptop / desktop)
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
}

/// Kategori ukuran layar berbasis standar Window Size Classes
enum ScreenTier { compact, medium, expanded }

/// Extension praktis untuk query ukuran layar secara efisien
extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;

  ScreenTier get screenTier {
    final w = screenWidth;
    if (w < AppSpacing.mobileBreakpoint) return ScreenTier.compact;
    if (w < AppSpacing.tabletBreakpoint) return ScreenTier.medium;
    return ScreenTier.expanded;
  }

  bool get isCompact => screenTier == ScreenTier.compact;
  bool get isMedium => screenTier == ScreenTier.medium;
  bool get isExpanded => screenTier == ScreenTier.expanded;
  bool get isTabletOrSmaller => screenWidth < AppSpacing.tabletBreakpoint;
}

class AppTextStyles {
  AppTextStyles._();

  // Menggunakan Plus Jakarta Sans sebagai representasi geometris identik dari Gilroy
  static TextStyle get _headingFont => GoogleFonts.plusJakartaSans();
  static TextStyle get _bodyFont => GoogleFonts.plusJakartaSans();

  // Heading raksasa (hero title) dengan skala 3-tier
  static TextStyle heroTitle(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final double size;
    if (width < AppSpacing.mobileBreakpoint) {
      size = 42;
    } else if (width < AppSpacing.tabletBreakpoint) {
      size = 62;
    } else {
      size = 84;
    }
    return _headingFont.copyWith(
      fontSize: size,
      fontWeight: FontWeight.w800,
      height: 1.05,
      letterSpacing: -1.5,
      color: AppColors.white,
    );
  }

  // Heading section (ABOUT, EXPERIENCE, PROJECTS, dst) dengan skala 3-tier
  static TextStyle sectionTitle(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final double size;
    if (width < AppSpacing.mobileBreakpoint) {
      size = 28;
    } else if (width < AppSpacing.tabletBreakpoint) {
      size = 38;
    } else {
      size = 48;
    }
    return _headingFont.copyWith(
      fontSize: size,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      color: AppColors.white,
    );
  }

  static TextStyle cardTitle = _headingFont.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle statNumber = _headingFont.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    color: AppColors.white,
  );

  static TextStyle navLink = _bodyFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.white,
  );

  static TextStyle logo = _headingFont.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5,
    color: AppColors.white,
  );

  static TextStyle body = _bodyFont.copyWith(
    fontSize: 16,
    height: 1.6,
    color: AppColors.white.withValues(alpha: 0.92),
  );

  static TextStyle bodySecondary = _bodyFont.copyWith(
    fontSize: 14,
    height: 1.6,
    color: AppColors.textSecondary,
  );

  static TextStyle indexLabel = _bodyFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
    color: AppColors.accent,
  );

  static TextStyle label = _bodyFont.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1,
    color: AppColors.textSecondary,
  );

  static TextStyle button = _bodyFont.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
  );
}
