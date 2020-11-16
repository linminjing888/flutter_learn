import 'package:flutter/material.dart';
import 'bloc/bloc_body_page.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bloc模式",
      home: MJMainPage(),
    );
  }
}
