import 'package:advanced_ui/components/custom_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class VerticalTabBar extends StatefulWidget {
  const VerticalTabBar({required this.tabsTitles, super.key});

  final List<String> tabsTitles;

  @override
  _VerticalTabBarState createState() => _VerticalTabBarState();
}

class _VerticalTabBarState extends State<VerticalTabBar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabsTitles.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppThemeData.light();
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;

    return SizedBox(
        width: 36,
        child: RotatedBox(
          quarterTurns: 1,
          child: TabBar(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              indicator: CustomTabIndicator(
                  gradient: colorScheme.gradients.mainPink,
                  radius: 5,
                  indicatorHeight: 5
              ),
              onTap: (tabIndex) {
                _selectedIndex = tabIndex;
              },
              controller: _tabController,
              tabs: [
                for (int index = 0; index < widget.tabsTitles.length; index++)
                  getItem(
                      child: ShaderMask(
                          blendMode: BlendMode.srcIn,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                                    begin: const Alignment(-1, -0.75),
                                    end: const Alignment(-0.75, 1),
                                    colors: index == _selectedIndex
                                        ? colorScheme.gradients.mainPink
                                        : [colorScheme.textColor.secondary, colorScheme.textColor.secondary]
                            ).createShader(bounds);
                          },
                          child: Text(
                            widget.tabsTitles[index],
                            style: textStyles.h5,
                          )))
              ]),
        ));
  }

  Widget getItem({required Widget child}) {
    return RotatedBox(
        quarterTurns: -1,
        child: Row(children: [
          const SizedBox(width: 8),
          RotatedBox(quarterTurns: -1, child: child)
        ]));
  }
}
