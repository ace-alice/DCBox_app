import 'package:dc_box_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';

AppBar loginAppBar() {
  return AppBar(
    leading: null,
    automaticallyImplyLeading: false,
    backgroundColor: AppColor.backdrop121212,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.app);
            Get.removeRoute(AppRoutes.login);
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      )
    ],
  );
}
