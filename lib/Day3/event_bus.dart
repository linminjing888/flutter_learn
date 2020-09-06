import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

// 1.创建全局的eventBus对象
final eventBus = EventBus();

class UserInfo {
  String name;
  int level;
  UserInfo(this.name, this.level);
}

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "事件监听",
      home: MJTestPage(),
    );
  }
}

class MJTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("多组件事件传递"),
      ),
      body: Column(
        children: <Widget>[
          ViewsBuilder(),
          SizedBox(
            height: 20,
          ),
          TextBuilder(),
        ],
      ),
    );
  }
}

class TextBuilder extends StatefulWidget {
  @override
  _TextBuilderState createState() => _TextBuilderState();
}

class _TextBuilderState extends State<TextBuilder> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();

    // 3. 监听事件的类型
    eventBus.on<UserInfo>().listen((event) {
      print(event.name);
      setState(() {
        _message = "${event.name}-${event.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_message",
      style: TextStyle(fontSize: 25),
    );
  }
}

class ViewsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print("111");
          },
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
          ),
        ),
        Center(
          child: GestureDetector(
            onPanDown: (details) {
              // print("222");
              // 2.发出事件
              final user = UserInfo("lmj", 27);
              eventBus.fire(user);
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
