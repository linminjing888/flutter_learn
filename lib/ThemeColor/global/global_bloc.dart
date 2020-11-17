import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/ThemeColor/app_storage.dart';
import 'package:flutter_learn/ThemeColor/cons.dart';
import 'package:flutter_learn/ThemeColor/sp_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final APPStorage storage;
  GlobalBloc(this.storage) : super(GlobalState());

  // @override
  // int get initialState => 0;

  // // @override
  // // GlobalState get initialState => GlobalState();

  // final APPStorage storage;

  // GlobalBloc(this.storage) : super(GlobalState());

  Future<SharedPreferences> get sp => storage.sp;

  @override
  Stream<GlobalState> mapEventToState(GlobalEvent event) async* {
    if (event is EventInitApp) {
      yield await storage.initApp();
    }
    if (event is EventSwitchThemeColor) {
      int themeIndex = Cons.themeColors.keys.toList().indexOf(event.color);
      await sp
        ..setInt(SpKey.themeColorIndex, themeIndex);

      yield GlobalState(themeColor: event.color);
    }
  }
}
