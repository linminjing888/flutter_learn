import 'package:flutter/material.dart';
import 'package:flutter_learn/ThemeColor/Widgets/feedback_widget.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onSubmit;

  CustomDialog({this.title = "", this.content = "", this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        width: 50,
        child: _buildDialog(context),
      ),
    );
  }

  Widget _buildDialog(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildBar(context),
        _buildTitle(),
        _buildContent(),
        _buildFooter(context),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyle(color: Colors.red, fontSize: 20),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        content,
        style: TextStyle(color: Colors.grey, fontSize: 16), // Color(0xffCFCFCF)
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildFooter(context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 15.0, top: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FeedbackWidget(
            onPressed: () => onSubmit(),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Theme.of(context).primaryColor),
              child: Text('确 定',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          FeedbackWidget(
            onPressed: () => Navigator.of(context).pop(),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.orangeAccent),
              child: Text('取 消',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }

  _buildBar(context) => Container(
        height: 30,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 10, top: 5),
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
}
