import 'package:flutter/material.dart';
class GradientColors {
  const GradientColors({required this.mainPink, required this.mainGrey});

  factory GradientColors.light() => const GradientColors(
    mainPink: _mainPink, 
    mainGrey: _mainGrey
  );

  final List<Color> mainPink;
  final List<Color> mainGrey;

  static const List<Color> _mainPink = [
      Color(0xFFFFA68D),
      Color(0xFFFD3A84)
   ];

     static const List<Color> _mainGrey = [
      Color(0xFFDEE7F3),
      Color(0xFFD1CEEE)
   ];
}