/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-17 09:15:13
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-26 15:31:03
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/Intl/1_international_date.dart';
import 'package:flutter_learn/Intl/localizations_delegate.dart';
import 'package:flutter_learn/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "国际化",
      home: InternationalDatePage(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate.delegate, // 手动国际化
        S.delegate, // intl插件 国际化
      ],
      supportedLocales: S.delegate.supportedLocales,
      // supportedLocales: [
      //   const Locale("zh"),
      //   const Locale("en"),
      // ],

      // locale: Locale("zh"), // APP内 手动设置语言环境

      // // 如果 App 仅支持英文和中文，其他系统的语言也默认使用中文：
      // localeResolutionCallback: (locale, supportedLocales) {
      //   var result = supportedLocales
      //       .where((element) => element.languageCode == locale.languageCode);
      //   if (result.isNotEmpty) {
      //     return locale;
      //   }
      //   return Locale("zh");
      // },
    );
  }
}
