import 'package:flutter/material.dart';

class MJGroupContent extends StatefulWidget {
  @override
  _MJGroupContentState createState() => _MJGroupContentState();
}

class _MJGroupContentState extends State<MJGroupContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "小组",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
