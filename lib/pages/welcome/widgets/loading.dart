import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller.dart';
import '../state.dart';

class LoadingWidget extends GetView {
  LoadingWidget({super.key});

  final WelcomeController welcomeController = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: SizedBox(
        height: 60.h,
        child: Obx(() {
          switch (welcomeController.state.loadingStatus.value) {
            case LoadStatus.loading:
              return const SizedBox(
                height: 48,
                child: CupertinoActivityIndicator(),
              );
            case LoadStatus.fail:
              return SizedBox(
                child: TextButton(
                  onPressed: welcomeController.getApiDomain,
                  child: const Text(
                    '重试',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            case LoadStatus.success:
              return const SizedBox.shrink();
            default:
              return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
