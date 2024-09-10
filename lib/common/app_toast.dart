import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/app_image/app_image.dart';

class AppToast {
  static simple(String text, void Function() fun,
      [ToastType type = ToastType.none]) {
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
