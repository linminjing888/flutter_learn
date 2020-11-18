import 'package:flutter/material.dart';
import 'package:flutter_learn/Dialog/cupertino_alert.dart';
import 'package:flutter_learn/Dialog/custom_dialog.dart';
import 'package:flutter/cupertino.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "弹窗",
      home: CustomDialogPage(),
    );
  }
}

class CustomDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.show_chart),
        onPressed: () {
          // showDialog(context: context, builder: (ctx) => _buildDialog());

          // showDialog(
          //   context: context,
          //   builder: (ctx) => _buildCupertinoDialog(),
          // );

          showDialog(
            context: context,
            builder: (ctx) => _buildCupertinoActionSheet(context),
          );
        },
      ),
    );
  }

  Widget _buildDialog() => CustomDialog(
        title: "提示",
        content: "这是一条有用的数据，是否删除？\n这是一条有用的数据，是否删除？",
        onSubmit: () {
          print("确定");
        },
      );

  Widget _buildCupertinoDialog() => MJCupertinoDialog(
        title: "提示",
        content: "这是一条有用的数据，是否删除？这是一条有用的数据，是否删除？",
        onSubmit: () {
          print("确定");
        },
      );

  Widget _buildCupertinoActionSheet(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        child: CupertinoActionSheet(
          title: Text("Please chose a language"),
          message: Text('the language you use in this application.'),
          cancelButton: CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          actions: <Widget>[
            CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context), child: Text('Dart')),
            CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context), child: Text('Java')),
            CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context), child: Text('Kotlin')),
          ],
        ),
      );
}
