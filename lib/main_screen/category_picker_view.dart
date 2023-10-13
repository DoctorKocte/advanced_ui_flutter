import 'package:advanced_ui/components/gradient_text.dart';
import 'package:advanced_ui/models.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:open_ui/open_ui.dart';

// figma: https://www.figma.com/file/9LZmFiZojiee3UDmFcVas5/Flutter-design?type=design&node-id=1-530&mode=design&t=CX8zZtq4sr20jzML-4

class CategoryPickerView extends StatefulWidget {
  const CategoryPickerView({
    required this.categories, 
    required this.onSelectCategories,
     super.key
  });

  final List<SaleCategory> categories;
  final Function(List<SaleType>) onSelectCategories;

  @override
  State<CategoryPickerView> createState() => _CategoryPickerViewState();
}

class _CategoryPickerViewState extends State<CategoryPickerView>
    with SingleTickerProviderStateMixin {

  List<int> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    final borderRadius = appTheme.radius;
    
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains(index)) {
                         selectedCategories.remove(index);
                      } else {
                        selectedCategories.add(index);
                      }
                      final types = selectedCategories.map((e) => widget.categories.elementAt(e).saleType).toList();
                      types.sort((a, b) => a.index.compareTo(b.index));
                      widget.onSelectCategories(types);
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        index == 0 ? 20 : 10, 
                        0,
                        widget.categories[index] == widget.categories.last ? 20 : 0,
                        0
                      ),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: selectedCategories.contains(index) ? colorScheme.gradients.mainPink : colorScheme.gradients.mainGrey),
                                width: 2,
                              ),
                              borderRadius: borderRadius.radius25
                          ),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(14, 12, index == 0 ? 14 : 25, 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    widget.categories[index].imageString,
                                    height: 22,
                                    width: 22,
                                  ),
                                  SizedBox(width: index == 0 ? 0 : 10),
                                  if (index == 0) 
                                    Container() 
                                  else 
                                    GradientText(
                                      widget.categories[index].name,
                                      style: textStyles.h5,
                                      gradient: LinearGradient(
                                        begin: const Alignment(-0.7, -1),
                                        end: const Alignment(-0.5, 0),
                                        colors: colorScheme.gradients.mainPink),
                                    )
                                ],
                              )))));
            }));
  }
}
