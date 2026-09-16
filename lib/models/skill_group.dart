import 'package:flutter/material.dart';

/// Model untuk satu grup skill (Mobile Dev, Architecture, Tools, dst).
class SkillGroup {
  final String index;
  final String title;
  final IconData icon;
  final String description;
  final List<String> items;

  const SkillGroup({
    required this.index,
    required this.title,
    required this.icon,
    required this.description,
    required this.items,
  });
}
