/*
 * @Author: lin minjing
 * @version: 
 * @Date: 2020-10-23 14:40:11
 * @LastEditors: lin minjing
 * @LastEditTime: 2020-12-02 18:37:18
 * @Descripttion: 
 */
import 'package:flutter/material.dart';

class HomeImagePage extends StatelessWidget {
  static const String routeName = "/image";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: MJContentBody(),
    );
  }
}

class MJContentBody extends StatelessWidget {
  final topImgUrl = "https://picsum.photos/400/300";
  final imgUrl =
      "https://upload-images.jianshu.io/upload_images/16117826-caad4bd33f9db69c.jpg";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // 本地图片
          Image.asset("assets/images/app_icon.png", width: 120, height: 120),
          // 占位图
          Container(
            width: double.infinity,
            child: FadeInImage.assetNetwork(
              placeholder: "assets/images/bg.jpg",
              image: topImgUrl,
            ),
          ),
          // 可以获取网络图片加载的进度
          Image.network(
            imgUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
          // 填充模式 fill：完全填充，宽高比可能会变。contain：等比拉伸，直到一边填充满。
          // cover：等比拉伸，直到2边都填充满，此时一边可能超出范围。
          Image(
            image: NetworkImage(imgUrl),
            width: 200,
            height: 200,
            fit: BoxFit.fitHeight, // 适应高度
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}
