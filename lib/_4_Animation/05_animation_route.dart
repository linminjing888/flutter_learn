import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_learn/_4_Animation/animation_detail_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "转场动画",
      home: MJMainTranPage(),
    );
  }
}

class MJMainTranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("转场动画"),
      ),
      body: Center(
        child: Text("首页"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.account_box),
          onPressed: () {
            // 从下往上弹出
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (ctx) {
            //     return AnimationDetailPage();
            //   },
            //   fullscreenDialog: true,
            // ));
            // 渐隐渐出
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(seconds: 2),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: AnimationDetailPage(),
                  );
                },
              ),
            );
          }),
    );
  }
}
