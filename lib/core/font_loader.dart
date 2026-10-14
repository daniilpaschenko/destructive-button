import 'package:flutter/services.dart';

/// loading font earlier than an app starts
Future<void> preloadMaterialIcons() async {
  try {
    final FontLoader loader = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await loader.load();
  } catch (_) {
  }
}
