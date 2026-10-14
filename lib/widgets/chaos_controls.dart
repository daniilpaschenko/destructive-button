import 'package:flutter/material.dart';

/// status message and a button
class ChaosControls extends StatelessWidget {
  const ChaosControls({
    super.key,
    required this.message,
    required this.label,
    required this.onPressed,
  });

  final String message;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: 0.85),
            shadows: const <Shadow>[
              Shadow(blurRadius: 12, color: Colors.black87),
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 64,
          child: FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFE53935),
              foregroundColor: Colors.white,
              elevation: 8,
              shadowColor: const Color(0x99E53935),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.3,
              ),
            ),
            child: Text(label),
          ),
        ),
      ],
    );
  }
}
