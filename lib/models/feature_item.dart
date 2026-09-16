import 'package:flutter/material.dart';

/// Satu fitur unggulan project, ditampilkan di grid "Key Features"
/// pada halaman detail project.
class FeatureItem {
  final IconData icon;
  final String title;
  final String description;

  const FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}
