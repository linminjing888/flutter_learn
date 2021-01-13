import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressIndicator extends StatelessWidget {
  // 粗细
  final double strokeWidth;
  // 半径
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

  CircularProgressIndicator(
      {this.strokeWidth = 5.0,
      @required this.radius,
      @required this.colors,
      this.stops,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.totalAngle = 2 * pi,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  CircularProgressPainter(this.progress);

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;
    Rect rect = Rect.fromLTWH(0, 0, radius * 2, radius * 2);

    double _offset = asin(10 / (radius * 2 - 10));
    // 渐变色
    Gradient gradient = SweepGradient(
        startAngle: -pi / 2,
        endAngle: pi * 2 * progress,
        colors: [Colors.red, Colors.orange]);
    _paint.shader = gradient.createShader(rect);

    canvas.save();
    canvas.translate(0.0, size.height);
    canvas.rotate(-pi / 2);

    canvas.drawArc(rect, 0, pi * 2 * progress, false, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
