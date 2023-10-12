import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_ui/theme/colors/app_color_scheme.dart';

class MaterialTheme {
  const MaterialTheme();

  static ThemeData get lightTheme => _materialTheme(
    colorScheme: AppColorScheme.light(),
    brightness: Brightness.light
  );

  static ThemeData _materialTheme({
    required AppColorScheme colorScheme,
    required Brightness brightness,
  }) {
    final backgroundColor = colorScheme.background.primary;
    final isBrightnessLight = brightness == Brightness.light;
    final brightnessTheme = isBrightnessLight ? Brightness.dark : Brightness.light;

    return ThemeData(
      brightness: brightness,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            systemNavigationBarColor: backgroundColor,
            systemNavigationBarIconBrightness: brightnessTheme,
            statusBarIconBrightness: brightnessTheme,
            statusBarBrightness: brightnessTheme),
        backgroundColor: backgroundColor,
        centerTitle: true,
        foregroundColor: backgroundColor    
      )
    );
  }
}
