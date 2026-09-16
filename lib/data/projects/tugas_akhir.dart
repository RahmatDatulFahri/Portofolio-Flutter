import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../profile_data.dart';

/// Project P/04 — Sistem Informasi App Reporting (Tugas Akhir D3).
const ProjectItem tugasAkhir = ProjectItem(
  index: 'P/04',
  title: 'Sistem Informasi App Reporting',
  techStack: 'FLUTTER · FIREBASE · FIRESTORE · BLOC — TUGAS AKHIR D3',
  githubUrl: ProfileData.githubUrl,
  category: 'Tugas Akhir D3 — Politeknik Negeri Padang',
  overview: 'Aplikasi mobile reporting sebagai tugas akhir, mencakup fitur '
      'absensi digital, laporan kinerja, dan manajemen izin dengan '
      'penyimpanan data real-time.',
  role: 'Pengembang Individu (Tugas Akhir)',
  company: 'Politeknik Negeri Padang',
  duration: '±4 bulan (semester akhir)',
  techStackDetailed: [
    'Flutter',
    'Firebase Auth',
    'Firestore',
    'BLoC',
    'Clean Architecture',
  ],
  implementationPoints: [
    'Merancang dan mengembangkan aplikasi mobile reporting menggunakan Flutter, mencakup fitur absensi digital, laporan kinerja, dan manajemen izin.',
    'Menggunakan Firebase Authentication untuk sistem login dan Firestore untuk penyimpanan data laporan secara real-time.',
    'Menerapkan arsitektur Clean Architecture dengan BLoC sebagai layer presentasi, menghasilkan kode yang terstruktur dan mudah diuji.',
  ],
  mockups: [
    MockupScreen(label: 'Login', imagePath: null),
    MockupScreen(label: 'Dashboard', imagePath: null),
    MockupScreen(label: 'Laporan Kinerja', imagePath: null),
  ],
  problem: 'Sebagai tugas akhir D3, dibutuhkan aplikasi reporting mandiri '
      'yang mencakup absensi digital, laporan kinerja, dan manajemen '
      'izin, dengan penyimpanan data yang real-time dan aman.',
  solution: 'Merancang dan mengembangkan aplikasi secara individu '
      'menggunakan Flutter dengan Clean Architecture dan BLoC, serta '
      'Firebase Authentication dan Firestore untuk autentikasi dan '
      'penyimpanan data real-time.',
  keyFeatures: [
    FeatureItem(
      icon: Icons.fingerprint,
      title: 'Absensi Digital',
      description: 'Pencatatan kehadiran dengan penyimpanan real-time.',
    ),
    FeatureItem(
      icon: Icons.bar_chart,
      title: 'Laporan Kinerja',
      description: 'Ringkasan performa berbasis data Firestore.',
    ),
    FeatureItem(
      icon: Icons.assignment_turned_in,
      title: 'Manajemen Izin',
      description: 'Alur pengajuan izin yang terintegrasi.',
    ),
  ],
  metrics: [
    ProjectMetric(
      value: '100%',
      label: 'Clean Architecture & BLoC Mandiri',
    ),
    ProjectMetric(
      value: 'Real-time',
      label: 'Sinkronisasi Cloud Firestore',
    ),
    ProjectMetric(
      value: 'Auth & DB',
      label: 'Keamanan Data Firebase Auth Teruji',
    ),
  ],
  teamNote: 'Dikerjakan secara individu sebagai proyek tugas akhir, dari '
      'tahap perancangan hingga implementasi penuh.',
  heroIcon: Icons.school_outlined,
  platform: 'Android',
  year: '2024',
  progressPercent: 85,
  progressLabel: 'Fitur Utama Berjalan, Tahap Penyempurnaan',
);
