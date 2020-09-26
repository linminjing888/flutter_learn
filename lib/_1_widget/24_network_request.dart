import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Network/flutter_request.dart';

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
        title: Text("网络请求"),
      ),
      body: MHContentBody(),
    );
  }
}

class MHContentBody extends StatefulWidget {
  @override
  _MHContentBodyState createState() => _MHContentBodyState();
}

class _MHContentBodyState extends State<MHContentBody> {
  @override
  void initState() {
    super.initState();

    // final dio = Dio();

    // dio.get("https://httpbin.org/get").then((value) {
    //   print("$value");
    // });

    MJHttpRquest.request("/post", params: {"name": "hhaa"}, method: "post")
        .then((value) {
      print("$value");
    }).catchError((err) {
      print("$err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
