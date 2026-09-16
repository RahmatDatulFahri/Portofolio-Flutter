import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../profile_data.dart';

/// Project P/03 — App JHEIN.
const ProjectItem appJhein = ProjectItem(
  index: 'P/03',
  title: 'App JHEIN',
  techStack: 'FLUTTER · REST API · MOSQUE INFO SYSTEM',
  githubUrl: ProfileData.githubUrl,
  category: 'Mosque Information System',
  overview: 'Aplikasi informasi berbasis masjid untuk COEDEV Technology, '
      'mencakup jadwal sholat, info masjid, dan donasi — dikembangkan '
      'penuh dari desain UI/UX menjadi aplikasi Flutter yang responsif.',
  role: 'Mobile Developer · Magang',
  company: 'COEDEV Technology · Malaysia, Remote',
  duration: '2 bulan',
  techStackDetailed: [
    'Flutter',
    'REST API',
    'Responsive Design',
    'Figma to Flutter',
  ],
  implementationPoints: [
    'Bertanggung jawab penuh membangun seluruh tampilan, fitur, dan navigasi aplikasi dari desain UI/UX menjadi aplikasi Flutter yang responsif.',
    'Menguji aplikasi secara berkala untuk memastikan tampilan responsif di berbagai ukuran layar HP, serta memperbaiki bug yang ditemukan.',
    'Berkoordinasi dengan tim Backend untuk menentukan data dan endpoint API yang dibutuhkan sesuai kebutuhan fitur.',
    'Mengintegrasikan REST API untuk menyinkronkan data antara web dan aplikasi mobile, memastikan informasi (jadwal sholat, info masjid, donasi) tetap konsisten.',
  ],
  mockups: [
    MockupScreen(label: 'Home', imagePath: null),
    MockupScreen(label: 'Jadwal Sholat', imagePath: null),
    MockupScreen(label: 'Donasi', imagePath: null),
  ],
  problem: 'COEDEV Technology membutuhkan aplikasi informasi masjid yang '
      'mudah diakses jamaah untuk melihat jadwal sholat, info kegiatan '
      'masjid, dan donasi secara digital — dikembangkan penuh dari '
      'tahap desain hingga aplikasi jadi.',
  solution: 'Bertanggung jawab penuh membangun seluruh tampilan, fitur, dan '
      'navigasi dari desain UI/UX menjadi aplikasi Flutter yang '
      'responsif, sekaligus berkoordinasi dengan tim Backend untuk '
      'endpoint API yang dibutuhkan.',
  keyFeatures: [
    FeatureItem(
      icon: Icons.access_time,
      title: 'Jadwal Sholat',
      description: 'Info waktu sholat yang selalu update.',
    ),
    FeatureItem(
      icon: Icons.mosque,
      title: 'Info Masjid',
      description: 'Informasi kegiatan dan pengumuman masjid.',
    ),
    FeatureItem(
      icon: Icons.volunteer_activism,
      title: 'Donasi',
      description: 'Fitur donasi digital yang mudah diakses jamaah.',
    ),
  ],
  metrics: [
    ProjectMetric(
      value: '3 Layanan',
      label: 'Jadwal Sholat, Info & Donasi',
    ),
    ProjectMetric(
      value: '100%',
      label: 'Multi-screen Adaptive Layout',
    ),
    ProjectMetric(
      value: 'Real-time',
      label: 'Sinkronisasi REST API & Backend',
    ),
  ],
  teamNote: 'Bekerja secara remote, berkoordinasi dengan tim Backend untuk '
      'memastikan data API sesuai kebutuhan fitur aplikasi.',
  heroIcon: Icons.mosque_outlined,
  platform: 'Android',
  year: '2024',
  // CATATAN: persentase ini ESTIMASI dari deskripsi "UI selesai + REST API
  // ke beberapa fitur" -- belum dikonfirmasi angka pasti oleh pemilik
  // portofolio. Update di sini kalau sudah ada angka yang lebih akurat.
  progressPercent: 55,
  progressLabel: 'UI Selesai, REST API Terintegrasi Sebagian Fitur',
);
