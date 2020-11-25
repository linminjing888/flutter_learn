/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-25 10:11:23
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-25 10:11:23
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/Search/app_search_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "搜索框",
      home: SearchPage(),
    );
  }
}
