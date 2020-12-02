/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-02 09:58:40
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-02 17:35:12
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/1_home_text.dart';
import 'package:flutter_learn/_1_widget/2_home_status.dart';
import 'package:flutter_learn/_1_widget/3_home_button.dart';
import 'package:flutter_learn/_1_widget/4_home_image.dart';
import 'package:flutter_learn/_1_widget/home_list_page.dart';

class HomeRouter {
  static final Map<String, WidgetBuilder> routes = {
    HomeListPage.routeName: (ctx) => HomeListPage(),
    HomeTextPage.routeName: (ctx) => HomeTextPage(),
    HomeStatusPage.routeName: (ctx) => HomeStatusPage(),
    HomeButtonPage.routeName: (ctx) => HomeButtonPage(),
    HomeImagePage.routeName: (ctx) => HomeImagePage(),
  };

  static final String initialRoute = HomeListPage.routeName;
}
