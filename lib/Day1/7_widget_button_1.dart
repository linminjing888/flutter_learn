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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("111"),
          color: Colors.orange,
          onPressed: () => print("111"),
        ),
        // 自定义 btn
        FlatButton(
          onPressed: () => print("喜欢"),
          color: Colors.yellow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text("喜欢"),
            ],
          ),
        ),
      ],
    );
  }
}
