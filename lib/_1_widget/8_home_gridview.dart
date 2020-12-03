/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-03 16:17:13
 * @Descripttion: 
 */
import 'dart:math';

import 'package:flutter/material.dart';

class HomeGridViewPage extends StatelessWidget {
  static const String routeName = "/GridView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: GridViewDemo3(),
      ),
    );
  }
}

class GridViewDemo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(20, (index) {
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      }),
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
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), 1.0),
          );
        });
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220, // 最大宽度
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.8,
      ),
      children: List.generate(20, (index) {
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
      // SliverGridDelegateWithFixedCrossAxisCount 交叉轴方向上固定数量
      // SliverGridDelegateWithMaxCrossAxisExtent 交叉轴方向上尽量大
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 交叉轴方向上个数
        mainAxisSpacing: 5, // 主轴方向上2行之间的间隔
        crossAxisSpacing: 5, // 交叉轴方向上之间的间隔
        childAspectRatio: 0.7, // 子控件宽高比
      ),
      children: List.generate(14, (index) {
        return Container(
          color: Colors.primaries[index],
        );
      }),
    );
  }
}
