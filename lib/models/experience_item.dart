/// Model untuk satu entri pengalaman kerja (magang).
class ExperienceItem {
  final String period;
  final String role;
  final String company;
  final String location;
  final List<String> highlights;

  const ExperienceItem({
    required this.period,
    required this.role,
    required this.company,
    required this.location,
    required this.highlights,
  });
}
