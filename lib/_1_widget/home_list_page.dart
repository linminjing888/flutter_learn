/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-01 17:17:42
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-02 17:35:32
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/1_home_text.dart';
import 'package:flutter_learn/_1_widget/2_home_status.dart';
import 'package:flutter_learn/_1_widget/3_home_button.dart';
import 'package:flutter_learn/_1_widget/4_home_image.dart';
import 'package:flutter_learn/_1_widget/home_items.dart';

class HomeListPage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Demo"),
      ),
      body: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(listItems[index]),
                  onTap: () {
                    _itemClicked(context, index);
                  },
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
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
    }
  }
}
