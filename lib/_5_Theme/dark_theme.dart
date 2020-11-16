import 'package:flutter/material.dart';
import 'package:flutter_learn/_5_Theme/theme_share.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "暗黑模式",
      home: MJMainTranPage(),
      theme: MJShareTheme.normalTheme, //正常主题
      darkTheme: MJShareTheme.darkTheme, //暗黑主题
    );
  }
}

class MJMainTranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Text("Hello,你好啊"),
      ),
    );
  }
}
