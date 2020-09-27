import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "动画",
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

  @override
  void initState() {
    super.initState();

    // 1.创建 AnimationController
    _container = AnimationController(
      vsync: this,
      // lowerBound: 50,
      // upperBound: 150,
      duration: Duration(seconds: 1),
    );

    // 2.curve 动画效果
    Animation animation = CurvedAnimation(
      parent: _container,
      curve: Curves.linear,
    );
    // 3.Tween 范围大小
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(animation);

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
        child: MJAnimation(_sizeAnimation),
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

class MJAnimation extends AnimatedWidget {
  MJAnimation(Animation ani) : super(listenable: ani);
  @override
  Widget build(BuildContext context) {
    Animation anim = listenable;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: anim.value,
    );
  }
}
