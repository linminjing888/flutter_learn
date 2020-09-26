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
      appBar: AppBar(
        title: Text("CustomScrollView Demo"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            //安全距离
            sliver: SliverPadding(
              padding: EdgeInsets.all(8), // 边距
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Container(
                      color: Color.fromRGBO(Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256), 1.0),
                    );
                  }, childCount: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 1.5)),
            ),
          )
        ],
      ),
    );
  }
}
