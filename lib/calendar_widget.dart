import 'package:advanced_ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:open_ui/open_ui.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;

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
            borderRadius: BorderRadius.all(Radius.circular(22))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: colorScheme.gradients.mainPink)
                    .createShader(bounds);
              },
              child: Icon(Icons.calendar_month_outlined),
            ),
            SizedBox(
              width: 15,
            ),
            GradientText(
              '28 марта',
              gradient: LinearGradient(
                begin: Alignment(-1, -1),
                end: Alignment(-0.3, 0),
                colors: colorScheme.gradients.mainPink),
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ));
  }
}
