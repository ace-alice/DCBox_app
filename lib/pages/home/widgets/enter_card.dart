import 'package:dc_box_app/generated/app_image/app_image.dart';
import 'package:dc_box_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_color.dart';

// AssetImage('assets/images/home/home_remind_login.png')
Widget enterCard() {
  return SizedBox(
    height: 100,
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
          const Positioned(
              left: 20,
              top: 25,
              child: Text(
                '轻松几步，开启首笔交易',
                style: TextStyle(
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
              child: const Text(
                '注册 / 登录 >',
                style: TextStyle(fontSize: 14, color: AppColor.textFEDF43),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
