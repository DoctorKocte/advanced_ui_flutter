import 'package:open_ui/theme/colors/gradient_colors.dart';
import 'package:open_ui/theme/colors/text_colors.dart';
import 'package:open_ui/theme/colors/background_colors.dart';

class AppColorScheme {
  const AppColorScheme({
    required this.background,
    required this.textColor,
    required this.gradients
  });

  factory AppColorScheme.light() => AppColorScheme(
    background: BackgroundColors.light(),
    textColor: TextColors.light(),
    gradients: GradientColors.light()
  );

  final BackgroundColors background;
  final TextColors textColor;
  final GradientColors gradients;
}
