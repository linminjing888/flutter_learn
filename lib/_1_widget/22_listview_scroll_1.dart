import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MJContentBody(),
    );
  }
}

class MJContentBody extends StatefulWidget {
  @override
  _MJContentBodyState createState() => _MJContentBodyState();
}

class _MJContentBodyState extends State<MJContentBody> {
  // 监听滚动
  ScrollController _controller = ScrollController(initialScrollOffset: 100);
  bool _isShowBtn = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print("${_controller.offset}");
      setState(() {
        _isShowBtn = _controller.offset >= 500;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("监听滚动"),
      ),
      body: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("第$index个"),
            );
          }),
      floatingActionButton: _isShowBtn
          ? FloatingActionButton(
              child: Icon(Icons.arrow_drop_up),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.bounceIn);
              },
            )
          : null,
    );
  }
}
