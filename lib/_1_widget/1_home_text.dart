/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-02 15:24:24
 * @Descripttion: 
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeTextPage extends StatelessWidget {
  static const String routeName = "/text";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatelessWidget {
  final Shader linearGradient =
      LinearGradient(colors: [Colors.purple, Colors.blue])
          .createShader(Rect.fromLTWH(0.0, 0.0, 400, 40));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello World",
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Hello World1",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
              fontStyle: FontStyle.italic, // 斜体
            ),
          ),
          // 设置字体，第一次运行时，要删除设备上的应用程序并重新安装
          Text(
            "Hello World2",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
              fontFamily: "IndieFlower", // Inconsolata
            ),
          ),
          Container(
            width: 300,
            color: Colors.blue.withOpacity(.4),
            child: Text(
              "Hello World3",
              textAlign: TextAlign.left, // 设置对齐方式
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(
            width: 200,
            color: Colors.red.withOpacity(.4),
            child: Text(
              "Hello World4 Hello World4",
              softWrap: true, // 文本自动换行
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(
            width: 200,
            color: Colors.yellow.withOpacity(.4),
            child: Text(
              "Hello World5 Hello World5",
              style: TextStyle(fontSize: 30.0),
              overflow: TextOverflow.ellipsis, // 文本超出范围时的处理
            ),
          ),
          // 富文本
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                    text: "Hello World6",
                    style: TextStyle(color: Colors.red, fontSize: 25)),
                TextSpan(text: "Hello World6", style: TextStyle(fontSize: 25)),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(text: "登陆即视为同意", style: TextStyle(fontSize: 20)),
                TextSpan(
                    text: "《服务协议》",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                    recognizer: TapGestureRecognizer() // 属性指定手势交互
                      ..onTap = () {
                        print("Hello World7");
                      }),
              ],
            ),
          ),
          // 文字渐变 1
          Text(
            "Hello World8 Hello World8",
            style: TextStyle(
                fontSize: 25.0, foreground: Paint()..shader = linearGradient),
          ),
          // 文字渐变 2
          Container(
            // 添加一个前景修饰
            foregroundDecoration: BoxDecoration(
              backgroundBlendMode: BlendMode.srcIn, //文本颜色以及前景色的混合模式
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.yellow, Color(0xfffd8403), Colors.red]),
            ),
            child: Text(
              "Hello World9 Hello World9",
              style: TextStyle(fontSize: 25.0, color: Color(0xff000000)),
            ),
          ),
          // 带前后置标签的文本
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                WidgetSpan(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blue,
                    ),
                    child: Text(
                      "标签",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                TextSpan(
                  text: "Hello World10",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
