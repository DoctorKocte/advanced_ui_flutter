import 'package:advanced_ui/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({
    super.key
  });

  @override
  State<ShopCard> createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard>
    with SingleTickerProviderStateMixin {

   

 @override
  Widget build(BuildContext context) {
     final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final borderRadius = appTheme.radius;
    final textStyles = appTheme.textStyles;

    return Card(
      child: Expanded(child: Column(
        children: [
          Container(
            height: 248,
            decoration: BoxDecoration(
              borderRadius: borderRadius.radius22
            ),
            child: Image.asset('assets/images/shop1.png'),
          ),
          Padding(padding: EdgeInsets.all(20), child:
          Expanded(child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('shop shop', style: textStyles.boldSubtitle),
               Row(children: [
                Row(children: [
                    Assets.images.star.image(height: 14, width: 14),
                    Text('4.9')
                ]),
                Row(children: [
                    Assets.images.cart.image(height: 14, width: 14),
                    Text('6000+')
                ]),
                Row(children: [
                    Assets.images.comment.image(height: 14, width: 14),
                    Text('700+')
                ]),
                Spacer()
              ],)
            ],
          )))
        ],
      )),
    );
  }
}
