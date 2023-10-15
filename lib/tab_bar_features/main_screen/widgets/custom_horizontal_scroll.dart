import 'package:advanced_ui/models.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

// figma: https://www.figma.com/file/9LZmFiZojiee3UDmFcVas5/Flutter-design?type=design&node-id=1-541&mode=design&t=CX8zZtq4sr20jzML-4

class CustomHorizontalScrollView extends StatefulWidget {
  CustomHorizontalScrollView({required this.height, required this.holidays, required this.onSelectHoliday, super.key});

  final double height;
  final List<HolidayCategory> holidays;
  final Function(HolidayType) onSelectHoliday;
  // иначе слетает выделение
  // хотя при переключении категории в пикекре сверху все равно слетает, нужно где-то хранить
  int selectedCard = -1;

  @override
  State<CustomHorizontalScrollView> createState() =>
      _CustomHorizontalScrollViewState();
}

class _CustomHorizontalScrollViewState extends State<CustomHorizontalScrollView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    final borderRadius = appTheme.radius;

    return SizedBox(
            height: widget.height,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.holidays.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.selectedCard == index
                            ? widget.selectedCard = -1
                            : widget.selectedCard = index;
                      });
                      widget.onSelectHoliday(widget.holidays[index].type);
                    },
                    // нужно ли отдельным компонентом?
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 20 : 8,
                        right: widget.holidays[index] == widget.holidays.last ? 20 : 0
                      ),
                      decoration: widget.selectedCard == index 
                      ? BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: colorScheme.gradients.mainPink
                          ),
                          borderRadius: borderRadius.radius22
                      )
                      : const BoxDecoration(),
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 10, 6, 8),
                          child: Column(children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: Image.asset(
                                  widget.holidays[index].imageString
                                ).image),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Flexible(
                                child: Text(widget.holidays[index].name,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: widget.selectedCard == index
                                     ? textStyles.h6.apply(color: colorScheme.textColor.white)
                                     : textStyles.lightH6.apply(color: colorScheme.textColor.primary)
                                  )),
                          ])),
                    ),
                  );
                }));
  }
}
