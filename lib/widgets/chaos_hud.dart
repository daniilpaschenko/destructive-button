import 'package:flutter/material.dart';

import 'stat_item.dart';

/// upper panel
class ChaosHud extends StatelessWidget {
  const ChaosHud({
    super.key,
    required this.pressCount,
    required this.emojiCount,
    required this.onReset,
  });

  final int pressCount;
  final int emojiCount;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.45),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                StatItem(label: 'Нажатий', value: '$pressCount'),
                StatItem(
                  label: 'Эмодзи',
                  value: '$emojiCount',
                  alignment: CrossAxisAlignment.end,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
