import 'package:flutter/material.dart';
import 'package:open_ui/theme/text/app_text_styles.dart';

class AppTextColors {
  const AppTextColors({
    required this.title,
    required this.boldSubtitle,
    required this.subtitle,
    required this.boldH4,
    required this.h4,
    required this.h5,
    required this.lightH5,
    required this.lightSubtitle,
    required this.subtitleLightH5,
    required this.h6,
    required this.lightH6
  });

  factory AppTextColors.regular() => const AppTextColors(
    title: AppTextStyles.title,
    boldSubtitle: AppTextStyles.boldSubtitle, 
    subtitle: AppTextStyles.subtitle,
    boldH4: AppTextStyles.boldH4,
    h4: AppTextStyles.h4, 
    h5: AppTextStyles.h5,
    lightH5: AppTextStyles.lightH5,
    lightSubtitle: AppTextStyles.lightSubtitle,
    subtitleLightH5: AppTextStyles.subtitleLightH5,
    h6: AppTextStyles.h6,
    lightH6: AppTextStyles.lightH6
);

  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle boldSubtitle;
  final TextStyle boldH4;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle lightH5;
  final TextStyle lightSubtitle;
  final TextStyle h6;
  final TextStyle lightH6;
  final TextStyle subtitleLightH5;

  AppTextColors withColor(Color? color) => AppTextColors(
    title: AppTextStyles.title.apply(color: color), 
    boldSubtitle: AppTextStyles.boldSubtitle.apply(color: color), 
    subtitle: AppTextStyles.subtitle.apply(color: color),
    boldH4: AppTextStyles.boldH4.apply(color: color), 
    h4: AppTextStyles.h4.apply(color: color), 
    h5: AppTextStyles.h5.apply(color: color), 
    lightH5: AppTextStyles.lightH5.apply(color: color), 
    lightSubtitle: AppTextStyles.lightSubtitle.apply(color: color),
    subtitleLightH5: AppTextStyles.subtitleLightH5.apply(color: color),
    h6: AppTextStyles.h6.apply(color: color),
    lightH6: AppTextStyles.lightH6.apply(color: color)
  );
}
