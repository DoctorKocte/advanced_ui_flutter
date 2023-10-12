import 'package:flutter/material.dart';

class BackgroundColors {
  const BackgroundColors({
    required this.primary
  });

  factory BackgroundColors.light() => const BackgroundColors(
      primary: _primary
  );

  final Color primary;

  static const Color _primary = Color(0xFFFDFDFD);
}
