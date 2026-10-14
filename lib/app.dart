import 'package:flutter/material.dart';

import 'screens/chaos_screen.dart';

// theme and a start screen
class ChaosApp extends StatelessWidget {
  const ChaosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Очиститель экрана',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF7C4DFF),
      ),
      home: const ChaosScreen(),
    );
  }
}
