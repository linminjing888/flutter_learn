import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/ThemeColor/app_storage.dart';
import 'package:flutter_learn/ThemeColor/global/global_bloc.dart';

final storage = APPStorage();

class BlocWrapper extends StatelessWidget {
  final Widget child;
  BlocWrapper(this.child);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalBloc(storage)..add(EventInitApp()),
      child: child,
    );
  }
}
