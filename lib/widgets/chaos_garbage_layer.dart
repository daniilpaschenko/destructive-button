import 'package:flutter/material.dart';

import '../models/blob.dart';
import 'blob_view.dart';

/// layer of garbage — throws [blob] for all over a screen
class ChaosGarbageLayer extends StatelessWidget {
  const ChaosGarbageLayer({super.key, required this.blobs});

  final List<Blob> blobs;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            for (final blob in blobs)
              BlobView(
                blob: blob,
                left: blob.x * (constraints.maxWidth - blob.size),
                top: blob.y * (constraints.maxHeight - blob.size),
              ),
          ],
        );
      },
    );
  }
}
