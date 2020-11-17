import 'package:flutter_learn/ThemeColor/cons.dart';
import 'package:flutter_learn/ThemeColor/global/global_bloc.dart';
import 'package:flutter_learn/ThemeColor/sp_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APPStorage {
  SharedPreferences _sp;

  Future<SharedPreferences> get sp async {
    _sp = _sp ?? await SharedPreferences.getInstance();
    return _sp;
  }

  Future<GlobalState> initApp() async {
    SharedPreferences prefs = await sp;

    int themeIndex = prefs.getInt(SpKey.themeColorIndex) ?? 4;
    return GlobalState(themeColor: Cons.themeColors.keys.toList()[themeIndex]);
  }
}
