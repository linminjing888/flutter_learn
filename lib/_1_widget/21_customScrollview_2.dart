import 'dart:math';

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
      // appBar: AppBar(
      //   title: Text("CustomScrollView Demo"),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            title: Text("Hello Demo"),
            pinned: true, // 导航悬浮
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  color: Color.fromRGBO(Random().nextInt(256),
                      Random().nextInt(256), Random().nextInt(256), 1.0),
                );
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 1.8)),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return ListTile(
              leading: Icon(Icons.phone),
              title: Text("哈哈哈"),
            );
          }, childCount: 10))
        ],
      ),
    );
  }
}
