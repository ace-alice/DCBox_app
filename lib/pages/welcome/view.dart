import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../generated/app_image/app_image.dart';
import 'controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WelcomeController>();
    final state = Get.find<WelcomeController>().state;

    return Container(
      width: 375.w,
      height: 812.h,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 7.w,
            top: 15.h,
            child: AppImage.welcome.splashTop(
              width: 360.w,
              height: 126.h,
            ),
          ),
          Positioned(
            left: 7.w,
            bottom: 15.h,
            child: AppImage.welcome.splashBot(
              width: 360.w,
              height: 197.h,
            ),
          ),
          Positioned(
            left: 74.w,
            top: 70.h,
            child: AppImage.welcome.title(
              width: 227.w,
              height: 70.h,
            ),
          ),
          Positioned(
            left: 59.w,
            top: 187.h,
            child: AppImage.welcome.illustration(
              width: 256.w,
              height: 275.h,
            ),
          ),
          Positioned(
            left: 162.w,
            bottom: 140.h,
            child: AppImage.welcome.logo(
              width: 48.w,
              height: 56.h,
            ),
          ),
          Positioned(
            left: 178.w,
            bottom: 100.h,
            child: const CupertinoActivityIndicator(),
          ),
        ],
      ),
    );
  }
}
