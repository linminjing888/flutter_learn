/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-02 17:52:01
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class HomeButtonPage extends StatelessWidget {
  static const String routeName = "/button";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text("111"),
            color: Colors.orange,
            elevation: 5.0, // 设置阴影
            onPressed: () => print("111"),
          ),
          // 自定义 btn
          FlatButton(
            onPressed: () => print("喜欢"),
            color: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text("喜欢"),
              ],
            ),
          ),
          // 设置比较小的按钮 (默认88 36)
          ButtonTheme(
            minWidth: 45,
            height: 45,
            child: RaisedButton(
              // MaterialTapTargetSize有2个值，分别为：
              // padded：最小点击区域为48*48。
              // shrinkWrap：子组件的实际大小。
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.all(2), // 设置内间距
              child: Text("1112"),
              color: Colors.orange,
              onPressed: () => print("222"),
            ),
          ),
          OutlineButton(
            child: Text('OutlineButton'),
            onPressed: () => print("333"),
          ),
        ],
      ),
    );
  }
}
