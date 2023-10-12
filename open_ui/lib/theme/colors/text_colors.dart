import 'package:flutter/material.dart';

class TextColors {
  const TextColors({
    required this.primary, 
    required this.white, 
    required this.secondary
  });

  factory TextColors.light() => TextColors(
    primary: _mainColor, 
    white: _lightColor, 
    secondary:  _secondary
  );

  final Color primary;
  final Color white;
  final Color secondary;

  static const Color _lightColor = Color(0xFFFCFAFB);
  static const Color _mainColor = Color(0xFF4C535D);
  static final Color _secondary = const Color(0xFF4C535D).withOpacity(0.3);
}
