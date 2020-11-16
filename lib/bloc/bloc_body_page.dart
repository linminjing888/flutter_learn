import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn/bloc/home_bloc.dart';

class MJMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///创建BlocProvider的，表明该Page，我们是用HomeBloc，HomeBloc是属于该页面的Bloc了
    return BlocProvider(
      // create: (context) => HomeBloc(),
      // 在HomeBloc上使用add方法,添加初始化事件
      create: (context) => HomeBloc()..add(HomeInitEvent()),
      child: MJBlocBodyPage(),
    );
  }
}

class MJBlocBodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bloc")),
      body: Row(
        children: [
          navigationRailSide(),
        ],
      ),
    );
  }

  Widget navigationRailSide() {
    Widget topWidget = Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3383029432,2292503864&fm=26&gp=0.jpg"),
                fit: BoxFit.fill,
              )),
        ),
      ),
    );

    Widget bottomWidget = Container(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              ///添加NavigationRail展开,收缩事件
              BlocProvider.of<HomeBloc>(context).add(IsExtendEvent());
              // context.bloc<HomeBloc>().add(IsExtendEvent());
            },
            child: Icon(state.isExtended ? Icons.send : Icons.navigation),
          );
        },
      ),
    );

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return NavigationRail(
          backgroundColor: Colors.white12,
          elevation: 3,
          // 刷新组件
          extended: state.isExtended,
          labelType: state.isExtended
              ? NavigationRailLabelType.none
              : NavigationRailLabelType.selected,
          destinations: [
            NavigationRailDestination(
                icon: Icon(Icons.add_to_queue),
                selectedIcon: Icon(Icons.add_to_photos),
                label: Text("测试一")),
            NavigationRailDestination(
                icon: Icon(Icons.add_circle_outline),
                selectedIcon: Icon(Icons.add_circle),
                label: Text("测试二")),
            NavigationRailDestination(
                icon: Icon(Icons.bubble_chart),
                selectedIcon: Icon(Icons.broken_image),
                label: Text("测试三")),
          ],
          selectedIndex: state.selectedIndex,
          //顶部widget
          leading: topWidget,
          //底部widget
          trailing: bottomWidget,
          onDestinationSelected: (value) {
            BlocProvider.of<HomeBloc>(context)
                .add(SwitchTabEvent(selectedIndex: value));
          },
        );
      },
    );
  }
}
