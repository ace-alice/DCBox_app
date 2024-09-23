import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:dc_box_app/pages/app/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final AppController controller;

  BottomNavigationBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomNavigationBar(
          currentIndex: controller.state.pageIndex.value,
          backgroundColor: AppColor.backdrop222222,
          selectedItemColor: AppColor.brand62A2B0,
          unselectedItemColor: AppColor.textFFFFFF,
          selectedFontSize: 12.0,
          // selectedIconTheme: const IconThemeData(size: 12),
          onTap: (int index) {
            controller.bottomNavigationBarOnTap(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: controller.state.pageIndex.value == 0
                  ? AppImage.tabs.homeSelected(width: 21, height: 21)
                  : AppImage.tabs.home(width: 21, height: 21),
              label: TrKey.home.tr,
            ),
            BottomNavigationBarItem(
              icon: controller.state.pageIndex.value == 1
                  ? AppImage.tabs.transactionSelected(width: 21, height: 21)
                  : AppImage.tabs.transaction(width: 21, height: 21),
              label: TrKey.trade.tr,
            ),
            BottomNavigationBarItem(
              icon: controller.state.pageIndex.value == 2
                  ? AppImage.tabs.orderSelected(width: 21, height: 21)
                  : AppImage.tabs.order(width: 21, height: 21),
              label: TrKey.bill.tr,
            ),
          ],
        );
      },
    );
  }
}
