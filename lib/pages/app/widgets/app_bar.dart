import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../controller.dart';
import '../state.dart';

AppBar appBarWidget(AppController controller, AppState state) {
  return AppBar(
    title: Obx(() => Text(
          state.pageTitle,
          style: const TextStyle(color: AppColor.textFFFFFF, fontSize: 20),
        )),
    backgroundColor: AppColor.backdrop222222,
  );
}
