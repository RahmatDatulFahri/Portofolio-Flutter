/// Model untuk metrik hasil / performa bisnis dalam studi kasus proyek.
/// Memenuhi standar pelaporan rekayasa perangkat lunak enterprise
/// (prinsip STAR: Situation, Task, Action, Result kuantitatif).
class ProjectMetric {
  final String value;
  final String label;

  const ProjectMetric({
    required this.value,
    required this.label,
  });
}

