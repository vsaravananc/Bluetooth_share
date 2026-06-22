import 'dart:math';
import 'package:flutter/services.dart';

final random = Random();
const double radius = 250;
const double centerX = 250;
const double centerY =250;

Offset getRandomOffsets() {
  final angle = random.nextDouble() * 2 * pi;
  final distance = sqrt(random.nextDouble());
  final x = centerX + distance * cos(angle);
  final y = centerY + distance * sin(angle);
  return Offset(x, y);
}
