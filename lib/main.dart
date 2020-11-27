/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-17 09:15:13
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-27 18:01:37
 * @Descripttion: 
 */
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
          showDialog(
              context: context, builder: (ctx) => _buildNormalDialog(context));

          // showDialog(context: context, builder: (ctx) => _buildDialog());

          // showDialog(
          //   context: context,
          //   builder: (ctx) => _buildCupertinoDialog(),
          // );

          // showDialog(
          //   context: context,
          //   builder: (ctx) => _buildCupertinoActionSheet(context),
          // );

          // _buildSnackBar(context);
        },
      ),
    );
  }

  Widget _buildNormalDialog(BuildContext context) {
    return AlertDialog(
      title: Text("提示"),
      content: Text("确认删除吗？"),
      actions: [
        FlatButton(
          child: Text("取消"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("确认"),
          onPressed: () {},
        ),
      ],
    );
  }

  // 自定义的
  Widget _buildDialog() => CustomDialog(
        title: "提示",
        content: "这是一条有用的数据，是否删除？\n这是一条有用的数据，是否删除？",
        onSubmit: () {
          print("确定");
        },
      );
  // iOS 风格
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
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              )),
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

  _buildSnackBar(BuildContext context) {
    // 如果有新的消息时，旧的都消息立刻消失，显示新的消息
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("HHH,出现问题了!"),
    //   backgroundColor: Colors.red,
    //   // elevation: 8,
    //   // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)), //设置背景和形状
    // ));

    // content属性不一定是文字，也可以是其他组件
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Row(
    //     children: [
    //       Icon(
    //         Icons.check,
    //         color: Colors.green,
    //       ),
    //       Text("下载成功"),
    //     ],
    //   ),
    //   duration: Duration(seconds: 1), // 显示时间，默认是4秒：
    //   // behavior: SnackBarBehavior.floating,  // 底部悬浮方式显示
    // ));

    // 带有按钮样式
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("HHH,出现问题了!"),
      action: SnackBarAction(
        label: "确定",
        onPressed: () {
          print("确定");
        },
      ),
    ));
  }
}
