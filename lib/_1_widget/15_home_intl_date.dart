/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-26 10:37:18
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-26 15:51:12
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class HomeIntlDatePage extends StatelessWidget {
  static const String routeName = "/date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date"),
      ),
      body: HomeIntlDateBody(),
    );
  }
}

class HomeIntlDateBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            color: Colors.blue,
            child: Text(
              "展示日期",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () {
              _buildDatePick(context);
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text(
              "选择日期",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () {
              _buildDateRangePicker(context);
            },
          ),
          _buildCalendarDatePicker(context),
        ],
      ),
    );
  }

  _buildDatePick(BuildContext context) async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), //初始化时间，通常情况下设置为当前时间。
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      // initialEntryMode: DatePickerEntryMode.input, //直接显示 输入模式
      // initialDatePickerMode: DatePickerMode.year, // 刚开始显示 选择年

      // helpText: "选择日期", // 设置顶部标题、取消按钮、确定按钮 文案
      // cancelText: "取消",
      // confirmText: "确定",

      // fieldLabelText: "填写日期", // 输入模式 下文案
      // errorFormatText: "错误的日期格式",

      selectableDayPredicate: (day) {
        // 设置可选日期范围
        return day.difference(DateTime.now()).inMilliseconds < 0;
      },

      // builder: (context, child) {  //设置深色主题如
      //   return Theme(
      //     data: ThemeData.dark(),
      //     child: child,
      //   );
      // },

      // locale: Locale('zh'), //此组件只支持中文，不管系统设置语言：
    );
    print(result);
  }

  // 选择范围日期使用
  _buildDateRangePicker(BuildContext context) async {
    var result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    print(result);
  }

  // 日期组件直接显示在页面上，而不是弹出显示：
  Widget _buildCalendarDatePicker(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      onDateChanged: (value) {
        print("$value");
      },
    );
  }
}

// 国际化，在 pubspec.yaml 中引入：
// dependencies:
//   flutter_localizations:
//     sdk: flutter

// 在顶级组件 MaterialApp 添加支持：
// MaterialApp(
//   title: 'Flutter Demo',

// localizationsDelegates: [
//   GlobalMaterialLocalizations.delegate,
//   GlobalWidgetsLocalizations.delegate,
//   GlobalCupertinoLocalizations.delegate,
// ],
// supportedLocales: [
//   const Locale('zh'),
//   const Locale('en'),
// ],
//   ...
// )
