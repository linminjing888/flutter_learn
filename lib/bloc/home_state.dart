part of 'home_bloc.dart';

// @immutable
// abstract class HomeState {}

// class HomeInitial extends HomeState {
//   final int selectedIndex;
//   final bool isExtended;

//   HomeInitial({this.selectedIndex, this.isExtended});
// }

class HomeState {
  int selectedIndex;
  bool isExtended;

  // HomeState({this.selectedIndex, this.isExtended});

  ///初始化方法,基础变量也需要赋初值,不然会报空异常
  HomeState init() {
    return HomeState()
      ..selectedIndex = 0
      ..isExtended = false;
  }

  ///也是对官方Flutter Login Tutorial这个demo中copyWith方法的一个优化
  ///Flutter Login Tutorial（https://bloclibrary.dev/#/flutterlogintutorial）
  // 级联符号..允许您在同一个对象上进行一系列操作。除了函数调用之外，还可以访问同一对象上的字段。
  // 这通常会为您节省创建临时变量的步骤，并允许您编写更流畅的代码。
  HomeState clone() {
    return HomeState()
      ..selectedIndex = selectedIndex
      ..isExtended = isExtended;
  }
}
