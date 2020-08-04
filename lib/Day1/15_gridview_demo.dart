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
        title: Text("GridView Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: GridViewDemo3(),
      ),
    );
  }
}

class GridViewDemo3 extends StatelessWidget {
  const GridViewDemo3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Color.fromRGBO(Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256), 1.0),
          );
        });
  }
}

class GridDemo2 extends StatelessWidget {
  const GridDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220, // 最大宽度
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),
      children: List.generate(30, (index) {
        return Container(
          color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
              Random().nextInt(256), 1.0),
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.7,
      ),
      children: List.generate(30, (index) {
        return Container(
          color: Colors.red,
        );
      }),
    );
  }
}
