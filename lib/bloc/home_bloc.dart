import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    // ///main_view中添加的事件，会在此处回调，此处处理完数据，将数据yield，BlocBuilder就会刷新组件
    // if (event is SwitchTabEvent) {
    //   ///获取到event事件传递过来的值,咱们拿到这值塞进HomeState中
    //   ///直接在state上改变内部的值,然后yield,只能触发一次BlocBuilder,它内部会比较上次MainState对象,如果相同,就不build
    //   yield HomeState()
    //     ..selectedIndex = event.selectedIndex
    //     ..isExtended = state.isExtended;
    // } else if (event is IsExtendEvent) {
    //   yield HomeState()
    //     ..selectedIndex = state.selectedIndex
    //     ..isExtended = !state.isExtended;
    // }

    if (event is HomeInitEvent) {
      yield await init();
    } else if (event is SwitchTabEvent) {
      yield state.clone()..selectedIndex = event.selectedIndex;
    } else if (event is IsExtendEvent) {
      yield state.clone()..isExtended = !state.isExtended;
    }
  }

  Future<HomeState> init() async {
    return state.clone();
  }
}

// state变量是框架内部定义的，会默认保存上一次同步的MainSate对象的值
