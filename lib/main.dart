/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-17 09:15:13
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 11:07:21
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/home_routr.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "学习项目",
      theme: ThemeData(
        primaryColor: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      // home: HomeListPage(),
      initialRoute: HomeRouter.initialRoute,
      routes: HomeRouter.routes,
    );
  }
}
