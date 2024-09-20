import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:dc_box_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';
import '../../../common/tr_key.dart';

// AssetImage('assets/images/home/home_remind_login.png')
Widget enterCard() {
  return Container(
    height: 100,
    margin: const EdgeInsets.only(bottom: 12),
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), //10像素圆角
        image: DecorationImage(
          image: MemoryImage(AppImage.home.homeRemindLoginImageData()!),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
              left: 20,
              top: 25,
              child: Text(
                TrKey.remindLoginDescription.tr,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )),
          Positioned(
            left: 8,
            bottom: 13,
            child: TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.login);
              },
              child: Text(
                TrKey.remindLoginText.tr,
                style:
                    const TextStyle(fontSize: 14, color: AppColor.textFEDF43),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
