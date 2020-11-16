import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_learn/_6_ScreenFit/screen_fit_share.dart';
import '../_6_ScreenFit/Extension/double_extension.dart';
import '../_6_ScreenFit/Extension/int_extension.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 分辨率
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    print("$physicalWidth - $physicalHeight");
    final dpr = window.devicePixelRatio;
    print("dpr $dpr");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "屏幕适配",
      home: MJMainTranPage(),
    );
  }
}

class MJMainTranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 屏幕宽高
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    print("$screenWidth - $screenHeight");
    final statusBarHeight = MediaQuery.of(context).padding.top;
    print("状态栏高度 $statusBarHeight");
    final bottomHeight = MediaQuery.of(context).padding.bottom;
    print("底部高度 $bottomHeight");

    MJSizeFit.initialize(context);

    // 局部主题
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Container(
            width: 200.px,
            height: 400.rpx,
            color: Colors.orange,
            alignment: Alignment.center,
            child: Text(
              "Hello,你好啊",
              style:
                  TextStyle(fontSize: MJSizeFit.setPx(25), color: Colors.white),
            )),
      ),
    );
  }
}
