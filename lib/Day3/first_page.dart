import 'package:flutter/material.dart';
import 'package:flutter_learn/Day3/section_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "导航传值",
      home: MJTestPage(),
    );
  }
}

class MJTestPage extends StatefulWidget {
  @override
  _MJTestPageState createState() => _MJTestPageState();
}

class _MJTestPageState extends State<MJTestPage> {
  String _homeMessage = "第一页";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("导航"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_homeMessage),
            RaisedButton(
              onPressed: () => jumpPage(context),
              child: Text(
                "跳转页面",
                style: TextStyle(color: Colors.orange),
              ),
            )
          ],
        ),
      ),
    );
  }

  void jumpPage(context) {
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MJSectionPage("this is a message");
    }));
    result.then((value) {
      print(value);
      if (value != null) {
        setState(() {
          _homeMessage = value;
        });
      }
    });
  }
}
