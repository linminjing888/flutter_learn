/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-24 15:32:20
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-24 16:07:00
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class AppSearchBar extends StatefulWidget {
  final ValueChanged<String> textChange;
  AppSearchBar({this.textChange});

  @override
  _AppSearchBarState createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: TextField(
        autofocus: false, //自动聚焦，闪游标
        maxLines: 1,
        controller: _controller,
        decoration: InputDecoration(
          filled: true, //填满
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none, //去边线
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: "请输入搜索文字",
          contentPadding: EdgeInsets.only(top: 0), //调整文字边距
          hintStyle: TextStyle(fontSize: 14), //提示样式
        ),
        onChanged: (value) {
          widget.textChange(value);
        },
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
          print("--$value");
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
