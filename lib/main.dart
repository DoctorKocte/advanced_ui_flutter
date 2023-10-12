import 'package:advanced_ui/assets/assets.gen.dart';
import 'package:advanced_ui/calendar_widget.dart';
import 'package:advanced_ui/category_picker_view.dart';
import 'package:advanced_ui/custom_grid_view.dart';
import 'package:advanced_ui/custom_horizontal_scroll.dart';
import 'package:advanced_ui/models.dart';
import 'package:advanced_ui/section_view.dart';
import 'package:advanced_ui/vertical_tab_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';
import 'package:scroll_shadow_container/scroll_shadow_container.dart';

void main() {
  runApp(const MainApp());
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

    List<SaleCard> cards = [
    SaleCard(name: 'Нежный набор', price: 3799, imageString: 'assets/images/flowers1.png', isFavorite: false, saleType: SaleType.flower),
    SaleCard(name: 'Осенняя сказка', price: 5799, imageString: 'assets/images/flowers2.png', isFavorite: false, saleType: SaleType.flower),
    SaleCard(name: 'Нежный набор', price: 3799, imageString: 'assets/images/flowers3.png', isFavorite: false, saleType: SaleType.flower),
    SaleCard(name: 'Композиция любви', price: 5799, imageString: 'assets/images/flowers4.png', isFavorite: false, saleType: SaleType.flower),
    SaleCard(name: 'Сладкое счастье', price: 3799, imageString: 'assets/images/cake1.png', isFavorite: false, saleType: SaleType.cake),
    SaleCard(name: 'Ореховый бисквит', price: 5799, imageString: 'assets/images/cake2.png', isFavorite: false, saleType: SaleType.cake),
    SaleCard(name: 'Фиерия любви', price: 3799, imageString: 'assets/images/cake3.png', isFavorite: false, saleType: SaleType.cake),
    SaleCard(name: 'Сладкое счастье', price: 5799, imageString: 'assets/images/cake1.png', isFavorite: false, saleType: SaleType.cake)
  ];

  static const List<Widget> _bodyView = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Business'),
    Text('Index 2: School'),
    Text('Index 3: School'),
    Text('Index 4: School'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
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
    List<Widget> _icons = const [
      Icon(Icons.home_rounded),
      Icon(Icons.storefront_rounded),
      Icon(Icons.favorite),
      Icon(Icons.shopping_bag),
      Icon(Icons.person)
    ];

    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;

    return Scaffold(
      extendBody: true,
        body: SafeArea(bottom: false,
            child:
          Stack(alignment: Alignment.bottomCenter,
            children: [
            Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(children: [
                Flexible(
                    child:
                    Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                          colors: colorScheme.gradients.mainPink)),
                  child: SearchBar(
                    surfaceTintColor:
                        MaterialStateProperty.all(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {}, icon: Assets.images.search.image()),
              ])),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:  CategoryPickerView()
          ),

 Expanded(child:
          ScrollShadowContainer(
  elevation: MaterialElevation.the2dp,
  child: 
         
          ListView(children: [
          SectionView(
              sectionTitle: 'Выберите повод',
              sectionWidgetInsets: EdgeInsets.only(top: 10),
              sectionWidget: CustomHorizontalScrollView(height: 100)),
          SectionView(
              sectionTitle: 'Выберите день праздника',
              sectionWidgetInsets: EdgeInsets.fromLTRB(20, 16, 20, 0),
              sectionWidget: CalendarWidget()),
          //SizedBox(height: 25),
          Row(children: [
           IntrinsicHeight(child:
            SizedBox(width: 40, child:
           // Column(children: [
             // SizedBox(height: 10,),
          VerticalTabBar()
          //])
          //, Spacer()])
           )),
          SizedBox(width: 6),
          Flexible(child: SectionView(
            sectionTitle: 'Цветы',
            sectionWidgetInsets: EdgeInsets.fromLTRB(20, 20, 20, 0),
            sectionWidget: CustomGridView(cards: cards.where((element) => element.saleType == SaleType.flower).toList())
          ))
          ]),
          SizedBox(height: 60)
        ])
        ))
        ]),

         Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 7),
            ],
          ),
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: Color(0xFFFEFCFD),
              child: TabBar(
                  onTap: (tabIndex) {
                    setState(() {
                      _selectedIndex = tabIndex;
                    });
                  },
                  labelColor: Colors.white,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide.none,
                  ),
                  tabs: [
                    for (int i = 0; i < _icons.length; i++)
                      _tabItem(
                        ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: i == _selectedIndex ? colorScheme.gradients.mainPink : colorScheme.gradients.mainGrey
                                    ).createShader(bounds);
                                },
                                child: _icons[i],
                              ),
                        isSelected: i == _selectedIndex,
                      ),
                  ],
                  controller: _tabController),
            ),
          ),
  )])));
  }
}
