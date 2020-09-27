import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "交织动画",
      home: MJTestPage(),
    );
  }
}

class MJTestPage extends StatefulWidget {
  @override
  _MJTestPageState createState() => _MJTestPageState();
}

class _MJTestPageState extends State<MJTestPage>
    with SingleTickerProviderStateMixin {
  AnimationController _container;
  Animation _sizeAnimation;
  Animation _colorAnimation;
  Animation _rotationAnim;
  Animation _opacityAnim;

  @override
  void initState() {
    super.initState();

    // 1.创建 AnimationController
    _container = AnimationController(
      vsync: this,
      // lowerBound: 50,
      // upperBound: 150,
      duration: Duration(seconds: 2),
    );

    // 2.curve 动画效果
    Animation animation = CurvedAnimation(
      parent: _container,
      curve: Curves.linear,
    );
    // 3.Tween 范围大小
    _sizeAnimation = Tween(begin: 10.0, end: 130.0).animate(_container);
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_container);
    _rotationAnim = Tween(begin: 0.0, end: 2 * pi).animate(_container);
    _opacityAnim = Tween(begin: 0.2, end: 1.0).animate(_container);

    _container.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _container.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _container.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnim.value, //透明度
              child: Transform(
                transform: Matrix4.rotationZ(_rotationAnim.value), //旋转角度
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnimation.value, //尺寸大小
                  height: _sizeAnimation.value,
                  color: _colorAnimation.value, //颜色
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            if (_container.isAnimating) {
              _container.stop();
            } else {
              if (_container.status == AnimationStatus.forward) {
                _container.forward();
              } else if (_container.status == AnimationStatus.reverse) {
                _container.reverse();
              } else {
                _container.forward();
              }
            }
          }),
    );
  }

  @override
  void dispose() {
    _container.dispose();
    super.dispose();
  }
}
