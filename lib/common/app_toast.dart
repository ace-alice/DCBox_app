import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/app_image/app_image.dart';

class AppToast {
  static simple(String text, [ToastType type = ToastType.none]) {
    BotToast.showCustomNotification(
      toastBuilder: (fun) {
        return Row(
          children: [
            const Expanded(flex: 1, child: SizedBox.shrink()),
            SizedBox(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      type == ToastType.none
                          ? const SizedBox.shrink()
                          : Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: AppImage.common
                                  .icSuccess(width: 14, height: 14),
                            ),
                      Text(
                        text,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(flex: 1, child: SizedBox.shrink()),
          ],
        );
      },
      onlyOne: true,
      align: const Alignment(0, -0.5),
    );
  }

  static popUps({
    required Widget Function(void Function() cancelFunc) build,
    bool onlyOne = false,
    AlignType align = AlignType.center,
    Duration? duration = const Duration(seconds: 3),
    bool enableSlideOff = false,
    alignment = Alignment.center,
    bool modelClose = false,
  }) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return build(cancelFunc);
      },
      onlyOne: onlyOne,
      duration: duration,
      enableSlideOff: enableSlideOff,
      wrapToastAnimation: (controller, cancelFunc, child) {
        return GestureDetector(
          onTap: () {
            if (modelClose) {
              cancelFunc();
            }
          }, // 点击遮罩层关闭通知
          child: FadeTransition(
            // 使用淡入动画显示
            opacity: controller,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.4)),
              child: Column(
                children: [
                  align == AlignType.top
                      ? const SizedBox.shrink()
                      : const Expanded(child: SizedBox.shrink()),
                  GestureDetector(
                    child: child,
                    onTap: () {},
                  ),
                  align == AlignType.bottom
                      ? const SizedBox.shrink()
                      : const Expanded(child: SizedBox.shrink()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

enum ToastType {
  none,
  success,
  fail,
}

Widget toastIcon(ToastType type) {
  switch (type) {
    case ToastType.none:
      return const SizedBox.shrink();
    case ToastType.success:
      return AppImage.common.icSuccess(width: 14, height: 14);
    case ToastType.fail:
      return AppImage.common.icError(width: 14, height: 14);
  }
}

enum AlignType { top, center, bottom }
