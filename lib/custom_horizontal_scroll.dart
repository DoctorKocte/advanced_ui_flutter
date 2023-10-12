import 'package:advanced_ui/models.dart';
import 'package:advanced_ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class CustomHorizontalScrollView extends StatefulWidget {
  CustomHorizontalScrollView({
    required this.height,
     super.key
  });

  double height;
  @override
  State<CustomHorizontalScrollView> createState() => _CustomHorizontalScrollViewState();
}

class _CustomHorizontalScrollViewState extends State<CustomHorizontalScrollView>  
with SingleTickerProviderStateMixin {
  int selectedCard = -1;

  List<SaleCategory> categories = [
    SaleCategory(name: 'День\nРождения', imageString: 'assets/images/holiday1.png'),
    SaleCategory(name: 'День Святого\nВалентина', imageString: 'assets/images/holiday5.png'),
    SaleCategory(name: 'Международный\nЖенский день', imageString: 'assets/images/holiday6.png'),
    SaleCategory(name: 'Новый год', imageString: 'assets/images/holiday7.png'),
    SaleCategory(name: 'День защитника\nотечества', imageString: 'assets/images/holiday5.png')
  ];

  @override
  Widget build(BuildContext context) {
     final appTheme = AppThemeData.light();
  final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    return 
    Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 22),
              child: SizedBox(
                  height: widget.height,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCard = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: selectedCard == index
                                        ? colorScheme.gradients.mainPink
                                        : [
                                            Colors.transparent,
                                            Colors.transparent
                                          ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(22))),
                            child: Padding(
                                padding: EdgeInsets.fromLTRB(6, 10, 6, 8),
                                child: Container(
                                  child: Column(children: [   
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: Image.asset(categories[index].imageString, fit: BoxFit.scaleDown,).image),  
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Flexible(child: 
                                    Text(categories[index].name,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: textStyles.h6.apply(color: selectedCard == index
                                            ? Colors.white
                                            : Colors.black)
                                      // TextStyle(
                                      //   fontSize: 10,
                                      //   color: selectedCard == index
                                      //       ? Colors.white
                                      //       : Colors.black,
                                      //   fontWeight: FontWeight.w500,
                                      // ),
                                    )),
                                  ]),
                                )
                                ),
                          ),
                        );
                      })
                      )
     );
  }
}
