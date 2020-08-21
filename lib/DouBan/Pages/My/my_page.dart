import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Pages/My/my_content.dart';

class MJMyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: MJMYContent(),
    );
  }
}
