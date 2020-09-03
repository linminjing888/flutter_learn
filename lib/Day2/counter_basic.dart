import 'package:flutter/material.dart';
import 'package:flutter_learn/Day2/counter_view_model.dart';
// import 'package:flutter_learn/DouBan/Main/main_page.dart';
import 'package:provider/provider.dart';

main() {
  // 2.在应用程序顶层 ChangeNotifierProvider
  runApp(ChangeNotifierProvider(
    create: (ctx) {
      return MJCounterViewModel();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "状态管理",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MJShowData1(),
            MJShowData2(),
          ],
        ),
      ),
      floatingActionButton: Selector<MJCounterViewModel, MJCounterViewModel>(
        selector: (ctx, counterVm) => counterVm,
        shouldRebuild: (previous, next) => false,
        builder: (context, value, child) {
          print("floatingActionButton build方法被执行");
          return FloatingActionButton(
            onPressed: () {
              value.counter += 1;
            },
            child: child,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MJShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 3.在其它位置使用共享的数据
    int counter = Provider.of<MJCounterViewModel>(context).counter;
    print("data01的build方法");
    return Container(
      color: Colors.blue,
      child: Text(
        "当前计数$counter",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class MJShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("data02的build方法");
    return Container(
      color: Colors.red,
      child: Consumer<MJCounterViewModel>(
        builder: (context, value, child) {
          print("data02 Consumer build方法被执行");
          return Text(
            "当前计数${value.counter}",
            style: TextStyle(fontSize: 20),
          );
        },
      ),
    );
  }
}

// 豆瓣
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "豆瓣项目",
//       theme: ThemeData(
//         primaryColor: Colors.green,
//         splashColor: Colors.transparent,
//         highlightColor: Colors.transparent,
//       ),
//       home: MJMainPage(),
//     );
//   }
// }
