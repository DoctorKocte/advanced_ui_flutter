import 'package:flutter/material.dart';

class AppShadows {
  AppShadows({
    required this.shadow5, 
    required this.shadow15,
    required this.shadow25
  });

  factory AppShadows.reqular() => AppShadows(
    shadow5: _shadow5,
    shadow15: _shadow15,
    shadow25: _shadow25
  );

  BoxShadow shadow5;
  BoxShadow shadow15;
  BoxShadow shadow25;

  // tab bar
  static const BoxShadow _shadow5 = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.05),
    blurRadius: 7
  );

  static const BoxShadow _shadow15 = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    blurRadius: 10
  );

    static const BoxShadow _shadow25 = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    blurRadius: 10
  );
}
