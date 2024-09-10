import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:dc_box_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../utils/clipboard_data.dart';
import '../controller.dart';
import '../state.dart';

AppBar appBarWidget(AppController controller, AppState state) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.login);
        },
        child: AppImage.common.icUserAvatar(),
      ),
    ),
    leadingWidth: 49,
    iconTheme: const IconThemeData(size: 25),
    title: GestureDetector(
      onTap: () {
        clipboardData('text');
      },
      child: Row(
        children: [
          const Text('(未登录)'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AppImage.common.copy(width: 14, height: 14),
          )
        ],
      ),
    ),
    titleTextStyle: const TextStyle(color: AppColor.textFFFFFF, fontSize: 14),
    titleSpacing: 0,
    backgroundColor: AppColor.backdrop222222,
    actions: [
      IconButton(
        icon: AppImage.home.icLanguage(width: 25, height: 25),
        onPressed: () {},
      ),
      IconButton(
        icon: AppImage.home.icCustomerService(width: 25, height: 25),
        onPressed: () {},
      ),
    ],
  );
}
