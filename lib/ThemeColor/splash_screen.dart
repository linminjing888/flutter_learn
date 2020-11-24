import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/ThemeColor/theme_color_setting.dart';

/// Author: lin minjing
/// Date: 2020-11-19 15:28:17
/// Descripttion: 
class SplashScreen extends StatefulWidget {
  static const String routeName = "/screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _curveAnim;
  double _factor = 0.0;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() {
            setState(() {
              _factor = _curveAnim.value;
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                _buildSettingPage();
              });
            }
          })
          ..forward();
    _curveAnim = CurvedAnimation(parent: _controller, curve: Curves.linear);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLogo(),
            _buildText(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, -2), end: const Offset(0, 0))
              .animate(_controller),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: pi).animate(_controller),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

  Widget _buildText() {
    final shadowStyle = TextStyle(
      fontSize: 45,
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.bold,
      shadows: [
        const Shadow(
          color: Colors.grey,
          offset: Offset(1.0, 1.0),
          blurRadius: 1.0,
        )
      ],
    );

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 600),
      opacity: _factor,
      child: SlideTransition(
        position:
            Tween(begin: Offset(0, 3), end: Offset(0, 1)).animate(_controller),
        child: Text(
          'Flutter Learn',
          style: shadowStyle,
        ),
      ),
    );
  }

  void _buildSettingPage() {
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      // Navigator.of(context)
      //     .pushReplacementNamed(ThemeColorSetting.routeName);

      // 渐隐渐出
      Navigator.of(context).push(
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: ThemeColorSetting(),
            );
          },
        ),
      );
    });
  }
}
