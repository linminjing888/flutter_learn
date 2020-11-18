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
          title: _buildTitle(context),
          content: _buildContent(),
          actions: <Widget>[
            CupertinoButton(
              child: Text("Yes, Delete"),
              onPressed: () => onSubmit(),
            ),
            CupertinoButton(
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
