import 'package:dc_box_app/common/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    final state = Get.find<AppController>().state;

    return const Text(
      'app',
      style: TextStyle(color: AppColor.border80FFFFFF),
    );
  }
}
