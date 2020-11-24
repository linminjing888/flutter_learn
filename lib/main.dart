import 'package:flutter/material.dart';
import 'package:flutter_learn/Search/app_search_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ceshi1",
      home: SearchPage(),
    );
  }
}
