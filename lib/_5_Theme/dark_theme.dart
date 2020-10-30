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
      title: "主题",
      home: MJMainTranPage(),
      theme: MJShareTheme.normalTheme,
      darkTheme: MJShareTheme.darkTheme,
    );
  }
}

class MJMainTranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 局部主题
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
