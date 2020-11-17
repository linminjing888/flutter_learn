import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/ThemeColor/global/global_bloc.dart';
import 'package:flutter_learn/ThemeColor/theme_color_setting.dart';

class FlutterUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "颜色设置",
          theme: ThemeData(primarySwatch: state.themeColor),
          home: ThemeColorSetting(),
        );
      },
    );
  }
}
