import 'package:advanced_ui/components/sale_card.dart';
import 'package:advanced_ui/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// figma: https://www.figma.com/file/9LZmFiZojiee3UDmFcVas5/Flutter-design?type=design&node-id=1-1264&mode=design&t=CX8zZtq4sr20jzML-4

class CustomGridView extends StatefulWidget {
  const CustomGridView({required this.cards, required this.onSelectCards, super.key});

  final List<SaleCard> cards;
  final Function(List<SaleCard>) onSelectCards;
  
  @override
  State<CustomGridView> createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView>
    with SingleTickerProviderStateMixin {

  final List<int> selectedCards = [];

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.cards.length,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              setState(() {
                selectedCards.contains(index)
                ? selectedCards.remove(index)
                : selectedCards.add(index);
              });
              final favoritesCards = selectedCards.map((e) => widget.cards.elementAt(e)).toList();
              widget.onSelectCards(favoritesCards);
            },
            child: SaleCardView(
              isSelected: selectedCards.contains(index), 
              card: widget.cards[index]
            )
        );
      },
    );
  }
}
