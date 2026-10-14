import 'package:flutter/material.dart';

import '../models/blob.dart';

/// draws 1 garbage element
class BlobView extends StatelessWidget {
  const BlobView({
    super.key,
    required this.blob,
    required this.left,
    required this.top,
  });

  final Blob blob;
  final double left;
  final double top;

  @override
  Widget build(BuildContext context) {
    final glyph = blob.isIcon
        ? Icon(blob.icon, size: blob.size, color: blob.color)
        : Text(blob.emoji!, style: TextStyle(fontSize: blob.size));

    return Positioned(
      left: left,
      top: top,
      child: IgnorePointer(
        child: Transform.rotate(
          angle: blob.rotation,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 220),
            curve: Curves.elasticOut,
            builder: (context, value, child) =>
                Transform.scale(scale: value, child: child),
            child: glyph,
          ),
        ),
      ),
    );
  }
}
