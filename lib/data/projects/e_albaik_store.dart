import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../profile_data.dart';

/// Project P/02 — E-AlBaik Store.
const ProjectItem eAlbaikStore = ProjectItem(
  index: 'P/02',
  title: 'E-AlBaik Store',
  techStack: 'FLUTTER · FIGMA-TO-CODE · E-COMMERCE',
  githubUrl: ProfileData.githubUrl,
  category: 'E-Commerce Application',
  overview: 'Aplikasi e-commerce dengan fitur Wishlist dan My Order, '
      'dikembangkan berdasarkan desain UI/UX tim Figma perusahaan.',
  role: 'Mobile Developer · Magang',
  company: 'PT. Koding Teknologi Asia (Udacoding) · Batam, Onsite',
  duration: '1 bulan',
  techStackDetailed: [
    'Flutter',
    'Figma-to-Code',
    'Custom Widgets',
    'Coding Standard',
  ],
  implementationPoints: [
    'Mengembangkan tampilan dan komponen UI menggunakan Flutter widgets, mengacu pada desain Figma tim UI/UX.',
    'Membangun fitur Wishlist dan My Order sesuai spesifikasi desain yang ditentukan.',
    'Menerapkan coding standard dan struktur folder project (TextWidget, TextStyleUtils, SizingUtil) sesuai panduan senior developer.',
    'Melakukan push kode berkala ke GitHub dan berkolaborasi lewat pull request & code review, termasuk menangani resolve conflict.',
  ],
  mockups: [
    MockupScreen(label: 'Home', imagePath: null),
    MockupScreen(label: 'Product Detail', imagePath: null),
    MockupScreen(label: 'Wishlist', imagePath: null),
  ],
  problem: 'Tim membutuhkan implementasi UI aplikasi e-commerce yang presisi '
      'sesuai desain Figma, termasuk fitur Wishlist dan My Order, '
      'dengan struktur kode yang konsisten mengikuti coding standard '
      'perusahaan.',
  solution: 'Mengimplementasikan seluruh komponen UI menggunakan custom '
      'Flutter widget, mengikuti struktur folder dan penamaan '
      '(TextWidget, TextStyleUtils, SizingUtil) sesuai panduan senior '
      'developer, serta aktif berkolaborasi lewat code review.',
  keyFeatures: [
    FeatureItem(
      icon: Icons.storefront,
      title: 'Katalog Produk',
      description: 'Tampilan produk sesuai desain Figma tim UI/UX.',
    ),
    FeatureItem(
      icon: Icons.favorite_border,
      title: 'Wishlist',
      description: 'Simpan produk favorit untuk dibeli nanti.',
    ),
    FeatureItem(
      icon: Icons.receipt_long,
      title: 'My Order',
      description: 'Pantau status dan riwayat pesanan pengguna.',
    ),
  ],
  metrics: [
    ProjectMetric(
      value: '98%',
      label: 'Figma-to-Code Design Fidelity',
    ),
    ProjectMetric(
      value: '3 Fitur',
      label: 'Katalog, Wishlist & My Order',
    ),
    ProjectMetric(
      value: '100%',
      label: 'Null-Safety & Clean Code Standard',
    ),
  ],
  teamNote: 'Berkolaborasi dengan senior developer melalui pull request dan '
      'code review, termasuk menangani resolve conflict secara '
      'mandiri.',
  heroIcon: Icons.storefront_outlined,
  platform: 'Android',
  year: '2024',
  progressPercent: 28,
  progressLabel: 'Tahap UI Slicing',
);
