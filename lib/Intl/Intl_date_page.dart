/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-26 10:37:18
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-26 15:51:12
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/Intl/app_localizations.dart';
import 'package:flutter_learn/generated/l10n.dart';

class InternationalDatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home),
        //Text(AppLocalizations.of(context).home),
      ),
      body: InternationalDateBody(),
    );
  }
}

class InternationalDateBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context).title,
              style: TextStyle(fontSize: 20)),
          RaisedButton(
            child: Text(
              S.of(context).showDate,
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              _buildDatePick(context);
              // _buildDateRangePicker(context);
            },
          ),
          // _buildCalendarDatePicker(context),
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

      // selectableDayPredicate: (day) { // 设置可选日期范围
      //   return day.difference(DateTime.now()).inMilliseconds < 0;
      // },

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
