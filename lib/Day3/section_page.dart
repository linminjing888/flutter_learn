import 'package:flutter/material.dart';

class MJSectionPage extends StatelessWidget {
  final String _message;
  MJSectionPage(this._message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message),
            RaisedButton(
              onPressed: () => backAction(context),
              child: Text("返回"),
            ),
          ],
        ),
      ),
    );
  }

  void backAction(context) {
    Navigator.of(context).pop("back messgae");
  }
}
