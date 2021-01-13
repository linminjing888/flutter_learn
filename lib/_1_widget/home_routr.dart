/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-12-02 09:58:40
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 17:23:02
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/10_home_nestedscrollview.dart';
import 'package:flutter_learn/_1_widget/11_home_dialog.dart';
import 'package:flutter_learn/_1_widget/13_home_animation.dart';
import 'package:flutter_learn/_1_widget/14_home_hero.dart';
import 'package:flutter_learn/_1_widget/15_home_intl_date.dart';
import 'package:flutter_learn/_1_widget/16_home_request_page.dart';
import 'package:flutter_learn/_1_widget/17_home_screen_fit_page.dart';
import 'package:flutter_learn/_1_widget/18_home_theme.dart';
import 'package:flutter_learn/_1_widget/19_canvas_page.dart';
import 'package:flutter_learn/_1_widget/1_home_text.dart';
import 'package:flutter_learn/_1_widget/2_home_status.dart';
import 'package:flutter_learn/_1_widget/3_home_button.dart';
import 'package:flutter_learn/_1_widget/4_home_image.dart';
import 'package:flutter_learn/_1_widget/5_home_textfield.dart';
import 'package:flutter_learn/_1_widget/6_home_stack.dart';
import 'package:flutter_learn/_1_widget/7_home_listview.dart';
import 'package:flutter_learn/_1_widget/8_home_gridview.dart';
import 'package:flutter_learn/_1_widget/9_home_customscrollview.dart';
import 'package:flutter_learn/_1_widget/home_list_page.dart';

class HomeRouter {
  static final Map<String, WidgetBuilder> routes = {
    HomeListPage.routeName: (ctx) => HomeListPage(),
    HomeTextPage.routeName: (ctx) => HomeTextPage(),
    HomeStatusPage.routeName: (ctx) => HomeStatusPage(),
    HomeButtonPage.routeName: (ctx) => HomeButtonPage(),
    HomeImagePage.routeName: (ctx) => HomeImagePage(),
    HomeTextFieldPage.routeName: (ctx) => HomeTextFieldPage(),
    HomeStackPage.routeName: (ctx) => HomeStackPage(),
    HomeListViewPage.routeName: (ctx) => HomeListViewPage(),
    HomeGridViewPage.routeName: (ctx) => HomeGridViewPage(),
    HomeCustomScrollViewPage.routeName: (ctx) => HomeCustomScrollViewPage(),
    HomeNestedScrollViewPage.routeName: (ctx) => HomeNestedScrollViewPage(),
    HomeDialogPage.routeName: (ctx) => HomeDialogPage(),
    HomeAnimationPage.routeName: (ctx) => HomeAnimationPage(),
    HomeHeroPage.routeName: (ctx) => HomeHeroPage(),
    HomeIntlDatePage.routeName: (ctx) => HomeIntlDatePage(),
    HomeDioPage.routeName: (ctx) => HomeDioPage(),
    HomeScreenFitPage.routeName: (ctx) => HomeScreenFitPage(),
    HomeThemePage.routeName: (ctx) => HomeThemePage(),
    HomeCanvasPage.routeName: (ctx) => HomeCanvasPage(),
  };

  static final String initialRoute = HomeListPage.routeName;
}
