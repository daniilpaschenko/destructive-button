import 'package:flutter/material.dart';

import 'app.dart';
import 'core/font_loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preloadMaterialIcons();
  runApp(const ChaosApp());
}
