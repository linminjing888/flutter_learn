/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-03 17:27:08
 * @Descripttion: 
 */
import 'dart:math';

import 'package:flutter/material.dart';

class HomeCustomScrollViewPage extends StatelessWidget {
  static const String routeName = "/CustomScrollView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("CustomScrollView"),
      // ),
      // body: CustomScrollViewDemo1(),

      body: CustomScrollViewDemo2(),
    );
  }
}

// 一个页面顶部是AppBar，然后是GridView，最后是ListView，这3个区域以整体来滚动，AppBar具有吸顶效果。
class CustomScrollViewDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true, // 是否悬浮
          expandedHeight: 230,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("CustomScrollView"),
            background: Image.network(
              "http://img.haote.com/upload/20180918/2018091815372344164.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
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
              childAspectRatio: 1.8),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(
            leading: Icon(Icons.phone),
            title: Text("哈哈哈"),
          );
        }, childCount: 10))
      ],
    );
  }
}

class CustomScrollViewDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          //安全距离
          sliver: SliverPadding(
            padding: EdgeInsets.all(8), // 边距
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      color: Color.fromRGBO(Random().nextInt(256),
                          Random().nextInt(256), Random().nextInt(256), 1.0),
                    );
                  },
                  childCount: 20,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.5)),
          ),
        )
      ],
    );
  }
}
