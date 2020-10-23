import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // 亮度
        brightness: Brightness.light,
        // primaryColor/accentColor的结合体
        primarySwatch: Colors.red,
        // 导航/底部TabBar
        primaryColor: Colors.blue,
        // FloatingActionButton/按钮颜色
        accentColor: Colors.orange,
        // 按钮主题
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          minWidth: 50,
          height: 30,
        ),
        // 文本主题
        textTheme: TextTheme(
          bodyText2: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hello,你好啊"),
            RaisedButton(child: Text("123"), onPressed: () {})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_time), onPressed: () {}),
    );
  }
}
