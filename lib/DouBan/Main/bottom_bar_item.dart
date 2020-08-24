import 'package:flutter/material.dart';

class MJBottomBarItem extends BottomNavigationBarItem {
  MJBottomBarItem(String title, String icon)
      : super(
          title: Text(title),
          icon: Image.asset(
            "assets/images/tabbar/$icon.png",
            width: 32,
            gaplessPlayback: true, // 解决第一次闪烁问题
          ),
          activeIcon: Image.asset(
            "assets/images/tabbar/${icon}_active.png",
            width: 32,
            gaplessPlayback: true,
          ),
        );
}
