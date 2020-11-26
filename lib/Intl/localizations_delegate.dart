/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-11-26 14:25:20
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-11-26 14:42:36
 * @Descripttion: 
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/Intl/app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  static AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "zh"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }
}
