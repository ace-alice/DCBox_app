// 函数用于合并两个 BoxDecoration
import 'package:flutter/cupertino.dart';

BoxDecoration mergeDecorations(BoxDecoration first, BoxDecoration? second) {
  if (second == null) {
    return first;
  }
  return BoxDecoration(
    // 优先使用第二个 BoxDecoration 的颜色或渐变
    color: second.color ?? first.color,
    gradient: second.gradient ?? first.gradient,

    // 合并边框
    border: second.border ?? first.border,

    // 合并圆角
    borderRadius: second.borderRadius ?? first.borderRadius,

    // 合并阴影效果
    boxShadow: [
      ...(first.boxShadow ?? []),
      ...(second.boxShadow ?? []),
    ],

    // 合并背景图片
    image: second.image ?? first.image,

    // 其他可以根据需要合并的属性
    shape: second.shape != BoxShape.rectangle ? second.shape : first.shape,
  );
}
