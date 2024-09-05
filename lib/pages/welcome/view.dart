import 'package:dc_box_app/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../generated/app_image/app_image.dart';
import 'controller.dart';
import 'widgets/loading.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = Get.find<WelcomeController>();
  final state = Bind.find<WelcomeController>().state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: AppColor.textFFFFFF,
          body: Stack(
            children: [
              Positioned(
                top: 40.h,
                left: 0,
                right: 0,
                child: AppImage.welcome.splashTop(),
              ),
              Positioned(
                bottom: 40.h,
                left: 0,
                right: 0,
                child: AppImage.welcome.splashBot(),
              ),
              Positioned(
                bottom: 40.h,
                left: 0,
                right: 0,
                child: AppImage.welcome.splashBot(),
              ),
              Column(
                children: [
                  const SizedBox(width: double.infinity),
                  const Spacer(flex: 20),
                  // GestureDetector(
                  //   onTap: controller.changeEnvironment,
                  //   child: AppImage.welcome.title(width: 230.w),
                  // ),
                  SizedBox(height: 74.w),
                  AppImage.welcome.illustration(width: 260.w),
                  SizedBox(height: 60.w),
                  AppImage.welcome.logo(height: 70.w),
                  SizedBox(height: 10.w),
                  LoadingWidget(),
                  const Spacer(flex: 14),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    Bind.delete<WelcomeController>();
    super.dispose();
  }
}
