import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<WelcomeController>();
    final state = Get.find<WelcomeController>().state;

    return Container();
  }
}
