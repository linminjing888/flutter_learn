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
    return Text.rich(
      TextSpan(
        text: "hello",
        style: TextStyle(color: Colors.orange, fontSize: 25),
        children: [
          TextSpan(
            text: "world",
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
          TextSpan(text: "你好", style: TextStyle(color: Colors.yellow)),
          WidgetSpan(
            child: Icon(
              Icons.account_box,
              color: Colors.red,
              size: 30,
            ),
          ),
          TextSpan(
              text: "小波", style: TextStyle(color: Colors.cyan, fontSize: 30)),
        ],
      ),
    );
  }
}
