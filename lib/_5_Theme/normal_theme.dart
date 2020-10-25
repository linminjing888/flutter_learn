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
    // 局部主题
    return Theme(
      // data: ThemeData(),
      // 很多时候并不想完全使用一个新的主题，而且在之前的主题基础之上进行修改
      data: Theme.of(context).copyWith(
        primaryColor: Colors.green,
      ),
      child: Scaffold(
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
        // 修改局部floatingActionButton主题方法
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    secondary: Colors.pink,
                  )),
          child: FloatingActionButton(
              child: Icon(Icons.access_time), onPressed: () {}),
        ),
      ),
    );
  }
}
