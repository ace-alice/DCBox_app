import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';
import '../../../core/user_manager/index.dart';
import '../../../generated/app_image/app_image.dart';
import '../../../router/app_routes.dart';
import '../../../utils/clipboard_data.dart';
import 'select_language.dart';

AppBar appBarWidget() {
  UserState userState = Get.put<UserState>(UserState());
  // NoticeBarManager noticeBarManager =
  //     Get.put<NoticeBarManager>(NoticeBarManagerImpl());
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {
          if (userState.token.value.isEmpty) {
            Get.toNamed(AppRoutes.login);
          } else {
            // noticeBarManager.show();
            Get.toNamed(AppRoutes.personal);
          }
        },
        child: AppImage.common.icUserAvatar(),
      ),
    ),
    leadingWidth: 49,
    iconTheme: const IconThemeData(size: 25),
    title: GestureDetector(
      onTap: () {
        clipboardData(userState.userInfo.value.loginName);
      },
      child: Row(
        children: [
          Obx(() {
            if (userState.userInfo.value.loginName.isNotEmpty) {
              return Text('(${userState.userInfo.value.loginName})');
            } else {
              return Text('(${TrKey.notLoggedIn.tr})');
            }
          }),
          Obx(
            () {
              if (userState.token.value.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppImage.common.copy(width: 14, height: 14),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    ),
    titleTextStyle: const TextStyle(color: AppColor.textFFFFFF, fontSize: 14),
    titleSpacing: 0,
    backgroundColor: AppColor.backdrop222222,
    actions: [
      SelectLanguageComponent(),
      IconButton(
        icon: AppImage.home.icCustomerService(width: 25, height: 25),
        onPressed: () {},
      ),
    ],
  );
}
