/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-03 11:33:32
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeTextFieldPage extends StatelessWidget {
  static const String routeName = "/textfield";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField"),
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
  final topTextFieldController = TextEditingController();
  final bottomTextFieldControllrt = TextEditingController();
  TextEditingController _controller;

  var _textValue = "";

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..addListener(() {
        //添加监听
        // //获取输入框的内容，变为大写
        // _controller.text = _controller.text.toUpperCase();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        //主题颜色（边框颜色）
        primaryColor: Colors.orange,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
        child: Column(
          children: <Widget>[
            TextField(
              controller: topTextFieldController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "请输入邮箱",
                icon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                //输入框内Icon
                // prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                print("change:$value");
              },
              onSubmitted: (value) {
                print("submit:$value");
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: bottomTextFieldControllrt,
              obscureText: true,
              decoration: InputDecoration(
                  // labelText: "请输入密码",
                  hintText: "请输入密码",
                  icon: Icon(
                    Icons.security,
                    color: Colors.blue,
                  ),
                  // labelStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 40,
              child: FlatButton(
                child: Text(
                  "登录",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  final email = topTextFieldController.text;
                  final password = bottomTextFieldControllrt.text;
                  print("email:$email psw:$password");
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              onChanged: (value) {
                setState(() {
                  _textValue = value;
                });
              },
              // 限制输入长度
              inputFormatters: [LengthLimitingTextInputFormatter(20)],
              decoration:
                  InputDecoration(counterText: "${_textValue.length}/20"),
            ),
            // filled为true时，输入框将会被fillColor填充
            Container(
              height: 60,
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Color(0x30cccccc),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00FF0000)),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  hintText: "请输入邮箱/手机号",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0x00FF0000)),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                ),
                textAlign: TextAlign.center, //居中
              ),
            ),
          ],
        ),
      ),
    );
  }
}
