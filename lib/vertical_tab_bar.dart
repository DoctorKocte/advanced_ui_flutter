import 'package:advanced_ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class VerticalTabBar extends StatefulWidget {
  @override
  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  List<String> tabsTitles = [
    'Высокий рейтинг',
    'Быстрая доставка',
    'Недорогие'
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;

    return SizedBox(
      width: 36,
      child: RotatedBox(
            quarterTurns: 1,
            child: //Row(children: [
            TabBar(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
                indicator: CustomTabIndicator(
                    gradient: colorScheme.gradients.mainPink,
                    radius: 5,
                    indicatorHeight: 5),
                onTap: (tabIndex) {
                  _selectedIndex = tabIndex;
                },
                controller: _tabController,
                tabs: [
                  for (int i = 0; i < tabsTitles.length; i++)
                    getItem(child:
                       ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  begin: Alignment(-1, -0.75),
                                  end: Alignment(-0.75, 1),
                                  colors: i == _selectedIndex 
                                   ? colorScheme.gradients.mainPink 
                                   : [colorScheme.textColor.secondary, colorScheme.textColor.secondary]
                              ).createShader(bounds);
                        },
                        child: Text(tabsTitles[i], style: textStyles.h5,)
                       ))
                ]),
                //IntrinsicHeight(child: SizedBox(width: 10, child: Spacer(),))              
             
                )
    );
  }

  Widget getItem({required Widget child}) {
    return RotatedBox(
        quarterTurns: -1,
        child: Row(children: [
          SizedBox(width: 8),
          RotatedBox(quarterTurns: -1, child: child)
        ])
        );
  }
}

class CustomTabIndicator extends Decoration {
  final double radius;
  final List<Color> gradient;

  final double indicatorHeight;

  const CustomTabIndicator(
      {required this.gradient, this.radius = 8, this.indicatorHeight = 4});

  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      radius,
      gradient,
      indicatorHeight,
    );
  }
}

class _CustomPainter extends BoxPainter {
  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.radius,
    this.gradient,
    this.indicatorHeight,
  ) : super(onChanged);

  final CustomTabIndicator decoration;
  final double radius;
  final List<Color> gradient;
  final double indicatorHeight;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos =
        offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.shader = LinearGradient(colors: gradient).createShader(Rect.largest);

    RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width / 3,
        height: indicatorHeight,
      ),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}
