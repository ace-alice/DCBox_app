import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../generated/app_image/app_image.dart' as app_image;
import '../../router/app_routes.dart';

Widget loading(RxDouble progress, RxBool isLoading) {
  Widget getLoadingIcon() {
    switch (Get.currentRoute) {
      case AppRoutes.service:
        return app_image.AppImage.tabs.service(fit: BoxFit.fitWidth);
      default:
        return app_image.AppImage.welcome.logo(fit: BoxFit.fitWidth);
    }
  }

  return Positioned.fill(child: Obx(
    () {
      return isLoading.value
          ? Stack(
              children: [
                Positioned.fill(
                  child: app_image.AppImage.guide.guideBg(fit: BoxFit.fitWidth),
                ),
                Positioned(
                  top: 140.h,
                  width: 375.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 180.w,
                        child: getLoadingIcon(),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 380.h,
                  width: 375.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(6),
                      value: progress.value,
                      // 设置进度值，范围在 0.0 到 1.0 之间
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink();
    },
  ));
}
