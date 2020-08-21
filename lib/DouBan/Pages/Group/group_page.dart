import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Pages/Group/group_content.dart';

class MJGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小组"),
      ),
      body: MJGroupContent(),
    );
  }
}
