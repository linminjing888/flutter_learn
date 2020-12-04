/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-18 15:53:12
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-27 17:49:37
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MJCupertinoDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onSubmit;

  MJCupertinoDialog({this.title = "", this.content = "", this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CupertinoAlertDialog(
          title: Text("提示"), //_buildTitle(context),
          content: _buildContent(),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("Yes, Delete"),
              onPressed: () => onSubmit(),
            ),
            CupertinoDialogAction(
              child: Text("Cancle"),
              onPressed: () => Navigator.pop(context),
            ),
          ]),
    );
  }

  Widget _buildTitle(context) {
    return Row(
        //标题
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            title,
            style: TextStyle(color: Colors.red, fontSize: 20),
          )),
          InkWell(
            child: Icon(CupertinoIcons.clear_thick),
            onTap: () => Navigator.pop(context),
          )
        ]);
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Column(
        children: <Widget>[
          Text(
            content,
            style: TextStyle(color: Colors.grey, fontSize: 16),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
