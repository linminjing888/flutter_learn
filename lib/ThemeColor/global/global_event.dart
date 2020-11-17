part of 'global_bloc.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class EventInitApp extends GlobalEvent {
  const EventInitApp();

  @override
  List<Object> get props => [];
}

class EventSwitchThemeColor extends GlobalEvent {
  final MaterialColor color;

  const EventSwitchThemeColor(this.color);

  @override
  List<Object> get props => [color];
}
