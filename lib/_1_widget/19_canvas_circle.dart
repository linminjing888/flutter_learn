import 'dart:math';

import 'package:flutter/material.dart';

class MJCircularProgressIndicator extends StatelessWidget {
  /// 粗细
  final double strokeWidth;

  /// 半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double> stops;

  MJCircularProgressIndicator({
    this.strokeWidth = 6.0,
    @required this.radius,
    @required this.colors,
    this.strokeCapRound = true,
    this.value,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    var _colors = colors;
    if (colors.length == 1) {
      _colors = [colors[0], colors[0]];
    }

    // return CustomPaint(
    //   painter: CircularProgressPainter(
    //     strokeWidth: strokeWidth,
    //     radius: radius,
    //     strokeCapRound: strokeCapRound,
    //     value: value,
    //     backgroundColor: backgroundColor,
    //     totalAngle: totalAngle,
    //     colors: _colors,
    //     stops: stops,
    //   ),
    //   child: Center(child: Text("sss")),
    // );

    return Transform.translate(
      offset: Offset(-radius, radius),
      child: Transform.rotate(
        angle: -pi / 2.0,
        child: CustomPaint(
          painter: CircularProgressPainter(
            strokeWidth: strokeWidth,
            radius: radius,
            strokeCapRound: strokeCapRound,
            value: value,
            backgroundColor: backgroundColor,
            totalAngle: totalAngle,
            colors: _colors,
            stops: stops,
          ),
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  /// 粗细
  final double strokeWidth;

  /// 半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度，取值范围 [0.0-1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条的总弧度，2*PI为整圆，小于2*PI则不是整圆
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色的终止点，对应colors属性
  final List<double> stops;

  CircularProgressPainter({
    this.strokeWidth = 6.0,
    @required this.radius,
    @required this.colors,
    this.strokeCapRound = true,
    this.value,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
    this.stops,
  });

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double _offset = strokeWidth / 2.0;
    double _value = (value ?? 0.0).clamp(0.0, 1.0) * totalAngle;
    double _start = 0.0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }
    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..isAntiAlias = true
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt;

    // canvas.save();
    // canvas.translate(0.0, size.height);
    // canvas.rotate(-pi / 2);
    // canvas.restore();

    if (backgroundColor != Colors.transparent) {
      _paint.color = backgroundColor;
      canvas.drawArc(rect, _start, totalAngle, false, _paint);
    }

    if (_value > 0) {
      Gradient gradient = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      );
      _paint.shader = gradient.createShader(rect);
      canvas.drawArc(rect, _start, _value, false, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
