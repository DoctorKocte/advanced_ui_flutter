import 'package:advanced_ui/assets/assets.gen.dart';
import 'package:advanced_ui/models.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ShopCard extends StatefulWidget {
  const ShopCard({required this.shopModel, super.key});

  final ShopModel shopModel;

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
    final shadows = appTheme.shadows;

    return DecoratedBox(
      decoration: BoxDecoration(
          boxShadow: [shadows.shadow25],
          color: colorScheme.background.primary,
          borderRadius: borderRadius.radius22),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            height: 175,
            decoration: BoxDecoration(borderRadius: borderRadius.radius22BottomRight),
            child: Image.asset(
            widget.shopModel.imageString,
            fit: BoxFit.fill,
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 13, 20, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.shopModel.name, style: textStyles.boldSubtitle),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      _iconTitleRow(Assets.images.star.image(),
                          widget.shopModel.rate.toString(),
                          widget.shopModel.rate >= 4
                      ),
                      const SizedBox(width: 8),
                      _iconTitleRow(Assets.images.cart.image(),
                          '${widget.shopModel.purchasesCount}+',
                          widget.shopModel.purchasesCount >= 1000
                      ),
                      const SizedBox(width: 10),
                      _iconTitleRow(Assets.images.comment.image(),
                          '${widget.shopModel.commentsCount}+',
                          widget.shopModel.commentsCount >= 100
                      ),
                      const Spacer()
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}

Widget _iconTitleRow(Image image, String title, bool isRateHigh) {
  final appTheme = AppThemeData.light();
  final textStyles = appTheme.textStyles;
  final colorScheme = appTheme.colorScheme;

  return Row(children: [
    SizedBox(
      width: 14,
      height: 14,
      child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isRateHigh
                        ? colorScheme.gradients.mainPink
                        : colorScheme.gradients.mainGrey)
                .createShader(bounds);
          },
          child: image),
    ),
    const SizedBox(width: 5),
    Text(title, style: textStyles.subtitleLightH5)
  ]);
}
