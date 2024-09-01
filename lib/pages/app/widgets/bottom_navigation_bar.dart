import 'package:dc_box_app/pages/app/controller.dart';
import 'package:dc_box_app/pages/app/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';

Widget bottomNavigationBarWidget(AppController controller, AppState state) {
  return Obx(() {
    return BottomNavigationBar(
      currentIndex: state.pageIndex.value,
      backgroundColor: AppColor.backdrop4C6D778B,
      selectedItemColor: AppColor.brand62A2B0,
      unselectedItemColor: AppColor.textFFFFFF,
      selectedFontSize: 12.0,
      // selectedIconTheme: const IconThemeData(size: 12),
      onTap: (int index) {
        controller.bottomNavigationBarOnTap(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '首页',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: '交易',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_alarm_rounded),
          label: '订单',
        ),
      ],
    );
  });
}
