import 'package:flutter/material.dart';
import 'package:flutter_learn/_3_Router/router.dart';
import 'package:flutter_learn/_3_Router/section_page.dart';
import 'package:flutter_learn/_3_Router/three_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "导航传值",
      initialRoute: MJRouter.initialRoute,
      routes: MJRouter.routes,
      onGenerateRoute: MJRouter.onGenerateRoute,
    );
  }
}

class MJTestPage extends StatefulWidget {
  static const String routeName = "/";
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
              onPressed: () => _jumpPage(context),
              child: Text(
                "正常跳转",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            RaisedButton(
              onPressed: () => _jumpThree(context),
              child: Text(
                "路由跳转",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            RaisedButton(
              onPressed: () => _jumpDetailPage(context),
              child: Text(
                "路由传参跳转",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _jumpPage(context) {
    Future result =
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MJSectionPage("111");
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

  void _jumpThree(context) {
    Navigator.of(context).pushNamed(ThreePages.routename, arguments: "2222");
  }

  void _jumpDetailPage(context) {
    Navigator.of(context).pushNamed(MJSectionPage.routeName, arguments: "3333");
  }
}
