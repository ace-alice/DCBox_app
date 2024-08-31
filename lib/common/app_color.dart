import 'package:flutter/material.dart';

/// Color(0xAARRGGBB)
/// AA = transparency
/// RR = red
/// GG = green
/// BB = blue
///  100% - FF
///  95% - F2
///  90% - E6
///  85% - D9
///  80% - CC
///  75% - BF
///  70% - B3
///  65% - A6
///  60% - 99
///  55% - 8C
///  50% - 80
///  45% - 73
///  40% - 66
///  35% - 59
///  30% - 4D
///  25% - 40
///  20% - 33
///  15% - 26
///  10% - 1A
///  5% - 0D
///  0% - 00
class AppColor {
  /// 品牌色_主色
  static const Color brand62A2B0 = Color(0xFF62A2B0);

  /// 品牌色_不可用
  static const Color brand383838 = Color(0xFF383838);

  /// 字体颜色_白色
  static const Color textFFFFFF = Color(0xFFFFFFFF);

  /// 字体颜色_次色
  static const Color text9A9AA0 = Color(0xFF9A9AA0);

  /// 字体颜色_辅助色
  static const Color text98A9AE = Color(0xFF98A9AE);

  /// 字体颜色_占位色
  static const Color text999999 = Color(0xFF999999);

  /// 字体颜色_错误提示
  static const Color textE94343 = Color(0xFFE94343);

  /// 字体颜色_正确提示
  static const Color text00D33B = Color(0xFF00D33B);

  /// 字体颜色_等待提示
  static const Color textFaAd14 = Color(0xFFFAAD14);

  /// 字体颜色_人機驗證標題
  static const Color text182140 = Color(0xFF182140);

  /// 字体颜色_首頁登入
  static const Color textFEDF43 = Color(0xFFFEDF43);

  /// 背景色_主黑
  static const Color backdrop121212 = Color(0xFF121212);

  /// 背景色_次黑
  static const Color backdrop222222 = Color(0xFF222222);

  /// 背景色_下拉选项
  static const Color backdrop2D2D2D = Color(0xFF2D2D2D);

  /// 背景色_浅色30%
  static const Color backdrop4C6D778B = Color(0x4C6D778B);

  /// 背景色_浅色30%
  static const Color backdrop91C9D6 = Color(0xFF91C9D6);

  /// 其他_选中
  static const Color other2D2D2D = Color(0xFF2D2D2D);

  /// 边框_深色
  static const Color border999999 = Color(0xFF999999);

  /// 边框_浅色
  static const Color border6D778B = Color(0xFF6D778B);

  /// 边框_白色
  static const Color borderFFFFFFFF = Color(0xFFFFFFFF);

  /// 名稱 待修正
  static const Color name03333e = Color(0xFF03333E);

  /// 边框_浅色 0.3
  static const Color border4C6D778B = Color(0x4C6D778B);

  /// 边框_白色 0.15
  static const Color border26FFFFFF = Color(0x26FFFFFF);

  /// 边框_白色 0.5
  static const Color border80FFFFFF = Color(0x80FFFFFF);

  /// 訂單類型_转账
  static const Color other1380FF = Color(0xFF1380FF);

  /// 按鈕背景色_深灰
  static const Color buttonFF383838 = Color(0xFF383838);

  /// 訂單類型_付款
  static const Color otherFAAD14 = Color(0xFFFAAD14);

  /// 點擊波紋色
  static const Color tap434343 = Color(0xFF434343);

  /// 分隔線顏色 60%
  static const Color divider60 = Color.fromRGBO(0x6d, 0x77, 0x8b, 0.4);

  /// 品牌色_主色漸變
  static LinearGradient brandGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        AppColor.brand62A2B0,
        AppColor.backdrop91C9D6,
      ],
    );
  }
}

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 255, 255, .05),
  100: const Color.fromRGBO(255, 255, 255, .1),
  200: const Color.fromRGBO(255, 255, 255, .2),
  300: const Color.fromRGBO(255, 255, 255, .3),
  400: const Color.fromRGBO(255, 255, 255, .4),
  500: const Color.fromRGBO(255, 255, 255, .5),
  600: const Color.fromRGBO(255, 255, 255, .6),
  700: const Color.fromRGBO(255, 255, 255, .7),
  800: const Color.fromRGBO(255, 255, 255, .8),
  900: const Color.fromRGBO(255, 255, 255, .9),
};

MaterialColor primarySwatchColor = MaterialColor(0xFF62A2B0, color);
