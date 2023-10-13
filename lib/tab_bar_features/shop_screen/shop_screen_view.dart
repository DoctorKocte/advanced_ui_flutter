import 'package:advanced_ui/tab_bar_features/common_widgets/vertical_tab_bar.dart';
import 'package:advanced_ui/tab_bar_features/shop_screen/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

class ShopScreenView extends StatefulWidget {
  const ShopScreenView({
    required this.tabsTitles,
    super.key
  });

  final List<String> tabsTitles;

  @override
  State<ShopScreenView> createState() => _ShopScreenViewState();
}

class _ShopScreenViewState extends State<ShopScreenView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ScrollShadowContainer(
            child: ListView(children: [
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IntrinsicHeight(
            child: SizedBox(
                width: 40,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Expanded(
                          child: VerticalTabBar(tabsTitles: widget.tabsTitles)),
                      const Spacer()
                    ]))),
        const SizedBox(width: 6),
        Expanded(child: 
        ShopCard())



      ]),
    ])));
  }
}
