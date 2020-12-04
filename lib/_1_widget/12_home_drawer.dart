/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-25 10:28:21
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 14:27:23
 * @Descripttion: 侧边栏
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/5_home_textfield.dart';

class DrawerBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 300,  // 自定义宽度
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              // UserAccountsDrawerHeader
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                image: DecorationImage(
                  image: NetworkImage("https://picsum.photos/300/200"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  child: CircleAvatar(
                    child: Text("R"),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("我的"),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("设置"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(HomeTextFieldPage.routeName);
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
