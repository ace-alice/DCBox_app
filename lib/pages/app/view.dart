import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class AppPage extends StatelessWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    final state = Get.find<AppController>().state;

    return Container();
  }
}
