import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MJHomePage(),
    );
  }
}

class MJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器"),
      ),
      body: MJHomeContent("Hello，EveryOne"),
    );
  }
}

class MJHomeContent extends StatefulWidget {
  final String message;
  MJHomeContent(this.message);
  @override
  _MJHomeContentState createState() => _MJHomeContentState();
}

class _MJHomeContentState extends State<MJHomeContent> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _setBtn(),
          SizedBox(
            height: 8,
          ),
          Text(
            "计数器值:$_counter",
            style: TextStyle(fontSize: 25),
          ),
          Text("接受传值：${widget.message}"),
        ],
      ),
    );
  }

  Widget _setBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          child: Text("+"),
          color: Colors.orange,
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
        RaisedButton(
          child: Text("-"),
          color: Colors.pink,
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
        )
      ],
    );
  }
}
