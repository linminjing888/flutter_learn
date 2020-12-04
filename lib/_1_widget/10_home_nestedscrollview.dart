/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-03 17:10:47
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 10:55:28
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

// NestedScrollView 可以在其内部嵌套其他滚动视图的滚动视图
class HomeNestedScrollViewPage extends StatefulWidget {
  static const String routeName = "/NestedScrollView";

  @override
  _HomeNestedScrollViewPageState createState() =>
      _HomeNestedScrollViewPageState();
}

class _HomeNestedScrollViewPageState extends State<HomeNestedScrollViewPage>
    with SingleTickerProviderStateMixin {
  TabController _tabbarController;
  List<String> tabs = ["资讯", "技术"];

  @override
  void initState() {
    super.initState();

    _tabbarController =
        TabController(vsync: this, initialIndex: 0, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildNestedScrollView2(), //_buildNestedScrollView1(context),
    );
  }

  Widget _buildNestedScrollView2() {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 230.0,
              pinned: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: PageView(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/liu.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      child: Image.asset("assets/images/liu.jpeg",
                          fit: BoxFit.cover),
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  controller: _tabbarController,
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: tabs[0]),
                    Tab(text: tabs[1]),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabbarController,
          children: [
            HomeListView2(title: tabs[0]),
            HomeListView2(title: tabs[1]),
          ],
        ),
      ),
    );
  }

  Widget _buildNestedScrollView1(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            // pinned: true,
            title: Text("NestedScrollView"),
          )
          // SliverAppBar(
          //   expandedHeight: 230.0,
          //   pinned: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('复仇者联盟'),
          //     background: Image.network(
          //       'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
          //       fit: BoxFit.fitHeight,
          //     ),
          //   ),
          // )
        ];
      },
      // ListView头部有一段空白区域，是因为当ListView没有和AppBar一起使用时，头部会有一个padding，
      // 为了去掉padding，可以使用MediaQuery.removePadding
      body: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 80,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Text(
                "$index",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            );
          },
          itemCount: 20,
        ),
      ),
    );
  }
}

// 动态创建
class HomeListView2 extends StatelessWidget {
  final String title;
  HomeListView2({this.title});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
          itemExtent: 60, // 每一个item的高度
          itemCount: 15,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$title ${index + 1}"),
              subtitle: Text("this is a description"),
              leading: Icon(Icons.account_box),
            );
          }),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
