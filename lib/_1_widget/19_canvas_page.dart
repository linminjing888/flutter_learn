/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2021-01-11 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2021-01-11 14:40:11
 * @Descripttion: 自绘动画
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/19_canvas_circle.dart';

class HomeCanvasPage extends StatelessWidget {
  static const String routeName = "/canvas";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canvas"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 160,
              height: 160,
              color: Colors.amber,
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 0.8),
                duration: Duration(seconds: 3),
                builder: (BuildContext context, double value, Widget child) {
                  return CustomPaint(
                    painter: CircleProgressPainter(value),
                    child: Center(
                      child: Text("${(value * 100).floor()}%"),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 300,
            height: 30,
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 3),
              builder: (BuildContext context, double value, Widget child) {
                return CustomPaint(
                  painter: LineProgressPainter(value),
                  child: Center(
                    child: Text("${(value * 100).floor()}%"),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
            child: Center(
              child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 0.75),
                duration: Duration(seconds: 3),
                builder: (BuildContext context, double value, Widget child) {
                  return MJCircularProgressIndicator(
                    radius: 80,
                    // colors: [Colors.blue],
                    value: value,
                    colors: [Colors.red, Colors.orange, Colors.red],
                    // totalAngle: 1.5 * pi,
                  );
                },
              ),
            ),
          ),

          // MJCircularProgressIndicator(
          //   colors: [Colors.blue[700], Colors.blue[300]],
          //   radius: 80.0,
          //   strokeWidth: 10.0,
          //   value: 0.8,
          //   strokeCapRound: true,
          // ),
        ],
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  CircleProgressPainter(this.progress);

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;
    Rect rect = Rect.fromLTWH(5, 5, radius * 2 - 10, radius * 2 - 10);

    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    double _start = asin(10 / (radius * 2 - 10));

    // 渐变色
    Gradient gradient = SweepGradient(
        startAngle: -pi / 2,
        endAngle: pi * 2 * progress,
        colors: [Colors.red, Colors.orange]);
    _paint.shader = gradient.createShader(rect);

    canvas.save();
    canvas.translate(0.0, size.height);
    canvas.rotate(-pi / 2);

    canvas.drawArc(rect, _start, pi * 2 * progress, false, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LineProgressPainter extends CustomPainter {
  final double progress;
  LineProgressPainter(this.progress);

  Paint _paint0 = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = Colors.grey;

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = Colors.blue
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(0.0, size.height / 2),
        Offset(size.width, size.height / 2), _paint0);

    canvas.drawLine(Offset(0.0, size.height / 2),
        Offset(size.width * progress, size.height / 2), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
