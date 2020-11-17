part of 'global_bloc.dart';

class GlobalState extends Equatable {
  final MaterialColor themeColor;

  const GlobalState({this.themeColor = Colors.blue});

  @override
  List<Object> get props => [themeColor];
}
