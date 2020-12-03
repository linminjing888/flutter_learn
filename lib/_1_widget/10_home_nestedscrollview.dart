/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-03 17:10:47
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-03 18:28:05
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/7_home_listview.dart';

// NestedScrollView 可以在其内部嵌套其他滚动视图的滚动视图
class HomeNestedScrollViewPage extends StatelessWidget {
  static const String routeName = "/NestedScrollView";

  @override
  Widget build(BuildContext context) {
    TabController _tabbarController = TabController();

    return Scaffold(
      body: _buildNestedScrollView2(), //_buildNestedScrollView1(context),
    );
  }

  Widget _buildNestedScrollView2() {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 230.0,
              pinned: true,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: PageView(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  tabs: <Widget>[
                    Tab(text: '资讯'),
                    Tab(text: '技术'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [
            HomeListViewPage(),
            HomeListViewPage(),
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
