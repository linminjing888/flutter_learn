import 'package:flutter/material.dart';

class MJHomeContent extends StatefulWidget {
  @override
  _MJHomeContentState createState() => _MJHomeContentState();
}

class _MJHomeContentState extends State<MJHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "首页内容",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
