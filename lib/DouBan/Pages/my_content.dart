import 'package:flutter/material.dart';

class MJMYContent extends StatefulWidget {
  @override
  _MJMYContentState createState() => _MJMYContentState();
}

class _MJMYContentState extends State<MJMYContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "我的世界",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
