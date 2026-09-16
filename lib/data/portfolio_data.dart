import '../models/models.dart';
import 'profile_data.dart';
import 'experiences_data.dart';
import 'skills_data.dart';
import 'projects/projects_data.dart';

// Re-export semua model, supaya file yang sebelumnya import
// 'portfolio_data.dart' untuk dapat ProjectItem/ExperienceItem/dst
// tetap jalan tanpa perlu ubah import.
export '../models/models.dart';

/// PortfolioData adalah "facade" (pintu depan) ke semua data portofolio.
///
/// Kenapa masih ada class ini padahal datanya sudah dipecah ke banyak
/// file? Supaya SEMUA widget yang sudah ada (navbar, hero_section,
/// about_section, dst) TIDAK PERLU diubah kodenya -- mereka tetap
/// panggil `PortfolioData.projects`, `PortfolioData.fullName`, dst
/// seperti biasa. Yang berubah cuma ISI di baliknya, sekarang diambil
/// dari file-file kecil yang lebih mudah dirawat:
///
///   lib/data/profile_data.dart       -> data diri, kontak, nav
///   lib/data/experiences_data.dart   -> data magang
///   lib/data/skills_data.dart        -> data skill
///   lib/data/projects/*.dart         -> data tiap project (1 file per project)
///
/// Mau update satu project spesifik? Buka file project-nya langsung di
/// lib/data/projects/, tidak perlu cari-cari di file besar ini.
class PortfolioData {
  PortfolioData._();

  // --- Profil & kontak (delegasi ke ProfileData) ---
  static const String fullName = ProfileData.fullName;
  static const String role = ProfileData.role;
  static const String heroSubtitle = ProfileData.heroSubtitle;
  static const String heroTags = ProfileData.heroTags;
  static const String aboutBio = ProfileData.aboutBio;
  static const String email = ProfileData.email;
  static const String phone = ProfileData.phone;
  static const String location = ProfileData.location;
  static const String github = ProfileData.github;
  static const String githubUrl = ProfileData.githubUrl;
  static const String linkedin = ProfileData.linkedin;
  static const String linkedinUrl = ProfileData.linkedinUrl;
  static const List<String> navItems = ProfileData.navItems;
  static const List<Map<String, String>> aboutStats = ProfileData.aboutStats;

  // --- Pengalaman (delegasi ke ExperiencesData) ---
  static const List<ExperienceItem> experiences = ExperiencesData.all;

  // --- Project (delegasi ke ProjectsData) ---
  static const List<ProjectItem> projects = ProjectsData.all;

  // --- Skill (delegasi ke SkillsData) ---
  static const List<SkillGroup> skillGroups = SkillsData.all;
}
