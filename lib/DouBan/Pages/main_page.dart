import 'package:flutter/material.dart';
import 'package:flutter_learn/DouBan/Pages/initialize_items.dart';

class MJMainPage extends StatefulWidget {
  @override
  _MJMainPageState createState() => _MJMainPageState();
}

class _MJMainPageState extends State<MJMainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
