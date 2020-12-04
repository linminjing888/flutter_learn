/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-04 17:59:23
 * @Descripttion: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_learn/_1_widget/14_image_detail_page.dart';
import 'package:flutter_learn/_1_widget/5_home_textfield.dart';

class HomeHeroPage extends StatelessWidget {
  static const String routeName = "/hero";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transition"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 16 / 9,
        ),
        children: List.generate(12, (index) {
          final imageUrl = "https://picsum.photos/300/200?randoms$index";
          return GestureDetector(
            child: Hero(
              tag: imageUrl,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ImageDetailPage(imageUrl),
                    );
                  },
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //从下往上弹出
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) {
                return HomeTextFieldPage();
              },
              fullscreenDialog: true,
            ));
            // 渐隐渐出
            // Navigator.of(context).push(
            //   PageRouteBuilder(
            //     transitionDuration: Duration(seconds: 1),
            //     pageBuilder: (context, animation, secondaryAnimation) {
            //       return FadeTransition(
            //         opacity: animation,
            //         child: HomeTextFieldPage(),
            //       );
            //     },
            //   ),
            // );
            // 从左到右划出
            // Navigator.of(context).push(PageRouteBuilder(
            //   pageBuilder: (context, animation, secondaryAnimation) {
            //     return HomeTextFieldPage();
            //   },
            //   // 表示页面的动画效果
            //   transitionsBuilder:
            //       (context, animation, secondaryAnimation, child) {
            //     return SlideTransition(
            //       position: Tween(begin: Offset(-1, 0), end: Offset(0, 0))
            //           .animate(animation),
            //       child: child,
            //     );
            //   },
            // ));
          }),
    );
  }
}
