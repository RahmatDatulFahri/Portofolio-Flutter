import '../../models/models.dart';
import 'app_reporting_system.dart';
import 'e_albaik_store.dart';
import 'app_jhein.dart';
import 'tugas_akhir.dart';

/// Menggabungkan semua project individual jadi satu List, sesuai urutan
/// tampil di Projects section. Tambah project baru: buat file baru di
/// folder projects/, lalu daftarkan di sini.
class ProjectsData {
  ProjectsData._();

  static const List<ProjectItem> all = [
    appReportingSystem,
    eAlbaikStore,
    appJhein,
    tugasAkhir,
  ];
}
