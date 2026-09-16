import 'package:flutter/material.dart';
import '../models/models.dart';

/// Data kategori skill. Tambah/ubah kategori atau item skill di sini --
/// tidak perlu sentuh file widget (skills_section.dart).
class SkillsData {
  SkillsData._();

  static const List<SkillGroup> all = [
    SkillGroup(
      index: '01',
      title: 'Mobile Dev',
      icon: Icons.smartphone,
      description: 'Membangun aplikasi mobile lintas platform dengan Flutter.',
      items: [
        'Flutter',
        'Dart',
        'BLoC / Cubit',
        'Riverpod',
        'Provider',
        'REST API (Dio)',
        'Firebase',
        'SQLite',
      ],
    ),
    SkillGroup(
      index: '02',
      title: 'Architecture',
      icon: Icons.architecture,
      description:
          'Menerapkan pola arsitektur agar kode terstruktur dan mudah diuji.',
      items: [
        'Clean Architecture',
        'BLoC / Cubit',
        'MVVM',
        'Repository Pattern',
        'Use Cases',
        'Dependency Injection',
      ],
    ),
    SkillGroup(
      index: '03',
      title: 'Backend & Database',
      icon: Icons.storage,
      description:
          'Integrasi API dan penyimpanan data untuk kebutuhan aplikasi.',
      items: [
        'REST API (Dio)',
        'Firebase Auth',
        'Firestore',
        'FCM',
        'MySQL',
        'SQLite',
        'Supabase',
      ],
    ),
    SkillGroup(
      index: '04',
      title: 'Tools & Workflow',
      icon: Icons.build_outlined,
      description:
          'Perangkat kerja modern untuk akselerasi development dan kolaborasi tim.',
      items: [
        'Git & GitHub',
        'VS Code & Android Studio',
        'Postman',
        'Figma',
        'AI Pair Programming (Claude, Gemini)',
        'Agentic AI (Antigravity)',
      ],
    ),
    SkillGroup(
      index: '05',
      title: 'Design & Multimedia',
      icon: Icons.palette_outlined,
      description:
          'Kemampuan pendukung untuk kebutuhan asset visual dan konten.',
      items: [
        'Adobe Photoshop',
        'Illustrator',
        'Premiere Pro',
        'After Effects',
        'Canva',
        'CapCut',
      ],
    ),
    SkillGroup(
      index: '06',
      title: 'Soft Skill',
      icon: Icons.groups_2_outlined,
      description: 'Kemampuan non-teknis yang mendukung kerja tim sehari-hari.',
      items: [
        'Problem Solving',
        'Kolaborasi Tim',
        'Agile & Scrum',
        'Adaptif',
        'Manajemen Waktu',
        'Komunikasi Teknis',
      ],
    ),
  ];
}
