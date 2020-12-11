import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/17_screen_fit_share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Extension/double_extension.dart';
import '../Extension/int_extension.dart';

class HomeScreenFitPage extends StatelessWidget {
  static const String routeName = "/ScreenFit";

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

    MJSizeFit.initialize(context); // 初始化，一般放在MaterialApp下主页中

    // 局部主题
    return Scaffold(
      appBar: AppBar(
        title: Text("ScreenFit"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200.px,
              height: 400.rpx,
              color: Colors.orange,
              alignment: Alignment.center,
              child: Text(
                "Hello,你好啊",
                style: TextStyle(
                    fontSize: MJSizeFit.setPx(25), color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            // flutter_screenutil
            Container(
                width: 300.w,
                height: 300.w,
                color: Colors.orange,
                alignment: Alignment.center,
                child: Text(
                  "Hello,你好啊",
                  style: TextStyle(fontSize: 40.sp, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
