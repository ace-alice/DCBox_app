import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/utils/app_color.dart';
import 'controller.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

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
