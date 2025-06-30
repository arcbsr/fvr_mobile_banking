import 'package:flutter/material.dart';

class SettingsItem {
  final IconData? icon;
  final String title;
  final bool isSectionTitle;
  final VoidCallback? onTap;

  SettingsItem({this.icon, required this.title, this.onTap, this.isSectionTitle = false});
}