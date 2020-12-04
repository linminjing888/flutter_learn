/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-25 11:10:49
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-25 11:14:01
 * @Descripttion: 自定义Drawer Appbar
 */
import 'package:flutter/material.dart';

class DrawerAppBar extends AppBar {
  final BuildContext context;
  DrawerAppBar(this.context)
      : super(
          title: Text("Learn Demo"),
          leading: Builder(
            builder: (context) {
              return IconButton(
                  icon: Icon(Icons.storage),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  });
            },
          ),
        );
}
