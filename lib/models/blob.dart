import 'package:flutter/material.dart';

class Blob {
  const Blob({
    required this.x,
    required this.y,
    required this.size,
    required this.rotation,
    required this.isIcon,
    required this.emoji,
    required this.icon,
    required this.color,
  });

  /// 0..1
  final double x;

  /// 0..1
  final double y;

  final double size;
  final double rotation;
  final bool isIcon;
  final String? emoji;
  final IconData? icon;
  final Color color;
}
