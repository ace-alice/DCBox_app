import 'package:flutter/cupertino.dart';
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
      child: Stack(
        children: [
          Positioned.fill(
            child: AppImage.welcome.background(fit: BoxFit.fitWidth),
          ),
          Positioned(
            top: 100.h,
            width: 375.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 240.w,
                  child: AppImage.welcome.logo(fit: BoxFit.fitWidth),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: 375.w,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SizedBox(
                      width: 254.w,
                      child: AppImage.welcome.title(fit: BoxFit.fitWidth),
                    ),
                  ),
                  LoadingWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Bind.delete<WelcomeController>();
    super.dispose();
  }
}
