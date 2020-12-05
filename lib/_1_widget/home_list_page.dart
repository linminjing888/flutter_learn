/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-01 17:17:42
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 11:08:12
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/10_home_nestedscrollview.dart';
import 'package:flutter_learn/_1_widget/11_home_dialog.dart';
import 'package:flutter_learn/_1_widget/12_drawer_appbar.dart';
import 'package:flutter_learn/_1_widget/12_home_drawer.dart';
import 'package:flutter_learn/_1_widget/13_home_animation.dart';
import 'package:flutter_learn/_1_widget/14_home_hero.dart';
import 'package:flutter_learn/_1_widget/15_home_intl_date.dart';
import 'package:flutter_learn/_1_widget/1_home_text.dart';
import 'package:flutter_learn/_1_widget/2_home_status.dart';
import 'package:flutter_learn/_1_widget/3_home_button.dart';
import 'package:flutter_learn/_1_widget/4_home_image.dart';
import 'package:flutter_learn/_1_widget/5_home_textfield.dart';
import 'package:flutter_learn/_1_widget/6_home_stack.dart';
import 'package:flutter_learn/_1_widget/7_home_listview.dart';
import 'package:flutter_learn/_1_widget/8_home_gridview.dart';
import 'package:flutter_learn/_1_widget/9_home_customscrollview.dart';
import 'package:flutter_learn/_1_widget/home_items.dart';

class HomeListPage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerAppBar(context),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              Icons.home,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(listItems[index]),
            onTap: () {
              _itemClicked(context, index);
            },
          );
        },
      ),
      drawer: DrawerBuild(),
      // drawerEnableOpenDragGesture: false, //手势侧滑
    );
  }

  void _itemClicked(BuildContext context, int index) {
    if (index == 0) {
      Navigator.of(context).pushNamed(HomeTextPage.routeName);
    } else if (index == 1) {
      Navigator.of(context).pushNamed(HomeStatusPage.routeName);
    } else if (index == 2) {
      Navigator.of(context).pushNamed(HomeButtonPage.routeName);
    } else if (index == 3) {
      Navigator.of(context).pushNamed(HomeImagePage.routeName);
    } else if (index == 4) {
      Navigator.of(context).pushNamed(HomeTextFieldPage.routeName);
    } else if (index == 5) {
      Navigator.of(context).pushNamed(HomeStackPage.routeName);
    } else if (index == 6) {
      Navigator.of(context).pushNamed(HomeListViewPage.routeName);
    } else if (index == 7) {
      Navigator.of(context).pushNamed(HomeGridViewPage.routeName);
    } else if (index == 8) {
      Navigator.of(context).pushNamed(HomeCustomScrollViewPage.routeName);
    } else if (index == 9) {
      Navigator.of(context).pushNamed(HomeNestedScrollViewPage.routeName);
    } else if (index == 10) {
      Navigator.of(context).pushNamed(HomeDialogPage.routeName);
    } else if (index == 11) {
      print("点击左上角");
    } else if (index == 12) {
      Navigator.of(context).pushNamed(HomeAnimationPage.routeName);
    } else if (index == 13) {
      Navigator.of(context).pushNamed(HomeHeroPage.routeName);
    } else if (index == 14) {
      Navigator.of(context).pushNamed(HomeIntlDatePage.routeName);
    }
  }
}
