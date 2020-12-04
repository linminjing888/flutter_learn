/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-04 14:45:21
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 16:47:49
 * @Descripttion: 
 */
import 'dart:math';

import 'package:flutter/material.dart';

class HomeAnimationPage extends StatelessWidget {
  static const String routeName = "/animation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: AnimationBody2(),
          ),
          Container(
            height: 200,
            child: AnimationBody(),
          ),
          Container(
            height: 200,
            child: GroupAnimation(),
          ),
        ],
      ),
    );
  }
}

// AnimatedBuilder 用法 不需要手动控制 status
class AnimationBody2 extends StatefulWidget {
  @override
  _AnimationBody2State createState() => _AnimationBody2State();
}

class _AnimationBody2State extends State<AnimationBody2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addStatusListener((status) {
            print("$status");
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    // curve 动画执行曲线 (动画效果)
    Animation animation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    // Tween 映射（范围大小）有很多子类可以使用
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(animation); // B
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build2");
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            if (_controller.status == AnimationStatus.forward) {
              _controller.forward();
            } else if (_controller.status == AnimationStatus.reverse) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          }
        },
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: _sizeAnimation.value,
            );
          },
        ),
      ),
    );
  }
}

// 1.基础用法-----------------------------------------
class AnimationBody extends StatefulWidget {
  @override
  _AnimationBodyState createState() => _AnimationBodyState();
}

class _AnimationBodyState extends State<AnimationBody>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  // double _size = 100; //A
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();
    // vsync：存在vsync时会防止屏幕外动画消耗不必要的资源，单个 AnimationController 的时候使用 SingleTickerProviderStateMixin，
    // 多个 AnimationController 使用 TickerProviderStateMixin。
    _controller = AnimationController(
        vsync: this,
        // lowerBound: 100, //A
        // upperBound: 200,
        duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {
          // _size = _controller.value; //A
        });
      })
      ..addStatusListener((status) {
        print("$status");
        if (status == AnimationStatus.completed) {
          //动画停止在结束处。
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画停止在开始处
          _controller.forward();
        }
      });
    // curve 动画执行曲线 (动画效果)
    Animation animation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);

    // Tween 映射（范围大小）有很多子类可以使用
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(animation); // B

    // _sizeAnimation = Tween(begin: 50.0, end: 150.0)
    //     .chain(CurveTween(curve: Curves.linear))
    //     .animate(_controller); //B 也可以这样写

    // 颜色变化 从蓝->红
    // _sizeAnimation =
    //     ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller); //C
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("build1");
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_controller.isAnimating) {
            _controller.stop();
          } else {
            if (_controller.status == AnimationStatus.forward) {
              _controller.forward();
            } else if (_controller.status == AnimationStatus.reverse) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          }
        },
        child: Icon(
          Icons.favorite,
          // size: _size, //A
          color: Colors.red,
          size: _sizeAnimation.value, //B
          // size: 100, //C
          // color: _sizeAnimation.value, //C
        ),
      ),
    );
  }
}

// 3.组合动画 --------------------------------------
class GroupAnimation extends StatefulWidget {
  @override
  _GroupAnimationState createState() => _GroupAnimationState();
}

class _GroupAnimationState extends State<GroupAnimation>
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
    _sizeAnimation = Tween(begin: 30.0, end: 150.0).animate(animation);
    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(animation);
    _rotationAnim = Tween(begin: 0.0, end: 2 * pi).animate(animation);
    _opacityAnim = Tween(begin: 0.2, end: 1.0).animate(animation);

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
    return Center(
      child: GestureDetector(
        onTap: () {
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
        },
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
    );
  }

  @override
  void dispose() {
    _container.dispose();
    super.dispose();
  }
}
