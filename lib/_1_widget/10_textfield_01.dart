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
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        //主题颜色（边框颜色）
        primaryColor: Colors.orange,
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: topTextFieldController,
              decoration: InputDecoration(
                labelText: "请输入邮箱",
                icon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              ),
              onChanged: (value) {
                print("change:$value");
              },
              onSubmitted: (value) {
                print("submit:$value");
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: bottomTextFieldControllrt,
              decoration: InputDecoration(
                  // labelText: "请输入密码",
                  hintText: "请输入密码",
                  icon: Icon(
                    Icons.security,
                    color: Colors.blue,
                  ),
                  labelStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
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
          ],
        ),
      ),
    );
  }
}
