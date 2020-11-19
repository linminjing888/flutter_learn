import 'package:flutter/material.dart';
import 'package:flutter_learn/ThemeColor/splash_screen.dart';
import 'package:flutter_learn/ThemeColor/theme_color_setting.dart';
import 'package:flutter_learn/_3_Router/first_page.dart';
import 'package:flutter_learn/_3_Router/section_page.dart';
import 'package:flutter_learn/_3_Router/three_page.dart';

class MJRouter {
  // 路由抽取
  static final Map<String, WidgetBuilder> routes = {
    MJFirstPage.routeName: (ctx) => MJFirstPage(),
    ThreePages.routename: (ctx) => ThreePages(),
    SplashScreen.routeName: (ctx) => SplashScreen(),
    ThemeColorSetting.routeName: (ctx) => ThemeColorSetting(),
  };

  static final String initialRoute = MJFirstPage.routeName;

  static final String initialRoute2 = SplashScreen.routeName;

  static final RouteFactory onGenerateRoute = (settings) {
    if (settings.name == MJSectionPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        return MJSectionPage(settings.arguments);
      });
    }
    return null;
  };
}
