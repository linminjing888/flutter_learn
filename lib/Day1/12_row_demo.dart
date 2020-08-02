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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴
      crossAxisAlignment: CrossAxisAlignment.start, // 附轴
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          color: Colors.blue,
          width: 100,
          height: 60,
        ),
        Container(
          color: Colors.orange,
          width: 60,
          height: 100,
        ),
        Container(
          color: Colors.yellow,
          width: 100,
          height: 50,
        ),
        Container(
          color: Colors.red,
          width: 80,
          height: 100,
        ),
      ],
    );
  }
}
