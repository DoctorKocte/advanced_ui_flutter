import 'package:advanced_ui/models.dart';
import 'package:advanced_ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:open_ui/open_ui.dart';

class CategoryPickerView extends StatefulWidget {
  CategoryPickerView({super.key});

  @override
  State<CategoryPickerView> createState() => _CategoryPickerViewState();
}

class _CategoryPickerViewState extends State<CategoryPickerView>
    with SingleTickerProviderStateMixin {
  //int selectedCategory = -1;
  List<int> selectedCategories = [];

  List<SaleCategory> categories = [
    SaleCategory(name: '', imageString: 'assets/images/settings.png'),
    SaleCategory(name: 'Цветы', imageString: 'assets/images/flower.png'),
    SaleCategory(name: 'Конфеты', imageString: 'assets/images/candy.png'),
    SaleCategory(name: 'Торты', imageString: 'assets/images/flower.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains(index)) {
                         selectedCategories.remove(index);
                      } else {
                        selectedCategories.add(index);
                      }
                      //selectedCategory = index;
                    });
                  },
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(index == 0 ? 20 : 10, 0,
                          categories[index] == categories.last ? 20 : 0, 0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: selectedCategories.contains(index) ? colorScheme.gradients.mainPink : colorScheme.gradients.mainGrey),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(25))),
                          child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  14, 12, index == 0 ? 14 : 25, 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    categories[index].imageString,
                                    height: 22,
                                    width: 22,
                                  ),
                                  SizedBox(width: index == 0 ? 0 : 10),
                                  index == 0
                                      ? Container()
                                      : GradientText(
                                          categories[index].name,
                                          style: textStyles.h5,
                                          gradient: LinearGradient(
                                            begin: Alignment(-0.7, -1),
                                            end: Alignment(-0.5, 0),
                                            colors: colorScheme.gradients.mainPink),
                                        )
                                ],
                              )))));
            }));
  }
}
