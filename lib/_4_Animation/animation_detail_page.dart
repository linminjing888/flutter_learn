import 'package:flutter/material.dart';

class AnimationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: Container(
        child: Center(
          child: Text("动画详情页面"),
        ),
      ),
    );
  }
}
