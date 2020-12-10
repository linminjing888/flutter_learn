/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-17 09:15:13
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 11:43:56
 * @Descripttion: 
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/home_routr.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '_1_widget/18_theme_share.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 分辨率
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    print("$physicalWidth - $physicalHeight");
    // 物理像素 / 逻辑像素
    final dpr = window.devicePixelRatio;
    print("dpr $dpr");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "学习项目",
      theme: ThemeData(
        primaryColor: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      // 主题
      // theme: MJShareTheme.normalTheme, //正常主题
      // darkTheme: MJShareTheme.darkTheme, //暗黑主题

      // home: HomeListPage(),
      // 路由
      initialRoute: HomeRouter.initialRoute,
      routes: HomeRouter.routes,
      // 国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("zh"),
        const Locale("en"),
      ],
    );
  }
}
