import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MJHomePage(),
    );
  }
}

class MJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MJContentBodyStatus();
  }
}

class MJContentBodyStatus extends State<MJContentBody> {
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
            value: flag,
            onChanged: (bool value) {
              print(value);
              setState(() {
                // 刷新页面
                flag = value;
              });
            },
          ),
          Text(
            "同意协议",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
