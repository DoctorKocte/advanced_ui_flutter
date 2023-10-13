import 'package:advanced_ui/components/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:open_ui/open_ui.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({
    required this.dateTitle, 
    required this.onTap, 
    super.key
  });

  final String dateTitle; 
  final void Function()? onTap;

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();

}

class _CalendarWidgetState extends State<CalendarWidget>
    with SingleTickerProviderStateMixin {
      
  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final borderRadius = appTheme.radius;

    return Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: GradientBoxBorder(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: colorScheme.gradients.mainGrey),
              width: 2,
            ),
            borderRadius: borderRadius.radius22
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) {
                return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: colorScheme.gradients.mainPink)
                    .createShader(bounds);
              },
              child: const Icon(Icons.calendar_month_outlined),
            ),
            const SizedBox(width: 15),
            GradientText(
              widget.dateTitle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: const Alignment(-0.3, 0),
                colors: colorScheme.gradients.mainPink),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ));
  }
}
