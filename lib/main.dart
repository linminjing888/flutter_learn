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
  final imgUrl =
      "https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/images/app_icon.png"), // 本地图片
        Image.network(imgUrl), // 网络图片
        Image(
          image: NetworkImage(imgUrl),
          width: 200,
          height: 200,
          fit: BoxFit.fitHeight, // 适应高度
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }
}
