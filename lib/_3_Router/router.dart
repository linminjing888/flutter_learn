import 'package:flutter/material.dart';
import 'package:flutter_learn/_3_Router/event_bus.dart';
import 'package:flutter_learn/_3_Router/first_page.dart';
import 'package:flutter_learn/_3_Router/section_page.dart';
import 'package:flutter_learn/_3_Router/three_page.dart';
import '../main.dart';

class MJRouter {
  // 路由抽取
  static final Map<String, WidgetBuilder> routes = {
    MJFirstPage.routeName: (ctx) => MJFirstPage(),
    ThreePages.routename: (ctx) => ThreePages(),
  };

  static final String initialRoute = MJFirstPage.routeName;

  static final RouteFactory onGenerateRoute = (settings) {
    if (settings.name == MJSectionPage.routeName) {
      return MaterialPageRoute(builder: (ctx) {
        return MJSectionPage(settings.arguments);
      });
    }
    return null;
  };
}
