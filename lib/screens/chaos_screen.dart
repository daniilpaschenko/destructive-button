import 'package:flutter/material.dart';

import '../controllers/chaos_controller.dart';
import '../widgets/chaos_controls.dart';
import '../widgets/chaos_garbage_layer.dart';
import '../widgets/chaos_hud.dart';

class ChaosScreen extends StatefulWidget {
  const ChaosScreen({super.key});

  @override
  State<ChaosScreen> createState() => _ChaosScreenState();
}

class _ChaosScreenState extends State<ChaosScreen> {
  late final ChaosController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ChaosController()..start();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final bg = Color.lerp(
          const Color(0xFF0B0F14),
          const Color(0xFF3B0A0A),
          _controller.danger,
        )!;

        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[bg, Color.lerp(bg, Colors.black, 0.45)!],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  // layer of garbage
                  Positioned.fill(
                    child: ChaosGarbageLayer(blobs: _controller.blobs),
                  ),
                  Positioned(
                    top: 12,
                    left: 16,
                    right: 8,
                    child: ChaosHud(
                      pressCount: _controller.pressCount,
                      emojiCount: _controller.blobs.length,
                      onReset: _controller.reset,
                    ),
                  ),
                  Positioned(
                    left: 24,
                    right: 24,
                    bottom: 24,
                    child: ChaosControls(
                      message: _controller.message,
                      label: _controller.buttonLabel,
                      onPressed: _controller.pressClear,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
