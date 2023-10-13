import 'package:advanced_ui/models.dart';
import 'package:advanced_ui/tab_bar_features/common_widgets/vertical_tab_bar.dart';
import 'package:advanced_ui/tab_bar_features/main_screen/widgets/calendar_widget.dart';
import 'package:advanced_ui/tab_bar_features/main_screen/widgets/custom_grid_view.dart';
import 'package:advanced_ui/tab_bar_features/main_screen/widgets/custom_horizontal_scroll.dart';
import 'package:advanced_ui/tab_bar_features/main_screen/widgets/section_view.dart';
import 'package:flutter/material.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({
      required this.holidays,
      required this.tabsTitles,
      required this.cards,
      required this.selectedSaleTypes,
      super.key
  });

  final List<HolidayCategory> holidays;
  final List<String> tabsTitles;
  final List<SaleCard> cards;
  final List<SaleType> selectedSaleTypes;

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView>
    with SingleTickerProviderStateMixin {

  List<int> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ScrollShadowContainer(
            child: ListView(children: [
      SectionView(
          sectionTitle: 'Выберите повод',
          sectionWidgetInsets: const EdgeInsets.only(top: 10),
          sectionWidget: CustomHorizontalScrollView(
            height: 100,
            holidays: widget.holidays,
            onSelectHoliday: (holidayType) {},
          )),
      const SizedBox(height: 20),
      SectionView(
          sectionTitle: 'Выберите день праздника',
          sectionWidgetInsets: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          sectionWidget: CalendarWidget(
            dateTitle: '28 марта',
            onTap: () {
              // логика нажатия на календарь
            },
          )),
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
        Flexible(
            child: Column(children: [
          const SizedBox(height: 25),
          for (final saleType in widget.selectedSaleTypes.isNotEmpty
              ? widget.selectedSaleTypes
              : [SaleType.flower, SaleType.candy, SaleType.cake])
            if (widget.cards
                .where((element) => element.saleType == saleType)
                .toList()
                .isNotEmpty)
              SectionView(
                  sectionTitle: saleType.title,
                  sectionWidgetInsets: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                  sectionWidget: CustomGridView(
                    cards: widget.cards
                        .where((element) => element.saleType == saleType)
                        .toList(),
                    onSelectCards: (selectedCards) {
                      // логика на апдейт карт
                    },
                  )),
          const SizedBox(height: 30),
        ])),
      ]),
    ])));
  }
}
