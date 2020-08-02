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
    return Stack(
      // 可以重叠
      children: <Widget>[
        Image.asset(
          "assets/images/app_icon.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "这是一个文案",
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.favorite),
                      onPressed: () => print("收藏按钮点击了"),
                    )
                  ],
                ))),
      ],
    );
  }
}
