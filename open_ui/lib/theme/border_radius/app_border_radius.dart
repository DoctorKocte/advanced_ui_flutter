import 'package:flutter/material.dart';

class AppBorderRadius {
  const AppBorderRadius({
    required this.radius16,
    required this.radiusTop16,
    required this.radius22,
    required this.radius22BottomRight,
    required this.radius25
  });

  factory AppBorderRadius.regular() => const AppBorderRadius(
    radius16: BorderRadius.all(
      Radius.circular(16),
    ),
    radiusTop16: BorderRadius.vertical(
      top: Radius.circular(16)
    ),
    radius22: BorderRadius.all(
      Radius.circular(22)
    ),
    radius22BottomRight: BorderRadius.only(bottomRight: Radius.circular(22), topLeft: Radius.circular(22), topRight: Radius.circular(22)),
    radius25: BorderRadius.all(
      Radius.circular(25)
    )
  );

  final BorderRadius radius16;
  final BorderRadius radiusTop16;
  final BorderRadius radius22;
  final BorderRadius radius22BottomRight;
  final BorderRadius radius25;
}
