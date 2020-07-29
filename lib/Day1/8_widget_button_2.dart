import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MJHomePage(),
    );
  }
}

class MJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text 富文本"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonTheme(
          minWidth: 45, // 设置比较小的按钮 (默认88 36)
          height: 45,
          child: RaisedButton(
            // 去除周围间距 (默认不到48，会扩充到48)
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.all(2), // 设置内间距
            child: Text("1112"),
            color: Colors.orange,
            onPressed: () => print("111"),
          ),
        ),
      ],
    );
  }
}
