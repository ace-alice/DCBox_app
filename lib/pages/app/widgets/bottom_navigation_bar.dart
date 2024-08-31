import 'package:dc_box_app/pages/app/controller.dart';
import 'package:dc_box_app/pages/app/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bottomNavigationBar(AppController controller, AppState state) {
  return Obx(() {
    return BottomNavigationBar(
      currentIndex: state.pageIndex.value,
      onTap: (int index) {
        controller.bottomNavigationBarOnTap(index);
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: '交易'),
        BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm_rounded), label: '订单'),
      ],
    );
  });
}
