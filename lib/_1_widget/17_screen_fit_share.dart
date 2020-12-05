import 'package:flutter/material.dart';

class MJSizeFit {
  static double screenWidth;
  static double screenHeight;
  static double rpx;
  static double px;

  // 初始化
  static void initialize(BuildContext context, {double standardWidth = 750}) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    rpx = screenWidth / standardWidth; // 在iPhone6上：1rpx = 375/750 = 0.5px
    px = screenWidth / standardWidth * 2;
  }

// 按 像素 适配
  static double setPx(double size) {
    return MJSizeFit.rpx * size * 2;
  }

// 按 rpx 适配 小程序适配方法
  static double setrPx(double size) {
    return MJSizeFit.rpx * size;
  }
}
