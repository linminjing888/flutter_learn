/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-26 11:51:59
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-26 14:20:21
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {"home": "Home", 'title': 'Hello World', "showDate": "Show Date"},
    "zh": {
      "home": "首页",
      'title': '你好',
      "showDate": "弹出日期",
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]["title"];
  }

  String get home {
    return _localizedValues[locale.languageCode]["home"];
  }

  String get showDate {
    return _localizedValues[locale.languageCode]["showDate"];
  }
}
