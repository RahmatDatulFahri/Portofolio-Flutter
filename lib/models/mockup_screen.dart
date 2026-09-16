/// Satu layar dalam galeri mockup UI project.
///
/// [imagePath] bersifat OPSIONAL. Kalau null (belum diisi), halaman detail
/// akan otomatis menampilkan placeholder "MOCKUP BELUM DITAMBAHKAN". Begitu
/// kamu punya screenshot asli, cukup isi path-nya di sini -- tidak perlu
/// ubah kode UI sama sekali.
///
/// Cara pakai:
/// 1. Taruh file gambar di assets/images/mockups/nama_file.png
/// 2. Isi imagePath: 'assets/images/mockups/nama_file.png'
class MockupScreen {
  final String label;
  final String? imagePath;

  const MockupScreen({required this.label, this.imagePath});
}
