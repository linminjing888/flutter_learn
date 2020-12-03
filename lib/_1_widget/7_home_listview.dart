/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-03 16:26:02
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class HomeListViewPage extends StatelessWidget {
  static const String routeName = "/ListView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: HomeListView5(), //HomeListView1(),
    );
  }
}

// ScrollController 监听滚动
class HomeListView5 extends StatefulWidget {
  @override
  _HomeListView5State createState() => _HomeListView5State();
}

class _HomeListView5State extends State<HomeListView5> {
  // 监听滚动
  ScrollController _controller = ScrollController(initialScrollOffset: 100);
  // bool _isShowBtn = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print("${_controller.offset}");
      setState(() {
        // _isShowBtn = _controller.offset >= 500;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.greenAccent,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_circle_down, color: Colors.white),
                onPressed: () {
                  _controller.animateTo(500,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_circle_up, color: Colors.white),
                onPressed: () {
                  _controller.animateTo(0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
              ),
            ],
          ),
        ),
        Expanded(
          // Scrollbar 滚动条
          child: Scrollbar(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),  //禁止滚动
              controller: _controller,
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("第$index个"),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

// 通知监听滚动
class HomeListView4 extends StatefulWidget {
  @override
  _HomeListView4State createState() => _HomeListView4State();
}

class _HomeListView4State extends State<HomeListView4> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          print("开始滚动");
        } else if (notification is ScrollUpdateNotification) {
          print("正在滚动 ${notification.metrics.pixels}");
        } else if (notification is ScrollEndNotification) {
          print("结束滚动");
        }
        return true;
      },
      child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("第$index个"),
            );
          }),
    );
  }
}

// 带分隔线
class HomeListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("hello world ${index + 1}"),
            subtitle: Text("this is a description"),
            leading: Icon(Icons.account_box),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(indent: 20, endIndent: 20);
        },
        itemCount: 15);
  }
}

// 动态创建
class HomeListView2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 60, // 每一个item的高度
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("hello world ${index + 1}"),
            subtitle: Text("this is a description"),
            leading: Icon(Icons.account_box),
          );
        });
  }
}

// 数据较少时，可以直接使用如下方式
class HomeListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MJHomeContentItem("apple1", "Mac1",
            "https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg"),
        MJHomeContentItem("apple2", "Mac2",
            "https://upload-images.jianshu.io/upload_images/16117826-02bce852cd0d3ca9.jpg"),
        MJHomeContentItem("apple3", "Mac3",
            "https://upload-images.jianshu.io/upload_images/16117826-a916e17817f9191a.jpg"),
      ],
    );
  }
}

class MJHomeContentItem extends StatelessWidget {
  final String title;
  final String subStr;
  final String imgUrl;
  MJHomeContentItem(this.title, this.subStr, this.imgUrl);

  final style1 = TextStyle(color: Colors.orange, fontSize: 25);
  final style2 = TextStyle(color: Colors.blue, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 8,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴

        children: <Widget>[
          Text(title, style: style1),
          SizedBox(height: 8),
          Text(subStr, style: style2),
          SizedBox(height: 8),
          Image.network(imgUrl),
        ],
      ),
    );
  }
}
