/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-03 14:42:41
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class HomeStackPage extends StatelessWidget {
  static const String routeName = "/stack";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack/Row"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MJContentBody> {
  bool _love = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStackDemo(),
        _buildRowDemo(),
        SizedBox(height: 20),
        _buildContainerDemo(),
      ],
    );
  }

  Widget _buildContainerDemo() {
    return Container(
      width: 200,
      height: 200,
      // color: Colors.red,
      padding: EdgeInsets.only(left: 20, top: 20), // 内边距
      alignment: Alignment.topLeft, // 位置
      margin: EdgeInsets.all(10), // 外边距
      child: Icon(
        Icons.pets,
        color: Colors.white,
        size: 50,
      ),
      decoration: BoxDecoration(
        color: Colors.orange,
        border: Border.all(
          color: Colors.red,
          width: 3,
        ),
        boxShadow: [
          // 阴影
          BoxShadow(color: Colors.blue, offset: Offset(5, 5), blurRadius: 10),
          BoxShadow(color: Colors.blue, offset: Offset(-5, -5), blurRadius: 10)
        ],
      ),
    );
  }

  Widget _buildRowDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 主轴 spaceEvenly
      crossAxisAlignment: CrossAxisAlignment.start, // 附轴
      // mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(color: Colors.blue, width: 100, height: 60),
        Container(color: Colors.orange, width: 60, height: 60),
        Container(color: Colors.yellow, width: 100, height: 60),
        Container(color: Colors.red, width: 80, height: 60),
      ],
    );
  }

  Widget _buildStackDemo() {
    return Stack(
      // Stack 对未定位（不被 Positioned 包裹）子组件的对齐方式由 alignment 控制，默认左上角对齐
      alignment: AlignmentDirectional.topStart,
      // 可以重叠
      children: <Widget>[
        Image.asset(
          "assets/images/liu.jpeg",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Icon(Icons.star, color: Colors.yellow),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            // color: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "这是一个文案",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  color: _love ? Colors.red : Colors.white,
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    print("喜欢按钮点击了");
                    setState(() {
                      _love = !_love;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
