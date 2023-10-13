import 'package:advanced_ui/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final borderRadius = appTheme.radius;

    return Row(children: [
      Flexible(
          child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: borderRadius.radius25,
            gradient: LinearGradient(colors: colorScheme.gradients.mainPink)),
        child: SearchBar(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
      )),
      const SizedBox(width: 20),
      IconButton(onPressed: () {}, icon: Assets.images.search.image()),
    ]);
  }
}
