part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

///初始化事件,这边目前不需要传什么值
class HomeInitEvent extends HomeEvent {}

// 切换tab
class SwitchTabEvent extends HomeEvent {
  final int selectedIndex;
  SwitchTabEvent({@required this.selectedIndex});
}

// 展开tab
class IsExtendEvent extends HomeEvent {}

// @immutable
// abstract class HomeEvent extends Equatable {
//   const HomeEvent();
// }

// // 切换tab
// class SwitchTabEvent extends HomeEvent {
//   final int selectedIndex;
//   const SwitchTabEvent({@required this.selectedIndex});

//   @override
//   List<Object> get props => [selectedIndex];
// }

// // 展开tab
// class IsExtendEvent extends HomeEvent {
//   const IsExtendEvent();

//   @override
//   List<Object> get props => [];
// }
