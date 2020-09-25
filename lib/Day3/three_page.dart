import 'package:flutter/material.dart';

class ThreePages extends StatelessWidget {
  static const String routename = "/three";
  @override
  Widget build(BuildContext context) {
    // 路由传过来的参数
    final String message = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.orange),
        ),
      ),
    );
  }
}
