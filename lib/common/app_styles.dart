import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/cupertino.dart';

class AppStyles {
  static btnGradient({double opacity = 1}) {
    return LinearGradient(
      colors: [
        const Color.fromRGBO(98, 162, 176, 1).withOpacity(opacity),
        const Color.fromRGBO(145, 201, 214, 1).withOpacity(opacity)
      ], // 渐变颜色
      begin: Alignment.topLeft, // 渐变的起点
      end: Alignment.bottomRight, // 渐变的终点
    );
  }

  static TextStyle btnTextStyle() {
    return const TextStyle(
        color: AppColor.textFFFFFF, fontSize: 14, fontWeight: FontWeight.w500);
  }
}
