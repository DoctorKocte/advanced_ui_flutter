import 'package:advanced_ui/assets/assets.gen.dart';
import 'package:advanced_ui/models.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

// figma: https://www.figma.com/file/9LZmFiZojiee3UDmFcVas5/Flutter-design?type=design&node-id=1-492&mode=design&t=CX8zZtq4sr20jzML-0

class SaleCardView extends StatefulWidget {
  const SaleCardView({required this.isSelected, required this.card, super.key});

  final bool isSelected;
  final SaleCard card;

  @override
  _SaleCardViewState createState() => _SaleCardViewState();
}

class _SaleCardViewState extends State<SaleCardView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    final borderRaduis = appTheme.radius;
    final shadows = appTheme.shadows;

    return DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.background.grey,
          borderRadius: borderRaduis.radius22
        ),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: Row(
                children: [
                  const Spacer(),
                  if (widget.isSelected) 
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) {
                          return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: colorScheme.gradients.mainPink
                          ).createShader(bounds);
                        },
                        child: Assets.images.fillHeart.image(width: 18, height: 16)
                      ) 
                  else Assets.images.heart.image(width: 18, height: 16)
                ],
              )),
          // как правильно? торты немного не так выглядят
          Image.asset(widget.card.imageString, width: 120, height: 80),
          const SizedBox(height: 18),
          Text(
            widget.card.name,
            textAlign: TextAlign.center,
            style: textStyles.lightSubtitle,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                alignment: Alignment.center,
                height: 33,
                decoration: BoxDecoration(
                  color: colorScheme.background.primary,
                  boxShadow: [shadows.shadow15],
                  borderRadius: borderRaduis.radius22,
                ),
                child: Text(
                  '${widget.card.price} ₽',
                   style: textStyles.lightH5
                )
            ),
          )
        ]));
  }
}
