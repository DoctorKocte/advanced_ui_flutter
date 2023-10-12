import 'package:advanced_ui/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:open_ui/open_ui.dart';

class CustomGridView extends StatefulWidget {
  CustomGridView({required this.cards, super.key});

  List<SaleCard> cards;
  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView>
    with SingleTickerProviderStateMixin {
  int selectedCard = -1;


  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
  
    return AlignedGridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.cards.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                selectedCard = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: colorScheme.gradients.mainGrey),
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child:
                  Column(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 15, top: 15),
                        child: 
                        
                        Row(
                          children: [
                            Spacer(),
                            Image.asset(
                              'assets/images/heart.png',
                              width: 18,
                              height: 16,
                            )
                          ],
                        )),
                    Image.asset(
                      widget.cards[index].imageString,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(height: 18),
                    Text(
                      widget.cards[index].name,
                      //maxLines: 2,
                      textAlign: TextAlign.center,
                      style: textStyles.lightSubtitle,
                    ),
                   Padding(padding: EdgeInsets.all(10), child:
                    Container(
                        alignment: Alignment.center,
                        height: 33,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(22)),
                        ),
                        child: Text('${widget.cards[index].price} ₽')),
                   //SizedBox(height: 10)
                   )])),
            );
      },
    );
  }
}
