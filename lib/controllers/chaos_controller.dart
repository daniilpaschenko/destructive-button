import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/chaos_content.dart';
import '../models/blob.dart';

class ChaosController extends ChangeNotifier {
  ChaosController({Random? random}) : _random = random ?? Random();

  static const int _minIntervalMs = 40;
  static const int _maxBatch = 150;
  static const Duration _startInterval = Duration(milliseconds: 5000);
  static const Duration _firstPressInterval = Duration(milliseconds: 3000);

  final Random _random;
  final List<Blob> _blobs = <Blob>[];

  Timer? _timer;
  Duration _interval = _startInterval;
  int _batchSize = 1;
  int _pressCount = 0;

  UnmodifiableListView<Blob> get blobs => UnmodifiableListView<Blob>(_blobs);
  int get pressCount => _pressCount;

  double get danger => (_pressCount / 6).clamp(0.0, 1.0);

  String get message =>
      ChaosContent.messages[min(_pressCount, ChaosContent.messages.length - 1)];

  String get buttonLabel => ChaosContent
      .buttonLabels[min(_pressCount, ChaosContent.buttonLabels.length - 1)];

  /// initial state: 1 emoji in 5 seconds
  void start() => _scheduleNext();

  /// increase garbage spawning
  void pressClear() {
    HapticFeedback.heavyImpact();
    _timer?.cancel();
    _pressCount++;

    if (_pressCount == 1) {
      _interval = _firstPressInterval;
    } else {
      // -40% for interval
      final ms = max(_minIntervalMs, (_interval.inMilliseconds * 0.6).round());
      _interval = Duration(milliseconds: ms);
      // how many emojis will apear
      _batchSize = min(_maxBatch, _batchSize + 2 + _random.nextInt(3));
    }

    _spawn(_batchSize);
    notifyListeners();
    _scheduleNext();
  }

  void reset() {
    _timer?.cancel();
    _blobs.clear();
    _pressCount = 0;
    _batchSize = 1;
    _interval = _startInterval;
    notifyListeners();
    _scheduleNext();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _scheduleNext() {
    _timer?.cancel();
    _timer = Timer(_interval, () {
      _spawn(_batchSize);
      notifyListeners();
      _scheduleNext();
    });
  }

  void _spawn(int count) {
    for (var i = 0; i < count; i++) {
      _blobs.add(_makeBlob());
    }
  }

  Blob _makeBlob() {
    final isIcon = _random.nextInt(5) == 0; // ~20% icons, the rest — emojis
    return Blob(
      x: _random.nextDouble(),
      y: _random.nextDouble(),
      size: 20 + _random.nextDouble() * 48,
      rotation: (_random.nextDouble() - 0.5) * 1.4,
      isIcon: isIcon,
      emoji: isIcon
          ? null
          : ChaosContent.emojis[_random.nextInt(ChaosContent.emojis.length)],
      icon: isIcon
          ? ChaosContent.icons[_random.nextInt(ChaosContent.icons.length)]
          : null,
      color: Colors.primaries[_random.nextInt(Colors.primaries.length)].shade300,
    );
  }
}
