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
        title: Text("ListView Demo"),
      ),
      body: ListDemo2(),
    );
  }
}

class ListDemo2 extends StatelessWidget {
  // 带分隔线
  const ListDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("hello world ${index + 1}"),
            subtitle: Text("this is a description"),
            leading: Icon(Icons.account_box),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            indent: 20,
            endIndent: 20,
          );
        },
        itemCount: 15);
  }
}

class ListDemo extends StatelessWidget {
  const ListDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 60,
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("hello world ${index + 1}"),
            subtitle: Text("this is a description"),
            leading: Icon(Icons.account_box),
          );
        });
  }
}
