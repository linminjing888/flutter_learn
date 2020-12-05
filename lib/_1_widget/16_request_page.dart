import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '16_flutter_request.dart';

class HomeDioPage extends StatelessWidget {
  static const String routeName = "/dio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio"),
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
  var _title = "请求数据";
  @override
  void initState() {
    super.initState();

    // final dio = Dio();
    // dio.get("https://httpbin.org/get").then((value) {
    //   print("$value");
    // });

    // 通过 cancel token 取消请求：
    // CancelToken cancelToken = CancelToken();
    // Response response = await Dio().post("https://xxx.com/test",
    //     queryParameters: {'name': 'laomeng', 'page': 1},
    //     cancelToken: cancelToken);
    // cancelToken.cancel();

    MJHttpRquest.request("/post", params: {"name": "hhaa"}, method: "post")
        .then((value) {
      print("response:$value");
      setState(() {
        _title = value["args"].toString();
      });
    }).catchError((err) {
      print("$err");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          _title,
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
    );
  }
}
