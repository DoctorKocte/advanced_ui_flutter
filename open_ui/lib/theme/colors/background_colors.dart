import 'package:flutter/material.dart';

class BackgroundColors {
  const BackgroundColors({
    required this.primary,
    required this.grey
  });

  factory BackgroundColors.light() => const BackgroundColors(
      primary: _primary,
      grey: _grey
  );

  final Color primary;
  final Color grey;

  static const Color _primary = Color(0xFFFDFDFD);
  static const Color _grey = Color(0xFFDEE7F3);
}
