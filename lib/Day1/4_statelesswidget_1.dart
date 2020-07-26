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
        title: Text("商品列表"),
      ),
      body: MJHomeContent(),
    );
  }
}

class MJHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MJHomeContentItem("apple1", "Mac1",
            "https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg"),
        MJHomeContentItem("apple2", "Mac2",
            "https://upload-images.jianshu.io/upload_images/16117826-02bce852cd0d3ca9.jpg"),
        MJHomeContentItem("apple3", "Mac3",
            "https://upload-images.jianshu.io/upload_images/16117826-a916e17817f9191a.jpg"),
      ],
    );
  }
}

class MJHomeContentItem extends StatelessWidget {
  final String title;
  final String subStr;
  final String imgUrl;
  MJHomeContentItem(this.title, this.subStr, this.imgUrl);
  final style1 = TextStyle(color: Colors.orange, fontSize: 25);
  final style2 = TextStyle(color: Colors.blue, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black26,
        width: 8,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴
        children: <Widget>[
          Text(title, style: style1),
          SizedBox(height: 8),
          Text(subStr, style: style2),
          SizedBox(height: 8),
          Image.network(imgUrl),
        ],
      ),
    );
  }
}
