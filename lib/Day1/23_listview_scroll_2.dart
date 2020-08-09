import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MJContentBody(),
    );
  }
}

class MJContentBody extends StatefulWidget {
  @override
  _MJContentBodyState createState() => _MJContentBodyState();
}

class _MJContentBodyState extends State<MJContentBody> {
  // 监听滚动
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听滚动"),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            print("开始滚动");
          } else if (notification is ScrollUpdateNotification) {
            print("正在滚动 ${notification.metrics.pixels}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
          }
          return true;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("第$index个"),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_drop_up),
        onPressed: () {},
      ),
    );
  }
}
