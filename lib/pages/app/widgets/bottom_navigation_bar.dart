import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:dc_box_app/pages/app/controller.dart';
import 'package:dc_box_app/pages/app/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';

Widget bottomNavigationBarWidget(AppController controller, AppState state) {
  return Obx(() {
    return BottomNavigationBar(
      currentIndex: state.pageIndex.value,
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
          icon: state.pageIndex.value == 0
              ? AppImage.tabs.homeSelected(width: 21, height: 21)
              : AppImage.tabs.home(width: 21, height: 21),
          label: '首页',
        ),
        BottomNavigationBarItem(
          icon: state.pageIndex.value == 1
              ? AppImage.tabs.transactionSelected(width: 21, height: 21)
              : AppImage.tabs.transaction(width: 21, height: 21),
          label: '交易',
        ),
        BottomNavigationBarItem(
          icon: state.pageIndex.value == 2
              ? AppImage.tabs.orderSelected(width: 21, height: 21)
              : AppImage.tabs.order(width: 21, height: 21),
          label: '订单',
        ),
      ],
    );
  });
}
