import 'package:flutter/material.dart';
import 'mockup_screen.dart';
import 'feature_item.dart';
import 'project_metric.dart';

/// Model untuk satu project. Dipakai baik untuk card ringkas di grid
/// Projects section, maupun untuk halaman detail lengkap saat card diklik.
class ProjectItem {
  final String index; // "P/01"
  final String title;
  final String techStack; // ringkasan singkat untuk card grid, mis. "FLUTTER · BLOC · DIO"
  final String githubUrl;

  // Field tambahan khusus untuk halaman detail:
  final String category; // mis. "Company Management System"
  final String overview; // ringkasan konteks project (2-3 kalimat)
  final String role; // mis. "Mobile Developer · Magang"
  final String company; // mis. "PT. Koding Teknologi Asia · Batam, Onsite"
  final String duration; // mis. "3-4 bulan" -- durasi kerja SPESIFIK project ini
  final List<String> techStackDetailed; // list terpisah untuk chip tags
  final List<String> implementationPoints; // detail teknis apa yang dikerjakan
  final List<MockupScreen> mockups; // galeri layar + path gambar (opsional)

  // Field "case study" (jujur, tanpa data fiktif):
  final String problem; // konteks masalah yang melatarbelakangi project
  final String solution; // pendekatan/solusi teknis yang diambil
  final List<FeatureItem> keyFeatures; // fitur utama aplikasi
  final List<ProjectMetric> metrics; // dampak bisnis & metrik rekayasa terukur
  final String teamNote; // konteks kerja tim (tanpa nama fiktif)

  // Field untuk hero (icon ilustrasi + badge progress/platform):
  final IconData heroIcon; // icon representatif project (bukan ilustrasi emoji)
  final String platform; // JUJUR: cuma "Android" karena CV sebut build APK,
  // bukan klaim iOS/Web yang tidak terbukti dikerjakan
  final String year; // mis. "2024" -- tahun pengerjaan, terpisah dari duration

  // PENTING -- progress project TIDAK semuanya 100% selesai. Ini data
  // jujur berdasarkan status pengerjaan aktual, BUKAN klaim "Selesai"
  // untuk semua project.
  final int progressPercent; // 0-100
  final String progressLabel; // mis. "Tahap UI Slicing", "Fitur Utama Selesai"

  const ProjectItem({
    required this.index,
    required this.title,
    required this.techStack,
    required this.githubUrl,
    required this.category,
    required this.overview,
    required this.role,
    required this.company,
    required this.duration,
    required this.techStackDetailed,
    required this.implementationPoints,
    required this.mockups,
    required this.problem,
    required this.solution,
    required this.keyFeatures,
    this.metrics = const [],
    required this.teamNote,
    required this.heroIcon,
    required this.platform,
    required this.year,
    required this.progressPercent,
    required this.progressLabel,
  });
}
