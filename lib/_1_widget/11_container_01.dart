import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MYHomePage(),
    );
  }
}

class MYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MJContentBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      // color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20), // 内边距
      alignment: Alignment.topLeft, // 位置
      margin: EdgeInsets.all(10), // 外边距
      child: Icon(
        Icons.pets,
        color: Colors.white,
        size: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(
          color: Colors.red,
          width: 5,
        ),
        boxShadow: [ // 阴影
          BoxShadow(color: Colors.black, offset: Offset(5, 5), blurRadius: 10),
          BoxShadow(color: Colors.green, offset: Offset(-5, -5), blurRadius: 10)
        ],
      ),
    );
  }
}
