import 'package:advanced_ui/models.dart';
import 'package:advanced_ui/tab_bar_features/common_widgets/category_picker_view.dart';
import 'package:advanced_ui/tab_bar_features/common_widgets/search_view.dart';
import 'package:advanced_ui/tab_bar_features/main_screen/main_screen_view.dart';
import 'package:advanced_ui/tab_bar_features/shop_screen/shop_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

void main() {
  runApp(const MainApp());
}

  enum TabTypes {
    home, shop, favorites, cart, profile;

    int get intValue => index;
  }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
        theme: AppThemeData.light(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Center(child: MyStatefulWidget()),
          ),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
    int _selectedIndex = 0;
    int selectedCard = -1;
    int selectedCategory = -1;

    TabTypes selectedTab = TabTypes.home;

    List<HolidayCategory> holidays = [
    HolidayCategory(
        name: 'День\nРождения', 
        type: HolidayType.birthday,
        imageString: 'assets/images/holiday5.png'
    ),
    HolidayCategory(
        name: 'День Святого\nВалентина',
        type: HolidayType.valentineDay,
        imageString: 'assets/images/holiday1.png'),
    HolidayCategory(
        name: 'Международный\nЖенский день',
        type: HolidayType.womenDay,
        imageString: 'assets/images/holiday6.png'),
    HolidayCategory(
        name: 'Новый год', type: HolidayType.newYear, imageString: 'assets/images/holiday7.png'),
    HolidayCategory(
        name: 'День защитника\nотечества',
        type: HolidayType.menDay,
        imageString: 'assets/images/holiday5.png')
  ];

  List<SaleType> selectedSaleTypes = [];


  List<SaleType> allSaleTypes = [SaleType.flower, SaleType.candy, SaleType.cake];

  List<String> tabsTitles = [
    'Высокий рейтинг',
    'Быстрая доставка',
    'Недорогие'
  ];

  List<SaleCard> cards = [
    SaleCard(
        name: 'Нежный набор',
        price: 3799,
        imageString: 'assets/images/flowers1.png',
        isFavorite: false,
        saleType: SaleType.flower),
    SaleCard(
        name: 'Осенняя сказка',
        price: 5799,
        imageString: 'assets/images/flowers2.png',
        isFavorite: false,
        saleType: SaleType.flower),
    SaleCard(
        name: 'Нежный набор',
        price: 3799,
        imageString: 'assets/images/flowers3.png',
        isFavorite: false,
        saleType: SaleType.flower),
    SaleCard(
        name: 'Композиция любви',
        price: 5799,
        imageString: 'assets/images/flowers4.png',
        isFavorite: false,
        saleType: SaleType.flower),
    SaleCard(
        name: 'Сладкое счастье',
        price: 3799,
        imageString: 'assets/images/cake1.png',
        isFavorite: false,
        saleType: SaleType.cake),
    SaleCard(
        name: 'Ореховый бисквит',
        price: 5799,
        imageString: 'assets/images/cake2.png',
        isFavorite: false,
        saleType: SaleType.cake),
    SaleCard(
        name: 'Фиерия любви',
        price: 3799,
        imageString: 'assets/images/cake3.png',
        isFavorite: false,
        saleType: SaleType.cake),
    SaleCard(
        name: 'Сладкое счастье',
        price: 5799,
        imageString: 'assets/images/cake1.png',
        isFavorite: false,
        saleType: SaleType.cake),
    SaleCard(
        name: 'Конфетка 1',
        price: 599,
        imageString: 'assets/images/flowers2.png',
        isFavorite: false,
        saleType: SaleType.candy),
    SaleCard(
        name: 'Конфетка 2',
        price: 399,
        imageString: 'assets/images/flowers2.png',
        isFavorite: false,
        saleType: SaleType.candy),
    SaleCard(
        name: 'Конфетка 3',
        price: 799,
        imageString: 'assets/images/flowers2.png',
        isFavorite: false,
        saleType: SaleType.candy)
  ];


   List<SaleCategory> categories = SaleType.values.map(
     (e) => SaleCategory(name: e.title, saleType: e, imageString: e.imageString)
   ).toList();


  late TabController _tabController;

  ValueNotifier<bool> isSaleTypesUpdated = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: TabTypes.values.length);
  }

  @override
  void dispose() {
    isSaleTypesUpdated.dispose();
     _tabController.dispose();
    super.dispose();
  }

  Widget _tabItem(Widget child, {bool isSelected = false}) {
    return AnimatedContainer(
        height: 40,
        width: 40,
        duration: const Duration(milliseconds: 300),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFFCEFF2),
              ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    const icons = <Widget>[
      Icon(Icons.home_rounded),
      Icon(Icons.storefront_rounded),
      Icon(Icons.favorite),
      Icon(Icons.shopping_bag),
      Icon(Icons.person)
    ];

    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final borderRadius = appTheme.radius; 
    final shadows = appTheme.shadows; 

    return Scaffold(
        body: SafeArea(
            bottom: false,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Column(children: [
                const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: SearchView()),
                Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: CategoryPickerView(
                      categories: categories, 
                      onSelectCategories: (saleTypes) {
                        selectedSaleTypes = saleTypes;
                        isSaleTypesUpdated.value = true;
                    })
                ),
                ValueListenableBuilder(
                valueListenable: isSaleTypesUpdated,
                builder: (context, value, child) {
                  isSaleTypesUpdated.value = false; 
                  switch (TabTypes.values[_selectedIndex]) {
                    case TabTypes.home:
                      return MainScreenView(
                        holidays: holidays,
                        tabsTitles: tabsTitles, 
                        cards: cards, 
                        selectedSaleTypes: selectedSaleTypes
                      );
                    case TabTypes.shop:
                      return ShopScreenView(tabsTitles: tabsTitles);
                    case TabTypes.favorites:
                      return const Center(child: Text('ha hia'));
                    case TabTypes.cart:
                      return const Center(child: Text('ui hu'));
                    case TabTypes.profile:
                      return const Center(child: Text('h ;vlk '));
                  }
                })
              ]),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [shadows.shadow5],
                ),
                height: 80,
                child: ClipRRect(
                  borderRadius: borderRadius.radius25,
                  child:
                   ColoredBox(
                    color: colorScheme.background.primary,
                    child:
                     TabBar(
                        onTap: (tabIndex) {
                          setState(() {                          
                            _selectedIndex = tabIndex;
                            _tabController.animateTo(_selectedIndex);
                          });
                        },
                        labelColor: colorScheme.textColor.white,
                        indicator: const UnderlineTabIndicator(
                          borderSide: BorderSide.none,
                        ),
                        tabs: [
                          for (int index = 0; index < icons.length; index++)
                            _tabItem(
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: index == _selectedIndex
                                              ? colorScheme.gradients.mainPink
                                              : colorScheme.gradients.mainGrey)
                                      .createShader(bounds);
                                },
                                child: icons[index],
                              ),
                              isSelected: index == _selectedIndex,
                            ),
                        ],
                        controller: _tabController),
                  ),
                ),
              )
            ])));
  }
}
