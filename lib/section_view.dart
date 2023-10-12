import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class SectionView extends StatelessWidget {
  SectionView({
    required this.sectionTitle,
    required this.sectionWidgetInsets,
    required this.sectionWidget,
    super.key
  });

  String sectionTitle;
  EdgeInsets sectionWidgetInsets;
  Widget sectionWidget;

    @override
  Widget build(BuildContext context) {

    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Padding(padding: EdgeInsets.only(left: 20), child:
          Text(
            sectionTitle,
            style: textStyles.title.copyWith(color: colorScheme.textColor.primary)
          )),
          Padding(padding: sectionWidgetInsets, child: 
              sectionWidget
          )
    ]);
  }
}
