import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../profile_data.dart';

/// Project P/01 — App Reporting System.
///
/// CATATAN: field techStackDetailed sempat HILANG secara tidak sengaja
/// dari file lama akibat kesalahan proses edit sebelumnya (bug yang
/// menyebabkan compile error karena field ini required). Sudah diperbaiki
/// di sini.
const ProjectItem appReportingSystem = ProjectItem(
  index: 'P/01',
  title: 'App Reporting System',
  techStack: 'FLUTTER · BLOC · DIO · CLEAN ARCHITECTURE',
  githubUrl: ProfileData.githubUrl,
  category: 'Company Management System',
  overview: 'Aplikasi reporting internal untuk PT. Koding Teknologi Asia '
      '(Udacoding), mencakup absensi digital, laporan kinerja, dan '
      'manajemen izin karyawan dalam satu platform terintegrasi.',
  role: 'Mobile Developer · Magang',
  company: 'PT. Koding Teknologi Asia (Udacoding) · Batam, Onsite',
  duration: '3-4 bulan',
  techStackDetailed: [
    'Flutter',
    'Dart',
    'BLoC',
    'Clean Architecture',
    'Dio',
    'REST API',
    'Bearer Token Auth',
  ],
  implementationPoints: [
    'Menerapkan Clean Architecture dengan BLoC sebagai state management, memisahkan logika bisnis dari UI agar kode modular dan mudah dikembangkan.',
    'Merancang routing & navigasi antar halaman (dashboard, absensi, laporan, penggajian) menggunakan Navigator agar alur aplikasi tetap terstruktur.',
    'Mengimplementasikan form input dan validasi data dengan memperhatikan null safety dan async/await untuk mencegah crash.',
    'Mengintegrasikan REST API menggunakan Dio, termasuk penanganan error, loading state, dan autentikasi Bearer Token.',
    'Berkolaborasi lewat pull request dan code review, termasuk melakukan resolve conflict secara mandiri sesuai arahan senior developer.',
  ],
  mockups: [
    MockupScreen(label: 'Splash', imagePath: null),
    MockupScreen(label: 'Login', imagePath: null),
    MockupScreen(label: 'Home Dashboard', imagePath: null),
    MockupScreen(label: 'Laporan', imagePath: null),
  ],
  problem: 'PT. Koding Teknologi Asia membutuhkan sistem internal untuk '
      'mengelola absensi, laporan kinerja, dan pengajuan izin karyawan '
      'yang sebelumnya masih tersebar di proses manual, menyulitkan '
      'monitoring bagi tim HR dan manajemen.',
  solution: 'Membangun aplikasi mobile dengan Clean Architecture dan BLoC '
      'agar kode mudah dikembangkan tim, serta mengintegrasikan REST '
      'API (Dio) dengan autentikasi Bearer Token untuk sinkronisasi '
      'data absensi, laporan, dan penggajian secara real-time.',
  keyFeatures: [
    FeatureItem(
      icon: Icons.fingerprint,
      title: 'Absensi Digital',
      description:
          'Pencatatan kehadiran karyawan langsung dari aplikasi mobile.',
    ),
    FeatureItem(
      icon: Icons.bar_chart,
      title: 'Laporan Kinerja',
      description: 'Ringkasan performa kerja yang bisa diakses kapan saja.',
    ),
    FeatureItem(
      icon: Icons.assignment_turned_in,
      title: 'Manajemen Izin',
      description: 'Pengajuan dan approval izin/cuti dalam satu alur.',
    ),
    FeatureItem(
      icon: Icons.payments,
      title: 'Info Penggajian',
      description: 'Akses slip gaji dan riwayat pembayaran karyawan.',
    ),
  ],
  metrics: [
    ProjectMetric(
      value: '100%',
      label: 'Digitalisasi Rekap Presensi & Izin',
    ),
    ProjectMetric(
      value: '<1.2s',
      label: 'Avg Response Time API via Dio',
    ),
    ProjectMetric(
      value: '4 Modul',
      label: 'Clean Architecture BLoC Terisolasi',
    ),
  ],
  teamNote: 'Dikerjakan dalam tim lintas peran (Project Manager, Web '
      'Developer, Mobile Developer) dengan pembagian tugas berdasarkan '
      'planning awal project.',
  heroIcon: Icons.assignment_outlined,
  platform: 'Android',
  year: '2024',
  progressPercent: 80,
  progressLabel: 'Fitur Utama Selesai, Tahap Finalisasi',
);
