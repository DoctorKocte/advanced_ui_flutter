import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  const CustomTabIndicator(
      {required this.gradient, this.radius = 8, this.indicatorHeight = 4});

  final double radius;
  final List<Color> gradient;
  final double indicatorHeight;

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

    final paint = Paint();
    final xAxisPos = offset.dx + configuration.size!.width / 2;
    final yAxisPos = offset.dy + configuration.size!.height - indicatorHeight / 2;
    paint.shader = LinearGradient(colors: gradient).createShader(Rect.largest);

    final fullRect = RRect.fromRectAndCorners(
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
