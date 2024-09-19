import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../core/user_manager/index.dart';
import '../../../generated/app_image/app_image.dart';
import '../../../router/app_routes.dart';
import '../../../widgets/rotation_animation/view.dart';

Widget accountInfo() {
  UserState userState = Get.put(UserState());
  UserManager userManager = Get.find<UserManager>();
  return Container(
    // margin: const EdgeInsets.only(top: 12),
    padding: const EdgeInsets.all(16),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.backdrop222222,
    ),
    child: Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                const Text(
                  '总资产(USDT)',
                  style: TextStyle(color: AppColor.text9A9AA0),
                ),
                RotationAnimationComponent(
                  loading: userState.balanceLoading,
                  child: IconButton(
                    onPressed: () {
                      userManager.getUserBalance();
                    },
                    icon: AppImage.home.iconHomeRefresh(height: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                userState.balanceByUSDT,
                style: const TextStyle(
                    color: AppColor.textFFFFFF, fontSize: 35, height: 1.25),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => Text(
                userState.balanceByCNY,
                style: const TextStyle(
                    color: AppColor.text9A9AA0, fontSize: 13, height: 1.25),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: const Color.fromRGBO(51, 51, 51, 0.5),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 14, 0, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tradeEnter(
                  AppImage.home.icScan(width: 16), '扫一扫', AppRoutes.browser),
              tradeEnter(
                  AppImage.home.icDeposit(width: 16), '充币', AppRoutes.browser),
              tradeEnter(
                  AppImage.home.icWithdraw(width: 16), '提币', AppRoutes.browser),
              tradeEnter(
                  AppImage.home.icTransfer(width: 16), '转账', AppRoutes.browser),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget tradeEnter(Widget image, String text, String route) {
  return SizedBox(
    width: 70,
    child: Column(
      children: [
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: const Color.fromRGBO(51, 51, 51, 1),
          ),
          child: image,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    ),
  );
}
